using Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Specifications
{
    public class CuisineListSpecification : BaseSpecification<Recipe, string>
    {
        public CuisineListSpecification()
        {
            AddSelect(x => x.Cuisine);
            ApplyDistinct();

            
        }
    }
    
}
