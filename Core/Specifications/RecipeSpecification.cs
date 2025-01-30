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
        public RecipeSpecification(RecipeSpecParameter specParams) : base(x =>
            (string.IsNullOrEmpty(specParams.Search) || x.Title.Contains(specParams.Search)) &&
            (specParams.Cuisines.Count == 0 || specParams.Cuisines.Contains(x.Cuisine)) &&
            (specParams.MealTypes.Count == 0 || specParams.MealTypes.Contains(x.MealType)) &&
            (specParams.Difficulties.Count == 0 || specParams.Difficulties.Contains(x.Difficulty))
        )
        {
            ApplyPaging(specParams.PageSize * (specParams.PageIndex - 1), specParams.PageSize);

            switch (specParams.Sort)
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
