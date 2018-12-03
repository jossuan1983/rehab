using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Rehab.Models
{ 
    public partial class RehabEntities
    {
        public override int SaveChanges()
        {
            ChangeTracker.DetectChanges();
            
            foreach (var item in ChangeTracker.Entries().Where(e => e.State == EntityState.Deleted))
            {
                item.State = EntityState.Modified;
                item.CurrentValues["IsDeleted"] = true;
            }

            foreach (var item in ChangeTracker.Entries().Where(e => e.State != EntityState.Added))
            {
                item.CurrentValues["Created"] = DateTime.Now;
            }

            foreach (var item in ChangeTracker.Entries().Where(e => e.State != EntityState.Unchanged))
            {
                item.CurrentValues["Modified"] = DateTime.Now;
            }

            return base.SaveChanges();
        }
    }
}

