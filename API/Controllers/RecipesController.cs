using Microsoft.AspNetCore.Mvc;
using Core.Entities;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using Core.Interfaces;
using Core.Specifications;
using API.RequestHelpers;
using Microsoft.AspNetCore.Cors;

namespace API.Controllers
{
    [EnableCors("CorsPolicy")]
    public class RecipesController(IUnitOfWork unit, RecipeContext context) : BaseApiController
    {
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Recipe>>> GetRecipes(
            [FromQuery]RecipeSpecParameter specParams)
        {
            var spec = new RecipeSpecification(specParams);

            
            return await CreatePagedResult(unit.Repository<Recipe>(), spec, specParams.PageIndex, specParams.PageSize);
        }

        [HttpGet("{id:int}")]
        public async Task<ActionResult<Recipe>> GetRecipeById(int id)
        {
            
            var recipe = await context.Recipes
                 .Include(r => r.Steps) 
                 .Include(r => r.Ingredients)
                 .FirstOrDefaultAsync(r => r.Id == id);


            if (recipe == null)
            {
                return NotFound();
            }
            return recipe;
        }

        [HttpPost]
        public async Task<ActionResult<Recipe>> CreateRecipe(Recipe recipe)
        {
            // Ensure Steps collection is initialized
            if (recipe.Steps == null)
            {
                recipe.Steps = new List<Steps>();
            }

            unit.Repository<Recipe>().Add(recipe);

            if (await unit.Complete())
            {
                return CreatedAtAction("GetRecipeById", new { id = recipe.Id }, recipe);
            }

            return BadRequest("Problem creating the recipe");
        }

        [HttpPut("{id:int}")]
        public async Task<ActionResult> UpdateRecipe(int id, Recipe recipe)
        {
            if (recipe.Id != id || !RecipeExists(id))
            {
                return BadRequest("Cannot update this recipe");
            }

            // Optionally handle updates to Steps here if needed
            unit.Repository<Recipe>().Update(recipe);

            if (await unit.Complete())
            {
                return NoContent();
            }

            return BadRequest("Problem updating the recipe");
        }

        [HttpDelete("{id:int}")]
        public async Task<ActionResult> DeleteRecipe(int id)
        {
            var recipe = await context.Recipes
                 .Include(r => r.Steps) // Include Steps to ensure cascade delete
                 .Include(r=>r.Ingredients)
                 .FirstOrDefaultAsync(r => r.Id == id);

            if (recipe == null) return NotFound();

            unit.Repository<Recipe>().Remove(recipe);
            if (await unit.Complete())
            {
                return NoContent();
            }
            return BadRequest("Problem deleting the recipe");
        }

        [HttpGet("cuisines")]
        public async Task<ActionResult<IReadOnlyList<string>>> GetCuisines()
        {
            // Example implementation: return distinct cuisines
            var spec = new CuisineListSpecification();
            return Ok(await unit.Repository<Recipe>().ListAsync(spec));
        }

        [HttpGet("mealtypes")]
        public async Task<ActionResult<IReadOnlyList<string>>> GetMealTypes()
        {
            var spec = new MealTypeListSpecification();
            return Ok(await unit.Repository<Recipe>().ListAsync(spec));
        }

        [HttpGet("difficulty")]
        public async Task<ActionResult<IReadOnlyList<string>>> GetDifficulties()
        {
            var spec = new DifficultyListSpecification();
            return Ok(await unit.Repository<Recipe>().ListAsync(spec));
        }

        private bool RecipeExists(int id)
        {
            return unit.Repository<Recipe>().Exists(id);
        }
    }
}
