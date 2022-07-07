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
    public class UsersAdminMainController : Controller
    {
        private DataQuickJobEntities db = new DataQuickJobEntities();

        // GET: Admin/UsersAdminMain
        public ActionResult IndexCandidate()
        {
            var users = db.Users.Where(n=>n.role_id == 1).Include(u => u.Provice).Include(u => u.Role).Include(u => u.Version).Include(u => u.WorkPlace);
            return View(users.ToList());
        }
        public ActionResult IndexEmployer()
        {
            var users = db.Users.Where(n=>n.role_id == 2).Include(u => u.Provice).Include(u => u.Role).Include(u => u.Version).Include(u => u.WorkPlace);
            return View(users.ToList());
        }
        public ActionResult IndexAdmin()
        {
            var users = db.Users.Where(n=>n.role_id == 3).Include(u => u.Provice).Include(u => u.Role).Include(u => u.Version).Include(u => u.WorkPlace);
            return View(users.ToList());
        }

        // GET: Admin/UsersAdminMain/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // GET: Admin/UsersAdminMain/Create
        public ActionResult Create()
        {
            ViewBag.provice_id = new SelectList(db.Provices, "provice_id", "provice_name");
            ViewBag.role_id = new SelectList(db.Roles, "role_id", "role_name");
            ViewBag.version_id = new SelectList(db.Versions, "version_id", "version_name");
            ViewBag.wp_id = new SelectList(db.WorkPlaces, "wp_id", "wp_name");
            return View();
        }

        // POST: Admin/UsersAdminMain/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "user_id,user_email,user_pass,user_active,user_option,user_datecreate,user_dateupdate,user_img,user_sex,user_birth,user_favourite,role_id,user_name,user_phone,employer_company,provice_id,employer_banner,employer_logo,employer_introduce,employer_favourite,employer_amount,user_note,employer_pageload,employer_youtube,user_key,wp_id,employer_addpress,version_id,user_deadline,employer_amoutjob,user_bin,candidate_amoutcv")] User user)
        {
            if (ModelState.IsValid)
            {
                db.Users.Add(user);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.provice_id = new SelectList(db.Provices, "provice_id", "provice_name", user.provice_id);
            ViewBag.role_id = new SelectList(db.Roles, "role_id", "role_name", user.role_id);
            ViewBag.version_id = new SelectList(db.Versions, "version_id", "version_name", user.version_id);
            ViewBag.wp_id = new SelectList(db.WorkPlaces, "wp_id", "wp_name", user.wp_id);
            return View(user);
        }

        // GET: Admin/UsersAdminMain/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            ViewBag.provice_id = new SelectList(db.Provices, "provice_id", "provice_name", user.provice_id);
            ViewBag.role_id = new SelectList(db.Roles, "role_id", "role_name", user.role_id);
            ViewBag.version_id = new SelectList(db.Versions, "version_id", "version_name", user.version_id);
            ViewBag.wp_id = new SelectList(db.WorkPlaces, "wp_id", "wp_name", user.wp_id);
            return View(user);
        }

        // POST: Admin/UsersAdminMain/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "user_id,user_email,user_pass,user_active,user_option,user_datecreate,user_dateupdate,user_img,user_sex,user_birth,user_favourite,role_id,user_name,user_phone,employer_company,provice_id,employer_banner,employer_logo,employer_introduce,employer_favourite,employer_amount,user_note,employer_pageload,employer_youtube,user_key,wp_id,employer_addpress,version_id,user_deadline,employer_amoutjob,user_bin,candidate_amoutcv")] User user)
        {
            if (ModelState.IsValid)
            {
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.provice_id = new SelectList(db.Provices, "provice_id", "provice_name", user.provice_id);
            ViewBag.role_id = new SelectList(db.Roles, "role_id", "role_name", user.role_id);
            ViewBag.version_id = new SelectList(db.Versions, "version_id", "version_name", user.version_id);
            ViewBag.wp_id = new SelectList(db.WorkPlaces, "wp_id", "wp_name", user.wp_id);
            return View(user);
        }

        // GET: Admin/UsersAdminMain/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // POST: Admin/UsersAdminMain/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            User user = db.Users.Find(id);
            db.Users.Remove(user);
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
