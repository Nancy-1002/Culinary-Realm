using Microsoft.AspNetCore.Mvc;
using Core.Entities;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using Core.Interfaces;
namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RecipesController(IRecipeRepository repo) : ControllerBase
    {
        
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Recipe>>> GetRecipes(string? cuisine, string? mealtype, 
            string? difficulty, string? sort)
        {
            return Ok(await repo.GetRecipesAsync(cuisine,mealtype,difficulty,sort));
        }

        [HttpGet("{id:int}")]
        public async Task<ActionResult<Recipe>> GetRecipeById(int id)
        {
            var recipe = await repo.GetRecipeByIdAsync(id);

            if (recipe == null) {
                return NotFound();
            }
            return recipe;
        }

        [HttpPost]
        public async Task<ActionResult<Recipe>> CreateRecipe(Recipe recipe)
        {
            repo.AddRecipe(recipe);

            if(await repo.SaveChangesAsync())
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
            repo.UpdateRecipe(recipe);
            if (await repo.SaveChangesAsync())
            {
                return NoContent();
            }

            return BadRequest("Problem updating the recipe");   
        }

        [HttpDelete("{id:int}")]
        public async Task<ActionResult> DeleteRecipe(int id)
        {
            var recipe = await repo.GetRecipeByIdAsync(id);
            if (recipe == null) return NotFound();

            repo.DeleteRecipe(recipe);
            if (await repo.SaveChangesAsync())
            {
                return NoContent();
            }
            return BadRequest("Problem deleting the recipe");
        }

        [HttpGet("cuisines")]
        public async Task<ActionResult<IReadOnlyList<string>>> GetCuisines()
        {
            return Ok(await repo.GetCuisineAsync());
        }


        [HttpGet("mealtypes")]
        public async Task<ActionResult<IReadOnlyList<string>>> GetMealTypes()
        {
            return Ok(await repo.GetMealTypeAsync());
        }

        [HttpGet("difficulty")]
        public async Task<ActionResult<IReadOnlyList<string>>> GetDifficulties()
        {
            return Ok(await repo.GetDifficultyAsync());
        }

        private bool RecipeExists(int id)
        {
            return repo.RecipeExists(id);
        }
    }
}
