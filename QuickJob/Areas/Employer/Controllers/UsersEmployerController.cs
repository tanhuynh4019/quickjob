using Model.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Common;
using QuickJob.Function;
using System.Data.Entity;

namespace QuickJob.Areas.Employer.Controllers
{
    public class UsersEmployerController : Controller
    {
        DataQuickJobEntities db = new DataQuickJobEntities();
        // GET: Employer/UsersEmployer
        public ActionResult Login()
        {
            var fu = new FunctionController();
            if (fu.CookieEm() != null)
            {
                return Redirect("/");
            }
            return View();
        }
        [HttpPost]
        public ActionResult Login(string email, string pass)
        {
            var dao = new UsersDAO();
            var status = dao.LoginEm(email, pass);
            if (status)
            {
                var check = db.Users.SingleOrDefault(n => n.user_email == email && n.role_id == 2);
                HttpCookie cookie = new HttpCookie("employer", check.user_id.ToString());
                cookie.Expires.AddDays(10);
                Response.Cookies.Set(cookie);
                return Redirect("/Employer/HomeEmployer/Index");
            }
            else
            {
                ViewBag.Check = "Sai tài khoản hoặc mật khẩu. Vui lòng kiểm tra lại?";
            }
            return View();
        }
        public ActionResult SignUp()
        {
            var fu = new FunctionController();
            if (fu.CookieEm() != null)
            {
                return Redirect("/");
            }
            return View();
        }
        [HttpPost]
        public ActionResult SignUp(User user, int[] cate)
        {
            var code = Guid.NewGuid().ToString();
            user.user_key = code;

            user.employer_amoutjob = 3;

            var dao = new UsersDAO();
            var status = dao.SignUpEm(user);
            if (status == 2)
            {
                ViewBag.Check = "Email đã tồn tại! Vui lòng dùng email khác.";
            }
            else if (status == 3)
            {
                var checkcode = db.Users.SingleOrDefault(n => n.user_key == code);
                foreach(var item in cate)
                {
                    Group group = new Group
                    {
                        category_id = item,
                        user_id = checkcode.user_id,
                        datecreate = DateTime.Now,
                        group_item = Common.Common.GROUP_EMPLOYER_CATEGORY
                    };
                    db.Groups.Add(group);
                    db.SaveChanges();
                }

                HttpCookie cookie = new HttpCookie("employer", checkcode.user_id.ToString());
                cookie.Expires.AddDays(10);
                Response.Cookies.Set(cookie);

                return Redirect("/Employer/HomeEmployer/Index");
            }
            else
            {
                ViewBag.Check = "Đăng ký thất bại.";
            }
            return View();
        }
        public ActionResult LogOut()
        {
            var cookie = Request.Cookies["employer"];
            cookie.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Set(cookie);
            return RedirectToAction("Login");
        }
        public ActionResult PersonalPage()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult PersonalPage(User user, HttpPostedFileBase logo, HttpPostedFileBase banner)
        {
            var code1 = Guid.NewGuid().ToString();
            var code2 = Guid.NewGuid().ToString();

            var fu = new FunctionController();
            var id = fu.CookieIDEm();

            //Logo
            if(logo == null)
            {
                user.employer_logo = id.employer_logo;
            }
            else
            {
                var img = fu.AddImages(logo, Common.Common.LINK_EMPLOYER, code1);
                user.employer_logo = img;
            }

            //Banner
            if(banner == null)
            {
                user.employer_banner = "satisfied-job.jpg";
            }
            else
            {
                var img = fu.AddImages(banner, Common.Common.LINK_EMPLOYER, code2);
                user.employer_banner = img;
            }

            if(id.employer_pageload == null)
            {
                user.employer_pageload = false;
            }
            else
            {
                user.employer_pageload = id.employer_pageload;
            }

            user.user_id = id.user_id;
            user.user_email = id.user_email;
            user.user_pass = id.user_pass;
            user.user_active = id.user_active;
            user.user_option = id.user_option;
            user.user_datecreate = id.user_datecreate;
            user.user_dateupdate = id.user_dateupdate;
            user.user_img = id.user_img;
            user.user_sex = id.user_sex;
            user.user_birth = id.user_birth;
            user.user_favourite = id.user_favourite;
            user.role_id = id.role_id;
            user.user_name = id.user_name;
            user.user_phone = id.user_phone;
            user.user_note = id.user_note;
            user.user_key = id.user_key;
            user.wp_id = id.wp_id;
            user.version_id = id.version_id;
            user.employer_amoutjob = id.employer_amoutjob;

            db.Entry(user).State = EntityState.Modified;
            db.SaveChanges();
            return Redirect("/Employer/HomeEmployer/Index");
        }
    }
}