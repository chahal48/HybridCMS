using HybridCMS.Models;
using HybridCMSBll;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Web;
using System.Web.Mvc;

namespace HybridCMS.Controllers
{
    public class PostController : Controller
    {
        PostBll postBll = new PostBll();
        AssetBll assetBll = new AssetBll();
        LoginEntity _User = new LoginEntity();
        public PostController()
        {
            SessionHelper.InitializeSession();
            _User = SessionHelper.authenticateUser();
        }
        // Post: AddPost
        [HttpPost]
        public ActionResult AddPost(AddPostViewModal obj)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (assetBll.CheckValidUserIdandAssetId(_User.Id, Convert.ToString(obj.AssetId)))
                    {
                        PostEntity postEntity = new PostEntity()
                        {
                            AssetId = obj.AssetId,
                            PostHeading = obj.Heading,
                            PostDescription = obj.Description,
                            EncodedHtml = obj.EncodedHtml,
                            ImageName = obj.Photo
                        };
                        bool result = postBll.AddPost(postEntity);
                        if (result)
                        {
                            TempData["SuccessMsg"] = "Post added successfully.";
                        }
                    }  
                }
                else
                {
                    TempData["ErrorMsg"] = "Error adding post.";
                }
            }
            catch { }
            try
            {
                if (obj.AssetId > 0)
                {
                    var asset = assetBll.GetAssetByAssetId(obj.AssetId);
                    return RedirectToAction("AssetView", "Asset",new { URL = asset.URL});
                }
            }
            catch { }
            return RedirectToAction("Index", "Home");
        }
    }
}