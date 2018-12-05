using Rehab.Models;
using System;
using System.ComponentModel.DataAnnotations;

namespace Rehab.WebApp.ViewModels
{
    public class PatientViewModel
    {
        public int Id { get; set; }

        [Display(Name = "FirstName", ResourceType = typeof(Resources.RehabGlob))]
        public string FirstName { get; set; }

        [Display(Name = "LastName", ResourceType = typeof(Resources.RehabGlob))]
        public string LastName { get; set; }

        [Display(Name = "SSN", ResourceType = typeof(Resources.RehabGlob))]
        public string SSN { get; set; }

        [DataType(DataType.Date)]
        [Display(Name = "DOB", ResourceType = typeof(Resources.RehabGlob))]
        public DateTime DOB { get; set; }

        [Display(Name = "Address", ResourceType = typeof(Resources.RehabGlob))]
        public string Address { get; set; }

        [Display(Name = "Insurance", ResourceType = typeof(Resources.RehabGlob))]
        public string Insurance { get; set; }

        public static implicit operator PatientViewModel(Patient m)
        {
            return AutoMapper.Mapper.Map<PatientViewModel>(m);
        }

        public static implicit operator Patient(PatientViewModel vm)
        {
            return AutoMapper.Mapper.Map<Patient>(vm);
        }
    }
}