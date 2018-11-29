using Rehab.Models;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace Rehab.Repositories
{
    public abstract class Repository<TEntity> : IRepository <TEntity> where TEntity : class
    {
        protected readonly DbContext _context;
        protected readonly DbSet<TEntity> _set; 

        public Repository(DbContext context)
        {
            _context = context;
            _set = _context.Set<TEntity>();
        }

        public virtual void Add(TEntity entity)
        {
            _set.Add(entity);
        }

        public virtual IEnumerable<TEntity> Find(System.Linq.Expressions.Expression<System.Func<TEntity, bool>> predicate)
        {
            return _set.Where(predicate);
        }

        public virtual TEntity Get(int id)
        {
            return _set.Find(id);
        }

        public virtual IEnumerable<TEntity> GetAll()
        {
            return _set.ToList();
        }

        public virtual void Remove(TEntity entity)
        {
            if (_context.Entry(entity).State == EntityState.Detached)
            {
                _set.Attach(entity);
            }
            _set.Remove(entity);
        }

        public virtual void Remove(object id)
        {
            var entity = _set.Find(id);
            Remove(entity);
        }

        public virtual void Update(TEntity entity)
        {
            _set.Attach(entity);
            _context.Entry(entity).State = EntityState.Modified;
        }
    }
}
