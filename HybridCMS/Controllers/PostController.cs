using HybridCMS.Models;
using HybridCMSBll;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.IO;
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
        [AcceptVerbs("Get", "Post")]
        [Route("@{URL}/Post/Create")]
        public ActionResult Create(string URL)
        {
            try
            {
                AssetEntity asset = new AssetEntity();
                if (!string.IsNullOrEmpty(URL))
                {
                    asset = assetBll.CheckValidURL(URL);

                    if (asset.AssetId > 0 && asset.UserId == _User.Id && asset.AssetTypeId == AssetType.Page)
                    {
                        PostViewModel postViewModel = new PostViewModel();
                        postViewModel.AssetId = asset.AssetId;
                        postViewModel.AssetUrl = asset.AssetUrl;
                        return View(postViewModel);
                    }
                }
            }
            catch { }
            return new ViewResult() { ViewName = "PageNotFound" };
        }
        public JsonResult PostCreate(PostViewModel obj)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (assetBll.CheckValidUserIdandAssetId(_User.Id, Convert.ToString(obj.AssetId)))
                    {
                        if (obj.Image != null && obj.Image.ContentLength > 0)
                        {
                            string mapPath = Server.MapPath("/Upload");
                            Guid guid = Guid.NewGuid();
                            string fileExtention = Path.GetExtension(obj.Image.FileName);
                            string FullImageName = guid.ToString() + fileExtention;
                            string fullPath = Path.Combine(mapPath, FullImageName);
                            obj.Image.SaveAs(fullPath);

                            obj.Photo = FullImageName;
                        }
                        PostEntity postEntity = new PostEntity()
                        {
                            AssetId = obj.AssetId,
                            PostHeading = obj.Heading,
                            PostDescription = obj.Description,
                            PostImage = obj.Photo
                        };
                        bool result = postBll.AddPost(postEntity);
                        if (result)
                        {
                            return Json(new { success = true, message = "Post created successfully." });
                        }
                    }
                }
            }
            catch { }
            return Json(new { success = false, message = "Error" });
        }

        [AcceptVerbs("Get", "Post")]
        [Route("@{URL}/Post/Update/{PostId}")]
        public ActionResult Update(string URL,string PostId)
        {
            try
            {
                AssetEntity asset = new AssetEntity();
                if (!string.IsNullOrEmpty(URL))
                {
                    asset = assetBll.CheckValidURL(URL);

                    if (asset.AssetId > 0 && asset.UserId == _User.Id && asset.AssetTypeId == AssetType.Page)
                    {
                        PostViewModel postViewModel = new PostViewModel();
                        postViewModel.AssetId = asset.AssetId;
                        postViewModel.AssetUrl = asset.AssetUrl;
                        return View(postViewModel);
                    }
                }
            }
            catch { }
            return new ViewResult() { ViewName = "PageNotFound" };
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
                    List = postBll.GetAllPostByAssetId(AssetId);
                }
                if(List.Count() > 0)
                {
                    return PartialView("_PostListPartial", List);
                }
            }
            catch { }
            return PartialView("_BlankPartialView");
        }
        [AcceptVerbs("Get", "Post")]
        [ChildActionOnly]
        public ActionResult PostPartial(PostEntity postEntity)
        {
            try
            {
                if (postEntity.PostId > 0)
                {
                    if (string.IsNullOrEmpty(postEntity.PostImage) || !System.IO.File.Exists(Server.MapPath("/Upload/" + postEntity.PostImage)))
                    {
                        postEntity.PostImage = null;
                    }

                    return PartialView("_PostPartial", postEntity);
                }
            }
            catch { }
            return PartialView("_BlankPartialView");
        }

        [AcceptVerbs("Get", "Post")]
        [ChildActionOnly]
        public ActionResult PostBtnPartialView(string PostId)
        {
            PostEntity postEntity = new PostEntity();

            if (postBll.CheckValidUserIdandPostId(_User.Id, PostId))
            {
                try
                {
                    if (long.Parse(PostId) > 0)
                    {
                        postEntity = postBll.GetPostByPostId(long.Parse(PostId));
                    }
                }
                catch { }
                return PartialView("_EditDeletePostBtnPartial", postEntity);
            }
            else
            {
                try
                {
                    if (long.Parse(PostId) > 0)
                    {
                        postEntity = postBll.GetPostByPostId(long.Parse(PostId));
                    }
                }
                catch { }
                return PartialView("_DetailPostBtnPartial", postEntity);
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
                        Photo = obj.PostImage
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
                        PostImage = obj.Photo
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
        //[HttpGet]
        //[Route("@{URL}/{PostId}")]
        //public ActionResult DetailPost(string URL, string PostId)
        //{
        //    PostEntity postEntity = new PostEntity();
        //    try
        //    {
        //        postEntity = postBll.GetPostByPostId(long.Parse(PostId));
        //    }
        //    catch { }
        //    if (postEntity.PostId > 0)
        //    {
        //        return View(postEntity);
        //    }
        //    return new ViewResult() { ViewName = "PageNotFound" };
        //}
        [Route("Post/Delete/{PostId}")]
        public ActionResult DeletePost(string PostId)
        {
            PostEntity postEntity = new PostEntity();
            if (postBll.CheckValidUserIdandPostId(_User.Id, PostId))
            {
                try
                {
                    postEntity = postBll.GetPostByPostId(long.Parse(PostId));
                }
                catch { }
                if (postBll.DeletePost(long.Parse(PostId)))
                {
                    ViewBag.AlertMsg = "Asset deleted successfully";
                    return RedirectToAction("AssetView", "Asset", new { URL = postEntity.AssetUrl });
                }
            }
            return new ViewResult() { ViewName = "PageNotFound" };
        }
    }
}