using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core.Entities;
using Core.Interfaces;
using Microsoft.EntityFrameworkCore;
namespace Infrastructure.Data
{
    public class RecipeRepository(RecipeContext context) : IRecipeRepository
    {
        public void AddRecipe(Recipe recipe)
        {
            context.Recipes.Add(recipe);
        }

        public void DeleteRecipe(Recipe recipe)
        {
            context.Recipes.Remove(recipe);
        }

        public async Task<IReadOnlyList<string>> GetCuisineAsync()
        {
            return await context.Recipes.Select(x=>x.Cuisine).Distinct().ToListAsync();
        }

        public async Task<IReadOnlyList<string>> GetDifficultyAsync()
        {
            return await context.Recipes.Select(x=>x.Difficulty).Distinct().ToListAsync();

        }

        public async Task<IReadOnlyList<string>> GetMealTypeAsync()
        {
            return await context.Recipes.Select(x=>x.MealType).Distinct().ToListAsync();

        }

        public async Task<Recipe?> GetRecipeByIdAsync(int id)
        {
            return await context.Recipes.FindAsync(id);
        }

        public async Task<IReadOnlyList<Recipe>> GetRecipesAsync(string? cuisine, string? mealtype, string? difficulty, string? sort)
        {
            var query = context.Recipes.AsQueryable();

            if(!string.IsNullOrWhiteSpace(cuisine) )
            {
                query= query.Where(x=>x.Cuisine==cuisine);
            }
            if (!string.IsNullOrWhiteSpace(mealtype))
            {
                query = query.Where(x => x.MealType == mealtype);
            }
            if (!string.IsNullOrWhiteSpace(difficulty))
            {
                query = query.Where(x => x.Difficulty == difficulty);
            }

            query = sort switch
            {
                "calAsc" => query.OrderBy(x => x.Calories),
                "calDesc" => query.OrderByDescending(x => x.Calories),
                _ => query.OrderBy(x => x.Title)
            };
            

            return await query.ToListAsync();
        }

       

        public bool RecipeExists(int id)
        {
            return context.Recipes.Any(x => x.Id==id);
        }

        public async Task<bool> SaveChangesAsync()
        {
            return await context.SaveChangesAsync()>0;  
        }

        public void UpdateRecipe(Recipe recipe)
        {
            context.Entry(recipe).State = EntityState.Modified;
        }
    }
}
