using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using QuickJob.Function;

namespace QuickJob.Controllers
{
    public class NewsController : Controller
    {
        private DataQuickJobEntities db = new DataQuickJobEntities();

        // GET: News
        public ActionResult Index()
        {
            var news = db.News.Include(n => n.User);
            return View(news.ToList());
        }
        public PartialViewResult Menu()
        {
            return PartialView();
        }

        // GET: News/Details/5
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

        // GET: News/Create
        public ActionResult Create()
        {
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email");
            return View();
        }

        public ActionResult CreateAD()
        {
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email");
            return View();
        }

        // POST: News/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "news_id,news_title,news_contents,news_image,cate_id,news_tags,news_genres,news_datecreate,news_dateupdate,news_active,news_option,news_bin,user_id,news_view")] News news)
        {
            var coo = new FunctionController();

            news.cate_id = 1;
            news.news_datecreate = DateTime.Now;
            news.news_dateupdate = DateTime.Now;
            news.news_active = true;
            news.news_option = true;
            news.news_bin = false;
            news.news_view = 1;
            news.user_id = coo.CookieID().user_id;
            db.News.Add(news);
            db.SaveChanges();

            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", news.user_id);
            return RedirectToAction("Index");

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult CreateAD([Bind(Include = "news_id,news_title,news_contents,news_image,cate_id,news_tags,news_genres,news_datecreate,news_dateupdate,news_active,news_option,news_bin,user_id,news_view")] News news, HttpPostedFileBase img)
        {
            var coo = new FunctionController();

            var code = Guid.NewGuid().ToString();

            var addi = coo.AddImages(img, Common.Common.LINK_NEW, code);

            news.news_image = addi;

            news.cate_id = 2;
            news.news_datecreate = DateTime.Now;
            news.news_dateupdate = DateTime.Now;
            news.news_active = false;
            news.news_option = true;
            news.news_bin = false;
            news.news_view = 1;
            news.user_id = coo.CookieIDEm().user_id;
            db.News.Add(news);
            db.SaveChanges();

            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", news.user_id);
            return RedirectToAction("Index");

        }

        // GET: News/Edit/5
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

        // POST: News/Edit/5
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

        // GET: News/Delete/5
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

        // POST: News/Delete/5
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
