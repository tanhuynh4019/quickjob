using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;
using QuickJob.Function;
using MoMo;
using Newtonsoft.Json.Linq;

namespace QuickJob.Controllers
{
    public class PaysController : Controller
    {
        DataQuickJobEntities db = new DataQuickJobEntities();
        // GET: Pays
        public ActionResult IndexPakage()
        {
            return View(db.Pakages.Where(n => n.role_id == 1 && n.pakage_active == true).ToList());
        }
        public ActionResult Details(int? id)
        {
            var coo = new FunctionController();
            var idus = coo.CookieID();

            if (idus.version_id == 2)
            {
                Response.Redirect("/Pays/IndexPakage");
            }
            return View(db.Pakages.Find(id));
        }
        public ActionResult PayMoMo(int? id)
        {
            var coo = new FunctionController();
            var idus = coo.CookieID();

            if (idus.version_id == 2)
            {
                return Redirect("/Pays/IndexPakage");
            }
            else
            {
                Pakage pakage = db.Pakages.Find(id);

                var money = pakage.pakage_money * (1 - (float)pakage.pakage_precent / 100);

                //request params need to request to MoMo system
                string endpoint = "https://test-payment.momo.vn/gw_payment/transactionProcessor";
                string partnerCode = "MOMO5RGX20191128";
                string accessKey = "M8brj9K6E22vXoDB";
                string serectkey = "nqQiVSgDMy809JoPF6OzP5OdBUB550Y4";
                string orderInfo = "Nâng cấp tài khoản " + idus.user_email + " lên " + pakage.pakage_name;
                string returnUrl = "https://localhost:44350/Pays/ReturnUrl";
                string notifyurl = "https://localhost:44350/Pays/NotifyUrl";

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

                Session["pakeid"] = id;

                return Redirect(jmessage.GetValue("payUrl").ToString());
            }
        }
        public ActionResult ReturnUrl(int errorCode, int amount,string orderId)
        {
            var coo = new FunctionController();
            var id = coo.CookieID();

            var pake = Int32.Parse(Session["pakeid"].ToString());
            Pakage pakage = db.Pakages.Find(pake);

            User us = db.Users.Find(id.user_id);

            if (us.version_id == 2)
            {
                return Redirect("/Pays/IndexPakage");
            }
            else
            {
                if (errorCode.Equals(0))
                {
                    ViewBag.Note = "Thanh toán thành công";

                    us.version_id = 2;
                    us.candidate_amoutcv = 10;
                    us.user_deadline = DateTime.Now.AddYears(1);
                    db.SaveChanges();


                    Bill bill = new Bill
                    {
                        user_id = id.user_id,
                        bill_active = true,
                        bill_datecreate = DateTime.Now,
                        bill_dealine = DateTime.Now.AddYears(1),
                        bill_sum = amount,
                        pakege_id = pakage.pakage_id,
                        bill_key = Guid.NewGuid().ToString(),
                        bill_orderid = orderId

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
                        user_id = id.user_id,
                        bill_active = false,
                        bill_datecreate = DateTime.Now,
                        bill_dealine = DateTime.Now,
                        bill_sum = amount,
                        pakege_id = pakage.pakage_id,
                        bill_key = Guid.NewGuid().ToString(),
                        bill_orderid = orderId

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
            var id = coo.CookieID();

            Session["pakeid"] = null;

            return View(db.Bills.Where(n => n.user_id == id.user_id).OrderByDescending(n => n.bill_datecreate).ToList());
        }
        public JsonResult JsonHistoryPay()
        {
            var coo = new FunctionController();
            var id = coo.CookieID();

            var list = db.Bills.Where(n => n.user_id == id.user_id).OrderByDescending(n => n.bill_datecreate).Select(n => new
            {
                id = n.bill_id,
                datecreate = n.bill_datecreate.ToString(),
                idus = n.user_id,
                sum = n.bill_sum,
                active = n.bill_active,
                deadline = n.bill_dealine.ToString(),
                idpake = n.pakege_id,
                key = n.bill_key,
                name = "Nâng cấp tài khoản lên " + n.Pakage.pakage_name,
                orderid = n.bill_orderid

            }).ToList();

            return Json(list,JsonRequestBehavior.AllowGet);
        }
    }
}