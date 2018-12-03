using PagedList;
using Rehab.Helpers;
using Rehab.Models;
using Rehab.Repositories;
using Rehab.WebApp.ViewModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace Rehab.WebApp.Controllers
{
    public class PatientsController : Controller
    {
        UnitOfWork _unitOfWork = new UnitOfWork();

        public ActionResult Index(string sortOrder, string currentFilter, string searchString, int? page)
        {
            ViewBag.CurrentSort = sortOrder;
            ViewBag.NameSortParm = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
            ViewBag.DateSortParm = sortOrder == "DOB" ? "date_desc" : "Date";

            if (searchString != null)
            {
                page = 1;
            }
            else
            {
                searchString = currentFilter;
            }

            ViewBag.CurrentFilter = searchString;

            var patients = _unitOfWork.PatientRepository.Search(searchString);
            
            switch (sortOrder)
            {
                case "name_desc":
                    patients = patients.OrderByDescending(s => (s.Contact.LastName));
                    break;
                case "DOB":
                    patients = patients.OrderBy(s => s.Contact.DOB);
                    break;
                case "Eval_Date":
                    //patients = patients.OrderByDescending(s => s.Contact.Evaluations);
                    break;
                default:
                    patients = patients.OrderBy(s => s.Contact.LastName);
                    break;
            }

            int pageSize = 3;
            int pageNumber = (page ?? 1);
            var patientsToView = AutoMapper.Mapper.Map<IEnumerable<PatientViewModel>>(patients);
            return View(patientsToView.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PatientViewModel patient = _unitOfWork.PatientRepository.Get(id.Value);
            if (patient == null)
            {
                return HttpNotFound();
            }
            return View(patient);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "FirstName,LastName,DOB,Insurance,Address,SSN")] PatientViewModel patient)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _unitOfWork.PatientRepository.Add(patient);
                    _unitOfWork.Save();
                    return RedirectToAction("Index");
                }
            }
            catch (DataException e)
            {
                ModelState.AddModelError("", "Unable to save changes. Try again, and if the problem persists see your system administrator.");
            }
            return View(patient);
        }

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PatientViewModel patient = _unitOfWork.PatientRepository.Get(id.Value);
            if (patient == null)
            {
                return HttpNotFound();
            }
            return View(patient);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,FirstName,LastName,DOB,Insurance,Address,SSN")] PatientViewModel patient)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var model = _unitOfWork.PatientRepository.Get(patient.Id);
                    model.Insurance = patient.Insurance;
                    PropertyHelper<PatientViewModel, Contact>.Copy(patient, model.Contact, "Id");
                    _unitOfWork.PatientRepository.Update(model);
                    _unitOfWork.Save();
                    return RedirectToAction("Index");
                }
                catch (DataException e)
                {
                    ModelState.AddModelError("", "Unable to save changes. Try again, and if the problem persists, see your system administrator.");
                }
            }
            return View(patient);
        }

        public ActionResult Delete(int? id, bool? saveChangesError = false)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (saveChangesError.GetValueOrDefault())
            {
                ViewBag.ErrorMessage = "Delete failed. Try again, and if the problem persists see your system administrator.";
            }
            PatientViewModel patient = _unitOfWork.PatientRepository.Get(id.Value);
            if (patient == null)
            {
                return HttpNotFound();
            }
            return View(patient);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            try
            {
                var patient = _unitOfWork.PatientRepository.Get(id);
                _unitOfWork.PatientRepository.Remove(patient);
                _unitOfWork.Save();
            }
            catch (DataException)
            {
                return RedirectToAction("Delete", new { id = id, saveChangesError = true });
            }
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                _unitOfWork.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
