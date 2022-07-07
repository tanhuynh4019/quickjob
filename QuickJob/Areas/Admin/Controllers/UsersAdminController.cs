using Model.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using QuickJob.Function;

namespace QuickJob.Areas.Admin.Controllers
{
    public class UsersAdminController : Controller
    {
        DataQuickJobEntities db = new DataQuickJobEntities();
        // GET: Admin/UsersAdminj

        public ActionResult Index()
        {
            var user = db.Users;
            return View(user.Where(t => t.user_bin == false).ToList());
        }

        [HttpPost]
        public JsonResult Remove(int? id)
        {
            if (id != null)
            {
                var removeItem = db.Users.Find(id);
                if (removeItem != null)
                {
                    removeItem.user_bin = true;
                    db.SaveChanges();
                    return Json(true, JsonRequestBehavior.AllowGet);
                }
            }
            return Json(false, JsonRequestBehavior.AllowGet);
        }

        public PartialViewResult Login()
        {
            var fu = new FunctionController();
            if (fu.CookieAd() != null)
            {
                Response.Redirect("/Admin/HomeAdmin/Index");
            }
            return PartialView();
        }
        [HttpPost]
        public PartialViewResult Login(string email, string pass)
        {
            var dao = new UsersDAO();
            var status = dao.LoginAd(email, pass);
            if (status)
            {
                var check = db.Users.SingleOrDefault(n => n.user_email == email && n.role_id == 3);
                HttpCookie cookie = new HttpCookie("admin", check.user_id.ToString());
                cookie.Expires.AddDays(10);
                Response.Cookies.Set(cookie);
                Response.Redirect("/Admin/HomeAdmin/Index");
            }
            else
            {
                ViewBag.Check = "Sai tài khoản hoặc mật khẩu. Vui lòng kiểm tra lại?";
            }
            return PartialView();
        }
        public ActionResult LogOut()
        {
            var cookie = Request.Cookies["admin"];
            cookie.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Set(cookie);
            return Redirect("/Admin/UsersAdmin/Login");
        }
    }
}