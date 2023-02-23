using HybridCMSDll.DataAccess;
using HybridCMSDll.Interface;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HybridCMSBll
{
    public class MasterDashboardBll
    {
        IMasterAdmin iMaster;
        public MasterDashboardBll()
        {
            iMaster = new SQLMasterDashboard();
        }
        public MasterEntity GetDataForMasterDashboard()
        {
            return iMaster.GetDataForMasterDashboard();
        }
        public List<UserEntity> GetAllUsers()
        {
            return iMaster.GetAllUsers();
        }
        public List<AssetEntity> GetAllAssetForMaster()
        {
            return iMaster.GetAllAssetForMaster();
        }
        public List<PostEntity> GetAllPostForMaster()
        {
            return iMaster.GetAllPostForMaster();
        }
        public List<CommentEntity> GetAllCommentForMaster()
        {
            return iMaster.GetAllCommentForMaster();
        }
        public bool MasterDisableUser(Int64 UserId)
        {
            return iMaster.MasterDisableUser(UserId);
        }
        public bool MasterEnableUser(Int64 UserId)
        {
            return iMaster.MasterEnableUser(UserId);
        }
        public bool MasterDisableAsset(Int64 AssetId)
        {
            return iMaster.MasterDisableAsset(AssetId);
        }
        public bool MasterEnableAsset(Int64 AssetId)
        {
            return iMaster.MasterEnableAsset(AssetId);
        }
        public bool MasterDisablePost(Int64 PostId)
        {
            return iMaster.MasterDisablePost(PostId);
        }
        public bool MasterEnablePost(Int64 PostId)
        {
            return iMaster.MasterEnablePost(PostId);
        }
        public bool MasterDisableComment(Int64 CommentId)
        {
            return iMaster.MasterDisableComment(CommentId);
        }
        public bool MasterEnableComment(Int64 CommentId)
        {
            return iMaster.MasterEnableComment(CommentId);
        }

    }
}
