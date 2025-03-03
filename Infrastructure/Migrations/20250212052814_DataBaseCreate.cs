using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class DataBaseCreate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.CreateTable(
            //    name: "Products",
            //    columns: table => new
            //    {
            //        Id = table.Column<int>(type: "int", nullable: false)
            //            .Annotation("SqlServer:Identity", "1, 1"),
            //        Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
            //        Price = table.Column<int>(type: "int", nullable: false),
            //        Brand = table.Column<string>(type: "nvarchar(max)", nullable: false),
            //        ImgUrl = table.Column<string>(type: "nvarchar(max)", nullable: false)
            //    },
            //    constraints: table =>
            //    {
            //        table.PrimaryKey("PK_Products", x => x.Id);
            //    });

            //migrationBuilder.CreateTable(
            //    name: "Recipes",
            //    columns: table => new
            //    {
            //        Id = table.Column<int>(type: "int", nullable: false)
            //            .Annotation("SqlServer:Identity", "1, 1"),
            //        Title = table.Column<string>(type: "nvarchar(max)", nullable: false),
            //        Description = table.Column<string>(type: "nvarchar(max)", nullable: false),
            //        TotalTime = table.Column<TimeSpan>(type: "time", nullable: false),
            //        Calories = table.Column<int>(type: "int", nullable: false),
            //        Serves = table.Column<int>(type: "int", nullable: false),
            //        Difficulty = table.Column<string>(type: "nvarchar(max)", nullable: false),
            //        ImageUrl = table.Column<string>(type: "nvarchar(max)", nullable: false),
            //        VideoUrl = table.Column<string>(type: "nvarchar(max)", nullable: false),
            //        Cuisine = table.Column<string>(type: "nvarchar(max)", nullable: false),
            //        MealType = table.Column<string>(type: "nvarchar(max)", nullable: false)
            //    },
            //    constraints: table =>
            //    {
            //        table.PrimaryKey("PK_Recipes", x => x.Id);
            //    });

            //migrationBuilder.CreateTable(
            //    name: "Ingredients",
            //    columns: table => new
            //    {
            //        Id = table.Column<int>(type: "int", nullable: false)
            //            .Annotation("SqlServer:Identity", "1, 1"),
            //        RecipeId = table.Column<int>(type: "int", nullable: false),
            //        Name = table.Column<string>(type: "nvarchar(max)", nullable: false)
            //    },
            //    constraints: table =>
            //    {
            //        table.PrimaryKey("PK_Ingredients", x => x.Id);
            //        table.ForeignKey(
            //            name: "FK_Ingredients_Recipes_RecipeId",
            //            column: x => x.RecipeId,
            //            principalTable: "Recipes",
            //            principalColumn: "Id",
            //            onDelete: ReferentialAction.Cascade);
            //    });

            //migrationBuilder.CreateTable(
            //    name: "Steps",
            //    columns: table => new
            //    {
            //        Id = table.Column<int>(type: "int", nullable: false)
            //            .Annotation("SqlServer:Identity", "1, 1"),
            //        RecipeId = table.Column<int>(type: "int", nullable: false),
            //        Description = table.Column<string>(type: "nvarchar(max)", nullable: false)
            //    },
            //    constraints: table =>
            //    {
            //        table.PrimaryKey("PK_Steps", x => x.Id);
            //        table.ForeignKey(
            //            name: "FK_Steps_Recipes_RecipeId",
            //            column: x => x.RecipeId,
            //            principalTable: "Recipes",
            //            principalColumn: "Id",
            //            onDelete: ReferentialAction.Cascade);
            //    });

            //migrationBuilder.CreateTable(
            //    name: "IngredientProduct",
            //    columns: table => new
            //    {
            //        Id = table.Column<int>(type: "int", nullable: false)
            //            .Annotation("SqlServer:Identity", "1, 1"),
            //        IngredientId = table.Column<int>(type: "int", nullable: false),
            //        ProductId = table.Column<int>(type: "int", nullable: false)
            //    },
            //    constraints: table =>
            //    {
            //        table.PrimaryKey("PK_IngredientProduct", x => x.Id);
            //        table.ForeignKey(
            //            name: "FK_IngredientProduct_Ingredients_IngredientId",
            //            column: x => x.IngredientId,
            //            principalTable: "Ingredients",
            //            principalColumn: "Id",
            //            onDelete: ReferentialAction.Cascade);
            //        table.ForeignKey(
            //            name: "FK_IngredientProduct_Products_ProductId",
            //            column: x => x.ProductId,
            //            principalTable: "Products",
            //            principalColumn: "Id",
            //            onDelete: ReferentialAction.Cascade);
            //    });

            //migrationBuilder.CreateIndex(
            //    name: "IX_IngredientProduct_IngredientId",
            //    table: "IngredientProduct",
            //    column: "IngredientId");

            //migrationBuilder.CreateIndex(
            //    name: "IX_IngredientProduct_ProductId",
            //    table: "IngredientProduct",
            //    column: "ProductId");

            //migrationBuilder.CreateIndex(
            //    name: "IX_Ingredients_RecipeId",
            //    table: "Ingredients",
            //    column: "RecipeId");

            //migrationBuilder.CreateIndex(
            //    name: "IX_Steps_RecipeId",
            //    table: "Steps",
            //    column: "RecipeId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "IngredientProduct");

            migrationBuilder.DropTable(
                name: "Steps");

            migrationBuilder.DropTable(
                name: "Ingredients");

            migrationBuilder.DropTable(
                name: "Products");

            migrationBuilder.DropTable(
                name: "Recipes");
        }
    }
}
