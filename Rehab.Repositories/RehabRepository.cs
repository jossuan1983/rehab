using Rehab.Models;
using System.Collections.Generic;
using System.Data.Entity;

namespace Rehab.Repositories
{
    public abstract class RehabRepository<TEntity> : Repository <TEntity> where TEntity : class
    {
        public RehabRepository(RehabEntities context) : base(context)
        {
        }

        protected RehabEntities RehabContext
        {
            get
            {
                return (RehabEntities)_context;
            }
        }
    }
}
