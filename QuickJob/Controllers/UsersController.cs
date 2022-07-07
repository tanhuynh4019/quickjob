using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;
using QuickJob.Function;

namespace QuickJob.Controllers
{
    public class UsersController : Controller
    {
        DataQuickJobEntities db = new DataQuickJobEntities();
        // GET: Users
        public ActionResult Login()
        {
            var fu = new FunctionController();
            if (fu.Cookie() != null)
            {
                return Redirect("/");
            }
            return View();
        }
        [HttpPost]
        public ActionResult Login(string email, string pass)
        {
            var dao = new UsersDAO();
            var status = dao.Login(email,pass);
            if(status)
            {
                var check = db.Users.SingleOrDefault(n => n.user_email == email && n.role_id == 1);
                HttpCookie cookie = new HttpCookie("candidate", check.user_id.ToString());
                cookie.Expires.AddDays(10);
                Response.Cookies.Set(cookie);
                return Redirect("/");
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
            if (fu.Cookie() != null)
            {
                return Redirect("/");
            }
            return View();
        }
        [HttpPost]
        public ActionResult SignUp(User user)
        {
            var code = Guid.NewGuid().ToString();

            user.user_key = code;
            user.candidate_amoutcv = 3;

            var dao = new UsersDAO();
            var status = dao.SignUp(user);




            if(status == 2)
            {
                ViewBag.Check = "Email đã tồn tại! Vui lòng dùng email khác.";
            }
            else if(status == 3)
            {
                var checkcode = db.Users.SingleOrDefault(n => n.user_key == code);

                HttpCookie cookie = new HttpCookie("candidate", checkcode.user_id.ToString());
                cookie.Expires.AddDays(10);
                Response.Cookies.Set(cookie);
                return Redirect("/");
            }
            else
            {
                ViewBag.Check = "Đăng ký thất bại.";
            }
            return View();
        }
        public ActionResult LogOut()
        {
            var cookie = Request.Cookies["candidate"];
            cookie.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Set(cookie);
            return Redirect("/Users/Login");
        }
        public PartialViewResult All()
        {
            return PartialView();
        }
        public ActionResult MyInfo(int ? id)
        {
            var fu = new FunctionController();
            if (id != fu.CookieID().user_id)
            {
                return Redirect("/");
            }
            return View(db.Users.Find(id));
        }
        //Img
        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult EditImg(HttpPostedFileBase IMG)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            User user = db.Users.Find(idus.user_id);

            if (IMG == null)
            {
                user.user_img = idus.user_img;
            }
            else
            {
                var code = Guid.NewGuid().ToString();
                var img = new FunctionController();
                img.AddImages(IMG, Common.Common.LINK_USER, code);
                user.user_img = code + IMG.FileName;
            }
            db.SaveChanges();

            return Redirect("/Users/MyInfo?id="+idus.user_id);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditAll(string phone, Nullable<bool> sex, string fa)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            User user = db.Users.Find(idus.user_id);

            if(phone != null)
            {
                user.user_phone = phone;
            }
            
            if(sex != null)
            {
                user.user_sex = sex;
            }


            if(fa != null)
            {
                user.user_favourite = fa;
            }

            db.SaveChanges();
            return Redirect("/Users/MyInfo?id=" + idus.user_id);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditBirth(DateTime birth)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            User user = db.Users.Find(idus.user_id);

            if (birth != null)
            {
                user.user_birth = birth;
            }

            db.SaveChanges();
            return Redirect("/Users/MyInfo?id=" + idus.user_id);
        }
        //Yêu thích
        public JsonResult Favourite(int ? id)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            Group group = new Group()
            {
                job_id = id,
                user_id = idus.user_id,
                datecreate = DateTime.Now,
                group_item = Common.Common.GROUP_JOB_USERS
            };
            db.Groups.Add(group);
            db.SaveChanges();

            var list = db.Groups.Where(n => n.group_item == Common.Common.GROUP_JOB_USERS && n.user_id == idus.user_id && n.job_id == id).Select(n => new
            {
                id = n.group_id

            }).ToList();

            return Json(list, JsonRequestBehavior.AllowGet);
        }
        //Hủy yêu thích
        public JsonResult CancelFavourite(int? id)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            Group group = db.Groups.Find(id);
            db.Groups.Remove(group);
            db.SaveChanges();

            var list = db.Groups.Where(n => n.group_item == Common.Common.GROUP_JOB_USERS && n.user_id == idus.user_id && n.job_id == id).Select(n => new
            {
                id = n.group_id

            }).ToList();

            return Json(list, JsonRequestBehavior.AllowGet);
        }
        //Hủy yêu thích telex
        public ActionResult CancelFavouriteDetails(int? id)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            Group group = db.Groups.Find(id);
            var idjob = group.job_id;



            db.Groups.Remove(group);
            db.SaveChanges();


            return Redirect("/View/DetailsJob?id=" + idjob);
        }
        //Danh sách yêu thích theo công việc
        public JsonResult IndexFavourite(int ? id)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            var list = db.Groups.Where(n=>n.group_item == Common.Common.GROUP_JOB_USERS && n.user_id == idus.user_id && n.job_id == id).Select(n => new
            {
                id = n.group_id

            }).ToList();

            return Json(list,JsonRequestBehavior.AllowGet);
        }
        //Danh sach yeu thich
        public ActionResult IndexFavouriteAll()
        {
            return View();
        }
        //Danh sach json yeu thich viec lam
        public ActionResult JsonIndexFavouriteAll()
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            var list = db.Groups.Where(n => n.group_item == Common.Common.GROUP_JOB_USERS && n.user_id == idus.user_id).OrderByDescending(n=>n.datecreate).Select(n => new
            {
                id = n.group_id,
                idjob = n.job_id,
                logo = n.Job.User.employer_logo,
                company = n.Job.User.employer_company,
                textprice = n.Job.job_textprice,
                start = n.Job.job_paystart,
                end = n.Job.job_payend,
                date = n.datecreate.Value.ToString(),
                namejob = n.Job.job_title,
                color = n.Job.User.version_id == 3 || n.Job.User.version_id == 4 ? "table-success" : n.Job.User.version_id == 5 ? "table-warning" : n.Job.User.version_id == 6 ? "table-danger" : ""

            }).ToList();

            return Json(list, JsonRequestBehavior.AllowGet);
        }
        //Theo dõi
        public JsonResult Follow(int? id)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            Group group = new Group()
            {
                em_id = id,
                user_id = idus.user_id,
                datecreate = DateTime.Now,
                group_item = Common.Common.GROUP_EMPLOYER_CANDIDATE
            };
            db.Groups.Add(group);
            db.SaveChanges();

            var list = db.Groups.Where(n => n.group_item == Common.Common.GROUP_EMPLOYER_CANDIDATE && n.user_id == idus.user_id && n.em_id == id).OrderByDescending(n => n.datecreate).Select(n => new
            {
                id = n.group_id

            }).ToList();

            return Json(list, JsonRequestBehavior.AllowGet);
        }
        //Huy theo doi
        public JsonResult CancelFollow(int? id)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            Group group = db.Groups.Find(id);
            db.Groups.Remove(group);
            db.SaveChanges();

            var list = db.Groups.Where(n => n.group_item == Common.Common.GROUP_EMPLOYER_CANDIDATE && n.user_id == idus.user_id && n.em_id == id).OrderByDescending(n => n.datecreate).Select(n => new
            {
                id = n.group_id

            }).ToList();

            return Json(list, JsonRequestBehavior.AllowGet);
        }
        //Danh sách theo theo trang cá nhân nhà tuyển dụng
        public JsonResult JsonIndexFollow(int ? id)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            var list = db.Groups.Where(n => n.group_item == Common.Common.GROUP_EMPLOYER_CANDIDATE && n.user_id == idus.user_id && n.em_id == id).OrderByDescending(n => n.datecreate).Select(n => new
            {
                id = n.group_id

            }).ToList();

            return Json(list, JsonRequestBehavior.AllowGet);
        }
        //Danh sách công ty theo dõi
        public ActionResult IndexFollowAll()
        {
            return View();
        }
        public ActionResult JsonIndexFollowAll()
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            db.Configuration.ProxyCreationEnabled = false;

            var list = db.Groups.Where(n => n.group_item == Common.Common.GROUP_EMPLOYER_CANDIDATE && n.user_id == idus.user_id).OrderByDescending(n => n.datecreate).Select(n => new
            {
                id = n.group_id,
                emid = n.em_id,
                logo = db.Users.FirstOrDefault(t => t.user_id == n.em_id).employer_logo,
                company = db.Users.FirstOrDefault(t => t.user_id == n.em_id).employer_company,
                addpress = db.Users.FirstOrDefault(t => t.user_id == n.em_id).employer_addpress,
                date = n.datecreate.Value.ToString()

            }).ToList();

            return Json(list, JsonRequestBehavior.AllowGet);
        }
        //Hủy thheo dõi telex
        public ActionResult CancelFollowDetails(int? id)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            Group group = db.Groups.Find(id);
            var emid = group.em_id;



            db.Groups.Remove(group);
            db.SaveChanges();


            return Redirect("/View/DetailsEmployer?id=" + emid);
        }
        //Thay đổi mật khẩu
        public ActionResult ResetPassword()
        {
            return View();
        }
        //Model
        [HttpPost]
        public ActionResult LoginModal(string email, string pass)
        {
            var dao = new UsersDAO();
            var status = dao.Login(email, pass);
            if (status)
            {
                var check = db.Users.SingleOrDefault(n => n.user_email == email && n.role_id == 1);
                HttpCookie cookie = new HttpCookie("candidate", check.user_id.ToString());
                cookie.Expires.AddDays(10);
                Response.Cookies.Set(cookie);
                return Redirect(Request.UrlReferrer.ToString());
            }
            else
            {
                ViewBag.Check = "Sai tài khoản hoặc mật khẩu. Vui lòng kiểm tra lại?";
            }
            return View();
        }
    }
}