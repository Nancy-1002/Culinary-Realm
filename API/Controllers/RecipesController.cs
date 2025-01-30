using Microsoft.AspNetCore.Mvc;
using Core.Entities;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using Core.Interfaces;
using Core.Specifications;
using API.RequestHelpers;

namespace API.Controllers
{
    
    public class RecipesController(IGenericRepository<Recipe> repo, RecipeContext context) : BaseApiController
    {
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Recipe>>> GetRecipes(
            [FromQuery]RecipeSpecParameter specParams)
        {
            var spec = new RecipeSpecification(specParams);

            
            return await CreatePagedResult(repo, spec, specParams.PageIndex, specParams.PageSize);
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

            repo.Add(recipe);

            if (await repo.SaveAllAsync())
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
            repo.Update(recipe);

            if (await repo.SaveAllAsync())
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

            repo.Remove(recipe);
            if (await repo.SaveAllAsync())
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
            return Ok(await repo.ListAsync(spec));
        }

        [HttpGet("mealtypes")]
        public async Task<ActionResult<IReadOnlyList<string>>> GetMealTypes()
        {
            var spec = new MealTypeListSpecification();
            return Ok(await repo.ListAsync(spec));
        }

        [HttpGet("difficulty")]
        public async Task<ActionResult<IReadOnlyList<string>>> GetDifficulties()
        {
            var spec = new DifficultyListSpecification();
            return Ok(await repo.ListAsync(spec));
        }

        private bool RecipeExists(int id)
        {
            return repo.Exists(id);
        }
    }
}
