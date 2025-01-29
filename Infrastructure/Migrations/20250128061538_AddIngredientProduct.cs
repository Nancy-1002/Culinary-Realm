using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class AddIngredientProduct : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Products_Ingredients_IngredientId",
                table: "Products");

            migrationBuilder.DropIndex(
                name: "IX_Products_IngredientId",
                table: "Products");

            migrationBuilder.DropColumn(
                name: "IngredientId",
                table: "Products");

            migrationBuilder.CreateTable(
                name: "IngredientProduct",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IngredientId = table.Column<int>(type: "int", nullable: false),
                    ProductId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_IngredientProduct", x => x.Id);
                    table.ForeignKey(
                        name: "FK_IngredientProduct_Ingredients_IngredientId",
                        column: x => x.IngredientId,
                        principalTable: "Ingredients",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_IngredientProduct_Products_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Products",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_IngredientProduct_IngredientId",
                table: "IngredientProduct",
                column: "IngredientId");

            migrationBuilder.CreateIndex(
                name: "IX_IngredientProduct_ProductId",
                table: "IngredientProduct",
                column: "ProductId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "IngredientProduct");

            migrationBuilder.AddColumn<int>(
                name: "IngredientId",
                table: "Products",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Products_IngredientId",
                table: "Products",
                column: "IngredientId");

            migrationBuilder.AddForeignKey(
                name: "FK_Products_Ingredients_IngredientId",
                table: "Products",
                column: "IngredientId",
                principalTable: "Ingredients",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
