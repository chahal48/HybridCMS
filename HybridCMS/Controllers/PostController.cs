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
using System.Web.Routing;

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
                    return RedirectToAction("AssetView", "Asset", new { URL = asset.URL });
                }
            }
            catch { }
            return RedirectToAction("Index", "Home");
        }
        [AcceptVerbs("Get", "Post")]
        [ChildActionOnly]
        public ActionResult PostListPartialView(Int64 AssetId)
        {
            List<PostEntity> List = new List<PostEntity>();

            try
            {
                if (AssetId > 0)
                {
                    List = postBll.GetAllAssetByUserId(AssetId);
                }
            }
            catch { }
            return PartialView("_PostListPartial", List);
        }
        [AcceptVerbs("Get", "Post")]
        [ChildActionOnly]
        public ActionResult PostBtnPartialView(string PostId)
        {
            PostMap postMap = new PostMap();

            if (postBll.CheckValidUserIdandPostId(_User.Id, PostId))
            {
                try
                {
                    if (long.Parse(PostId) > 0)
                    {
                        postMap = postBll.GetPostByPostId(long.Parse(PostId));
                    }
                }
                catch { }
                return PartialView("_EditDeletePostBtnPartial", postMap);
            }
            else
            {
                try
                {
                    if (long.Parse(PostId) > 0)
                    {
                        postMap = postBll.GetPostByPostId(long.Parse(PostId));
                    }
                }
                catch { }
                return PartialView("_DetailPostBtnPartial", postMap);
            }
        }
        [HttpGet]
        [Route("Post/EditPost/{PostId}")]
        public ActionResult EditPost(string PostId)
        {
            if (postBll.CheckValidUserIdandPostId(_User.Id, PostId))
            {
                EditPostViewModal editPostView = new EditPostViewModal();
                try
                {
                    var obj = postBll.GetPostByPostId(long.Parse(PostId));
                    editPostView = new EditPostViewModal()
                    {
                        PostId = obj.PostId,
                        Heading = obj.PostHeading,
                        Description = obj.PostDescription,
                        EncodedHtml = obj.EncodedHtml,
                        Photo = obj.PostPhoto
                    };
                }
                catch { }
                return View(editPostView);
            }
            return new ViewResult() { ViewName = "PageNotFound" };
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Route("Post/EditPost/{PostId}")]
        public ActionResult EditPostMethod(string PostId, EditPostViewModal obj)
        {
            try
            {
                if (ModelState.IsValid && postBll.CheckValidUserIdandPostId(_User.Id, PostId))
                {
                    PostEntity postEntity = new PostEntity()
                    {
                        PostId = obj.PostId,
                        PostHeading = obj.Heading,
                        PostDescription = obj.Description,
                        EncodedHtml = obj.EncodedHtml,
                        ImageName = obj.Photo
                    };
                    bool result = postBll.EditPost(postEntity);
                    if (result)
                    {
                        TempData["SuccessMsg"] = "Post Updated successfully.";
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
        [HttpGet]
        [Route("@{URL}/{PostId}")]
        public ActionResult DetailPost(string URL, string PostId)
        {
            PostMap postMap = new PostMap();
            try
            {
                postMap = postBll.GetPostByPostId(long.Parse(PostId));
            }
            catch { }
            if (postMap.PostId > 0)
            {
                return View(postMap);
            }
            return new ViewResult() { ViewName = "PageNotFound" };
        }
        [Route("Post/Delete/{PostId}")]
        public ActionResult DeletePost(string PostId)
        {
            PostMap postMap = new PostMap();
            if (postBll.CheckValidUserIdandPostId(_User.Id, PostId))
            {
                try
                {
                    postMap = postBll.GetPostByPostId(long.Parse(PostId));
                }
                catch { }
                if (postBll.DeletePost(long.Parse(PostId)))
                {
                    ViewBag.AlertMsg = "Asset deleted successfully";
                    return RedirectToAction("AssetView", "Asset", new { URL = postMap.URL });
                }
            }
            return new ViewResult() { ViewName = "PageNotFound" };
        }
    }
}