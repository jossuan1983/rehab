using Rehab.Models;
using System;
using System.ComponentModel.DataAnnotations;

namespace Rehab.WebApp.ViewModels
{
    public class EvaluationViewModel
    {
        public int Id { get; set; }

        public int PatientId { get; set; }

        public DateTime Date { get; set; }

        public string Type { get; set; }

        public string TreatmentCode { get; set; }

        public DateTime? TreatmentStart { get; set; }

        public DateTime? TreatmentEnd { get; set; }

        public string History { get; set; }

        public string Development { get; set; }

        [Display(Name = "TherapistName", ResourceType = typeof(Resources.RehabGlob))]
        public string TherapistName { get; set; }

        [Display(Name = "ProviderNumber", ResourceType = typeof(Resources.RehabGlob))]
        public string ProviderNumber { get; set; }

        [Display(Name = "PhysicianName", ResourceType = typeof(Resources.RehabGlob))]
        public string PhysicianName { get; set; }

        public DateTime? DateSingned { get; set; }

        public string AuthorizationNumber { get; set; }

        public string Recomendations { get; set; }

        public bool IsDeleted { get; set; }

        public DateTime Created { get; set; }

        public DateTime Modified { get; set; }

        public static implicit operator EvaluationViewModel(Evaluation m)
        {
            return AutoMapper.Mapper.Map<EvaluationViewModel>(m);
        }

        public static implicit operator Evaluation(EvaluationViewModel vm)
        {
            return AutoMapper.Mapper.Map<Evaluation>(vm);
        }
    }
}