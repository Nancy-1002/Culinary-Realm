using API.Middleware;
using Core.Interfaces;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services
builder.Services.AddControllers()
    .AddJsonOptions(options =>
    {
        options.JsonSerializerOptions.ReferenceHandler = System.Text.Json.Serialization.ReferenceHandler.Preserve;
    });

builder.Services.AddDbContext<RecipeContext>(opts =>
{
    opts.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
});

// Configure CORS
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAllOrigins", policy =>
        policy.AllowAnyOrigin()
              .AllowAnyMethod()
              .AllowAnyHeader());
});



builder.Services.AddScoped<IRecipeRepository, RecipeRepository>();
builder.Services.AddScoped(typeof(IGenericRepository<>), typeof(GenericRepository<>));


var app = builder.Build();

// Correct middleware order
app.UseRouting();
app.UseCors("AllowAllOrigins");
app.UseAuthorization();
app.UseMiddleware<ExceptionMiddleware>();

// Map controllers and handle OPTIONS requests
app.UseEndpoints(endpoints =>
{
    if (endpoints is null)
    {
        throw new ArgumentNullException(nameof(endpoints));
    }

    endpoints.MapControllers();
    endpoints.MapMethods("/api/{**catchall}", new[] { "OPTIONS" }, async context =>
    {
        context.Response.StatusCode = 200;
        await context.Response.CompleteAsync();
    });
});

app.Run();
