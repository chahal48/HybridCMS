using HybridCMS.Models;
using HybridCMSBll;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;

namespace HybridCMS.Controllers
{
    public class PageController : Controller
    {
        LoginEntity _User;
        AssetBll _assetBll = new AssetBll();

        public PageController()
        {
            SessionHelper.InitializeSession();
            _User = SessionHelper.authenticateUser();
        }

        [HttpGet]
        public ActionResult Create()
        {
            if (_User.Id > 0 && _User.RoleId == 2)
            {
                return View();
            }
            return new ViewResult() { ViewName = "PageNotFound" };
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(PageViewModel obj)
        {
            try
            {
                if (ModelState.IsValid && _User.Id > 0)
                {
                    AssetEntity pageEntity = new AssetEntity();
                    if (obj.Image != null && obj.Image.ContentLength > 0)
                    {
                        string mapPath = Server.MapPath("/Upload");
                        Guid guid = Guid.NewGuid();
                        string fileExtention = Path.GetExtension(obj.Image.FileName);
                        string FullImageName = guid.ToString() + fileExtention;
                        string fullPath = Path.Combine(mapPath, FullImageName);
                        obj.Image.SaveAs(fullPath);

                        obj.Picture = FullImageName;
                    }
                    pageEntity = new AssetEntity()
                    {
                        UserId = _User.Id,
                        AssetUrl = obj.URL,
                        AssetName = obj.PageTitle,
                        AssetTypeId = AssetType.Page,
                        Description = obj.Description,
                        AssetPhoto = obj.Picture
                    };
                    bool result = _assetBll.AddAsset(pageEntity);
                    if (result)
                    {
                        TempData["SuccessMsg"] = "Page added successfully.";
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Error adding page.");
                }
            }
            catch { }
            return RedirectToAction("AdminDashboard", "CMS");
        }
        [HttpGet]
        [Route("Page/Update/{AssetId}")]
        public ActionResult Update(string AssetId)
        {
            PageViewModel pageViewModel = new PageViewModel();
            try
            {
                if (_assetBll.CheckValidUserIdandAssetId(_User.Id, AssetId))
                {
                    var asset = _assetBll.GetAssetByAssetId(long.Parse(AssetId));
                    if (asset.UserId == _User.Id && asset.AssetTypeId == AssetType.Page)
                    {
                        pageViewModel = new PageViewModel()
                        {
                            AssetId = asset.AssetId,
                            UserId = asset.UserId,
                            AssetTypeId = asset.AssetTypeId,
                            URL = asset.AssetUrl,
                            PageTitle = asset.AssetName,
                            Description = asset.Description,
                            Picture = asset.AssetPhoto
                        };
                        return View(pageViewModel);
                    }
                }
            }
            catch { }
            return new ViewResult() { ViewName = "PageNotFound" };
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Route("Page/Update/{AssetId}")]
        public ActionResult Update(string AssetId, PageViewModel obj)
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
                        if (obj.Image != null && obj.Image.ContentLength > 0)
                        {
                            string mapPath = Server.MapPath("/Upload");
                            Guid guid = Guid.NewGuid();
                            string fileExtention = Path.GetExtension(obj.Image.FileName);
                            string FullImageName = guid.ToString() + fileExtention;
                            string fullPath = Path.Combine(mapPath, FullImageName);
                            obj.Image.SaveAs(fullPath);

                            obj.Picture = FullImageName;
                        }

                        AssetEntity pageEntity = new AssetEntity();
                        pageEntity = new AssetEntity()
                        {
                            AssetId = obj.AssetId,
                            UserId = _User.Id,
                            AssetUrl = obj.URL,
                            AssetName = obj.PageTitle,
                            Description = obj.Description,
                            AssetPhoto = obj.Picture,
                        };
                        bool result = _assetBll.UpdateAsset(pageEntity);
                        if (result)
                        {
                            TempData["SuccessMsg"] = "Page updated successfully.";
                        }
                    }
                }
                else
                {
                    TempData["ErrorMsg"] = "Error updating page.";
                }
            }
            catch { }
            return RedirectToAction("AdminDashboard", "CMS");
        }
        [AcceptVerbs("Get", "Post")]
        public ActionResult IsUrlAvailable([Bind(Prefix = "URL")] string URL, string initialURL)
        {
            if (URL.Length < 5 || URL.Length > 50)
            {
                return Json("Sorry, URL must be between 5 and 50 characters long.");
            }
            string pattern = @"^[A-Za-z -]*$";
            bool checkPattern = Regex.IsMatch(URL, pattern);
            if (!checkPattern)
            {
                return Json("Sorry, only letters are allowed.");
            }
            if (!string.IsNullOrEmpty(initialURL) && !string.IsNullOrEmpty(URL))
            {
                if (URL.ToLower() == initialURL.ToLower())
                {
                    return Json(true, JsonRequestBehavior.AllowGet);
                }
            }
            bool result = _assetBll.CheckUrlAlreadyExists(URL);
            if (result)
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            return Json("URL already exist.");
        }
        [AcceptVerbs("Get", "Post")]
        public ActionResult IsPageTitleValid([Bind(Prefix = "PageTitle")] string PageTitle)
        {
            if (string.IsNullOrWhiteSpace(PageTitle))
            {
                return Json("Sorry, Page title empty or contains blank space only.");
            }
            if (PageTitle.Trim().Length < 5 || PageTitle.Length > 50)
            {
                return Json("Sorry, Page title must be between 5 and 50 characters long.");
            }
            return Json(true, JsonRequestBehavior.AllowGet);
        }
    }
}