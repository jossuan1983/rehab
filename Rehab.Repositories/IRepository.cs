using System;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace Rehab.Repositories
{
    public interface IRepository <TEntity> where TEntity : class
    {
        TEntity Get(int id);
        IEnumerable<TEntity> GetAll();
        IEnumerable<TEntity> Find(Expression<Func<TEntity, bool>> predicate);

        void Add(TEntity entity);
        void Remove(TEntity entity);
        void Remove(object id);
        void Update(TEntity entity);
    }
}
