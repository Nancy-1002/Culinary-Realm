using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Entities
{
    public class Product : BaseEntity
    {
        public required string Name { get; set; }
        public int Price { get; set; }
        public  string Brand { get; set; } = string.Empty;

        public string ImgUrl { get; set; } = string.Empty ;
       
        public ICollection<IngredientProduct> IngredientProducts { get; set; } = new List<IngredientProduct>();
    }
}