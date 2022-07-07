using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;
using QuickJob.Function;
using QuickJob.Hubs;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace QuickJob.Areas.Employer.Controllers
{
    public class SubmitController : Controller
    {
        DataQuickJobEntities db = new DataQuickJobEntities();
        // GET: Employer/Submit
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Details(int? id)
        {
            SubmitCv submitCv = db.SubmitCvs.Find(id);
            if(submitCv.sb_active == 1)
            {
                submitCv.sb_active = 2;
                db.SaveChanges();
            }

            return View(submitCv);
        }
        public JsonResult GetViewCvEmployer()
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieIDEm();

            using (var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DataQuickJob"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(@"SELECT [sb_id]
                                                          ,[user_id]
                                                          ,[job_id]
                                                          ,[sb_datecreate]
                                                          ,[sb_active]
                                                          ,[sb_notecandidate]
                                                          ,[sb_noteemployer]
                                                          ,[sb_update]
                                                          ,[cv_id] FROM [dbo].[SubmitCv]", connection))
                {
                    // Make sure the command object does not already have
                    // a notification object associated with it.
                    command.Notification = null;

                    SqlDependency dependency = new SqlDependency(command);
                    dependency.OnChange += new OnChangeEventHandler(show_ViewCvCandidate);

                    if (connection.State == ConnectionState.Closed)
                        connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    var list = db.SubmitCvs.Where(n => n.Job.User.user_id == idus.user_id).OrderByDescending(n => n.sb_update).Select(n => new {

                        id = n.sb_id,
                        idus = n.user_id,
                        idjob = n.job_id,
                        namejob = n.Job.job_title,
                        logo = n.Job.User.employer_logo,
                        company = n.Job.User.employer_company,
                        textprice = n.Job.job_textprice,
                        end = n.Job.job_payend,
                        start = n.Job.job_paystart,
                        datecreate = n.sb_datecreate.ToString(),
                        update = n.sb_update.ToString(),
                        notecandidate = n.sb_notecandidate,
                        noteemployer = n.sb_noteemployer,
                        idcv = n.cv_id,
                        fullnamecv = n.Cv.cv_fullname,
                        locationcv = n.Cv.cv_location,
                        active = n.sb_active == 2 ? "Đã xem" : n.sb_active == 3 ? "Từ chối" : n.sb_active == 4 ? "Chấp nhận" : "Chưa xem",
                        color = n.sb_active == 2 ? "text-primary" : n.sb_active == 3 ? "text-danger" : n.sb_active == 4 ? "text-success" : "text-dark",
                        imgcv = n.Cv.cv_img
                    }).ToList();

                    return Json(new { list = list }, JsonRequestBehavior.AllowGet);

                }
            }
        }

        private void show_ViewCvCandidate(object sender, SqlNotificationEventArgs e)
        {
            CvHub.ShowSubmitCvsEmployer();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Yes(string sb_noteemployer, int ? id)
        {
            SubmitCv submitCv = db.SubmitCvs.Find(id);
            submitCv.sb_active = 4;
            submitCv.sb_update = DateTime.Now;
            submitCv.sb_noteemployer = sb_noteemployer;
            db.SaveChanges();
            return Redirect("/Employer/Submit/Index");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult No(string sb_noteemployer, int? id)
        {
            SubmitCv submitCv = db.SubmitCvs.Find(id);
            submitCv.sb_active = 3;
            submitCv.sb_update = DateTime.Now;
            submitCv.sb_noteemployer = sb_noteemployer;
            db.SaveChanges();
            return Redirect("/Employer/Submit/Index");
        }
        //THư mời làm việc
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SubmitJob(SubmitJob submitJob, int ? id)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieIDEm();

            submitJob.user_id = idus.user_id;
            submitJob.sj_datecreate = DateTime.Now;
            submitJob.cv_id = id;


            db.SubmitJobs.Add(submitJob);
            db.SaveChanges();
            return Redirect("/Employer/CvsEmployer/DetailsCvs?id="+id);
        }
        public ActionResult DeleteSubmitJob(int? id,int ? idcv)
        {
            SubmitJob submitJob = db.SubmitJobs.Find(id);
            db.SubmitJobs.Remove(submitJob);
            db.SaveChanges();
            return Redirect("/Employer/CvsEmployer/DetailsCvs?id=" + idcv);
        }
    }
}