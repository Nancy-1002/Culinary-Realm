using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Specifications
{
    public class RecipeSpecParameter
    {

        private const int MaxPageSize = 50;
        public int PageIndex { get; set; } = 1;

        private int _pageSize = 6;

        public int PageSize
        {
            get => _pageSize; 
            set => _pageSize = (value > MaxPageSize) ? MaxPageSize : value;
        }

        private List<string> _cuisines = [];

        public List<string> Cuisines {
            get => _cuisines;
            set
            {
                _cuisines = value.SelectMany(x => x.Split(',', StringSplitOptions.RemoveEmptyEntries)).ToList();
            }
        }
    

        private List<string> _mealTypes = [];

        public List<string> MealTypes
        {
            get => _mealTypes;
            set
            {
                _mealTypes = value.SelectMany(x => x.Split(',', StringSplitOptions.RemoveEmptyEntries)).ToList();
            }
        }

        private List<string> _difficulty = [];

        public List<string> difficulty
        {
            get => _difficulty;
            set
            {
                if (value.Count == 1 && value[0].Contains(","))
                {
                    Console.WriteLine($"Received Difficulty: {string.Join(", ", value)}"); // Debugging

                    // Ensure it properly splits values
                    _difficulty = value.SelectMany(x => x.Split(',', StringSplitOptions.RemoveEmptyEntries)).ToList();

                    Console.WriteLine($"Processed Difficulty: {string.Join(", ", _difficulty)}"); // Debugging
                }
                else
                {
                    _difficulty = value;
                }
            }
        }

        public string? Sort {  get; set; }

        private string? _search;
        public string Search
        {
            get => _search ?? "";
            set => _search = value.ToLower();
        }
    }
}
