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
        bool CheckValidUserIdandAssetId(Int64 UserId, string AssetId);
        AssetEntity GetAssetByAssetId(Int64 AssetId);
        bool UpdateAsset(string Name, Int64 AssetId, Int64 UserId, string URL, string Description, string Photo);
        AssetEntity CheckValidURL(string URL);
        bool CheckUrlAlreadyExists(string url);
        List<AssetEntity> GetAllAssetByUserId(Int64 userId);
        bool AddAsset(string Name, AssetType assetType, Int64 UserId, string URL, string Description, string Photo);
        bool DeleteAsset(Int64 AssetId);
    }
}
