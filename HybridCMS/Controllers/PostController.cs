using HybridCMS.Models;
using HybridCMSBll;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Http.Results;

namespace HybridCMS.Controllers
{
    public class PostController : Controller
    {
        PostBll postBll = new PostBll();
        AssetBll assetBll = new AssetBll();
        LoginEntity _User = new LoginEntity();
        FileHelper _fileHelper = new FileHelper();
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
                        string ImagedNameToSave = _fileHelper.SaveFile(obj.Image);

                        PostEntity postEntity = new PostEntity()
                        {
                            AssetId = obj.AssetId,
                            PostHeading = obj.Heading,
                            PostDescription = obj.Description,
                            PostImage = ImagedNameToSave
                        };
                        bool result = postBll.CreatePost(postEntity);
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
        public ActionResult Update(string URL, string PostId)
        {
            try
            {
                AssetEntity asset = new AssetEntity();
                if (!string.IsNullOrEmpty(URL))
                {
                    asset = assetBll.CheckValidURL(URL);

                    if (asset.AssetId > 0 && asset.UserId == _User.Id && asset.AssetTypeId == AssetType.Page)
                    {
                        PostEntity postEntity = new PostEntity();
                        if (postBll.CheckValidUserIdandPostId(_User.Id, PostId))
                        {
                            if (long.Parse(PostId) > 0)
                            {
                                postEntity = postBll.GetPostByPostId(long.Parse(PostId));

                                PostViewModel postViewModel = new PostViewModel()
                                {
                                    PostId = postEntity.PostId,
                                    AssetId = postEntity.AssetId,
                                    AssetUrl = postEntity.AssetUrl,
                                    Heading = postEntity.PostHeading,
                                    Description = postEntity.PostDescription,
                                    Photo = postEntity.PostImage
                                };
                                if (string.IsNullOrEmpty(postViewModel.Photo) || !System.IO.File.Exists(Server.MapPath("/Upload/" + postViewModel.Photo)))
                                {
                                    postViewModel.Photo = null;
                                }
                                return View(postViewModel);
                            }
                        }
                    }
                }
            }
            catch { }
            return new ViewResult() { ViewName = "PageNotFound" };
        }
        public JsonResult PostUpdate(PostViewModel obj)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (postBll.CheckValidUserIdandPostId(_User.Id, Convert.ToString(obj.PostId)))
                    {
                        string ImagedNameToSave = _fileHelper.SaveFile(obj.Image);

                        PostEntity postEntity = new PostEntity()
                        {
                            PostId = obj.PostId,
                            PostHeading = obj.Heading,
                            PostDescription = obj.Description,
                            PostImage = ImagedNameToSave
                        };
                        bool result = postBll.UpdatePost(postEntity);
                        if (result)
                        {
                            if (!string.IsNullOrEmpty(ImagedNameToSave) && System.IO.File.Exists(Server.MapPath("/Upload/" + ImagedNameToSave)))
                            {
                                _fileHelper.DeleteFile(obj.Photo);
                            }
                            return Json(new { success = true, message = "Post created successfully." });
                        }
                    }
                }
            }
            catch { }
            return Json(new { success = false, message = "Error" });
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
                if (List.Count() > 0)
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
        public ActionResult btnPostPartial(PostEntity obj)
        {
            PostEntity postEntity = new PostEntity();

            bool Result = false;

            try
            {
                Result = postBll.CheckValidUserIdandPostId(_User.Id, Convert.ToString(obj.PostId));
            }
            catch { }

            if (Result)
            {
                try
                {
                    if (obj.PostId > 0)
                    {
                        postEntity = postBll.GetPostByPostId(obj.PostId);
                    }
                }
                catch { }
                return PartialView("_ModifyPostPartial", postEntity);
            }
            else if (!Result && _User.RoleId == 3)
            {
                BookmarkPostEntity bookmark = new BookmarkPostEntity();
                try
                {
                    if (_User.Id > 0)
                    {
                        bookmark = postBll.CheckBookmarkOnPost(UserId: _User.Id, PostId: obj.PostId);
                    }
                }
                catch { }
                BookmarkPostEntity bookmarkPostEntity = new BookmarkPostEntity()
                {
                    UserId = _User.Id,
                    PostId = obj.PostId,
                    AssetUrl = obj.AssetUrl,
                    IsBookMarked = bookmark.IsBookMarked
                };
                return PartialView("_BookmarkPostPartial", bookmarkPostEntity);
            }
            else
            {
                return PartialView("_BlankPartialView");
            }
        }

        public JsonResult Delete(Int64 PostId)
        {
            PostEntity postEntity = new PostEntity();
            if (postBll.CheckValidUserIdandPostId(_User.Id, Convert.ToString(PostId)))
            {
                try
                {
                    postEntity = postBll.GetPostByPostId(PostId);
                }
                catch { }
                if (postBll.DeletePost(PostId))
                {
                    return Json(new { success = true, message = "Post deleted successfully." });
                }
            }
            return Json(new { success = false, message = "Error" });
        }
        public JsonResult Bookmark(string UserId, string PostId)
        {
            try
            {
                if (!string.IsNullOrEmpty(UserId) && !string.IsNullOrEmpty(PostId) && long.TryParse(PostId, out long resultPostId) && long.TryParse(UserId, out long resultUserId))
                {
                    if (resultUserId > 0 && resultPostId > 0 && resultUserId == _User.Id)
                    {
                        if (postBll.setPostBookmark(UserId: resultUserId, PostId: resultPostId))
                        {
                            var bookmark = postBll.CheckBookmarkOnPost(UserId: _User.Id, PostId: resultPostId);
                            if (bookmark != null && bookmark.UserId == resultUserId && bookmark.PostId == resultPostId)
                            {
                                if (bookmark.IsBookMarked)
                                {
                                    return Json(new { success = true, message = true });
                                }
                                else
                                {
                                    return Json(new { success = true, message = false });
                                }
                            }
                        }
                    }
                    else
                    {
                        return Json(new { success = false, message = "login" });
                    }
                }
            }
            catch { }
            return Json(new { success = false, message = "Error" });
        }
        [Route("SavedPosts")]
        public ActionResult BookmarkedPost()
        {
            if (_User.Id > 0 && _User.RoleId == 3)
            {
                return View();
            }
            return new ViewResult() { ViewName = "PageNotFound" };
        }
        [AcceptVerbs("Get", "Post")]
        [ChildActionOnly]
        public ActionResult BookmarkedPostPartial()
        {
            try
            {
                List<PostEntity> posts = new List<PostEntity>();

                posts = postBll.GetAllBookmarkedPostByUserId(_User.Id);

                if (posts.Count > 0)
                {
                    return PartialView("_AllBookmarkedPostsPartial", posts);
                }
            }
            catch { }
            return PartialView("_NoPostFoundPartial");
        }
        [AcceptVerbs("Get", "Post")]
        //[ChildActionOnly]
        public ActionResult NoPostFoundPartial()
        {
            return PartialView("_NoPostFoundPartial");
        }
        [AcceptVerbs("Get", "Post")]
        //[ChildActionOnly]
        public ActionResult FoundPartial()
        {
            return PartialView("FoundPartial");
        }
        [Route("@{URL}/Post/{PostId}")]
        public ActionResult Post(string URL, string PostId)
        {
            try
            {
                AssetEntity asset = new AssetEntity();
                if (!string.IsNullOrEmpty(URL) && !string.IsNullOrEmpty(PostId))
                {
                    asset = assetBll.CheckValidURL(URL);

                    if (asset.AssetId > 0 && asset.AssetTypeId == AssetType.Page)
                    {
                        PostEntity postEntity = new PostEntity();
                        if (long.TryParse(PostId, out long resultPostId))
                        {
                            postEntity = postBll.GetPostByPostId(resultPostId);

                            return View(postEntity);
                        }
                    }
                }
            }
            catch { }
            return new ViewResult() { ViewName = "PageNotFound" };
        }
    }
}