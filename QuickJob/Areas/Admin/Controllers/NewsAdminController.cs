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
    public class NewsAdminController : Controller
    {
        private DataQuickJobEntities db = new DataQuickJobEntities();

        // GET: Admin/NewsAdmin
        public ActionResult IndexNews()
        {
            var news = db.News.Where(n=>n.cate_id == 2).Include(n => n.User);
            return View(news.ToList());
        }
        public ActionResult IndexQuestion()
        {
            var news = db.News.Where(n => n.cate_id == 1).Include(n => n.User);
            return View(news.ToList());
        }
        // GET: Admin/NewsAdmin/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        // GET: Admin/NewsAdmin/Create
        public ActionResult Create()
        {
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email");
            return View();
        }

        // POST: Admin/NewsAdmin/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "news_id,news_title,news_contents,news_image,cate_id,news_tags,news_genres,news_datecreate,news_dateupdate,news_active,news_option,news_bin,user_id,news_view")] News news)
        {
            if (ModelState.IsValid)
            {
                db.News.Add(news);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", news.user_id);
            return View(news);
        }

        // GET: Admin/NewsAdmin/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", news.user_id);
            return View(news);
        }

        // POST: Admin/NewsAdmin/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "news_id,news_title,news_contents,news_image,cate_id,news_tags,news_genres,news_datecreate,news_dateupdate,news_active,news_option,news_bin,user_id,news_view")] News news)
        {
            if (ModelState.IsValid)
            {
                db.Entry(news).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", news.user_id);
            return View(news);
        }

        // GET: Admin/NewsAdmin/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        // POST: Admin/NewsAdmin/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            News news = db.News.Find(id);
            db.News.Remove(news);
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
