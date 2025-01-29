using Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Specifications
{
    public class MealTypeListSpecification : BaseSpecification<Recipe, string>
    {
        public MealTypeListSpecification()
        {
            AddSelect(x => x.MealType);
            ApplyDistinct();
        }
        
    }
}
