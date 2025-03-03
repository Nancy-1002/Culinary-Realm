using Core.Entities;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Data
{
    public class RecipeContext(DbContextOptions options) : IdentityDbContext<AppUser>(options)
    {
        public DbSet<Recipe> Recipes { get; set; }
        public DbSet<Address> Addresses { get; set; }

        public DbSet<Steps> Steps { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Ingredient> Ingredients { get; set; }
        public DbSet<DeliveryMethod> DeliveryMethods { get; set; }
    }
}
