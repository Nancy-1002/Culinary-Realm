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
    public class StepsController(IUnitOfWork unit) : ControllerBase
    {
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Steps>>> GetSteps()
        {
            return Ok(await unit.Repository<Steps>().ListAllAsync());
        }

        [HttpGet("{id:int}")]
        public async Task<ActionResult<Steps>> GetStepById(int id)
        {
            var step = await unit.Repository<Steps>().GetByIdAsync(id);

            if (step == null)
            {
                return NotFound();
            }
            return step;
        }

        [HttpPost("create")]
        public async Task<ActionResult<Steps>> CreateStep(Steps st)
        {
            var recipe = await unit.Repository<Recipe>().GetByIdAsync(st.RecipeId);

            if (recipe == null)
                return NotFound($"Recipe with id {st.RecipeId} not found");

            var step = new Steps
            {
                RecipeId = st.RecipeId,
                Description = st.Description
            };
            unit.Repository<Steps>().Add(step);

            if (await unit.Complete())
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
            unit.Repository<Steps>().Update(step);
            if (await unit.Complete())
            {
                return NoContent();
            }

            return BadRequest("Problem updating the step");
        }

        [HttpDelete("{id:int}")]
        public async Task<ActionResult> DeleteStep(int id)
        {
            var step = await unit.Repository<Steps>().GetByIdAsync(id);
            if (step == null) return NotFound();

            unit.Repository<Steps>().Remove(step);
            if (await unit.Complete())
            {
                return NoContent();
            }
            return BadRequest("Problem deleting the step");
        }

        
        private bool StepExists(int id)
        {
            return unit.Repository<Steps>().Exists(id);
        }
    }
}
