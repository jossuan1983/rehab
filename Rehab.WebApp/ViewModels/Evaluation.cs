using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace RehabCenter.Models
{
    public class Evaluation
    {
        public int EvaluationID { get; set; }


        [Display(Name = "Evaluation Date")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime EvalDate { get; set; }
        public int PacientID { get; set; }
        [Display(Name = "Treatment Code")]
        public string TreatmentCode { get; set; }

        [Display(Name = "Treatment Authorization Period")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime TreatmentStart { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime TreatmentEnd { get; set; }
        [Display(Name = "Therapist Name")]
        public string TherapistName { get; set; }
        [Display(Name = "Provider Number")]
        public string ProviderNumber { get; set; }
        [Display(Name = "Physician's  Name")]
        public string PhysicianName { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Display(Name = "Date Signed")]
        public DateTime DateSingned { get; set; }
        [Display(Name = "Authorization Number")]
        public string AuthorizationNumber { get; set; }

        [Display(Name = "GENERAL NOTES")]
        [DataType(DataType.MultilineText)]
        public string GeneralNotes1 { get; set; }
        [DataType(DataType.MultilineText)]
        public string GeneralNotes2 { get; set; }
        [DataType(DataType.MultilineText)]
        public string GeneralNotes3 { get; set; }
        [DataType(DataType.MultilineText)]
        public string GeneralNotes4 { get; set; }

        [Display(Name = "GOALS")]
        [DataType(DataType.MultilineText)]
        public string Goals1 { get; set; }
        [DataType(DataType.MultilineText)]
        public string Goals2 { get; set; }
        [DataType(DataType.MultilineText)]
        public string Goals3 { get; set; }
        [DataType(DataType.MultilineText)]
        public string Goals4 { get; set; }

        [Display(Name = "LONG TERM GOALS")]
        [DataType(DataType.MultilineText)]
        public string LongTermGoals1 { get; set; }
        [DataType(DataType.MultilineText)]
        public string LongTermGoals2 { get; set; }

        [Display(Name = "THERAPY METHODS")]
        public virtual ICollection<TherapyMethod> TherapyMethods { get; set; }

        [Display(Name = "RECOMMENDATIONS")]
        [DataType(DataType.MultilineText)]
        public string Recomendations { get; set; }
        [Display(Name = "DIAGNOSIS/ SIGNIFICAN HISTORY")]
        [DataType(DataType.MultilineText)]
        public string Diagnosis { get; set; }
        [Display(Name = "TEST ADMINISTERED")]
        [DataType(DataType.MultilineText)]
        public string TestAdministerd { get; set; }
        [Display(Name = "FUNCTIONAL AND/OR FINE MOTOR DEVELOPMENT")]
        [DataType(DataType.MultilineText)]
        public string MotorDevelop { get; set; }
        [Display(Name = "ASSESMENT/ MAJOR AREAS OF CONCERN")]
        public string Assesment { get; set; }

        public string TreatmentPeriod()
        {
            return TreatmentStart + "-" + TreatmentEnd; 
        }
    }
}