using HybridCMSDll.DataAccess;
using HybridCMSDll.Interface;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;

namespace HybridCMSBll
{
    public class AssetBll
    {
        IAsset iAsset;
        public AssetBll()
        {
            iAsset = new SQLAsset();
        }
        public List<AssetEntity> GetAllAssetByUserId(Int64 userId)
        {
            return iAsset.GetAllAssetByUserId(userId);
        }
        public bool CheckUrlAlreadyExists(string url)
        {
            return iAsset.CheckUrlAlreadyExists(url);
        }
        public AssetEntity CheckValidURL(string URL)
        {
            return iAsset.CheckValidURL(URL);
        }
        public bool DeleteAsset(Int64 AssetId)
        {
            return iAsset.DeleteAsset(AssetId);
        }
        public AssetEntity GetAssetByAssetId(Int64 AssetId)
        {
            return iAsset.GetAssetByAssetId(AssetId);
        }
        public bool AddAsset(AssetEntity obj)
        {
            return iAsset.AddAsset(obj);
        }
        public bool UpdateAsset(AssetEntity obj)
        {
            return iAsset.UpdateAsset(obj);
        }
        public bool CheckValidUserIdandAssetId(Int64 UserId, string AssetId)
        {
            return iAsset.CheckValidUserIdandAssetId(UserId: UserId, AssetId: AssetId);
        }
        public List<AssetEntity> GetAllAsset()
        {
            return iAsset.GetAllAsset();
        }
        public List<AssetEntity> GetAllAssetBySearch(string Search)
        {
            return iAsset.GetAllAssetBySearch(Search);
        }
        public bool publishAsset(Int64 UserId, Int64 AssetId)
        {
            return iAsset.publishAsset(UserId: UserId, AssetId: AssetId);
        }
    }
}
