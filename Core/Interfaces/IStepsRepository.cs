using Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Interfaces
{
    public interface IStepsRepository
    {
        Task<IReadOnlyList<Recipe>> GetStepsAsync();
        Task<Recipe?> GetStepByIdAsync(int id);
       

        void AddStep(Recipe recipe);
        void UpdateStep(Recipe recipe);
        void DeleteStep(Recipe recipe);
        bool StepExists(int id);
        Task<bool> SaveChangesAsync();
    }
}
