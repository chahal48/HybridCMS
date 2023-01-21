using HybridCMSDll.ADO;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Common;

namespace HybridCMSDll.DataAccess
{
    public partial class SQLAsset
    {
        public List<AssetEntity> GetAllAssetByUserId(Int64 userId)
        {
            List<AssetEntity> assetList = new List<AssetEntity>();
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                using (IDataReader dr = exec.ExecuteReader(CommandType.StoredProcedure, "usp_GetAllAssetByUserId",
                    new SqlParameter("@UserId", userId)
                    ))
                {
                    while (dr.Read())
                    {
                        assetList.Add(new AssetEntity()
                        {
                            AssetId = Convert.ToInt64(dr["AssetId"]),
                            UserId = Convert.ToInt64(dr["UserId"]),
                            AssetTypeId = (AssetType)dr["AssetTypeId"],
                            Name = Convert.ToString(dr["Name"]),
                            URL = Convert.ToString(dr["URL"])
                        });
                    }
                }
            }
            return assetList;
        }
        public AssetEntity GetAssetByAssetId(Int64 AssetId)
        {
            AssetEntity asset = new AssetEntity();
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                using (IDataReader dr = exec.ExecuteReader(CommandType.StoredProcedure, "usp_GetAssetByAssetId",
                    new SqlParameter("@AssetId", AssetId)
                    ))
                {
                    while (dr.Read())
                    {
                        asset = new AssetEntity()
                        {
                            AssetId = Convert.ToInt64(dr["AssetId"]),
                            UserId = Convert.ToInt64(dr["UserId"]),
                            AssetTypeId = (AssetType)dr["AssetTypeId"],
                            Name = Convert.ToString(dr["Name"]),
                            URL = Convert.ToString(dr["URL"]),
                            Description = Convert.ToString(dr["Description"]),
                            ProfilePicture = Convert.ToString(dr["ProfilePicture"])
                        };
                    }
                }
            }
            return asset;
        }
        public bool AddAsset(string Name, AssetType assetType, Int64 UserId, string URL, string Description, string Photo)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_AddAsset",
                    new SqlParameter("@Name", Name),
                    new SqlParameter("@UserId", UserId),
                    new SqlParameter("@AssetTypeId", assetType),
                    new SqlParameter("@URL", URL),
                    new SqlParameter("@Description", Description),
                    new SqlParameter("@ProfilePicture", Photo));

                return ReturnBool(Result);
            }
        }
        public bool CheckUrlAlreadyExists(string url)
        {
            int Result = 1;
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                var obj = exec.ExecuteScalar(CommandType.StoredProcedure, "usp_CheckUrlAlreadyExists",
                    new SqlParameter("@url", url));

                if (obj != null)
                {
                    Result = Convert.ToInt32(obj);
                }

                return Result == 0;
            }
        }
        public AssetEntity CheckValidURL(string URL)
        {
            AssetEntity assetEntity = new AssetEntity();
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                using (IDataReader dr = exec.ExecuteReader(CommandType.StoredProcedure, "usp_CheckValidURL",
                    new SqlParameter("@URL", URL)
                    ))
                {
                    while (dr.Read())
                    {
                        assetEntity.AssetId = Convert.ToInt64(dr["AssetId"]);
                        assetEntity.Name = Convert.ToString(dr["Name"]);
                        assetEntity.UserId = Convert.ToInt64(dr["UserId"]);
                        assetEntity.AssetTypeId = (AssetType)(dr["AssetTypeId"]);
                        assetEntity.Description = Convert.ToString(dr["Description"]);
                        assetEntity.URL = Convert.ToString(dr["URL"]);
                        assetEntity.ProfilePicture = Convert.ToString(dr["Photo"]);
                    }
                    return assetEntity;
                }
            }
        }
        public bool DeleteAsset(Int64 AssetId)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_DeleteAsset",
                    new SqlParameter("@AssetId", AssetId));

                return ReturnBool(Result);
            }
        }
        public bool UpdateAsset(string Name, Int64 AssetId, Int64 UserId, string URL, string Description, string Photo)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_UpdateAsset",
                    new SqlParameter("@AssetId", AssetId),
                    new SqlParameter("@Name", Name),
                    new SqlParameter("@UserId", UserId),
                    new SqlParameter("@URL", URL),
                    new SqlParameter("@Description", Description),
                    new SqlParameter("@ProfilePicture", Photo));

                return ReturnBool(Result);
            }
        }
        public bool CheckValidUserIdandAssetId(Int64 UserId, string AssetId)
        {
            int Result = 0;
            if (UserId <= 0 || string.IsNullOrEmpty(AssetId))
            {
                return ReturnBool(Result);
            }
            if (long.TryParse(AssetId, out long resultAssetId))
            {
                using (ADOExecution exec = new ADOExecution(GetConnectionString()))
                {
                    var obj = exec.ExecuteScalar(CommandType.StoredProcedure, "usp_CheckValidUserAndAsset",
                        new SqlParameter("@AssetId", resultAssetId),
                        new SqlParameter("@UserId", UserId)
                        );

                    if (obj != null)
                    {
                        Result = Convert.ToInt32(obj);
                    }
                }
            }
            return ReturnBool(Result);
        }
    }
}
