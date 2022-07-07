using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuickJob.Areas.Admin.Controllers
{
    public class ViewAdminController : Controller
    {
        // GET: Admin/ViewAdmin
        public PartialViewResult Menu(string key)
        {
            ViewBag.Title = key;
            return PartialView();
        }
        //Thống kê tiền
        public ActionResult StaticPrice()
        {
            return View();
        }
    }
}