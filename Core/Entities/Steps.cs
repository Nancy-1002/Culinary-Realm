using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Core.Entities
{
    public class Steps : BaseEntity
    {
        public int RecipeId { get; set; }
        public string Description { get; set; }
        public Recipe? Recipe { get; set; }
    }

    public class StepDto
    {
        public int RecipeId { get; set; }
        public string Description { get; set; }
    }


}
