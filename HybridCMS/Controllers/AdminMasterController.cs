using HybridCMS.Models;
using HybridCMSBll;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;

namespace HybridCMS.Controllers
{
    public class AdminMasterController : Controller
    {
        LoginEntity _User = new LoginEntity();
        MasterDashboardBll _masterBll = new MasterDashboardBll();

        public AdminMasterController()
        {
            SessionHelper.InitializeSession();
            _User = SessionHelper.authenticateUser();
        }
        [AcceptVerbs("Get", "Post")]
        [ChildActionOnly]
        public ActionResult MasterDashboardLoadFirst()
        {
            List<UserEntity> List = new List<UserEntity>();

            try
            {
                if (_User.Id > 0 && _User.RoleId == 1)
                {
                    List = _masterBll.GetAllUsers();
                }
            }
            catch { }
            return PartialView("_MasterDashboardPartial", List);
        }
        [AcceptVerbs("Get", "Post")]
        public ActionResult TableDataPartial(int LoadTableId)
        {
            if(LoadTableId > 0)
            {
                if(LoadTableId == 1)
                {
                    return PartialView("_Master_UsersPartial");
                }
                else if(LoadTableId == 2)
                {
                    return PartialView("_Master_AssetListPartial");
                }
                else if(LoadTableId == 3)
                {
                    return PartialView("_Master_PostListPartial");
                }
                else if (LoadTableId == 4)
                {
                    return PartialView("_Master_CommentListPartial");
                }
            }
            return PartialView("_BlankPartialView");
        }
        public JsonResult GetAllUsers()
        {
            try
            {
                if (_User.Id > 0 && _User.RoleId == 1)
                {
                    var result = _masterBll.GetAllUsers();
                    return Json(result, JsonRequestBehavior.AllowGet);
                }
            }
            catch { }
            return Json(false);
        }
        public JsonResult GetAllAssets()
        {
            try
            {
                if (_User.Id > 0 && _User.RoleId == 1)
                {
                    var result = _masterBll.GetAllAssetForMaster();
                    return Json(result, JsonRequestBehavior.AllowGet);
                }
            }
            catch { }
            return Json(false);
        }
        public JsonResult GetAllPosts()
        {
            try
            {
                if (_User.Id > 0 && _User.RoleId == 1)
                {
                    var result = _masterBll.GetAllPostForMaster();
                    return Json(result, JsonRequestBehavior.AllowGet);
                }
            }
            catch { }
            return Json(false);
        }
        public JsonResult GetAllComments()
        {
            try
            {
                if (_User.Id > 0 && _User.RoleId == 1)
                {
                    var result = _masterBll.GetAllCommentForMaster();
                    return Json(result, JsonRequestBehavior.AllowGet);
                }
            }
            catch { }
            return Json(false);
        }
        public JsonResult DisableUser(Int64 Id)
        {
            try
            {
                if (Id > 0 && _User.Id > 0 && _User.RoleId == 1)
                {
                    
                }
                else
                {
                    return Json(new { success = false, message = "login" });
                }
            }
            catch { }
            return Json(new { success = false, message = "Error" });
        }
    }
}