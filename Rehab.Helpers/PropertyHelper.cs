using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Rehab.Helpers
{
    public class PropertyHelper<TSource, TDest> where TSource : class
                                            where TDest : class
    {
        public static void Copy(TSource src, TDest dest)
        {
            var parentProperties = src.GetType().GetProperties();
            var childProperties = dest.GetType().GetProperties();

            foreach (var parentProperty in parentProperties)
            {
                foreach (var childProperty in childProperties)
                {
                    if (parentProperty.Name == childProperty.Name && parentProperty.PropertyType == childProperty.PropertyType)
                    {
                        childProperty.SetValue(dest, parentProperty.GetValue(src));
                        break;
                    }
                }
            }
        }

    }
}
