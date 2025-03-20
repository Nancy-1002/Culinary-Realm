using Core.Entities;
using Core.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class IngredientProductController(IUnitOfWork unit) : ControllerBase
    {
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Ingredient>>> GetIngredientProduct()
        {
            return Ok(await unit.Repository<IngredientProduct>().ListAllAsync());
        }

        [HttpGet("{ingId}")]
        public async Task<ActionResult<IngredientProduct>> GetIngredientProductById(int ingId)
        {
            var ingPro = await unit.Repository<IngredientProduct>().GetByConditionAsync(ip => ip.IngredientId == ingId);

            if (ingPro == null)
            {
                return NotFound();
            }

            return Ok(ingPro);
        }


        [HttpPost]
        public async Task<ActionResult<IngredientProduct>> CreateIngredientProduct(IngredientProduct ingPro)
        {
            var ing = await unit.Repository<Ingredient>().GetByIdAsync(ingPro.IngredientId);
            var pro = await unit.Repository<Product>().GetByIdAsync(ingPro.ProductId);

            if (ing == null || pro == null)
            {
                return NotFound($"Ingredient with id {ingPro.IngredientId} or Product with id {ingPro.ProductId}  not found");
            }

            var ingredientProduct = new IngredientProduct
            {
                IngredientId = ingPro.IngredientId,
                ProductId = ingPro.ProductId
            };

            unit.Repository<IngredientProduct>().Add(ingredientProduct);

            if (await unit.Complete())
            {
                return CreatedAtAction("GetIngredientProductById", new { id = ingPro.Id }, ingPro);
            }

            return BadRequest("Problem creating the ingredient product");
        }

        [HttpPut("{id:int}")]
        public async Task<ActionResult> UpdateIngredientProduct(int id, IngredientProduct ingPro)
        {

            if (ingPro.Id != id || !IngredientProductExists(id))
            {
                return BadRequest("Cannot update this ingredient");
            }
            unit.Repository<IngredientProduct>().Update(ingPro);
            if (await unit.Complete())
            {
                return NoContent();
            }

            return BadRequest("Problem updating the ingredient");
        }

        [HttpDelete("{id:int}")]
        public async Task<ActionResult> DeleteIngredientProduct(int id)
        {
            var ingPro = await unit.Repository<IngredientProduct>().GetByIdAsync(id);
            if (ingPro == null) return NotFound();

            unit.Repository<IngredientProduct>().Remove(ingPro);
            if (await unit.Complete())
            {
                return NoContent();
            }
            return BadRequest("Problem deleting the ingredient product");
        }


        private bool IngredientProductExists(int id)
        {
            return unit.Repository<IngredientProduct>().Exists(id);
        }
    }
}

