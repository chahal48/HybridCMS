using HybridCMS.Models;
using HybridCMSBll;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.Remoting.Lifetime;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Services.Description;
using System.Xml;
using System.Xml.Linq;

namespace HybridCMS.Controllers
{
    public class CMSController : Controller
    {
        UserBll userBll = new UserBll();
        public ActionResult Login(string returnurl)
        {
            if (Request.Cookies["HybridCMS"] != null)
            {
                HttpCookie HybridCMS = Request.Cookies["HybridCMS"];

                CMSLoginViewModel cMSLoginView = new CMSLoginViewModel
                {
                    UserName = HybridCMS["CMSUserName"],
                    Password = HybridCMS["CMSPass"],
                    RemenberMe = Convert.ToBoolean(HybridCMS["RemenberMe"])
                };
                return View(cMSLoginView);
            }
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(CMSLoginViewModel model, string returnurl)
        {
            if (ModelState.IsValid)
            {
                string encryptPass = userBll.EncryptPassword(model.Password);
                var cmsEntity = userBll.LoginCMS(model.UserName, encryptPass);

                if (cmsEntity == null || cmsEntity.EmailId == null || encryptPass == null)
                {
                    ModelState.AddModelError("", "Your username or password is incorrect.");
                }
                else
                {
                    if (model.RemenberMe == true)
                    {
                        HttpCookie HybridCMS = new HttpCookie("HybridCMS");

                        HybridCMS["CMSName"] = cmsEntity.Name;
                        HybridCMS["CMSUserName"] = model.UserName;
                        HybridCMS["CMSId"] = Convert.ToString(cmsEntity.Id);
                        HybridCMS["CMSEmail"] = cmsEntity.EmailId;
                        HybridCMS["CMSPass"] = encryptPass;
                        HybridCMS["CMSPhoto"] = cmsEntity.Photo;
                        HybridCMS["CMSRoleId"] = Convert.ToString(cmsEntity.RoleId);
                        HybridCMS["RemenberMe"] = Convert.ToString(model.RemenberMe);

                        HybridCMS.Expires = DateTime.Now.AddDays(30);
                        Response.Cookies.Add(HybridCMS);

                    }
                    Session["CMSName"] = cmsEntity.Name;
                    Session["CMSId"] = Convert.ToString(cmsEntity.Id);
                    Session["CMSEmail"] = cmsEntity.EmailId;
                    Session["CMSPhoto"] = cmsEntity.Photo;
                    Session["CMSRoleId"] = Convert.ToString(cmsEntity.RoleId);

                    if (!string.IsNullOrEmpty(returnurl) && Url.IsLocalUrl(returnurl))
                    {
                        return Redirect(returnurl);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
            }
            return View();
        }
        public ActionResult ChangePassword()
        {
            if (Session["CMSName"] != null && Session["CMSId"] != null)
            {
                return View();
            }

            return RedirectFromLogin();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePassword(CMSChangePasswordViewModel obj)
        {
            if (ModelState.IsValid && Session["CMSId"] != null)
            {
                try
                {
                    if (userBll.ChangePassword(CurrentPassword: obj.CurrentPassword, NewPassword: obj.NewPassword, Convert.ToInt64(Session["CMSId"])))
                    {
                        ViewBag.AlertMsg = "Password updated successfully.";
                    }
                    else
                    {
                        ModelState.AddModelError("", "Try again - that`s not your current password.");
                    }
                }
                catch { }
            }
            return View(obj);
        }
        public ActionResult AdminDashboard()
        {
            if (Session["CMSName"] != null && Session["CMSId"] != null && Session["CMSRoleId"].Equals("2"))
            {
                return View();
            }
            return RedirectFromLogin();
        }
        public ActionResult Logout()
        {
            Session.Abandon();
            Session.Clear();
            Response.Cookies.Clear();
            if (Request.Cookies["HybridCMS"] != null)
            {
                HttpCookie HybridCMS = new HttpCookie("HybridCMS");
                HybridCMS.Expires = DateTime.Now.AddDays(-30);
                Response.Cookies.Add(HybridCMS);
            }
            return RedirectToAction("login");
        }
        public ActionResult RedirectFromLogin()
        {
            string returnurl = Request.RawUrl;

            var routeValues = new RouteValueDictionary
            {
                { "returnurl", returnurl }
            };
            return RedirectToAction("Login", "CMS", routeValues);
        }
        public ActionResult ForgotPassword()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ForgotPassword(ForgetPasswordViewModel obj)
        {
            if (obj.EmailorUsername != null)
            {
                string toEmailAddress = userBll.CheckEmailorUsernameExists(obj.EmailorUsername);
                if (string.IsNullOrEmpty(toEmailAddress))
                {
                    ModelState.AddModelError("", "Email/Username was not found!");
                }
                else
                {
                    string TokenId = Convert.ToString(Guid.NewGuid());
                    StringBuilder sbUrl = new StringBuilder();
                    sbUrl = sbUrl.Append(Request.Url.GetLeftPart(UriPartial.Authority));
                    sbUrl = sbUrl.Append("/CMS/ResetPassword/?url=");
                    sbUrl = sbUrl.Append(TokenId);
                    string subject = "Welcome to my web application";
                    string body = "<h1 style=\"color: #3CB815 !important; font-weight: 700 !important;margin: 0 !important;font-size: calc(1.375rem + 1.5vw);\">Hybrid<span style=\"color: #F65005 !important;\">CMS</span></h1>" +
                                        "Please use the following link to reset your password:" +
                                        "<br/><br/><a href=\"" + sbUrl + "\" style=\"cursor: pointer;font-size: 0.9rem;padding: 0.50rem 1rem;letter-spacing: 0.05rem;text-decoration: none !important;border-radius: 20px;font-weight: 700 !important;color: #fff;background-color: #3CB815;border-color: #3CB815;display: inline-block;\">Reset</a>" +
                                        "<br/><br/>Please note that the link will expire in 15 minutes." +
                                        //link to reset password 
                                        "<br/>If you did not request a password change, please feel free to ignore this message." +
                                        "<br/>If you have any comments or questions don’t hesitate to reach us at " +
                                        "sachin.c@antheminfotech.com ." + //email address
                                        "<br/>Please feel free to respond to this email.It was sent from a monitored email address, and we would love to hear from you.";
                    
                    try
                    {
                        if (userBll.GenerateTokenForResetPassword(EmailorUsername: obj.EmailorUsername, TokenId: TokenId))
                        {
                            MailHelper.ForgetPasswordEmail(toEmailAddress, subject, body, true);
                            ViewBag.AlertMsg = "We have sent a reset password link to your email.Please check.";
                        }
                        else
                        {
                            ModelState.AddModelError("", "Error :  please check your connection.");
                        }
                    }
                    catch
                    {
                    }
                }
            }
            else
            {
                ModelState.AddModelError("", "Email/Username is required!");
            }
            return View(obj);
        }
        public ActionResult ResetPassword(string url)
        {
            if (!string.IsNullOrEmpty(url))
            {
                if (userBll.CheckValidToken(url))
                {
                    return View();
                }
                TempData["LinkExpired"] = true;
                return RedirectToAction("ForgotPassword", "CMS");
            }
            return RedirectToAction("ForgotPassword", "CMS");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ResetPassword(ResetPasswordViewModel obj,string url)
        {
            if (ModelState.IsValid)
            {
                if (userBll.ChangeUserPasswordByToken(Password: obj.NewPassword,TokenId: url))
                {
                    TempData["AlertMsg"] = "Password updated successfully.";
                    return RedirectToAction("Login", "CMS");
                }
            }
            return View(obj);
        }

    }
}