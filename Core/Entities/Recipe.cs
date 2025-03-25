using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;


namespace Core.Entities
{
    public class Recipe : BaseEntity
    {
        public required string Title { get; set; } 
        public required string Description { get; set; } 

        public TimeSpan TotalTime {  get; set; }

        public int Calories { get; set; }
        public int Serves { get; set; }
        public required string Difficulty { get; set; } 
        public required string ImageUrl { get; set; } 
        public required string VideoUrl {  get; set; }
        public required string Cuisine {  get; set; } 
        public required string MealType {  get; set; }

        public ICollection<Steps> Steps { get; set; } = new List<Steps>(); 
        public ICollection<Ingredient> Ingredients { get; set; } = new List<Ingredient>();
        public ICollection<UserFavoriteRecipe> FavoritedByUser { get; set; } = new List<UserFavoriteRecipe>();
    }
}
