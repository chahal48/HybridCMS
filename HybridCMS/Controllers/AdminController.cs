using HybridCMS.Models;
using HybridCMSBll;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
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
        [HttpGet]
        public ActionResult PartialAddPostView(Int64 AssetId)
        {
            AddPostViewModal obj = new AddPostViewModal();
            obj.AssetId = AssetId;
            return PartialView("_AddPostPartial", obj);
        }
        [HttpPost]
        public ActionResult AddPost(AddPostViewModal obj)
        {
            pageBll.AddPost(obj.AssetId, obj.Heading, obj.Description, WebUtility.HtmlEncode(obj.EncodedHtml), obj.Photo);

            return new ViewResult() { ViewName = "PageNotFound" };
        }

    }
}