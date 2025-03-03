using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Core.Entities
{
    public class IngredientProduct : BaseEntity
    {
        public int IngredientId { get; set; }
        public Ingredient? Ingredient { get; set; }

        public int ProductId { get; set; }
        public Product? Product { get; set; }
    }
}
