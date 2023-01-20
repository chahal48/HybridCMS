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
        public bool AddAsset(string Name, AssetType assetType, Int64 UserId, string URL, string Description, string Photo)
        {
            return iAsset.AddAsset(Name: Name,assetType:assetType,UserId:UserId,URL:URL,Description:Description,Photo:Photo);
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
        public bool UpdateAsset(string Name, Int64 AssetId, Int64 UserId, string URL, string Description, string Photo)
        {
            return iAsset.UpdateAsset(Name:Name,AssetId:AssetId,UserId:UserId,URL:URL,Description:Description,Photo:Photo);
        }
        public bool CheckValidUserIdandAssetId(Int64 UserId, string AssetId)
        {
            return iAsset.CheckValidUserIdandAssetId(UserId: UserId, AssetId: AssetId);
        }
    }
}
