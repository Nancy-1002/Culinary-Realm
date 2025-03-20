using Microsoft.AspNetCore.Mvc;
using Core.Entities;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using Core.Interfaces;
using Core.Specifications;
namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ProductsController(IUnitOfWork unit) : BaseApiController
    {

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Product>>> GetProducts(
            [FromQuery]ProductSpecParameter specParams)
        {
            var spec = new ProductSpecification(specParams);


            return await CreatePagedResult(unit.Repository<Product>(),spec, specParams.PageIndex, specParams.PageSize);
        }

        [HttpGet("{id:int}")]
        public async Task<ActionResult<Product>> GetProductById(int id)
        {
            var product = await unit.Repository<Product>().GetByIdAsync(id);

            if (product == null)
            {
                return NotFound();
            }
            return product;
        }

        [HttpPost]
        public async Task<ActionResult<Product>> CreateProduct(Product product)
        {

            unit.Repository<Product>().Add(product);

            if (await unit.Complete())
            {
                return CreatedAtAction("GetProductById", new { id = product.Id }, product);
            }

            return BadRequest("Problem creating the product");
        }

        [HttpPut("{id:int}")]
        public async Task<ActionResult> UpdateProduct(int id, Product product)
        {
            if (product.Id != id || !ProductExists(id))
            {
                return BadRequest("Cannot update this product");
            }
            unit.Repository<Product>().Update(product);
            if (await unit.Complete())
            {
                return NoContent();
            }

            return BadRequest("Problem updating the product");
        }

        [HttpDelete("{id:int}")]
        public async Task<ActionResult> DeleteProduct(int id)
        {
            var product = await unit.Repository<Product>().GetByIdAsync(id);
            if (product == null) return NotFound();

            unit.Repository<Product>().Remove(product);
            if (await unit.Complete())
            {
                return NoContent();
            }
            return BadRequest("Problem deleting the product");
        }


        private bool ProductExists(int id)
        {
            return unit.Repository<Product>().Exists(id);
        }
    }
}
