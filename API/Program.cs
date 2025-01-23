using Core.Interfaces;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using CloudinaryDotNet;

var builder = WebApplication.CreateBuilder(args);




builder.Services.AddControllers();
builder.Services.AddDbContext<RecipeContext>(opts =>
{
    opts.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));

});

builder.Services.AddScoped<IRecipeRepository, RecipeRepository>();
var app = builder.Build();

app.MapControllers();

app.Run();
