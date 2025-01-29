using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Entities
{
    public class Ingredient : BaseEntity
    {
        public int RecipeId { get; set; }
        public required string Name { get; set; }

        public Recipe? Recipe { get; set; }

        public ICollection<IngredientProduct> IngredientProducts { get; set; } = new List<IngredientProduct>();
        
    }
}
