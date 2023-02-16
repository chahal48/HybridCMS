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
    public class CommentController : Controller
    {
        LoginEntity _User = new LoginEntity();
        PostBll postBll = new PostBll();
        CommentBll commentBll = new CommentBll();
        public CommentController()
        {
            SessionHelper.InitializeSession();
            _User = SessionHelper.authenticateUser();
        }

        [AcceptVerbs("Get", "Post")]
        [ChildActionOnly]
        public ActionResult Add(Int64 PostId)
        {
            PostCommentViewModel postComment = new PostCommentViewModel();

            try
            {
                if (PostId > 0)
                {
                    postComment.PostId = PostId;
                    return PartialView("_AddPostCommentPartial", postComment);
                }
            }
            catch { }
            return PartialView("_BlankPartialView");
        }
        public JsonResult Create(PostCommentViewModel obj)
        {
            try
            {
                if (!string.IsNullOrEmpty(obj.Comment) && obj.Comment.Trim().Length > 0)
                {
                    if (obj.PostId > 0 && _User.Id > 0)
                    {

                        CommentEntity commentEntity = new CommentEntity()
                        {
                            UserId = _User.Id,
                            PostId = obj.PostId,
                            Comment = obj.Comment.Trim()
                        };
                        bool result = commentBll.Create(commentEntity);
                        if (result)
                        {
                            return Json(new { success = true, message = "success" });
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
        [AcceptVerbs("Get", "Post")]
        [ChildActionOnly]
        public ActionResult FirstLoadCommentsListPartial(Int64 PostId)
        {
            List<CommentEntity> List = new List<CommentEntity>();

            try
            {
                if (PostId > 0)
                {
                    List = commentBll.GetCommentsByPostIdByPageNo(PostId:PostId,PageNumber: 1);
                }
                if (List.Count() > 0)
                {
                    return PartialView("CommentsListPartial", List);
                }
            }
            catch { }
            return PartialView("_BlankPartialView");
        }
        [AcceptVerbs("Get", "Post")]
        public ActionResult CommentsListPartial(LazyLoadCommentList obj)
        {
            List<CommentEntity> List = new List<CommentEntity>();

            try
            {
                if (obj.PostId > 0 && obj.PageNumber > 0)
                {
                    List = commentBll.GetCommentsByPostIdByPageNo(PostId: obj.PostId, PageNumber: obj.PageNumber);
                }
                if (List.Count() > 0)
                {
                    return PartialView("CommentsListPartial", List);
                }
            }
            catch { }
            return PartialView("_BlankPartialView");
        }
        [AcceptVerbs("Get", "Post")]
        [ChildActionOnly]
        public ActionResult btnDeletePostCommentPartial(CommentEntity obj)
        {
            bool Result = false;

            try
            {
                Result = commentBll.CheckValidUserIdandCommentId(UserId: _User.Id,CommentId: obj.CommentId);
            }
            catch { }

            if (Result)
            {
                return PartialView("_btnDeletePostCommentPartial", obj);
            }
            else
            {
                return PartialView("_BlankPartialView");
            }
        }
        public JsonResult Delete(Int64 CommentId)
        {
            bool Result = false;

            try
            {
                Result = commentBll.CheckValidUserIdandCommentId(UserId: _User.Id, CommentId: CommentId);
            }
            catch { }

            if (Result)
            {
                try
                {
                    if (commentBll.DeleteComment(CommentId))
                    {
                        return Json(new { success = true, message = "Comment deleted successfully." });
                    }
                }
                catch { }
            }
            return Json(new { success = false, message = "Error" });
        }
    }
}