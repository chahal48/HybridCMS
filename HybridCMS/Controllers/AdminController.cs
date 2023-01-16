using HybridCMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HybridCMS.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult Page()
        {
            if (Session["CMSName"] != null && Session["CMSId"] != null && Session["CMSRoleId"].Equals("2"))
            {
                return View();
            }
            else
            {
                SessionHelper.ClearHybridCMS();
            }
            return RedirectToAction("Login","CMS");
        }
    }
}