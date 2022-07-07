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
    public class ExpsController : Controller
    {
        private DataQuickJobEntities db = new DataQuickJobEntities();

        // GET: Admin/Exps
        public ActionResult Index()
        {
            return View(db.Exps.ToList());
        }

        // GET: Admin/Exps/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Exp exp = db.Exps.Find(id);
            if (exp == null)
            {
                return HttpNotFound();
            }
            return View(exp);
        }

        // GET: Admin/Exps/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Exps/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "exp_id,exp_name")] Exp exp)
        {
            if (ModelState.IsValid)
            {
                db.Exps.Add(exp);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(exp);
        }

        // GET: Admin/Exps/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Exp exp = db.Exps.Find(id);
            if (exp == null)
            {
                return HttpNotFound();
            }
            return View(exp);
        }

        // POST: Admin/Exps/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "exp_id,exp_name")] Exp exp)
        {
            if (ModelState.IsValid)
            {
                db.Entry(exp).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(exp);
        }

        // GET: Admin/Exps/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Exp exp = db.Exps.Find(id);
            if (exp == null)
            {
                return HttpNotFound();
            }
            return View(exp);
        }

        // POST: Admin/Exps/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Exp exp = db.Exps.Find(id);
            db.Exps.Remove(exp);
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
