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
    

        private List<string> _mealtypes = [];

        public List<string> MealTypes
        {
            get => _mealtypes;
            set
            {
                _mealtypes = value.SelectMany(x => x.Split(',', StringSplitOptions.RemoveEmptyEntries)).ToList();
            }
        }

        private List<string> _difficulties = [];

        public List<string> Difficulties
        {
            get => _difficulties;
            set
            {
                _difficulties = value.SelectMany(x => x.Split(',', StringSplitOptions.RemoveEmptyEntries)).ToList();
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
