using HybridCMS.Models;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HybridCMS.Controllers
{
    public class HomeController : Controller
    {
        LoginEntity _User = new LoginEntity();
        public HomeController()
        {
            SessionHelper.InitializeSession();
            _User = SessionHelper.authenticateUser();
        }
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }
        // GET: ContactUs
        public ActionResult ContactUs()
        {
            return View();
        }
    }
}