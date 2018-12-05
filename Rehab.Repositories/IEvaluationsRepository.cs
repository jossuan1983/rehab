using Rehab.Models;
using System.Collections.Generic;
using System.Linq;

namespace Rehab.Repositories
{
    public interface IEvaluationsRepository : IRepository<Evaluation>
    {
        IEnumerable<Evaluation> Search(string searchString);
    }
}
