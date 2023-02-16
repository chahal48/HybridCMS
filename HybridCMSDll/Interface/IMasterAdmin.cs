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
    }
}
