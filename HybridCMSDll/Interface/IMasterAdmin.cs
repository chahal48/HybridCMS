using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HybridCMSDll.Interface
{
    public interface IMasterAdmin
    {
        MasterEntity GetDataForMasterDashboard();
        List<UserEntity> GetAllUsers();
        List<AssetEntity> GetAllAssetForMaster();
        List<PostEntity> GetAllPostForMaster();
        List<CommentEntity> GetAllCommentForMaster();
        bool MasterDisableUser(Int64 UserId);
        bool MasterEnableUser(Int64 UserId);
        bool MasterDisableAsset(Int64 AssetId);
        bool MasterEnableAsset(Int64 AssetId);
        bool MasterDisablePost(Int64 PostId);
        bool MasterEnablePost(Int64 PostId);
        bool MasterDisableComment(Int64 CommentId);
        bool MasterEnableComment(Int64 CommentId);
    }
}
