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
    public class AssetController : Controller
    {
        AssetBll assetBll = new AssetBll();
        LoginEntity _User;
        public AssetController()
        {
            SessionHelper.InitializeSession();
            _User = SessionHelper.authenticateUser();
        }

        [HttpGet]
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
        [Route("{URL}", Name = "PageView")]
        public ActionResult AssetView(string URL)
        {
            AssetEntity asset = assetBll.CheckValidURL(URL);

            if (!string.IsNullOrEmpty(URL) && asset.AssetId > 0 && !string.IsNullOrEmpty(asset.URL))
            {
                return View(asset);
            }
            return new ViewResult() { ViewName = "PageNotFound" };
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddAsset(AssetViewModel obj)
        {
            try
            {
                if (ModelState.IsValid && _User.Id > 0)
                {
                    bool result = assetBll.AddAsset(Name: obj.Name,assetType:obj.AssetTypeId, UserId: _User.Id, URL: obj.URL, Description: obj.Description, Photo: obj.ProfilePicture);
                    if (result)
                    {
                        TempData["SuccessMsg"] = "Asset added successfully.";
                    }
                }
                else
                {
                    TempData["ErrorMsg"] = "Error adding asset.";
                }
            }
            catch { }
            return RedirectToAction("AdminDashboard", "CMS");
        }
        public ActionResult DeleteAsset(string AssetId)
        {
            bool result = assetBll.CheckValidUserIdandAssetId(_User.Id, AssetId);

            if (result)
            {
                if (assetBll.DeleteAsset(long.Parse(AssetId)))
                {
                    ViewBag.AlertMsg = "Asset deleted successfully";
                }
            }
            return new ViewResult() { ViewName = "PageNotFound" };
        }
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
            bool result = assetBll.CheckUrlAlreadyExists(URL);
            if (result)
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            return Json(JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public ActionResult EditAsset(string AssetId)
        {
            AssetViewModel assetViewModel = new AssetViewModel();
            if (assetBll.CheckValidUserIdandAssetId(_User.Id, AssetId))
            {
                var asset = assetBll.GetAssetByAssetId(long.Parse(AssetId));
                if (asset.UserId == _User.Id)
                {
                    assetViewModel = new AssetViewModel()
                    {
                        AssetId = asset.AssetId,
                        UserId = asset.UserId,
                        AssetTypeId = asset.AssetTypeId,
                        URL = asset.URL,
                        Name = asset.Name,
                        Description = asset.Description,
                        ProfilePicture = asset.ProfilePicture
                    };
                    return View(assetViewModel);
                }
            }
            return new ViewResult() { ViewName = "PageNotFound" };
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditAsset(AssetViewModel obj)
        {
            try
            {
                if (ModelState.IsValid && _User.Id > 0)
                {
                    if (_User.Id != obj.UserId)
                    {
                        ModelState.AddModelError("", "you can`t change other user data!");
                    }
                    else
                    {
                        bool result = assetBll.UpdateAsset(Name: obj.Name, AssetId: obj.AssetId, UserId: obj.UserId, URL: obj.URL, Description: obj.Description, Photo: obj.ProfilePicture);
                        if (result)
                        {
                            TempData["SuccessMsg"] = "Asset added successfully.";
                        }
                    }
                }
                else
                {
                    TempData["ErrorMsg"] = "Error adding asset.";
                }
            }
            catch { }
            return RedirectToAction("AdminDashboard", "CMS");
        }
    }
}