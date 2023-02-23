using HybridCMS.Models;
using HybridCMSBll;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
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
                    return PartialView("_MasterUserPanel");
                }
                else if(LoadTableId == 2)
                {
                    return PartialView("_MasterAssetPanel");
                }
                else if(LoadTableId == 3)
                {
                    return PartialView("_MasterPostPanel");
                }
                else if (LoadTableId == 4)
                {
                    return PartialView("_MasterCommentPanel");
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
        public JsonResult EnableUser(Int64[] selectedIds)
        {
            try
            {
                if (_User.Id > 0 && _User.RoleId == 1)
                {
                    if (selectedIds != null && selectedIds.Length > 0)
                    {
                        bool result = false;
                        List<Int64> list = new List<Int64>();
                        foreach (Int64 selectedId in selectedIds)
                        {
                            result = _masterBll.MasterEnableUser(selectedId);
                            if (!result)
                            {
                                list.Add(selectedId);
                            }                            
                        }

                        if(list.Count == 0)
                        {
                            return Json(new { success = true, message = "true" });
                        }
                        else
                        {
                            return Json(new { success = true, message = "Error enable user with Id`s " + string.Join<Int64>(",", list) + "." });
                        }
                    }
                }
                else
                {
                    return Json(new { success = false, message = "login" });
                }
            }
            catch { }
            return Json(new { success = false, message = "Error" });
        }
        public JsonResult DisableUser(Int64[] selectedIds)
        {
            try
            {
                if (_User.Id > 0 && _User.RoleId == 1)
                {
                    if (selectedIds != null && selectedIds.Length > 0)
                    {
                        bool result = false;
                        List<Int64> list = new List<Int64>();
                        foreach (Int64 selectedId in selectedIds)
                        {
                            result = _masterBll.MasterDisableUser(selectedId);
                            if (!result)
                            {
                                list.Add(selectedId);
                            }                            
                        }

                        if(list.Count == 0)
                        {
                            return Json(new { success = true, message = "true" });
                        }
                        else
                        {
                            return Json(new { success = true, message = "Error disable user with Id`s " + string.Join<Int64>(",", list) + "." });
                        }
                    }
                }
                else
                {
                    return Json(new { success = false, message = "login" });
                }
            }
            catch { }
            return Json(new { success = false, message = "Error" });
        }
        public JsonResult EnableAsset(Int64[] selectedIds)
        {
            try
            {
                if (_User.Id > 0 && _User.RoleId == 1)
                {
                    if (selectedIds != null && selectedIds.Length > 0)
                    {
                        bool result = false;
                        List<Int64> list = new List<Int64>();
                        foreach (Int64 selectedId in selectedIds)
                        {
                            result = _masterBll.MasterEnableAsset(selectedId);
                            if (!result)
                            {
                                list.Add(selectedId);
                            }                            
                        }

                        if(list.Count == 0)
                        {
                            return Json(new { success = true, message = "true" });
                        }
                        else
                        {
                            return Json(new { success = true, message = "Error enable asset with Id`s " + string.Join<Int64>(",", list) + "." });
                        }
                    }
                }
                else
                {
                    return Json(new { success = false, message = "login" });
                }
            }
            catch { }
            return Json(new { success = false, message = "Error" });
        }
        public JsonResult DisableAsset(Int64[] selectedIds)
        {
            try
            {
                if (_User.Id > 0 && _User.RoleId == 1)
                {
                    if (selectedIds != null && selectedIds.Length > 0)
                    {
                        bool result = false;
                        List<Int64> list = new List<Int64>();
                        foreach (Int64 selectedId in selectedIds)
                        {
                            result = _masterBll.MasterDisableAsset(selectedId);
                            if (!result)
                            {
                                list.Add(selectedId);
                            }                            
                        }

                        if(list.Count == 0)
                        {
                            return Json(new { success = true, message = "true" });
                        }
                        else
                        {
                            return Json(new { success = true, message = "Error disable asset with Id`s " + string.Join<Int64>(",", list) + "." });
                        }
                    }
                }
                else
                {
                    return Json(new { success = false, message = "login" });
                }
            }
            catch { }
            return Json(new { success = false, message = "Error" });
        }
        public JsonResult EnableComment(Int64[] selectedIds)
        {
            try
            {
                if (_User.Id > 0 && _User.RoleId == 1)
                {
                    if (selectedIds != null && selectedIds.Length > 0)
                    {
                        bool result = false;
                        List<Int64> list = new List<Int64>();
                        foreach (Int64 selectedId in selectedIds)
                        {
                            result = _masterBll.MasterEnableComment(selectedId);
                            if (!result)
                            {
                                list.Add(selectedId);
                            }                            
                        }

                        if(list.Count == 0)
                        {
                            return Json(new { success = true, message = "true" });
                        }
                        else
                        {
                            return Json(new { success = true, message = "Error enable comment with Id`s " + string.Join<Int64>(",", list) + "." });
                        }
                    }
                }
                else
                {
                    return Json(new { success = false, message = "login" });
                }
            }
            catch { }
            return Json(new { success = false, message = "Error" });
        }
        public JsonResult DisableComment(Int64[] selectedIds)
        {
            try
            {
                if (_User.Id > 0 && _User.RoleId == 1)
                {
                    if (selectedIds != null && selectedIds.Length > 0)
                    {
                        bool result = false;
                        List<Int64> list = new List<Int64>();
                        foreach (Int64 selectedId in selectedIds)
                        {
                            result = _masterBll.MasterDisableComment(selectedId);
                            if (!result)
                            {
                                list.Add(selectedId);
                            }                            
                        }

                        if(list.Count == 0)
                        {
                            return Json(new { success = true, message = "true" });
                        }
                        else
                        {
                            return Json(new { success = true, message = "Error disable comment with Id`s " + string.Join<Int64>(",", list) + "." });
                        }
                    }
                }
                else
                {
                    return Json(new { success = false, message = "login" });
                }
            }
            catch { }
            return Json(new { success = false, message = "Error" });
        }
        public JsonResult EnablePost(Int64[] selectedIds)
        {
            try
            {
                if (_User.Id > 0 && _User.RoleId == 1)
                {
                    if (selectedIds != null && selectedIds.Length > 0)
                    {
                        bool result = false;
                        List<Int64> list = new List<Int64>();
                        foreach (Int64 selectedId in selectedIds)
                        {
                            result = _masterBll.MasterEnablePost(selectedId);
                            if (!result)
                            {
                                list.Add(selectedId);
                            }                            
                        }

                        if(list.Count == 0)
                        {
                            return Json(new { success = true, message = "true" });
                        }
                        else
                        {
                            return Json(new { success = true, message = "Error enable post with Id`s " + string.Join<Int64>(",", list) + "." });
                        }
                    }
                }
                else
                {
                    return Json(new { success = false, message = "login" });
                }
            }
            catch { }
            return Json(new { success = false, message = "Error" });
        }
        public JsonResult DisablePost(Int64[] selectedIds)
        {
            try
            {
                if (_User.Id > 0 && _User.RoleId == 1)
                {
                    if (selectedIds != null && selectedIds.Length > 0)
                    {
                        bool result = false;
                        List<Int64> list = new List<Int64>();
                        foreach (Int64 selectedId in selectedIds)
                        {
                            result = _masterBll.MasterDisablePost(selectedId);
                            if (!result)
                            {
                                list.Add(selectedId);
                            }                            
                        }

                        if(list.Count == 0)
                        {
                            return Json(new { success = true, message = "true" });
                        }
                        else
                        {
                            return Json(new { success = true, message = "Error disable post with Id`s " + string.Join<Int64>(",", list) + "." });
                        }
                    }
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