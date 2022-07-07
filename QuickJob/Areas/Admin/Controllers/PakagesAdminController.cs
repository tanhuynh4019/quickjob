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
    public class PakagesAdminController : Controller
    {
        private DataQuickJobEntities db = new DataQuickJobEntities();

        // GET: Admin/PakagesAdmin
        public ActionResult Index()
        {
            var pakages = db.Pakages.Include(p => p.Role);
            return View(pakages.ToList());
        }

        // GET: Admin/PakagesAdmin/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Pakage pakage = db.Pakages.Find(id);
            if (pakage == null)
            {
                return HttpNotFound();
            }
            return View(pakage);
        }

        // GET: Admin/PakagesAdmin/Create
        public ActionResult Create()
        {
            ViewBag.role_id = new SelectList(db.Roles, "role_id", "role_name");
            return View();
        }

        // POST: Admin/PakagesAdmin/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "pakage_id,pakage_name,pakage_note,pakage_money,pakage_precent,pakage_active,role_id")] Pakage pakage)
        {
            if (ModelState.IsValid)
            {
                db.Pakages.Add(pakage);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.role_id = new SelectList(db.Roles, "role_id", "role_name", pakage.role_id);
            return View(pakage);
        }

        // GET: Admin/PakagesAdmin/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Pakage pakage = db.Pakages.Find(id);
            if (pakage == null)
            {
                return HttpNotFound();
            }
            ViewBag.role_id = new SelectList(db.Roles, "role_id", "role_name", pakage.role_id);
            return View(pakage);
        }

        // POST: Admin/PakagesAdmin/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "pakage_id,pakage_name,pakage_note,pakage_money,pakage_precent,pakage_active,role_id")] Pakage pakage)
        {
            if (ModelState.IsValid)
            {
                db.Entry(pakage).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.role_id = new SelectList(db.Roles, "role_id", "role_name", pakage.role_id);
            return View(pakage);
        }

        // GET: Admin/PakagesAdmin/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Pakage pakage = db.Pakages.Find(id);
            if (pakage == null)
            {
                return HttpNotFound();
            }
            return View(pakage);
        }

        // POST: Admin/PakagesAdmin/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Pakage pakage = db.Pakages.Find(id);
            db.Pakages.Remove(pakage);
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
