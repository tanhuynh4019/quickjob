using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using QuickJob.Function;
using QuickJob.Hubs;

namespace QuickJob.Controllers
{
    public class ViewController : Controller
    {
        DataQuickJobEntities db = new DataQuickJobEntities();
        // GET: View
        public PartialViewResult Menu()
        {
            return PartialView();
        }
        public ActionResult IndexEmployer()
        {
            return View();
        }
        public JsonResult JsonIndexEmployer()
        {
            var list = db.Users.Where(n => n.user_active == true && n.user_option == true && n.employer_pageload == true).OrderByDescending(n => n.user_datecreate).Select(n => new
            {
                logo = n.employer_logo,
                company = n.employer_company,
                id = n.user_id

            }).ToList();

            return Json(list,JsonRequestBehavior.AllowGet);
        }
        public ActionResult DetailsEmployer(int ? id)
        {
            return View(db.Users.Find(id));
        }
        public ActionResult IndexJob()
        {
            return View();
        }
        public JsonResult JsonIndexJob()
        {
            var list = db.Jobs.Where(n => n.job_bin == false && n.job_active == true && n.job_option == true && n.User.user_active == true && n.User.user_option == true && n.job_bin == false && n.User.employer_pageload == true).OrderByDescending(n => n.job_dateupdate).Select(n => new
            {
                id = n.job_id,
                title = n.job_title.Length < 40 ? n.job_title : n.job_title.Substring(0, 40) + "...",
                provice = n.Groups.Where(t => t.group_item == Common.Common.GROUP_JOB_PROVICE).Select(t => t.Provice.provice_name),
                amout = n.job_amout == 0 ? "không giới hạn" : n.job_amout.ToString(),
                category = n.Groups.Where(t => t.group_item == Common.Common.GROUP_JOB_CATEGORY).Select(t => t.Category.cate_name),
                type = n.TypeJob.type_name,
                workplace = n.WorkPlace.wp_name,
                sex = n.job_sex,
                exp = n.Exp.exp_name,
                active = n.job_active,
                option = n.job_option,
                bin = n.job_bin,
                datecreate = n.job_datecreate.ToString(),
                deadline = n.job_datedeline.ToString(),
                update = n.job_dateupdate.ToString(),
                logo = n.User.employer_logo,
                textprice = n.job_textprice,
                paystart = n.job_paystart,
                typename = n.User.version_id == 3 && n.User.version_id == 4 ? "nenlam" : n.User.version_id == 5 ? "hapdan" : n.User.version_id == 6 ? "totnhat" : "free",
                payend = n.job_payend,
                company = n.User.employer_company.Length < 40 ? n.User.employer_company : n.User.employer_company.Substring(0, 40) + "...",
                idem = n.user_id,
                ver = n.User.version_id == 3 || n.User.version_id == 4 ? "border border-success" : n.User.version_id == 5 ? "border border-warning" : n.User.version_id == 6 ? "border border-danger" : ""


            }).ToList();

            return Json(list, JsonRequestBehavior.AllowGet);
        }
        public ActionResult DetailsJob(int? id)
        {
            return View(db.Jobs.Find(id));
        }
        public ActionResult ViewCvEmployer()
        {
            return View();
        }
        public PartialViewResult Test()
        {
            return PartialView();
        }
        public JsonResult GetViewCvEmployer()
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

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
                    dependency.OnChange += new OnChangeEventHandler(show_ViewCvEmployer);

                    if (connection.State == ConnectionState.Closed)
                        connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    var list = db.SubmitCvs.Where(n => n.user_id == idus.user_id).OrderByDescending(n => n.sb_update).Select(n=> new { 
                    
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
                        color = n.sb_active == 2 ? "table-primary" : n.sb_active == 3 ? "table-danger" : n.sb_active == 4 ? "table-success" : "table-dark",
                        link = n.sb_active == 2 ? "Đã xem" : n.sb_active == 3 ? "<a href='/View/DetailsViewCvEmployer?id="+n.sb_id+"' class='text-danger'><i class='fa fa-eye'>&nbsp;</i>Phản hồi</a>" : n.sb_active == 4 ? "<a class='text-danger' href='/View/DetailsViewCvEmployer?id=" + n.sb_id + "'><i class='fa fa-eye text-danger'>&nbsp;</i>Liên hệ</a>" : "Chưa xem"

                    }).ToList();

                    return Json(new { list = list }, JsonRequestBehavior.AllowGet);

                }
            }
        }

        private void show_ViewCvEmployer(object sender, SqlNotificationEventArgs e)
        {
            CvHub.ShowSubmitCvsCandidate();
        }

        public ActionResult DetailsViewCvEmployer(int ? id)
        {
            return View(db.SubmitCvs.Find(id));
        }

        //---------------------------Thông báo
        public JsonResult RMess()
        {

            var cookie = new FunctionController();
            var idus = cookie.CookieID();


            using (var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DataQuickJob"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(@"SELECT [chat_id]
                                                                    ,[chat_sender]
                                                                    ,[chat_receiver]
                                                                    ,[chat_content]
                                                                    ,[chat_datecreate]
                                                                    ,[chat_color]
                                                                    ,[chat_key]
                                                                FROM [dbo].[Chats]", connection))
                {
                    // Make sure the command object does not already have
                    // a notification object associated with it.
                    command.Notification = null;

                    SqlDependency dependency = new SqlDependency(command);
                    dependency.OnChange += new OnChangeEventHandler(showMessenger);

                    if (connection.State == ConnectionState.Closed)
                        connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    var list = db.Chats.Where(n => n.chat_active == false).OrderByDescending(n => n.chat_datecreate).Select(n => new
                    {

                        id = n.chat_id,
                        sender = n.chat_sender,
                        receiver = n.chat_receiver,
                        content = n.chat_content

                    }).ToList();

                    return Json(new { list = list }, JsonRequestBehavior.AllowGet);

                }
            }
        }

        private void showMessenger(object sender, SqlNotificationEventArgs e)
        {
            NotiHub.ShowMess();
        }

        //NTD Xem hồ sơ
        public ActionResult EmployerViewCV()
        {
            return View();
        }
        public JsonResult GetEmployerViewCV()
        {

            var cookie = new FunctionController();
            var idus = cookie.CookieID();


            using (var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DataQuickJob"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(@"SELECT [view_id]
                                                                    ,[view_view]
                                                                    ,[cv_id]
                                                                    ,[user_id]
                                                                    ,[view_dateupdate]
                                                                FROM [dbo].[ViewCvs]", connection))
                {
                    // Make sure the command object does not already have
                    // a notification object associated with it.
                    command.Notification = null;

                    SqlDependency dependency = new SqlDependency(command);
                    dependency.OnChange += new OnChangeEventHandler(showEmployerViewCV);

                    if (connection.State == ConnectionState.Closed)
                        connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    var list = db.ViewCvs.Where(n => n.Cv.user_id == idus.user_id).OrderByDescending(n => n.view_dateupdate).Select(n => new
                    {

                        id = n.view_id,
                        fullname = n.Cv.cv_fullname,
                        location = n.Cv.cv_location,
                        key = n.Cv.cv_fakeid,
                        logo = n.User.employer_logo,
                        company = n.User.employer_company,
                        view = n.view_view,
                        update = n.view_dateupdate.ToString(),
                        img = n.Cv.cv_img

                    }).ToList();

                    return Json(new { list = list }, JsonRequestBehavior.AllowGet);

                }
            }
        }

        private void showEmployerViewCV(object sender, SqlNotificationEventArgs e)
        {
            CvHub.ShowEmployerViewCV();
        }
        //Nhà tuyển dụng chú ý
        public ActionResult AttentionEmployer()
        {
            return View();
        }
        public JsonResult GetAttentionEmployer()
        {

            var cookie = new FunctionController();
            var idus = cookie.CookieID();


            using (var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DataQuickJob"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(@"SELECT [view_id]
                                                                    ,[view_view]
                                                                    ,[cv_id]
                                                                    ,[user_id]
                                                                    ,[view_dateupdate]
                                                                FROM [dbo].[ViewCvs]", connection))
                {
                    // Make sure the command object does not already have
                    // a notification object associated with it.
                    command.Notification = null;

                    SqlDependency dependency = new SqlDependency(command);
                    dependency.OnChange += new OnChangeEventHandler(showAttentionEmployer);

                    if (connection.State == ConnectionState.Closed)
                        connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    var list = db.SubmitJobs.Where(n => n.Cv.user_id == idus.user_id).OrderByDescending(n => n.sj_datecreate).Select(n => new
                    {

                        company = n.Job.User.employer_company,
                        title = n.Job.job_title,
                        textpeice = n.Job.job_textprice,
                        payend = n.Job.job_payend,
                        paystart = n.Job.job_paystart,
                        fullname = n.Cv.cv_fullname,
                        location = n.Cv.cv_location,
                        id = n.sj_id,
                        logo = n.Job.User.employer_logo

                    }).ToList();

                    return Json(new { list = list }, JsonRequestBehavior.AllowGet);

                }
            }
        }

        private void showAttentionEmployer(object sender, SqlNotificationEventArgs e)
        {
            CvHub.ShowAttentionEmployer();
        }
        public ActionResult Rating(Rating rating)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            rating.rating_datecreate = DateTime.Now;
            rating.user_id = idus.user_id;



            db.Ratings.Add(rating);
            db.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
        }
    }
}