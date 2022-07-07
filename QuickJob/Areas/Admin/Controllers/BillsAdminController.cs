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
    public class BillsAdminController : Controller
    {
        private DataQuickJobEntities db = new DataQuickJobEntities();

        // GET: Admin/BillsAdmin
        public ActionResult IndexCandidate()
        {
            var bills = db.Bills.Where(n=>n.User.role_id == 1).Include(b => b.Pakage).Include(b => b.User);
            return View(bills.ToList());
        }
        public ActionResult IndexEmployer()
        {
            var bills = db.Bills.Where(n => n.User.role_id == 2).Include(b => b.Pakage).Include(b => b.User);
            return View(bills.ToList());
        }

        // GET: Admin/BillsAdmin/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bill bill = db.Bills.Find(id);
            if (bill == null)
            {
                return HttpNotFound();
            }
            return View(bill);
        }

        // GET: Admin/BillsAdmin/Create
        public ActionResult Create()
        {
            ViewBag.pakege_id = new SelectList(db.Pakages, "pakage_id", "pakage_name");
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email");
            return View();
        }

        // POST: Admin/BillsAdmin/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "bill_id,user_id,bill_datecreate,bill_sum,bill_active,bill_dealine,pakege_id,bill_key,bill_orderid")] Bill bill)
        {
            if (ModelState.IsValid)
            {
                db.Bills.Add(bill);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.pakege_id = new SelectList(db.Pakages, "pakage_id", "pakage_name", bill.pakege_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", bill.user_id);
            return View(bill);
        }

        // GET: Admin/BillsAdmin/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bill bill = db.Bills.Find(id);
            if (bill == null)
            {
                return HttpNotFound();
            }
            ViewBag.pakege_id = new SelectList(db.Pakages, "pakage_id", "pakage_name", bill.pakege_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", bill.user_id);
            return View(bill);
        }

        // POST: Admin/BillsAdmin/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "bill_id,user_id,bill_datecreate,bill_sum,bill_active,bill_dealine,pakege_id,bill_key,bill_orderid")] Bill bill)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bill).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.pakege_id = new SelectList(db.Pakages, "pakage_id", "pakage_name", bill.pakege_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", bill.user_id);
            return View(bill);
        }

        // GET: Admin/BillsAdmin/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bill bill = db.Bills.Find(id);
            if (bill == null)
            {
                return HttpNotFound();
            }
            return View(bill);
        }

        // POST: Admin/BillsAdmin/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Bill bill = db.Bills.Find(id);
            db.Bills.Remove(bill);
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
