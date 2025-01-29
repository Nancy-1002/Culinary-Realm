using Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Specifications
{
    public class RecipeSpecification : BaseSpecification<Recipe>
    {
        public RecipeSpecification(string? cuisine, string? mealtype, string? difficulty, string? sort) : base(x =>
            (string.IsNullOrWhiteSpace(cuisine) || x.Cuisine == cuisine) &&
            (string.IsNullOrWhiteSpace(mealtype) || x.MealType == mealtype) &&
            (string.IsNullOrWhiteSpace(difficulty) || x.Difficulty == difficulty)
        )
        {
            switch (sort)
            {
                case "calAsc":
                    AddOrderBy(x => x.Calories); break;
                case "calDesc":
                    AddOrderByDesc(x => x.Calories); break;
                default:
                    AddOrderBy(x=> x.Title); break;
            }
        }
    }
}
