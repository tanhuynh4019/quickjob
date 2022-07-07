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
    public class ChatController : Controller
    {
        DataQuickJobEntities db = new DataQuickJobEntities();
        // GET: Chat
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult QuickChatCandidate(int ?id)
        {
            return View(db.Users.Find(id));
        }
        public ActionResult IndexEmployer()
        {
            return View();
        }
        public ActionResult QuickChatEmployer(int? id)
        {
            return View(db.Users.Find(id));
        }
        //------------------- candidate
        public JsonResult GetCandidate(int ? idem)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            var em = db.Users.Find(idem);


            var key = idus.user_id + "key" + em.user_id + idus.user_email.Substring(1, 5) + "key" + em.user_email.Substring(1, 5);
            var key2 = em.user_id + "key" + idus.user_id + em.user_email.Substring(1, 5) + "key" + idus.user_email.Substring(1, 5);


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
                      ,[chat_active]
                  FROM [dbo].[Chats]", connection))
                {
                    // Make sure the command object does not already have
                    // a notification object associated with it.
                    command.Notification = null;

                    SqlDependency dependency = new SqlDependency(command);
                    dependency.OnChange += new OnChangeEventHandler(show_chatcandidate);

                    if (connection.State == ConnectionState.Closed)
                        connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    var list = db.Chats.Where(n => n.chat_key == key || n.chat_key == key2).OrderByDescending(n => n.chat_datecreate).Select(n => new {

                        id = n.chat_id,
                        send = n.chat_sender,
                        rec = n.chat_receiver,
                        content = n.chat_content,
                        date = n.chat_datecreate.ToString(),
                        chatkey = n.chat_key

                    }).ToList();

                    return Json(new { list = list }, JsonRequestBehavior.AllowGet);

                }
            }
        }

        private void show_chatcandidate(object sender, SqlNotificationEventArgs e)
        {
            ChatHub.ShowChatCandidate();
        }

        public JsonResult ChatCandidate(string content, int? idem)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieID();

            var em = db.Users.Find(idem);

            var key = idus.user_id + "key" + em.user_id + idus.user_email.Substring(1, 5) + "key" + em.user_email.Substring(1, 5);

            Chat chat = new Chat()
            {
                chat_content = content,
                chat_datecreate = DateTime.Now,
                chat_key = key,
                chat_receiver = idem,
                chat_sender = idus.user_id,
                chat_active = false
            };
            db.Chats.Add(chat);
            db.SaveChanges();

            return Json(null);
        }
        //----------------------------------------------
        public JsonResult GetEmployer(int? idcan)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieIDEm();

            var em = db.Users.Find(idcan);


            var key = idus.user_id + "key" + em.user_id + idus.user_email.Substring(1, 5) + "key" + em.user_email.Substring(1, 5);
            var key2 = em.user_id + "key" + idus.user_id + em.user_email.Substring(1, 5) + "key" + idus.user_email.Substring(1, 5);


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
                      ,[chat_active]
                  FROM [dbo].[Chats]", connection))
                {
                    // Make sure the command object does not already have
                    // a notification object associated with it.
                    command.Notification = null;

                    SqlDependency dependency = new SqlDependency(command);
                    dependency.OnChange += new OnChangeEventHandler(show_chatemployer);

                    if (connection.State == ConnectionState.Closed)
                        connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    var list = db.Chats.Where(n => n.chat_key == key || n.chat_key == key2).OrderByDescending(n => n.chat_datecreate).Select(n => new {

                        id = n.chat_id,
                        send = n.chat_sender,
                        rec = n.chat_receiver,
                        content = n.chat_content,
                        date = n.chat_datecreate.ToString(),
                        chatkey = n.chat_key

                    }).ToList();

                    return Json(new { list = list }, JsonRequestBehavior.AllowGet);

                }
            }
        }

        private void show_chatemployer(object sender, SqlNotificationEventArgs e)
        {
            ChatHub.ShowChatEmployer();
        }
        public JsonResult ChatEmployer(string content, int? idcan)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieIDEm();

            var em = db.Users.Find(idcan);

            var key = idus.user_id + "key" + em.user_id + idus.user_email.Substring(1, 5) + "key" + em.user_email.Substring(1, 5);

            Chat chat = new Chat()
            {
                chat_content = content,
                chat_datecreate = DateTime.Now,
                chat_key = key,
                chat_receiver = idcan,
                chat_sender = idus.user_id,
                chat_active = false
            };
            db.Chats.Add(chat);
            db.SaveChanges();

            return Json(null);
        }
    }
}