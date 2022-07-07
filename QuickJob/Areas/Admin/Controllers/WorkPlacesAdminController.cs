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
    public class WorkPlacesAdminController : Controller
    {
        private DataQuickJobEntities db = new DataQuickJobEntities();

        // GET: Admin/WorkPlacesAdmin
        public ActionResult Index()
        {
            return View(db.WorkPlaces.ToList());
        }

        // GET: Admin/WorkPlacesAdmin/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            WorkPlace workPlace = db.WorkPlaces.Find(id);
            if (workPlace == null)
            {
                return HttpNotFound();
            }
            return View(workPlace);
        }

        // GET: Admin/WorkPlacesAdmin/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/WorkPlacesAdmin/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "wp_id,wp_name")] WorkPlace workPlace)
        {
            if (ModelState.IsValid)
            {
                db.WorkPlaces.Add(workPlace);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(workPlace);
        }

        // GET: Admin/WorkPlacesAdmin/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            WorkPlace workPlace = db.WorkPlaces.Find(id);
            if (workPlace == null)
            {
                return HttpNotFound();
            }
            return View(workPlace);
        }

        // POST: Admin/WorkPlacesAdmin/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "wp_id,wp_name")] WorkPlace workPlace)
        {
            if (ModelState.IsValid)
            {
                db.Entry(workPlace).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(workPlace);
        }

        // GET: Admin/WorkPlacesAdmin/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            WorkPlace workPlace = db.WorkPlaces.Find(id);
            if (workPlace == null)
            {
                return HttpNotFound();
            }
            return View(workPlace);
        }

        // POST: Admin/WorkPlacesAdmin/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            WorkPlace workPlace = db.WorkPlaces.Find(id);
            db.WorkPlaces.Remove(workPlace);
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
