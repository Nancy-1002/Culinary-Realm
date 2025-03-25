using Core.Entities;
using Core.Interfaces;
using Core.Specifications;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace API.Controllers
{
    public class FavoritesController(IUnitOfWork unit) : BaseApiController
    {
        [HttpPost("add-favorite/{recipeId}")]
        [Authorize]
        public async Task<IActionResult> AddToFavorites(int recipeId)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var favorite = new UserFavoriteRecipe
            {
                AppUserId = userId,
                RecipeId = recipeId
            };
            unit.Repository<UserFavoriteRecipe>().Add(favorite);
            await unit.Complete();
            return Ok();
        }

        [HttpDelete("remove-favorite/{recipeId}")]
        [Authorize]
        public async Task<IActionResult> RemoveFromFavorites(int recipeId)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var favorite = await unit.Repository<UserFavoriteRecipe>()
                .GetEntityWithSpec(new FavoriteRecipeSpecification(userId,recipeId));
            if (favorite == null)
                return NotFound();

            unit.Repository<UserFavoriteRecipe>().Remove(favorite);
            await unit.Complete();
            return Ok();
        }

        [HttpGet("user-favorites")]
        [Authorize]
        public async Task<ActionResult<IReadOnlyList<Recipe>>> GetUserFavorites()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var spec = new UserFavoriteRecipeSpecification(userId);
            var favorites = await unit.Repository<Recipe>().ListAsync(spec);
            return Ok(favorites);
        }

        [HttpGet("favorite/{recipeId}")]
        [Authorize]
        public async Task<ActionResult<Recipe>> GetFavoriteRecipe(int recipeId)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var spec = new UserFavoriteRecipeSpecification(userId, recipeId);
            var recipe = await unit.Repository<Recipe>().GetEntityWithSpec(spec);

            if (recipe == null)
                return NotFound();

            return Ok(recipe);
        }
    }
}
