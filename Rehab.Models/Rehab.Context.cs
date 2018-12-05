﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class RehabEntities : DbContext
    {
        public RehabEntities()
            : base("name=RehabEntities")
        {
        }
    
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<Patient> Patients { get; set; }
        public virtual DbSet<Evaluation> Evaluations { get; set; }
    	
    	protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
    		modelBuilder.Entity<Contact>().Map(m => m.Requires("IsDeleted").HasValue(false));
    		modelBuilder.Entity<Patient>().Map(m => m.Requires("IsDeleted").HasValue(false));
    		modelBuilder.Entity<Evaluation>().Map(m => m.Requires("IsDeleted").HasValue(false));
        }
    
    }	
    
}
