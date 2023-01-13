using HybridCMSBll;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;

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

                CMSLoginView cMSLoginView = new CMSLoginView
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
        public ActionResult Login(CMSLoginView model,string returnurl)
        {
            if (ModelState.IsValid)
            {
                string encryptPass = userBll.EncryptPassword(model.Password);
                var cmsEntity = userBll.LoginCMS(model.UserName , encryptPass);

                //string decryptPass = adminBll.DecryptPassword(model.Password);

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
            return RedirectToAction("Login", "CMS");
        }
        public ActionResult AdminDashboard()
        {
            if (Session["CMSName"] != null && Session["CMSId"] != null && Session["CMSRoleId"].Equals("2"))
            {
                return View();
            }
            return RedirectToAction("Login", "CMS");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePassword(CMSChangePasswordView obj)
        {
            if (ModelState.IsValid && Session["CMSId"] != null)
            {
                try
                {
                    if (userBll.ChangePassword(obj, Convert.ToInt64(Session["CMSId"])))
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
    }
}