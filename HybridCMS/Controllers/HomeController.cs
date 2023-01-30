using HybridCMS.Models;
using HybridCMSBll;
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
        PostBll postBll = new PostBll();
        AssetBll assetBll = new AssetBll();
        public HomeController()
        {
            SessionHelper.InitializeSession();
            _User = SessionHelper.authenticateUser();
        }
        // GET: Home
        [AcceptVerbs("Get", "Post")]
        public ActionResult Index(string search)
        {
            List<AssetMap> assetMaps = new List<AssetMap>();
            try
            {
                if(!string.IsNullOrEmpty(search))
                {
                    assetMaps = assetBll.GetAllAssetBySearch(search);
                }
                else
                {
                    assetMaps = assetBll.GetAllAsset();
                }
            }
            catch { }
            return View(assetMaps);
        }
        // GET: ContactUs
        public ActionResult ContactUs()
        {
            return View();
        }
        [AcceptVerbs("Get", "Post")]
        [ChildActionOnly]
        public ActionResult LatestPostView()
        {
            List<PostMap> postMap = new List<PostMap>();
            try
            {
                postMap = postBll.GetLatestPost();
            }
            catch { }
            if (postMap.Count > 3)
            {
                return PartialView("_LatestPostView", postMap);
            }
            return PartialView("_BlankPartialView");
        }
        [AcceptVerbs("Get", "Post")]
        [ChildActionOnly]
        public ActionResult Blogs(string search)
        {
            List<AssetMap> assetMaps = new List<AssetMap>();
            try
            {
                if (!string.IsNullOrEmpty(search))
                {
                    assetMaps = assetBll.GetAllAssetBySearch(search);
                }
                else
                {
                    assetMaps = assetBll.GetAllAsset();
                }
            }
            catch { }
            return PartialView("_BlogsView", assetMaps.Where(a => a.AssetTypeId == AssetType.Blog));
        }
        
    }
}