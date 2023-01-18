using HybridCMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HybridCMS.Controllers
{
    public class HomeController : Controller
    {
        public HomeController()
        {
            SessionHelper.InitializeSession();
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