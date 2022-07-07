using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using QuickJob.Function;

namespace QuickJob.Areas.Employer.Controllers
{
    public class CvsEmployerController : Controller
    {
        DataQuickJobEntities db = new DataQuickJobEntities();
        // GET: Employer/CvsEmployer
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult JsonIndex()
        {
            var list = db.Cvs.Where(n => n.cv_active == Common.Common.ACTIVE_HD && n.cv_option == true && n.cv_bin == false && n.User.user_active == true && n.User.user_option == true).OrderByDescending(n => n.cv_dateupdate)
                .Select(n => new
                {
                    img = n.cv_img,
                    name = n.cv_fullname,
                    location = n.cv_location == null ? "Chưa rõ" : n.cv_location,
                    sex = n.cv_sex,
                    id = n.cv_id,
                    rank = db.ItemCvs.Where(t=>t.ic_fake == n.cv_fakeid && t.ic_stt == Common.Common.CV_HOCTAP).Select(t=>t.ic_name),
                    location2 = n.cv_location == null ? "Chưa rõ" : n.cv_location,

                }).ToList();
            return Json(list,JsonRequestBehavior.AllowGet);
        }
        public ActionResult DetailsCvs(int? id)
        {
            var fu = new FunctionController();
            var idus = fu.CookieIDEm();

            List<ViewCv> viewCv = db.ViewCvs.Where(n => n.user_id == idus.user_id && n.cv_id == id).ToList();
            if(viewCv.Count == 0)
            {
                ViewCv view = new ViewCv
                {
                    user_id = idus.user_id,
                    cv_id = id,
                    view_dateupdate = DateTime.Now,
                    view_view = 1,
                };
                db.ViewCvs.Add(view);
                db.SaveChanges();
            }
            else
            {
                var idview = db.ViewCvs.SingleOrDefault(n => n.user_id == idus.user_id && n.cv_id == id);
                idview.view_view = idview.view_view + 1;
                db.SaveChanges();
            }

            return View(db.Cvs.Find(id));
        }
    }
}