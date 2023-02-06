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
        FileHelper _fileHelper = new FileHelper();
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
                    string ImagedNameToSave = _fileHelper.SaveFile(obj.Image);

                    AssetEntity blogEntity = new AssetEntity();                    

                    blogEntity = new AssetEntity()
                    {
                        UserId = _User.Id,
                        AssetUrl = obj.URL,
                        AssetName = obj.BlogTitle,
                        AssetTypeId = AssetType.Blog,
                        Description = obj.Description,
                        AssetPhoto = ImagedNameToSave
                    };
                    bool result = _assetBll.AddAsset(blogEntity);
                    if (result)
                    {
                        TempData["SuccessMsg"] = "Blog added successfully.";
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Error adding blog.");
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
                            URL = asset.AssetUrl,
                            BlogTitle = asset.AssetName,
                            Description = asset.Description,
                            Picture = asset.AssetPhoto
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
                        string ImagedNameToSave = _fileHelper.SaveFile(obj.Image);

                        AssetEntity blogEntity = new AssetEntity();
                        blogEntity = new AssetEntity()
                        {
                            AssetId = obj.AssetId,
                            UserId = _User.Id,
                            AssetUrl = obj.URL,
                            AssetName = obj.BlogTitle,
                            Description = obj.Description,
                            AssetPhoto = ImagedNameToSave,
                        };
                        bool result = _assetBll.UpdateAsset(blogEntity);
                        if (result)
                        {
                            if (!string.IsNullOrEmpty(ImagedNameToSave) && System.IO.File.Exists(Server.MapPath("/Upload/" + ImagedNameToSave)))
                            {
                                _fileHelper.DeleteFile(obj.Picture);
                            }

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
            if (string.IsNullOrWhiteSpace(BlogTitle))
            {
                return Json("Sorry, Blog title empty or contains blank space only.");
            }
            if (BlogTitle.Trim().Length < 5 || BlogTitle.Length > 50)
            {
                return Json("Sorry, Blog title must be between 5 and 50 characters long.");
            }
            return Json(true, JsonRequestBehavior.AllowGet);
        }
        [Route("Blogs")]
        [AcceptVerbs("Get", "Post")]
        public ActionResult Blogs()
        {
            return View();
        }
    }
}