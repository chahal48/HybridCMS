using HybridCMS.Models;
using HybridCMSBll;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Runtime.InteropServices;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace HybridCMS.Controllers
{
    public class AssetController : Controller
    {
        AssetBll assetBll = new AssetBll();
        LoginEntity _User;
        public AssetController()
        {
            SessionHelper.InitializeSession();
            _User = SessionHelper.authenticateUser();
        }

        #region Child Action Method
        [AcceptVerbs("Get", "Post")]
        [ChildActionOnly]
        public ActionResult AdminAssetList()
        {
            List<AssetEntity> List = new List<AssetEntity>();

            if (_User.Id > 0)
            {
                List = assetBll.GetAllAssetByUserId(_User.Id);
            }
            return PartialView("_AdminAssetListPartial", List);
        }
        //[AcceptVerbs("Get", "Post")]
        //[ChildActionOnly]
        //public ActionResult AddPostButtonPartialView(string AssetId)
        //{
        //    if (assetBll.CheckValidUserIdandAssetId(_User.Id, AssetId))
        //    {
        //        return PartialView("_AddPostBtnPartial");
        //    }
        //    return PartialView("_BlankPartialView");
        //}
        //[AcceptVerbs("Get", "Post")]
        //[ChildActionOnly]
        //public ActionResult PartialAddPostView(string AssetId)
        //{
        //    if (assetBll.CheckValidUserIdandAssetId(_User.Id, AssetId))
        //    {
        //        AddPostViewModal obj = new AddPostViewModal();
        //        obj.AssetId = long.Parse(AssetId);
        //        return PartialView("_AddPostPartial", obj);
        //    }
        //    return PartialView("_BlankPartialView");
        //}
        #endregion

        [AcceptVerbs("Get", "Post")]
        [Route("@{URL}")]
        public ActionResult AssetView(string URL)
        {
            try
            {
                AssetEntity asset = new AssetEntity();
                asset = assetBll.CheckValidURL(URL);
                if (!string.IsNullOrEmpty(URL) && asset.AssetId > 0 && !string.IsNullOrEmpty(asset.AssetUrl))
                {
                    return View(asset);
                }
            }
            catch { }
            return new ViewResult() { ViewName = "PageNotFound" };
        }
        [AcceptVerbs("Get", "Post")]
        [ChildActionOnly]
        public ActionResult AssetBlogPartial(AssetEntity asset)
        {
            if (string.IsNullOrEmpty(asset.AssetPhoto) || !System.IO.File.Exists(Server.MapPath("/Upload/" + asset.AssetPhoto)))
            {
                asset.AssetPhoto = null;
            }
            return PartialView("_AssetBlogPartial",asset);
        }
        [AcceptVerbs("Get", "Post")]
        [ChildActionOnly]
        public ActionResult AssetPagePartial(AssetEntity asset)
        {
            if (string.IsNullOrEmpty(asset.AssetPhoto) || !System.IO.File.Exists(Server.MapPath("/Upload/" + asset.AssetPhoto)))
            {
                asset.AssetPhoto = null;
            }
            return PartialView("_AssetPagePartial", asset);
        }
        [Route("Asset/DeleteAsset/{AssetId}")]
        public ActionResult DeleteAsset(string AssetId)
        {
            bool result = assetBll.CheckValidUserIdandAssetId(_User.Id, AssetId);

            if (result)
            {
                if (assetBll.DeleteAsset(long.Parse(AssetId)))
                {
                    ViewBag.AlertMsg = "Asset deleted successfully";
                    return RedirectToAction("AdminDashboard", "CMS");
                }
            }
            return new ViewResult() { ViewName = "PageNotFound" };
        }
        [Route("Asset/UpdateAsset/{AssetId}")]
        public ActionResult UpdateAsset(string AssetId)
        {
            bool result = assetBll.CheckValidUserIdandAssetId(_User.Id, AssetId);

            if (result)
            {
                var asset = assetBll.GetAssetByAssetId(long.Parse(AssetId));
                if (asset.UserId == _User.Id && asset.AssetTypeId == AssetType.Blog)
                {
                    return RedirectToAction("Update", "Blog", new { AssetId = AssetId });
                }
                else if(asset.UserId == _User.Id && asset.AssetTypeId == AssetType.Page)
                {
                    return RedirectToAction("Update", "Page", new { AssetId = AssetId });
                }
            }
            return new ViewResult() { ViewName = "PageNotFound" };
        }
        //[Route("Asset/{AssetId}")]
        //public ActionResult AssetDetails(string AssetId)
        //{
        //    bool result = assetBll.CheckValidUserIdandAssetId(_User.Id, AssetId);

        //    if (result)
        //    {
        //        var asset = assetBll.GetAssetByAssetId(long.Parse(AssetId));
        //        if (asset.UserId == _User.Id && asset.AssetTypeId == AssetType.Blog)
        //        {
        //            return RedirectToAction("Update", "Blog", new { AssetId = AssetId });
        //        }
        //        else if (asset.UserId == _User.Id && asset.AssetTypeId == AssetType.Page)
        //        {
        //            return RedirectToAction("Update", "Page", new { AssetId = AssetId });
        //        }
        //    }
        //    return new ViewResult() { ViewName = "PageNotFound" };
        //}
    }
}