using Core.Entities;
using Core.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class IngredientProductController(IGenericRepository<IngredientProduct> ingProRepo, IGenericRepository<Ingredient> ingRepo, IGenericRepository<Product> proRepo) : ControllerBase
    {
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Ingredient>>> GetIngredientProduct()
        {
            return Ok(await ingProRepo.ListAllAsync());
        }

        [HttpGet("{ingId}")]
        public async Task<ActionResult<IngredientProduct>> GetIngredientProductById(int ingId)
        {
            var ingPro = await ingProRepo.GetByConditionAsync(ip => ip.IngredientId == ingId);

            if (ingPro == null)
            {
                return NotFound();
            }

            return Ok(ingPro);
        }


        [HttpPost]
        public async Task<ActionResult<IngredientProduct>> CreateIngredientProduct(IngredientProduct ingPro)
        {
            var ing = await ingRepo.GetByIdAsync(ingPro.IngredientId);
            var pro = await proRepo.GetByIdAsync(ingPro.ProductId);

            if (ing == null || pro == null)
            {
                return NotFound($"Ingredient with id {ingPro.IngredientId} or Product with id {ingPro.ProductId}  not found");
            }

            var ingredientProduct = new IngredientProduct
            {
                IngredientId = ingPro.IngredientId,
                ProductId = ingPro.ProductId
            };
            
            ingProRepo.Add(ingredientProduct);

            if (await ingProRepo.SaveAllAsync())
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
            ingProRepo.Update(ingPro);
            if (await ingProRepo.SaveAllAsync())
            {
                return NoContent();
            }

            return BadRequest("Problem updating the ingredient");
        }

        [HttpDelete("{id:int}")]
        public async Task<ActionResult> DeleteIngredientProduct(int id)
        {
            var ingPro = await ingProRepo.GetByIdAsync(id);
            if (ingPro == null) return NotFound();

            ingProRepo.Remove(ingPro);
            if (await ingProRepo.SaveAllAsync())
            {
                return NoContent();
            }
            return BadRequest("Problem deleting the ingredient product");
        }


        private bool IngredientProductExists(int id)
        {
            return ingProRepo.Exists(id);
        }
    }
}

