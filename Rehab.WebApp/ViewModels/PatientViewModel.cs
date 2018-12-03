using Rehab.Models;
using System;
using System.ComponentModel.DataAnnotations;

namespace Rehab.WebApp.ViewModels
{
    public class PatientViewModel
    {
        public int Id { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string SSN { get; set; }

        [DataType(DataType.Date)]
        public DateTime DOB { get; set; }

        public string Address { get; set; }

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