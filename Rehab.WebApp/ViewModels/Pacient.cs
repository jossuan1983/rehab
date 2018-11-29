using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace RehabCenter.Models
{
    public class Pacient
    {
        [Key]
        public int ID { get; set; }
        [Display(Name = "Name")]
        public string FirstName { get; set; }
        [Display(Name = "Last Name")]
        public string LastName { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime DOB { get; set; }
        [Display(Name = "Teachers Name")]
        public string TeachersName { get; set; }
        public string Insurance { get; set; }
        [Display(Name = "Insurance Type")]
        public string InsuranceType { get; set; }


        public virtual ICollection<Evaluation> Evaluations { get; set; }
    }
}