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
    public class StepsController(IGenericRepository<Steps> repo, IGenericRepository<Recipe> recipeRepository) : ControllerBase
    {
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Steps>>> GetSteps()
        {
            return Ok(await repo.ListAllAsync());
        }

        [HttpGet("{id:int}")]
        public async Task<ActionResult<Steps>> GetStepById(int id)
        {
            var step = await repo.GetByIdAsync(id);

            if (step == null)
            {
                return NotFound();
            }
            return step;
        }

        [HttpPost("create")]
        public async Task<ActionResult<Steps>> CreateStep(Steps st)
        {
            var recipe = await recipeRepository.GetByIdAsync(st.RecipeId);

            if (recipe == null)
                return NotFound($"Recipe with id {st.RecipeId} not found");

            var step = new Steps
            {
                RecipeId = st.RecipeId,
                Description = st.Description
            };
            repo.Add(step);

            if (await repo.SaveAllAsync())
            {
                return CreatedAtAction("GetStepById", new { id = step.Id }, step);
            }

            return BadRequest("Problem creating the step");
        }

        [HttpPut("{id:int}")]
        public async Task<ActionResult> UpdateStep(int id, Steps step)
        {
            if (step.Id != id || !StepExists(id))
            {
                return BadRequest("Cannot update this step");
            }
            repo.Update(step);
            if (await repo.SaveAllAsync())
            {
                return NoContent();
            }

            return BadRequest("Problem updating the step");
        }

        [HttpDelete("{id:int}")]
        public async Task<ActionResult> DeleteStep(int id)
        {
            var step = await repo.GetByIdAsync(id);
            if (step == null) return NotFound();

            repo.Remove(step);
            if (await repo.SaveAllAsync())
            {
                return NoContent();
            }
            return BadRequest("Problem deleting the step");
        }

        
        private bool StepExists(int id)
        {
            return repo.Exists(id);
        }
    }
}
