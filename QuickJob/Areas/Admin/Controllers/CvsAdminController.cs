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
    public class CvsAdminController : Controller
    {
        private DataQuickJobEntities db = new DataQuickJobEntities();

        // GET: Admin/CvsAdmin
        public ActionResult Index()
        {
            var cvs = db.Cvs.Include(c => c.Theme).Include(c => c.User);
            return View(cvs.Where(t => t.cv_bin == false).ToList());
        }

        // GET: Admin/CvsAdmin/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cv cv = db.Cvs.Find(id);
            if (cv == null)
            {
                return HttpNotFound();
            }
            return View(cv);
        }

        // GET: Admin/CvsAdmin/Create
        public ActionResult Create()
        {
            ViewBag.theme_id = new SelectList(db.Themes, "theme_id", "theme_name");
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email");
            return View();
        }

        // POST: Admin/CvsAdmin/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "cv_id,cv_img,cv_location,cv_datebirth,cv_sex,cv_website,cv_target,cv_interest,cv_informatin,cv_referenceperson,cv_title,cv_email,cv_phone,cv_fullname,cv_active,cv_option,cv_bin,cv_datecreate,cv_dateupdate,cv_fakeid,cv_fontsize,cv_bg,cv_p,cv_view,cv_point,cv_deadline,user_id,theme_id,cv_addpress,cv_f")] Cv cv)
        {
            if (ModelState.IsValid)
            {
                db.Cvs.Add(cv);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.theme_id = new SelectList(db.Themes, "theme_id", "theme_name", cv.theme_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", cv.user_id);
            return View(cv);
        }

        // GET: Admin/CvsAdmin/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cv cv = db.Cvs.Find(id);
            if (cv == null)
            {
                return HttpNotFound();
            }
            ViewBag.theme_id = new SelectList(db.Themes, "theme_id", "theme_name", cv.theme_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", cv.user_id);
            return View(cv);
        }

        // POST: Admin/CvsAdmin/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "cv_id,cv_img,cv_location,cv_datebirth,cv_sex,cv_website,cv_target,cv_interest,cv_informatin,cv_referenceperson,cv_title,cv_email,cv_phone,cv_fullname,cv_active,cv_option,cv_bin,cv_datecreate,cv_dateupdate,cv_fakeid,cv_fontsize,cv_bg,cv_p,cv_view,cv_point,cv_deadline,user_id,theme_id,cv_addpress,cv_f")] Cv cv)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cv).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.theme_id = new SelectList(db.Themes, "theme_id", "theme_name", cv.theme_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", cv.user_id);
            return View(cv);
        }

        [HttpPost]
        public JsonResult Remove(int? id)
        {
            if (id != null)
            {
                var removeItem = db.Cvs.Find(id);
                if (removeItem != null)
                {
                    removeItem.cv_bin = true;
                    db.SaveChanges();
                    return Json(true, JsonRequestBehavior.AllowGet);
                }
            }
            return Json(false, JsonRequestBehavior.AllowGet);
        }

        // GET: Admin/CvsAdmin/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cv cv = db.Cvs.Find(id);
            if (cv == null)
            {
                return HttpNotFound();
            }
            return View(cv);
        }

        // POST: Admin/CvsAdmin/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Cv cv = db.Cvs.Find(id);
            db.Cvs.Remove(cv);
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
