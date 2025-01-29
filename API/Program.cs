using Core.Interfaces;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using CloudinaryDotNet;

var builder = WebApplication.CreateBuilder(args);




builder.Services.AddControllers()
    .AddJsonOptions(options =>
    {
        options.JsonSerializerOptions.ReferenceHandler = System.Text.Json.Serialization.ReferenceHandler.Preserve;
    }); ;
builder.Services.AddDbContext<RecipeContext>(opts =>
{
    opts.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));

});

builder.Services.AddScoped<IRecipeRepository, RecipeRepository>();
builder.Services.AddScoped(typeof(IGenericRepository<>), typeof(GenericRepository<>));
var app = builder.Build();

app.MapControllers();

//try
//{
//    using var scope = app.Services.CreateScope();
//    var services = scope.ServiceProvider;
//    var context = services.GetRequiredService<RecipeContext>();
//    await context.Database.MigrateAsync();
//    await StoreContextSeed.SeedAsync(context);
//}

//catch(Exception ex)
//{
//    Console.WriteLine(ex.ToString());
//    throw;
//}
app.Run();
