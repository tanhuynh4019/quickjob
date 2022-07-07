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
    public class ProvicesAdminController : Controller
    {
        private DataQuickJobEntities db = new DataQuickJobEntities();

        // GET: Admin/ProvicesAdmin
        public ActionResult Index()
        {
            return View(db.Provices.ToList());
        }

        // GET: Admin/ProvicesAdmin/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Provice provice = db.Provices.Find(id);
            if (provice == null)
            {
                return HttpNotFound();
            }
            return View(provice);
        }

        // GET: Admin/ProvicesAdmin/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/ProvicesAdmin/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "provice_id,provice_name")] Provice provice)
        {
            if (ModelState.IsValid)
            {
                db.Provices.Add(provice);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(provice);
        }

        // GET: Admin/ProvicesAdmin/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Provice provice = db.Provices.Find(id);
            if (provice == null)
            {
                return HttpNotFound();
            }
            return View(provice);
        }

        // POST: Admin/ProvicesAdmin/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "provice_id,provice_name")] Provice provice)
        {
            if (ModelState.IsValid)
            {
                db.Entry(provice).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(provice);
        }

        // GET: Admin/ProvicesAdmin/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Provice provice = db.Provices.Find(id);
            if (provice == null)
            {
                return HttpNotFound();
            }
            return View(provice);
        }

        // POST: Admin/ProvicesAdmin/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Provice provice = db.Provices.Find(id);
            db.Provices.Remove(provice);
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
