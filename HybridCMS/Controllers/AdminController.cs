using HybridCMS.Models;
using HybridCMSBll;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace HybridCMS.Controllers
{
    public class AdminController : Controller
    {
        PageBll pageBll = new PageBll();
        public AdminController()
        {
            SessionHelper.InitializeSession();
        }
        
        [HttpPost]
        public ActionResult AddPage(AssetViewModel obj)
        {
            try
            {
                if (ModelState.IsValid && Session["CMSId"] != null)
                {
                    bool result = pageBll.AddPage(Name: obj.Name, UserId: Convert.ToInt64(Session["CMSId"]), URL: obj.URL, Description: obj.Description, Photo: obj.ProfilePicture);
                    if (result)
                    {
                        TempData["SuccessMsg"] = "Page added successfully.";
                    }
                }
                else
                {
                    TempData["ErrorMsg"] = "Error adding page.";
                }
            }
            catch { }
            return RedirectToAction("AdminDashboard", "CMS");
        }
        /// <summary>
        /// To mentain uniqueness of URL
        /// </summary>
        /// <param name="URL"></param>
        /// <param name="initialURL"></param>
        /// <returns></returns>
        [AcceptVerbs("Get", "Post")]
        public ActionResult IsUrlAvailable([Bind(Prefix = "URL")] string URL, string initialURL)
        {
            if (initialURL != "" && initialURL != null)
            {
                if (URL.ToLower() == initialURL.ToLower())
                {
                    return Json(true, JsonRequestBehavior.AllowGet);
                }
            }
            bool result = pageBll.CheckUrlAlreadyExists(URL);
            if (result)
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            return Json(JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        [ChildActionOnly]
        public ActionResult AdminPageList()
        {
            List<AdminPageListView> List = new List<AdminPageListView>();
            if(Session["CMSId"] != null)
            {
                List = pageBll.GetAllPageByUserId(Convert.ToInt64(Session["CMSId"]));
            }
            return PartialView("_AdminPageListPartial", List);
        }
        [Route("{URL}", Name = "PageView")]
        public ActionResult AdminPageView(string URL)
        {
            if (!string.IsNullOrEmpty(URL) && pageBll.CheckValidURL(URL))
            {
                return View();
            }
            return new ViewResult() { ViewName = "PageNotFound" };
        }
    }
}