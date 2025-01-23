using Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace Core.Interfaces
{
    public interface IRecipeRepository
    {
        Task<IReadOnlyList<Recipe>> GetRecipesAsync(string? cuisine, string? mealtype, string? difficulty,string? sort);
        Task<Recipe?> GetRecipeByIdAsync(int id);
        Task<IReadOnlyList<string>> GetCuisineAsync();
        Task<IReadOnlyList<string>> GetMealTypeAsync();
        Task<IReadOnlyList<string>> GetDifficultyAsync();


        void AddRecipe(Recipe recipe);
        void UpdateRecipe(Recipe recipe);
        void DeleteRecipe(Recipe recipe);
        bool RecipeExists(int id);
        Task<bool> SaveChangesAsync();


    }
}
