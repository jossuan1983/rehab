using AutoMapper;
using Rehab.Models;
using Rehab.WebApp.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Rehab.WebApp
{
    public static class MappingConfig
    {
        internal static void RegisterMaps()
        {
            Mapper.Initialize(config => 
            {
                config.CreateMap<Patient, PatientViewModel>()
                .ForMember(dest => dest.FirstName, opt => opt.MapFrom(src => src.Contact.FirstName))
                .ForMember(dest => dest.LastName, opt => opt.MapFrom(src => src.Contact.LastName))
                .ForMember(dest => dest.SSN, opt => opt.MapFrom(src => src.Contact.SSN))
                .ForMember(dest => dest.DOB, opt => opt.MapFrom(src => src.Contact.DOB))
                .ForMember(dest => dest.Address, opt => opt.MapFrom(src => src.Contact.Address))
                .ReverseMap();

                config.CreateMap<Evaluation, EvaluationViewModel>().ReverseMap();
            });
        }
    }
}