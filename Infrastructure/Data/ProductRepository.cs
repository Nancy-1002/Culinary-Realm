using Core.Entities;
using Core.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Data
{
    public class ProductRepository(RecipeContext context) : IProductRepository
    {
        public void AddProduct(Product product)
        {
            context.Products.Add(product);
        }

        public void DeleteProduct(Product product)
        {
            context.Products.Remove(product);
        }

        public async Task<Product?> GetProductByIdAsync(int id)
        {
            var product = await context.Products.FindAsync(id);
            return product;
        }

        public async Task<IReadOnlyList<Product>> GetProductsAsync(string? sort)
        {
            var query = context.Products.AsQueryable();
            query = sort switch
            {
                "priceAsc" => query.OrderBy(p => p.Price),
                "priceDesc" => query.OrderByDescending(p => p.Price),
                _ => query.OrderBy(p => p.Name)
            };
            return await query.ToListAsync();
        }

        public bool ProductExists(int id)
        {
            if(context.Products.Any(e => e.Id == id))
            {
                return true;
            }
            return false;
        }

        public async Task<bool> SaveChangesAsync()
        {
            var result=await context.SaveChangesAsync();
            return result > 0;
        }

        public void UpdateProduct(Product product)
        {
            if (product == null)
                throw new ArgumentNullException(nameof(product));

            var existingProduct = context.Products.Find(product.Id);
            if (existingProduct == null)
                throw new KeyNotFoundException("Product not found");

            context.Entry(existingProduct).CurrentValues.SetValues(product);
        }
    }
}
