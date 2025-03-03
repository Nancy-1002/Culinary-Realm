using Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace Infrastructure.Data
{
    public class RecipeContextSeed
    {
        public static async Task SeedAsync(RecipeContext context)
        {
            if (!context.DeliveryMethods.Any())
            {
                var deliveryData = await File.ReadAllTextAsync("../Infrastructure/Data/SeedData/deliveryData.json");
                var deliveries = JsonSerializer.Deserialize<List<DeliveryMethod>>(deliveryData);

                if(deliveries == null) return;

                context.DeliveryMethods.AddRange(deliveries);
                await context.SaveChangesAsync();
            }
        }
    }
}
