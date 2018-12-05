using Rehab.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Rehab.Repositories
{
    public class UnitOfWork : IDisposable
    {
        protected RehabEntities _context = new RehabEntities();

        protected IEvaluationsRepository _evaluationsRepository;
        public IEvaluationsRepository EvaluationsRepository
        {
            get
            {
                if (_evaluationsRepository == null)
                {
                    _evaluationsRepository = new EvaluationsRepository(_context);
                }
                return _evaluationsRepository;
            }
        }

        protected IPatientsRepository _patientsRepository;
        public IPatientsRepository PatientsRepository
        {
            get
            {
                if (_patientsRepository == null)
                {
                    _patientsRepository = new PatientsRepository(_context);
                }
                return _patientsRepository;
            }
        }

        protected IContactsRepository _contactsRepository;
        public IContactsRepository ContactsRepository
        {
            get
            {
                if (_contactsRepository == null)
                {
                    _contactsRepository = new ContactsRepository(_context);
                }
                return _contactsRepository;
            }
        }

        public void Save()
        {
            _context.SaveChanges();
        }

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    _context.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}
