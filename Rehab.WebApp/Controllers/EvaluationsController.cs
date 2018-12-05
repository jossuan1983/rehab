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
    public class EvaluationsController : Controller
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

            var evaluations = _unitOfWork.EvaluationsRepository.Search(searchString);
            
            /*switch (sortOrder)
            {
                case "name_desc":
                    Evaluations = Evaluations.OrderByDescending(s => (s.Contact.LastName));
                    break;
                case "DOB":
                    Evaluations = Evaluations.OrderBy(s => s.Contact.DOB);
                    break;
                case "Eval_Date":
                    //Evaluations = Evaluations.OrderByDescending(s => s.Contact.Evaluations);
                    break;
                default:
                    Evaluations = Evaluations.OrderBy(s => s.Contact.LastName);
                    break;
            }*/

            int pageSize = 3;
            int pageNumber = (page ?? 1);
            var EvaluationsToView = AutoMapper.Mapper.Map<IEnumerable<EvaluationViewModel>>(evaluations);
            return View(EvaluationsToView.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EvaluationViewModel Evaluation = _unitOfWork.EvaluationsRepository.Get(id.Value);
            if (Evaluation == null)
            {
                return HttpNotFound();
            }
            return View(Evaluation);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "")] EvaluationViewModel Evaluation)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _unitOfWork.EvaluationsRepository.Add(Evaluation);
                    _unitOfWork.Save();
                    return RedirectToAction("Index");
                }
            }
            catch (DataException e)
            {
                ModelState.AddModelError("", "Unable to save changes. Try again, and if the problem persists see your system administrator.");
            }
            return View(Evaluation);
        }

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EvaluationViewModel Evaluation = _unitOfWork.EvaluationsRepository.Get(id.Value);
            if (Evaluation == null)
            {
                return HttpNotFound();
            }
            return View(Evaluation);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id")] EvaluationViewModel Evaluation)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    _unitOfWork.EvaluationsRepository.Update(Evaluation);
                    _unitOfWork.Save();
                    return RedirectToAction("Index");
                }
                catch (DataException e)
                {
                    ModelState.AddModelError("", "Unable to save changes. Try again, and if the problem persists, see your system administrator.");
                }
            }
            return View(Evaluation);
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
            EvaluationViewModel Evaluation = _unitOfWork.EvaluationsRepository.Get(id.Value);
            if (Evaluation == null)
            {
                return HttpNotFound();
            }
            return View(Evaluation);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            try
            {
                var Evaluation = _unitOfWork.EvaluationsRepository.Get(id);
                _unitOfWork.EvaluationsRepository.Remove(Evaluation);
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
