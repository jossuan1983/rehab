using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Rehab.Models
{
    public partial class RehabEntities
    {
        static RehabEntities _instance;

        public static RehabEntities Instance
        {
            get
            {
                if(_instance == null)
                {
                    _instance = new RehabEntities();
                }
                return _instance;
            }
        }
    }
}
