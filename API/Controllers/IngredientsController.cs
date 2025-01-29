using Microsoft.AspNetCore.Mvc;
using Core.Entities;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using Core.Interfaces;
using Core.Specifications;
using System.Net.NetworkInformation;
namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class IngredientsController(IGenericRepository<Ingredient> repo, IGenericRepository<Recipe> recipeRepo) : ControllerBase
    {

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Ingredient>>> GetIngredients()
        {
            return Ok(await repo.ListAllAsync());
        }

        [HttpGet("{id:int}")]
        public async Task<ActionResult<Ingredient>> GetIngredientById(int id)
        {
            var ing = await repo.GetByIdAsync(id);

            if (ing == null)
            {
                return NotFound();
            }
            return ing;
        }

        [HttpPost]
        public async Task<ActionResult<Ingredient>> CreateIngredient(Ingredient ing)
        {
            var recipe = await recipeRepo.GetByIdAsync(ing.RecipeId);

            if (recipe == null)
            {
                return NotFound($"Recipe with id {ing.RecipeId} not found");
            }

            var ingredients = new Ingredient
            {
                RecipeId = ing.RecipeId,
                Name = ing.Name
            };
            repo.Add(ingredients);

            if (await repo.SaveAllAsync())
            {
                return CreatedAtAction("GetIngredientById", new { id = ing.Id }, ing);
            }

            return BadRequest("Problem creating the ingredient");
        }

        [HttpPut("{id:int}")]
        public async Task<ActionResult> UpdateIngredient(int id, Ingredient ing)
        {
            
            if (ing.Id != id || !IngredientExists(id))
            {
                return BadRequest("Cannot update this ingredient");
            }
            repo.Update(ing);
            if (await repo.SaveAllAsync())
            {
                return NoContent();
            }

            return BadRequest("Problem updating the ingredient");
        }

        [HttpDelete("{id:int}")]
        public async Task<ActionResult> DeleteIngredient(int id)
        {
            var ing = await repo.GetByIdAsync(id);
            if (ing == null) return NotFound();

            repo.Remove(ing);
            if (await repo.SaveAllAsync())
            {
                return NoContent();
            }
            return BadRequest("Problem deleting the ingredient");
        }


        private bool IngredientExists(int id)
        {
            return repo.Exists(id);
        }
    }
}
