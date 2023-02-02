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
            List<AssetEntity> assetEntity = new List<AssetEntity>();
            try
            {
                if(!string.IsNullOrEmpty(search))
                {
                    assetEntity = assetBll.GetAllAssetBySearch(search);
                }
                else
                {
                    assetEntity = assetBll.GetAllAsset();
                }
            }
            catch { }
            return View(assetEntity);
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
            List<PostEntity> postEntity = new List<PostEntity>();
            try
            {
                postEntity = postBll.GetLatestPost();
            }
            catch { }
            if (postEntity.Count > 3)
            {
                return PartialView("_LatestPostView", postEntity);
            }
            return PartialView("_BlankPartialView");
        }
        [AcceptVerbs("Get", "Post")]
        [ChildActionOnly]
        public ActionResult Blogs(string search)
        {
            List<AssetEntity> assetEntity = new List<AssetEntity>();
            try
            {
                if (!string.IsNullOrEmpty(search))
                {
                    assetEntity = assetBll.GetAllAssetBySearch(search);
                }
                else
                {
                    assetEntity = assetBll.GetAllAsset();
                }
            }
            catch { }
            return PartialView("_AllBlogPartial", assetEntity.Where(a => a.AssetTypeId == AssetType.Blog));
        }
        [AcceptVerbs("Get", "Post")]
        [ChildActionOnly]
        public ActionResult Pages(string search)
        {
            List<AssetEntity> assetEntity = new List<AssetEntity>();
            try
            {
                if (!string.IsNullOrEmpty(search))
                {
                    assetEntity = assetBll.GetAllAssetBySearch(search);
                }
                else
                {
                    assetEntity = assetBll.GetAllAsset();
                }
            }
            catch { }
            return PartialView("_AllPagePartial", assetEntity.Where(a => a.AssetTypeId == AssetType.Page));
        }

    }
}