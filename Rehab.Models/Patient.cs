//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Rehab.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Patient
    {
        public int Id { get; set; }
        public string Insurance { get; set; }
        public Nullable<int> ContactId { get; set; }
    
        public virtual Contact Contact { get; set; }
    }
}
