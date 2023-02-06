using HybridCMS.Models;
using HybridCMSBll;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace HybridCMS.Controllers
{
    public class UserController : Controller
    {
        UserBll userBll = new UserBll();
        LoginEntity _User = new LoginEntity();
        public UserController()
        {
            SessionHelper.InitializeSession();
            _User = SessionHelper.authenticateUser();
        }
        [Route("User/Login/{returnurl ?}")]
        public ActionResult Login(string returnurl)
        {
            if (Request.Cookies["HybridCMS"] == null && _User.Id <= 0)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        [HttpPost]
        [Route("User/Login/{returnurl ?}")]
        [ValidateAntiForgeryToken]
        public ActionResult Login(CMSLoginViewModel model, string returnurl)
        {
            if (ModelState.IsValid)
            {
                var cmsEntity = userBll.LoginCMS(EmailorUsername: model.EmailorUsername, Password: model.Password);

                if (cmsEntity == null || cmsEntity.EmailId == null || cmsEntity.Id <= 0 || cmsEntity.RoleId != 3)
                {
                    ModelState.AddModelError("", "Your email/username or password is incorrect.");
                }
                else
                {
                    SessionHelper.EmailorUsername = model.EmailorUsername;
                    SessionHelper.Password = model.Password;

                    if (model.RemenberMe)
                    {
                        SessionHelper.SaveHybridCMS(keyName: model.EmailorUsername, keyPass: model.Password);
                    }

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
    }
}