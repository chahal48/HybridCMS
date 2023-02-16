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
    }
}
