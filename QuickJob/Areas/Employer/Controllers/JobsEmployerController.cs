using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Common;
using QuickJob.Function;

namespace QuickJob.Areas.Employer.Controllers
{
    public class JobsEmployerController : Controller
    {
        private DataQuickJobEntities db = new DataQuickJobEntities();

        // GET: Employer/JobsEmployer
        public ActionResult Index()
        {
            var fu = new FunctionController();
            var id = fu.CookieIDEm();
            var jobs = db.Jobs.Include(j => j.Exp).Include(j => j.TypeJob).Include(j => j.WorkPlace).Include(j => j.User);
            return View(jobs.ToList());
        }
        public JsonResult Json()
        {
            var fu = new FunctionController();
            var id = fu.CookieIDEm();
            var list = db.Jobs.Where(n=>n.user_id == id.user_id && n.job_bin == false).OrderByDescending(n=>n.job_dateupdate).Select(n => new
            {
                id = n.job_id,
                title = n.job_title,
                provice = n.Groups.Where(t=>t.group_item == Common.Common.GROUP_JOB_PROVICE).Select(t=>t.Provice.provice_name),
                amout = n.job_amout,
                category = n.Groups.Where(t=>t.group_item == Common.Common.GROUP_JOB_CATEGORY).Select(t=>t.Category.cate_name),
                type = n.TypeJob.type_name,
                workplace = n.WorkPlace.wp_name,
                sex = n.job_sex,
                exp = n.Exp.exp_name,
                active = n.job_active,
                option = n.job_option,
                bin = n.job_bin,
                datecreate = n.job_datecreate.ToString(),
                deadline = n.job_datedeline.ToString(),
                update = n.job_dateupdate.ToString()


            }).ToList();

            return Json(list, JsonRequestBehavior.AllowGet);
        }

        // GET: Employer/JobsEmployer/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Job job = db.Jobs.Find(id);
            if (job == null)
            {
                return HttpNotFound();
            }
            return View(job);
        }

        // GET: Employer/JobsEmployer/Create
        public ActionResult Create()
        {
            var fu = new FunctionController();
            var id = fu.CookieIDEm();

            List<Job> job = db.Jobs.Where(n => n.user_id == id.user_id).ToList();

            if (id.employer_pageload == null)
            {
                return Redirect("/Employer/UsersEmployer/PersonalPage");
            }

            if(id.employer_amoutjob - job.Count == 0)
            {
                return Redirect("/Employer/PayEmployer/Index");
            }

            ViewBag.exp_id = new SelectList(db.Exps, "exp_id", "exp_name");
            ViewBag.type_id = new SelectList(db.TypeJobs, "type_id", "type_name");
            ViewBag.wp_id = new SelectList(db.WorkPlaces, "wp_id", "wp_name");
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email");
            return View();
        }

        // POST: Employer/JobsEmployer/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "job_id,job_title,job_addpress,job_amout,wp_id,type_id,job_sex,exp_id,job_payend,job_paystart,job_datedeline,job_name,job_phone,job_describe,job_request,job_right,job_active,job_option,job_datecreate,job_dateupdate,job_bin,job_view,user_id,job_textprice")] Job job,int[] cate, int[] provice)
        {
            var fu = new FunctionController();
            var code = Guid.NewGuid().ToString();
            if (ModelState.IsValid)
            {

                job.job_key = code;
                job.job_active = false;
                job.job_option = true;
                job.job_bin = false;
                job.job_datecreate = DateTime.Now;
                job.job_dateupdate = DateTime.Now;
                job.job_view = 0;
                job.user_id = fu.CookieIDEm().user_id;


                if(job.job_textprice == "Từ")
                {
                    job.job_payend = "0";
                }
                else if(job.job_textprice == "Lên đến")
                {
                    job.job_payend = "0";
                }
                else if(job.job_textprice == "Trong khoảng")
                {

                }
                else
                {
                    job.job_payend = "0";
                    job.job_paystart = "0";
                }


                if(job.job_amout == null)
                {
                    job.job_amout = 0;
                }

                db.Jobs.Add(job);
                db.SaveChanges();


                Job check = db.Jobs.SingleOrDefault(n => n.job_key == code);
                //Cate
                foreach(var item in cate)
                {
                    Group group = new Group
                    {
                        datecreate = DateTime.Now,
                        job_id = check.job_id,
                        category_id = item,
                        group_item = Common.Common.GROUP_JOB_CATEGORY
                    };
                    db.Groups.Add(group);
                    db.SaveChanges();
                }
                //Provice
                foreach (var item in provice)
                {
                    Group group = new Group
                    {
                        datecreate = DateTime.Now,
                        job_id = check.job_id,
                        provice_id = item,
                        group_item = Common.Common.GROUP_JOB_PROVICE
                    };
                    db.Groups.Add(group);
                    db.SaveChanges();
                }

                return RedirectToAction("Index");
            }

            ViewBag.exp_id = new SelectList(db.Exps, "exp_id", "exp_name", job.exp_id);
            ViewBag.type_id = new SelectList(db.TypeJobs, "type_id", "type_name", job.type_id);
            ViewBag.wp_id = new SelectList(db.WorkPlaces, "wp_id", "wp_name", job.wp_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", job.user_id);
            return View(job);
        }

        // GET: Employer/JobsEmployer/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Job job = db.Jobs.Find(id);
            if (job == null)
            {
                return HttpNotFound();
            }
            ViewBag.exp_id = new SelectList(db.Exps, "exp_id", "exp_name", job.exp_id);
            ViewBag.type_id = new SelectList(db.TypeJobs, "type_id", "type_name", job.type_id);
            ViewBag.wp_id = new SelectList(db.WorkPlaces, "wp_id", "wp_name", job.wp_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", job.user_id);
            return View(job);
        }

        // POST: Employer/JobsEmployer/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "job_id,job_title,job_addpress,job_amout,wp_id,type_id,job_sex,exp_id,job_payend,job_paystart,job_datedeline,job_name,job_phone,job_describe,job_request,job_right,job_active,job_option,job_datecreate,job_dateupdate,job_bin,job_view,user_id")] Job job)
        {
            if (ModelState.IsValid)
            {
                db.Entry(job).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.exp_id = new SelectList(db.Exps, "exp_id", "exp_name", job.exp_id);
            ViewBag.type_id = new SelectList(db.TypeJobs, "type_id", "type_name", job.type_id);
            ViewBag.wp_id = new SelectList(db.WorkPlaces, "wp_id", "wp_name", job.wp_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", job.user_id);
            return View(job);
        }

        // GET: Employer/JobsEmployer/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Job job = db.Jobs.Find(id);
            if (job == null)
            {
                return HttpNotFound();
            }
            return View(job);
        }

        // POST: Employer/JobsEmployer/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Job job = db.Jobs.Find(id);
            db.Jobs.Remove(job);
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
