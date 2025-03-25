using Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Specifications
{
    public class UserFavoriteRecipeSpecification : BaseSpecification<Recipe>
    {
        public UserFavoriteRecipeSpecification(string userId)
            : base(r => r.FavoritedByUser.Any(f => f.AppUserId == userId))
        {
            AddInclude(r => r.Ingredients);
            AddInclude(r => r.Steps);
            AddInclude(r => r.FavoritedByUser);
        }
        public UserFavoriteRecipeSpecification(string userId, int recipeId)
            : base(r =>
                r.Id == recipeId &&
                r.FavoritedByUser.Any(f => f.AppUserId == userId))
        {
            AddInclude(r => r.Ingredients);
            AddInclude(r => r.Steps);
            AddInclude(r => r.FavoritedByUser);
        }  
    }
    public class FavoriteRecipeSpecification : BaseSpecification<UserFavoriteRecipe>
    {
        public FavoriteRecipeSpecification(string userId, int recipeId)
            : base(uf => uf.AppUserId == userId && uf.RecipeId == recipeId)
        {
        }
    }
}
