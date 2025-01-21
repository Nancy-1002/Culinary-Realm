using Microsoft.AspNetCore.Mvc;
using Core.Entities;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RecipesController : ControllerBase
    {
        private readonly RecipeContext context;

        public RecipesController(RecipeContext context)
        {
            this.context = context;
        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Recipe>>> GetRecipes()
        {
            return await context.Recipes.ToListAsync();
        }

        [HttpGet("{id:int}")]
        public async Task<ActionResult<Recipe>> GetRecipeById(int id)
        {
            var recipe = await context.Recipes.FindAsync(id);

            if (recipe == null) {
                return NotFound();
            }
            return recipe;
        }

        [HttpPost]
        public async Task<ActionResult<Recipe>> CreateRecipe(Recipe recipe)
        {
            context.Recipes.Add(recipe);

            await context.SaveChangesAsync();

            return recipe;
        }

        [HttpPut("{id:int}")]
        public async Task<ActionResult> UpdateRecipe(int id, Recipe recipe)
        {
            if (recipe.Id != id || !RecipeExists(id))
            {
                return BadRequest("Cannot update this recipe");
            }
            context.Entry(recipe).State = EntityState.Modified;

            await context.SaveChangesAsync();

            return NoContent();
        }

        [HttpDelete("{id:int}")]
        public async Task<ActionResult> DeleteRecipe(int id)
        {
            var recipe = await context.Recipes.FindAsync(id);
            if (recipe == null) return NotFound();

            context.Recipes.Remove(recipe);
            await context.SaveChangesAsync();

            return NoContent();
        }


        private bool RecipeExists(int id)
        {
            return context.Recipes.Any(x=> x.Id == id);
        }
    }
}
