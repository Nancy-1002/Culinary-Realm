using Core.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Data
{
    public class RecipeContext(DbContextOptions options) : DbContext(options)
    {
        public DbSet<Recipe> Recipes { get; set; }
    }
}
