using Rehab.Models;
using System.Collections.Generic;
using System.Data.Entity;

namespace Rehab.Repositories
{
    public abstract class ContextBaseRepository<TEntity> : Repository <TEntity> where TEntity : class
    {
        public ContextBaseRepository(RehabEntities context) : base(context)
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
