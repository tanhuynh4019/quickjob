using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using MoMo;
using Newtonsoft.Json.Linq;
using QuickJob.Function;

namespace QuickJob.Areas.Employer.Controllers
{
    public class PayEmployerController : Controller
    {
        DataQuickJobEntities db = new DataQuickJobEntities();
        // GET: Employer/PayEmployer
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Details(int? id)
        {
            return View(db.Pakages.Find(id));
        }
        public ActionResult PayMoMo(int? id)
        {
            var coo = new FunctionController();
            var idus = coo.CookieIDEm();

            Pakage pakage = db.Pakages.Find(id);

            var money = pakage.pakage_money * (1 - (float)pakage.pakage_precent / 100);

            //request params need to request to MoMo system
            string endpoint = "https://test-payment.momo.vn/gw_payment/transactionProcessor";
            string partnerCode = "MOMO5RGX20191128";
            string accessKey = "M8brj9K6E22vXoDB";
            string serectkey = "nqQiVSgDMy809JoPF6OzP5OdBUB550Y4";
            string orderInfo = "Nâng cấp tài khoản " + idus.user_email + " lên " + pakage.pakage_name;
            string returnUrl = "https://localhost:44350/Employer/PayEmployer/ReturnUrl";
            string notifyurl = "https://localhost:44350/Employer/PayEmployer/ReturnNotify";

            string amount = money.ToString();
            string orderid = Guid.NewGuid().ToString();
            string requestId = Guid.NewGuid().ToString();
            string extraData = "";

            //Before sign HMAC SHA256 signature
            string rawHash = "partnerCode=" +
                partnerCode + "&accessKey=" +
                accessKey + "&requestId=" +
                requestId + "&amount=" +
                amount + "&orderId=" +
                orderid + "&orderInfo=" +
                orderInfo + "&returnUrl=" +
                returnUrl + "&notifyUrl=" +
                notifyurl + "&extraData=" +
                extraData;

            MoMoSecurity crypto = new MoMoSecurity();
            string signature = crypto.signSHA256(rawHash, serectkey);
            //build body json request
            JObject message = new JObject
            {
                { "partnerCode", partnerCode },
                { "accessKey", accessKey },
                { "requestId", requestId },
                { "amount", amount },
                { "orderId", orderid },
                { "orderInfo", orderInfo },
                { "returnUrl", returnUrl },
                { "notifyUrl", notifyurl },
                { "extraData", extraData },
                { "requestType", "captureMoMoWallet" },
                { "signature", signature }

            };

            string responseFromMomo = PaymentRequest.sendPaymentRequest(endpoint, message.ToString());
            JObject jmessage = JObject.Parse(responseFromMomo);


            TempData["pakeid"] = id;

            return Redirect(jmessage.GetValue("payUrl").ToString());
        }
        public ActionResult ReturnUrl(int errorCode, int amount)
        {
            if(TempData["pakeid"] == null)
            {
                return RedirectToAction("HistoryPay");
            }
            else
            {
                var coo = new FunctionController();
                var idus = coo.CookieIDEm();

                User us = db.Users.Find(idus.user_id);

                int pake = Int32.Parse(TempData["pakeid"].ToString());
                Pakage pakege = db.Pakages.Find(pake);

                if (errorCode.Equals(0))
                {
                    ViewBag.Note = "Thanh toán thành công";

                    if (pakege.pakage_id == 11)
                    {
                        us.employer_amoutjob = 30;
                        us.version_id = Common.Common.VER_EM_CC1;
                        us.user_deadline = DateTime.Now.AddMonths(1);
                    }
                    else if (pakege.pakage_id == 12)
                    {
                        us.employer_amoutjob = 50;
                        us.version_id = Common.Common.VER_EM_CC2;
                        us.user_deadline = DateTime.Now.AddMonths(1);
                    }
                    else if (pakege.pakage_id == 13)
                    {
                        us.employer_amoutjob = 80;
                        us.version_id = Common.Common.VER_EM_PRO;
                        us.user_deadline = DateTime.Now.AddMonths(1);
                    }
                    else if (pakege.pakage_id == 14)
                    {
                        us.employer_amoutjob = 120;
                        us.version_id = Common.Common.VER_EM_MAX;
                        us.user_deadline = DateTime.Now.AddMonths(1);
                    }
                    else
                    {
                        us.user_active = false;
                    }

                    Bill bill = new Bill
                    {
                        bill_active = true,
                        bill_datecreate = DateTime.Now,
                        bill_dealine = DateTime.Now.AddMonths(1),
                        bill_sum = amount,
                        user_id = us.user_id,
                        pakege_id = pake
                    };
                    db.Bills.Add(bill);
                    db.SaveChanges();

                    return RedirectToAction("HistoryPay");
                }
                else
                {
                    ViewBag.Note = "Thanh toán thất bại";

                    Bill bill = new Bill
                    {
                        bill_active = false,
                        bill_datecreate = DateTime.Now,
                        bill_dealine = DateTime.Now,
                        bill_sum = amount,
                        user_id = us.user_id,
                        pakege_id = pake
                    };
                    db.Bills.Add(bill);

                    db.SaveChanges();
                    return RedirectToAction("HistoryPay");
                }
            }
        }
        public ActionResult HistoryPay()
        {
            var coo = new FunctionController();
            var id = coo.CookieIDEm();


            return View(db.Bills.Where(n => n.user_id == id.user_id).OrderByDescending(n => n.bill_datecreate).ToList());
        }
    }
}