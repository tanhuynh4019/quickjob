using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Model.EF;

namespace QuickJob.Areas.Admin.Controllers
{
    public class TypeJobsAdminController : Controller
    {
        private DataQuickJobEntities db = new DataQuickJobEntities();

        // GET: Admin/TypeJobsAdmin
        public ActionResult Index()
        {
            return View(db.TypeJobs.ToList());
        }

        // GET: Admin/TypeJobsAdmin/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TypeJob typeJob = db.TypeJobs.Find(id);
            if (typeJob == null)
            {
                return HttpNotFound();
            }
            return View(typeJob);
        }

        // GET: Admin/TypeJobsAdmin/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/TypeJobsAdmin/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "type_id,type_name")] TypeJob typeJob)
        {
            if (ModelState.IsValid)
            {
                db.TypeJobs.Add(typeJob);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(typeJob);
        }

        // GET: Admin/TypeJobsAdmin/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TypeJob typeJob = db.TypeJobs.Find(id);
            if (typeJob == null)
            {
                return HttpNotFound();
            }
            return View(typeJob);
        }

        // POST: Admin/TypeJobsAdmin/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "type_id,type_name")] TypeJob typeJob)
        {
            if (ModelState.IsValid)
            {
                db.Entry(typeJob).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(typeJob);
        }

        // GET: Admin/TypeJobsAdmin/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TypeJob typeJob = db.TypeJobs.Find(id);
            if (typeJob == null)
            {
                return HttpNotFound();
            }
            return View(typeJob);
        }

        // POST: Admin/TypeJobsAdmin/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TypeJob typeJob = db.TypeJobs.Find(id);
            db.TypeJobs.Remove(typeJob);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
