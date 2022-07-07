using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuickJob.Areas.Employer.Controllers
{
    public class ViewEmployerController : Controller
    {
        // GET: Employer/ViewEmployer
        public PartialViewResult Menu()
        {
            return PartialView();
        }
    }
}