using Rehab.Models;
using System.Collections.Generic;
using System.Linq;

namespace Rehab.Repositories
{
    public interface IPatientRepository : IRepository<Patient>
    {
        IEnumerable<Patient> Search(string searchString);
    }
}
