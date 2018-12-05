using Rehab.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace Rehab.Repositories
{
    public class EvaluationsRepository : ContextBaseRepository<Evaluation>, IEvaluationsRepository
    { 

        public EvaluationsRepository(RehabEntities db):base(db)
        { }
        
        public IEnumerable<Evaluation> Search(string searchString)
        {
            if (String.IsNullOrEmpty(searchString))
            {
                return from p in RehabContext.Evaluations
                       where !p.IsDeleted
                       select p;
            }
            return from p in RehabContext.Evaluations
                   where !p.IsDeleted && 
                       (p.History.Contains(searchString) || 
                       p.PhysicianName.Contains(searchString))
                       select p;
        }
    }
}
