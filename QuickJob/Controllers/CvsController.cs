using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using QuickJob.Function;
using Model.DAO;

namespace QuickJob.Controllers
{
    public class CvsController : Controller
    {
        DataQuickJobEntities db = new DataQuickJobEntities();
        // GET: Cvs
        public ActionResult IndexThemes()
        {
            List<Theme> theme = db.Themes.Where(n => n.theme_active == true).OrderByDescending(n => n.theme_datecreate).ToList();
            return View(theme);
        }
        //Quản lý CV
        public ActionResult IndexCvs()
        {
            return View();
        }
        public JsonResult JsonIndexCvs()
        {
            var coo = new FunctionController();
            var id = coo.CookieID();

           var list = db.Cvs.Where(n => n.cv_bin == false && n.user_id == id.user_id).OrderByDescending(n => n.cv_datecreate).Select(n=> new {
               id = n.cv_id,
               img = n.cv_img,
               option = n.cv_option,
               datecreate = n.cv_datecreate.ToString(),
               dateupdate = n.cv_dateupdate.ToString(),
               fakeid = n.cv_fakeid,
               title = n.cv_title,
               themeid = (int)n.theme_id,
               point = n.cv_point,
               key = n.cv_fakeid.Substring(0, 6),
               pass = n.cv_pass
           }).ToList();

            return Json(list, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangeKey(string pass, int ? id)
        {
            Cv cv = db.Cvs.Find(id);
            cv.cv_pass = pass;
            cv.cv_submitkey = 3;
            db.SaveChanges();
            return Redirect("/Cvs/IndexCvs");
        }
        public JsonResult JsonIndexThemes()
        {
            var list = db.Themes.Where(n => n.theme_active == true).OrderByDescending(n => n.theme_datecreate).Select(n => new
            {
                id = n.theme_id,
                name = n.theme_name,
                img = n.theme_img,
                note = n.theme_note,
                view = n.theme_view,
                datecreat = n.theme_datecreate,
                active = n.theme_active,
                versiton = n.theme_version

            }).ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        public PartialViewResult Theme(int? id, Cv cvs)
        {

            var cookie = new FunctionController();
            var idus = cookie.CookieID();


            var code = Guid.NewGuid().ToString();
            var fakeid = code + id;


            Cv checkcv = db.Cvs.SingleOrDefault(n => n.theme_id == id && n.user_id == idus.user_id);
            if (checkcv != null)
            {
                return PartialView(checkcv);
            }
            else
            {
                cvs.cv_fakeid = fakeid;
                cvs.cv_datecreate = DateTime.Now;
                cvs.user_id = idus.user_id;
                cvs.theme_id = id;
                cvs.cv_active = Common.Common.ACTIVE_HD;
                cvs.cv_option = false;
                cvs.cv_bin = false;
                cvs.cv_view = 1;
                cvs.cv_deadline = DateTime.Now.AddMonths(1);

                ItemCv itemCv1 = new ItemCv
                {
                    ic_name = "Đại học QuickJob",
                    ic_content = "Tốt nghiệp loại Giỏi, điểm trung bình 8.0",
                    ic_mid = "Chuyên ngành: Quản trị Doanh nghiệp",
                    ic_fake = fakeid,
                    ic_theme_id = id,
                    ic_enddate = "05/2014",
                    ic_todate = "10/2010",
                    ic_stt = Common.Common.CV_HOCTAP,
                    ic_usid = idus.user_id

                };
                db.ItemCvs.Add(itemCv1);
                db.SaveChanges();

                ItemCv itemCv2 = new ItemCv
                {
                    ic_name = "Công ty QuickJob",
                    ic_content = "- Hỗ trợ viết bài quảng cáo sản phẩm qua kênh facebook, các forum,... \n - Giới thiệu, tư vấn sản phẩm, giải đáp các vấn đề thắc mắc của khách hàng qua điện thoại và email.",
                    ic_mid = "Nhân viên bán hàng",
                    ic_fake = fakeid,
                    ic_theme_id = id,
                    ic_enddate = "05/2014",
                    ic_todate = "10/2010",
                    ic_stt = Common.Common.CV_KINHNGHIEMVIECLAM,
                    ic_usid = idus.user_id

                };
                db.ItemCvs.Add(itemCv2);
                db.SaveChanges();

                ItemCv itemCv3 = new ItemCv
                {
                    ic_name = "Nhóm tình nguyện QuickJob",
                    ic_content = "Tập hợp các món quà và phân phát tới người vô gia cư. \n - Chia sẻ, động viên họ vượt qua giai đoạn khó khăn, giúp họ có những suy nghĩ lạc quan.",
                    ic_mid = "Tình nguyện viên",
                    ic_fake = fakeid,
                    ic_theme_id = id,
                    ic_enddate = "05/2014",
                    ic_todate = "10/2010",
                    ic_stt = Common.Common.CV_HOATDONG,
                    ic_usid = idus.user_id

                };
                db.ItemCvs.Add(itemCv3);
                db.SaveChanges();

                ItemCv itemCv4 = new ItemCv
                {
                    ic_name = "Giải nhất tài năng QuickJob 2017",
                    ic_fake = fakeid,
                    ic_theme_id = id,
                    ic_enddate = "2017",
                    ic_stt = Common.Common.CV_CHUNGCHI,
                    ic_usid = idus.user_id

                };
                db.ItemCvs.Add(itemCv4);
                db.SaveChanges();

                ItemCv itemCv5 = new ItemCv
                {
                    ic_name = "Nhân viên xuất sắc năm công ty QuickJob",
                    ic_fake = fakeid,
                    ic_theme_id = id,
                    ic_enddate = "2017",
                    ic_stt = Common.Common.CV_GIAITHUONG,
                    ic_usid = idus.user_id

                };
                db.ItemCvs.Add(itemCv5);
                db.SaveChanges();

                for (var i = 0; i < 2; i++)
                {
                    ItemCv itemCv6 = new ItemCv
                    {
                        ic_name = "Tin học văn phòng QuickJob",
                        ic_fake = fakeid,
                        ic_theme_id = id,
                        ic_enddate = "",
                        ic_mid = "Sử dụng thành thạo các công cụ Word, Excel, Power Point",
                        ic_stt = Common.Common.CV_CACKYNANG,
                        ic_usid = idus.user_id

                    };
                    db.ItemCvs.Add(itemCv6);
                    db.SaveChanges();
                }

                var dao = new CvsDao();
                if (dao.Create(cvs))
                {
                    Cv cV = db.Cvs.SingleOrDefault(n => n.cv_fakeid == fakeid);
                    return PartialView(cV);
                }
                else
                {

                }
            }
            return PartialView();
        }
        //Them hoan toan cv
        public ActionResult Edit(Cv cV, HttpPostedFileBase IMG)
        {
            var f = new FunctionController();
            User id = f.CookieID();

            Cv cV1 = db.Cvs.Find(cV.cv_id);
            cV.theme_id = cV1.theme_id;
            cV.cv_datecreate = DateTime.Now;
            cV.cv_dateupdate = DateTime.Now;
            cV.user_id = cV1.user_id;

            if(cV.cv_point >= 80)
            {
                cV.cv_active = 1;
                cV.cv_option = true;
            }
            else if(cV.cv_point >= 65)
            {
                cV.cv_active = 1;
                cV.cv_option = false;
            }
            else
            {
                cV.cv_active = 2;
                cV.cv_option = false;
            }

            cV.cv_bin = cV1.cv_bin;
            cV.cv_fakeid = cV1.cv_fakeid;
            cV.cv_deadline = DateTime.Now.AddMonths(1);
            cV.cv_view = cV1.cv_view;
            cV.cv_bg = "darkcyan";

            cV.cv_p = 1;

            var img = new FunctionController();
            var code = Guid.NewGuid().ToString();
            if (IMG == null)
            {
                cV.cv_img = cV1.cv_img;
            }
            else
            {
                img.AddImages(IMG, Common.Common.LINK_CV, code);
                cV.cv_img = code + IMG.FileName;
            }

            if (cV.cv_title == null)
            {
                cV.cv_title = cV.cv_fullname + " " + cV1.cv_fakeid.Substring(0, 6);
            }


            var dao = new CvsDao();
            if (dao.Edit(cV))
            {
                return Redirect("/Cvs/IndexCvs");
            }
            else
            {
                return Redirect("/");
            }
        }
        //In danh sách item của cv
        public JsonResult Item(string fakeid)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            var list = db.ItemCvs.Where(n => n.ic_fake == fakeid && n.ic_usid == idus.user_id).Select(n => new
            {
                content = n.ic_content,
                enddate = n.ic_enddate,
                fake = n.ic_fake,
                id = n.ic_id,
                idtheme = (int)n.ic_theme_id,
                mid = n.ic_mid,
                name = n.ic_name,
                stt = (int)n.ic_stt,
                todate = n.ic_todate,
                usid = (int)n.ic_usid

            }).ToList();

            return Json(list, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Create(string fakeid, int? id, int stt)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            ItemCv check = db.ItemCvs.SingleOrDefault(n => n.ic_fake == fakeid && n.ic_usid == idus.user_id && n.ic_id == id);


            ItemCv itemCv1 = new ItemCv
            {
                ic_name = check.ic_name,
                ic_content = check.ic_content,
                ic_mid = check.ic_mid,
                ic_fake = fakeid,
                ic_theme_id = check.ic_theme_id,
                ic_enddate = check.ic_enddate,
                ic_todate = check.ic_todate,
                ic_stt = stt,
                ic_usid = idus.user_id

            };
            db.ItemCvs.Add(itemCv1);
            db.SaveChanges();


            var list = db.ItemCvs.Where(n => n.ic_fake == fakeid && n.ic_usid == idus.user_id).Select(n => new
            {
                content = n.ic_content,
                enddate = n.ic_enddate,
                fake = n.ic_fake,
                id = n.ic_id,
                idtheme = (int)n.ic_theme_id,
                mid = n.ic_mid,
                name = n.ic_name,
                stt = (int)n.ic_stt,
                todate = n.ic_todate,
                usid = (int)n.ic_usid

            }).ToList();

            return Json(list, JsonRequestBehavior.AllowGet);


        }

        public JsonResult Delete(string fakeid, int? id)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            ItemCv check = db.ItemCvs.SingleOrDefault(n => n.ic_fake == fakeid && n.ic_id == id && n.ic_usid == idus.user_id && n.ic_id == id);
            db.ItemCvs.Remove(check);
            db.SaveChanges();

            var list = db.ItemCvs.Where(n => n.ic_fake == fakeid && n.ic_usid == idus.user_id).Select(n => new
            {
                content = n.ic_content,
                enddate = n.ic_enddate,
                fake = n.ic_fake,
                id = n.ic_id,
                idtheme = (int)n.ic_theme_id,
                mid = n.ic_mid,
                name = n.ic_name,
                stt = (int)n.ic_stt,
                todate = n.ic_todate,
                usid = (int)n.ic_usid

            }).ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        public JsonResult EditItem(string fakeid, int? id, string name, string mid, string content, string to, string end)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            ItemCv check = db.ItemCvs.SingleOrDefault(n => n.ic_fake == fakeid && n.ic_id == id && n.ic_usid == idus.user_id);
            check.ic_name = name;
            check.ic_mid = mid;
            check.ic_content = content;
            check.ic_todate = to;
            check.ic_enddate = end;
            db.SaveChanges();

            List<ItemCv> itemCvs = db.ItemCvs.Where(n => n.ic_fake == fakeid && n.ic_usid == idus.user_id).ToList();
            var list = db.ItemCvs.Where(n => n.ic_fake == fakeid && n.ic_usid == idus.user_id).Select(n => new
            {
                content = n.ic_content,
                enddate = n.ic_enddate,
                fake = n.ic_fake,
                id = n.ic_id,
                idtheme = (int)n.ic_theme_id,
                mid = n.ic_mid,
                name = n.ic_name,
                stt = (int)n.ic_stt,
                todate = n.ic_todate,
                usid = (int)n.ic_usid

            }).ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SubmitCv(SubmitCv submitCv, int? id)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            submitCv.sb_datecreate = DateTime.Now;
            submitCv.sb_update = DateTime.Now;
            submitCv.user_id = idus.user_id;
            submitCv.job_id = id;

            submitCv.sb_active = 1;

            db.SubmitCvs.Add(submitCv);
            db.SaveChanges();

            return Redirect("/View/ViewCvEmployer");
        }
        public PartialViewResult Details(int ? id)
        {
            return PartialView(db.Cvs.Find(id));
        }
        //Tải nhanh CV
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ModalKey(string key, string pass)
        {
            Cv cv = db.Cvs.SingleOrDefault(n => n.cv_fakeid.Substring(0, 6) == key && n.cv_pass == pass);
            if(cv != null)
            {
                Session["key"] = cv.cv_fakeid; ;
                return RedirectToAction("DetailsKey");
            }
            else
            {
                TempData["note"] = "Sai mật khẩu hoặc key";
            }
            return View();
        }
        public PartialViewResult DetailsKey()
        {
            if (Session["key"] == null)
            {
                Response.Redirect("");
            }

            var idkey = Session["key"].ToString();
            Cv cv = db.Cvs.SingleOrDefault(n => n.cv_fakeid == idkey);
            if (cv.cv_fakeid != idkey)
            {
                Response.Redirect("");
            }

            

            return PartialView(cv);
        }
        public JsonResult Submitkey(string key)
        {
            Cv cv = db.Cvs.SingleOrDefault(n => n.cv_fakeid == key);
            cv.cv_submitkey = cv.cv_submitkey - 1;
            db.SaveChanges();
            return Json(null);
        }
    }
}