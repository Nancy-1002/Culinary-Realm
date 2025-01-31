using Core.Entities;
using System.ComponentModel.DataAnnotations;

namespace API.DTOs
{
    public class CreateRecipeDto
    {
        [Required]
        public  string Title { get; set; } = string.Empty;
        [Required]
        public string Description { get; set; } = string.Empty;

        public TimeSpan TotalTime { get; set; }

        public int Calories { get; set; }
        [Range(1, int.MaxValue, ErrorMessage = "Servings must be greater than 0")]
        public int Serves { get; set; }
        [Required]
        public string Difficulty { get; set; } = string.Empty;
        [Required]
        public string ImageUrl { get; set; } = string.Empty;
        [Required]
        public string VideoUrl { get; set; } = string.Empty;
        [Required]
        public string Cuisine { get; set; } = string.Empty;
        [Required] 
        public string MealType { get; set; } = string.Empty;

        public ICollection<Steps> Steps { get; set; } = new List<Steps>();
        public ICollection<Ingredient> Ingredients { get; set; } = new List<Ingredient>();

    }
}
