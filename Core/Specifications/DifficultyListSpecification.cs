using Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Specifications
{
    public class DifficultyListSpecification : BaseSpecification<Recipe,string>
    {
        public DifficultyListSpecification() 
        {
            AddSelect(x => x.Difficulty);
            ApplyDistinct();
        }
    }
}
