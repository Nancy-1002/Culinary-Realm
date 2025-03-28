﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Entities
{
    public class UserFavoriteRecipe : BaseEntity
    {
        public required string AppUserId { get; set; }
        public AppUser? User { get; set; }

        public int RecipeId { get; set; }
        public Recipe? Recipe { get; set; }

    }
}
