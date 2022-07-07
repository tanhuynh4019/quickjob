using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;
using System.IO;

namespace QuickJob.Function
{
    public class FunctionController : Controller
    {
        DataQuickJobEntities db = new DataQuickJobEntities();
        public User CookieID()
        {
            HttpCookie cookie = System.Web.HttpContext.Current.Request.Cookies["candidate"];
            try
            {
                User user = db.Users.Find(Int32.Parse(cookie.Value.ToString()));
                return user;
            }
            catch (Exception) { return null; }

        }
        public HttpCookie Cookie()
        {
            HttpCookie cookie = System.Web.HttpContext.Current.Request.Cookies["candidate"];
            return cookie;

        }
        public User CookieIDEm()
        {
            HttpCookie cookie = System.Web.HttpContext.Current.Request.Cookies["employer"];
            try
            {
                User user = db.Users.Find(Int32.Parse(cookie.Value.ToString()));
                return user;
            }
            catch (Exception) { return null; }

        }
        public HttpCookie CookieEm()
        {
            HttpCookie cookie = System.Web.HttpContext.Current.Request.Cookies["employer"];
            return cookie;

        }
        public User CookieIDAd()
        {
            HttpCookie cookie = System.Web.HttpContext.Current.Request.Cookies["admin"];
            try
            {
                User user = db.Users.Find(Int32.Parse(cookie.Value.ToString()));
                return user;
            }
            catch (Exception) { return null; }

        }
        public HttpCookie CookieAd()
        {
            HttpCookie cookie = System.Web.HttpContext.Current.Request.Cookies["admin"];
            return cookie;

        }
        public string AddImages(HttpPostedFileBase IMG, string LinkImages, string code)
        {
            var fileimg = Path.GetFileName(IMG.FileName);
            var pa = Path.Combine(System.Web.HttpContext.Current.Server.MapPath("~/Images/" + LinkImages), code + fileimg);
            IMG.SaveAs(pa);
            return code + fileimg;
        }
    }
}