using HybridCMS.Models;
using HybridCMSBll;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using static System.Net.WebRequestMethods;

namespace HybridCMS.Controllers
{
    public class BlogController : Controller
    {
        LoginEntity _User;
        AssetBll _assetBll = new AssetBll();
        public BlogController()
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
        public ActionResult Create(BlogViewModel obj)
        {
            try
            {
                if (ModelState.IsValid && _User.Id > 0)
                {
                    AssetEntity blogEntity = new AssetEntity();
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
                    blogEntity = new AssetEntity()
                    {
                        UserId = _User.Id,
                        URL = obj.URL,
                        Name = obj.BlogTitle,
                        AssetTypeId = AssetType.Blog,
                        Description = obj.Description,
                        ProfilePicture = obj.Picture
                    };
                    bool result = _assetBll.AddAsset(blogEntity);
                    if (result)
                    {
                        TempData["SuccessMsg"] = "Blog added successfully.";
                    }
                }
                else
                {
                    ModelState.AddModelError("","Error adding blog.");
                }
            }
            catch { }
            return RedirectToAction("AdminDashboard", "CMS");
        }
        [HttpGet]
        [Route("Blog/Update/{AssetId}")]
        public ActionResult Update(string AssetId)
        {
            BlogViewModel blogViewModel = new BlogViewModel();
            try
            {
                if (_assetBll.CheckValidUserIdandAssetId(_User.Id, AssetId))
                {
                    var asset = _assetBll.GetAssetByAssetId(long.Parse(AssetId));
                    if (asset.UserId == _User.Id && asset.AssetTypeId == AssetType.Blog)
                    {
                        blogViewModel = new BlogViewModel()
                        {
                            AssetId = asset.AssetId,
                            UserId = asset.UserId,
                            AssetTypeId = asset.AssetTypeId,
                            URL = asset.URL,
                            BlogTitle = asset.Name,
                            Description = asset.Description,
                            Picture = asset.ProfilePicture
                        };
                        return View(blogViewModel);
                    }
                }
            }
            catch { }
            return new ViewResult() { ViewName = "PageNotFound" };
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Route("Blog/Update/{AssetId}")]
        public ActionResult Update(string AssetId, BlogViewModel obj)
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

                        AssetEntity blogEntity = new AssetEntity();
                        blogEntity = new AssetEntity()
                        {
                            AssetId = obj.AssetId,
                            UserId = _User.Id,
                            URL = obj.URL,
                            Name = obj.BlogTitle,
                            Description = obj.Description,
                            ProfilePicture = obj.Picture,
                        };
                        bool result = _assetBll.UpdateAsset(blogEntity);
                        if (result)
                        {
                            TempData["SuccessMsg"] = "Blog updated successfully.";
                        }
                    }
                }
                else
                {
                    TempData["ErrorMsg"] = "Error updating blog.";
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
        public ActionResult IsBlogTitleValid([Bind(Prefix = "BlogTitle")] string BlogTitle)
        {
            if(string.IsNullOrWhiteSpace(BlogTitle))
            {
                return Json("Sorry, Blog title empty or contains blank space only.");
            }
            if (BlogTitle.Trim().Length < 5 || BlogTitle.Length > 50)
            {
                return Json("Sorry, Blog title must be between 5 and 50 characters long.");
            }
            return Json(true, JsonRequestBehavior.AllowGet);
        }
    }
}