using Microsoft.Ajax.Utilities;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;

namespace QuickJob.Areas.Employer.Controllers
{
    public class StaticEmployerController : Controller
    {
        DataQuickJobEntities db = new DataQuickJobEntities();
        public class ST
        {
            public int CandidateAll { get; set; }
            public int CandidateMonth { get; set; }
            public int CandidateDay { get; set; }
        }

        // GET: Employer/StaticEmployer
        private List<ST> GetUsers()
        {

            var list = new List<ST>
            {
                new ST
                {
                    CandidateAll = db.Cvs.Count(),
                    CandidateMonth = db.Cvs.Where(n => n.cv_datecreate < n.cv_datecreate.Value.AddMonths(1)).Count(),
                    CandidateDay = db.Cvs.Where(n => n.cv_datecreate.Value.ToString("dd/MM/yyyy") == DateTime.Now.ToString("dd/MM/yyyy")).ToList().Count()
                }
            };

            return list;
        }
        public JsonResult JsonStatic()
        {
            var list = GetUsers();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
    }
}