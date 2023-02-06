using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HybridCMSDll.Interface
{
    public interface IAsset
    {
        List<AssetEntity> GetAllAsset();
        List<AssetEntity> GetAllAssetBySearch(string Search);
        bool CheckValidUserIdandAssetId(Int64 UserId, string AssetId);
        AssetEntity GetAssetByAssetId(Int64 AssetId);
        bool UpdateAsset(AssetEntity obj);
        AssetEntity CheckValidURL(string URL);
        bool CheckUrlAlreadyExists(string url);
        List<AssetEntity> GetAllAssetByUserId(Int64 userId);
        bool AddAsset(AssetEntity obj);
        bool DeleteAsset(Int64 AssetId);
        bool publishAsset(Int64 UserId, Int64 AssetId);
    }
}
