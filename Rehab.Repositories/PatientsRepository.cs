using Rehab.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace Rehab.Repositories
{
    public class PatientRepository : RehabRepository<Patient>, IPatientRepository
    { 

        public PatientRepository(RehabEntities db):base(db)
        { }
        
        public IEnumerable<Patient> Search(string searchString)
        {
            if (String.IsNullOrEmpty(searchString))
            {
                return from p in RehabContext.Patients
                       where !p.IsDeleted
                       select p;
            }
            return from p in RehabContext.Patients
                       where !p.IsDeleted && 
                       (p.Contact.LastName.Contains(searchString) || 
                       p.Contact.FirstName.Contains(searchString))
                       select p;
        }
    }
}
