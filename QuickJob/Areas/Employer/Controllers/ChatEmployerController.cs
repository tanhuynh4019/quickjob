using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Model.EF;
using System.Web.Mvc;
using System.Configuration;
using System.Data;
using QuickJob.Function;
using QuickJob.Hubs;

namespace QuickJob.Areas.Employer.Controllers
{
    public class ChatEmployerController : Controller
    {
        DataQuickJobEntities db = new DataQuickJobEntities();
        public JsonResult GetChat(int ? idreceiver,int ? idcv)
        {

            var cookie = new FunctionController();
            var idus = cookie.CookieIDEm();

            var receiver = db.Users.Find(idreceiver);
            var cv = db.Cvs.Find(idcv);

            var key = idus.user_id + "key" + receiver.user_id + idus.user_email.Substring(1, 5) + "key" + receiver.user_email.Substring(1, 5);
            var key2 = receiver.user_id + "key" + idus.user_id + receiver.user_email.Substring(1, 5) + "key" + idus.user_email.Substring(1, 5);

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
                                                                FROM [dbo].[Chats]", connection))
                {
                    // Make sure the command object does not already have
                    // a notification object associated with it.
                    command.Notification = null;

                    SqlDependency dependency = new SqlDependency(command);
                    dependency.OnChange += new OnChangeEventHandler(dependency_OnChange);

                    if (connection.State == ConnectionState.Closed)
                        connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    var list = db.Chats.Where(n=>n.chat_key == key || n.chat_key == key2).OrderByDescending(n => n.chat_datecreate).Select(n => new
                    {

                        id = n.chat_id,
                        sender = n.chat_sender,
                        receiver = n.chat_receiver,
                        content = n.chat_content,
                        datecreate = n.chat_datecreate.ToString(),
                        color = n.chat_receiver != idus.user_id ? "media-chat-reverse" : "",
                        key = n.chat_key,
                        name = n.chat_receiver != idus.user_id ? "Tôi" : "Ứng viên",
                        img = n.chat_receiver != idus.user_id ? "Employers/"+idus.employer_logo : "Cvs/" + cv.cv_img,
                        active = n.chat_active == true ? "Đã xem" : "Chưa xem"

                    }).ToList();

                    return Json(new { list = list }, JsonRequestBehavior.AllowGet);

                }
            }
        }

        private void dependency_OnChange(object sender, SqlNotificationEventArgs e)
        {
            ChatHub.ShowEmployer();
        }

        public JsonResult Chat(string message, int? idreceiver)
        {
            var cookie = new FunctionController();
            var idus = cookie.CookieIDEm();

            var receiver = db.Users.Find(idreceiver);

            var key = idus.user_id + "key" + receiver.user_id + idus.user_email.Substring(1, 5) + "key" + receiver.user_email.Substring(1, 5);

            Chat chat = new Chat()
            {
                chat_content = message,
                chat_datecreate = DateTime.Now,
                chat_key = key,
                chat_receiver = idreceiver,
                chat_sender = idus.user_id,
                chat_active = false
            };
            db.Chats.Add(chat);
            db.SaveChanges();

            return Json(null);
        }
    }
}