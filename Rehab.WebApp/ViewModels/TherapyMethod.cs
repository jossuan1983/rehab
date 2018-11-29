using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace RehabCenter.Models
{
    public class TherapyMethod
    {
        public int TherapyMethodID { get; set; }
        public int EvalID { get; set; }

        public Boolean SoftTissue { get; set; }
        public Boolean NeuroDevelopment { get; set; }
        public Boolean Strengthening { get; set; }
        public Boolean SensoryInt { get; set; }
        public Boolean NeuroMuscular { get; set; }
        public Boolean PerceptualMotor { get; set; }
        public Boolean HEP { get; set; }
        public Boolean TherapeuticExc { get; set; }
        public Boolean MotorCoord { get; set; }
        public Boolean MotorPlanning { get; set; }
        public Boolean PusturalControl { get; set; }
        public Boolean InHandManip { get; set; }
        public Boolean SelfCareTraining { get; set; }

    }
}