using Rehab.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace Rehab.Repositories
{
    public class ContactsRepository : RehabRepository<Contact>, IContactsRepository
    {
        public ContactsRepository(RehabEntities db):base(db)
        { }
        
    }
}
