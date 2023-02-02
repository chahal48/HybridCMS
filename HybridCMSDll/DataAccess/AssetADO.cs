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
using HybridCMSDll.Interface;

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
                            AssetName = Convert.ToString(dr["Name"]),
                            AssetUrl = Convert.ToString(dr["URL"]),
                            TotalPost = Convert.ToInt64(dr["PostCount"])
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
                            AssetName = Convert.ToString(dr["AssetName"]),
                            AuthorName = Convert.ToString(dr["AuthorName"]),
                            AuthorUserName = Convert.ToString(dr["AuthorUserName"]),
                            TotalPost = Convert.ToInt64(dr["PostCount"]),
                            AssetUrl = Convert.ToString(dr["URL"]),
                            Description = Convert.ToString(dr["Description"]),
                            AssetPhoto = Convert.ToString(dr["AssetPhoto"]),
                            CreatedOn = Convert.ToDateTime(dr["CreatedOn"])
                        };
                    }
                }
            }
            return asset;
        }
        public bool AddAsset(AssetEntity obj)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_AddAsset",
                    new SqlParameter("@Name", obj.AssetName),
                    new SqlParameter("@UserId", obj.UserId),
                    new SqlParameter("@AssetTypeId", obj.AssetTypeId),
                    new SqlParameter("@URL", obj.AssetUrl),
                    new SqlParameter("@Description", obj.Description),
                    new SqlParameter("@ProfilePicture", obj.AssetPhoto));

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
                        assetEntity = new AssetEntity()
                        {
                            AssetId = Convert.ToInt64(dr["AssetId"]),
                            UserId = Convert.ToInt64(dr["UserId"]),
                            AssetTypeId = (AssetType)dr["AssetTypeId"],
                            AssetName = Convert.ToString(dr["AssetName"]),
                            AuthorName = Convert.ToString(dr["AuthorName"]),
                            AuthorUserName = Convert.ToString(dr["AuthorUserName"]),
                            TotalPost = Convert.ToInt64(dr["PostCount"]),
                            AssetUrl = Convert.ToString(dr["URL"]),
                            Description = Convert.ToString(dr["Description"]),
                            AssetPhoto = Convert.ToString(dr["AssetPhoto"]),
                            CreatedOn = Convert.ToDateTime(dr["CreatedOn"])
                        };
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
        public bool UpdateAsset(AssetEntity obj)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_UpdateAsset",
                    new SqlParameter("@AssetId", obj.AssetId),
                    new SqlParameter("@Name", obj.AssetName),
                    new SqlParameter("@UserId", obj.UserId),
                    new SqlParameter("@URL", obj.AssetUrl),
                    new SqlParameter("@Description", obj.Description),
                    new SqlParameter("@ProfilePicture", obj.AssetPhoto));

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
        public List<AssetEntity> GetAllAsset()
        {
            List<AssetEntity> assetEntity= new List<AssetEntity>();
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                using (IDataReader dr = exec.ExecuteReader(CommandType.StoredProcedure, "usp_GetAllAsset"))
                {
                    while (dr.Read())
                    {
                        assetEntity.Add(new AssetEntity()
                        {
                            AssetId = Convert.ToInt64(dr["AssetId"]),
                            AssetTypeId = (AssetType)dr["AssetTypeId"],
                            AssetName = Convert.ToString(dr["AssetName"]),
                            AssetUrl = Convert.ToString(dr["AssetUrl"]),
                            TotalPost = Convert.ToInt64(dr["PostCount"]),
                            AuthorName = Convert.ToString(dr["AuthorName"]),
                            AuthorUserName = Convert.ToString(dr["AuthorUserName"]),
                            AssetPhoto = Convert.ToString(dr["AssetPhoto"]),
                            Description = Convert.ToString(dr["AssetDescription"]),
                            CreatedOn = Convert.ToDateTime(dr["CreatedOn"])
                        });
                    }
                }
            }
            return assetEntity;
        }
        public List<AssetEntity> GetAllAssetBySearch(string Search)
        {
            List<AssetEntity> assetEntity = new List<AssetEntity>();
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                using (IDataReader dr = exec.ExecuteReader(CommandType.StoredProcedure, "usp_GetAllAssetBySearch",
                    new SqlParameter("@Search", Search)
                    ))
                {
                    while (dr.Read())
                    {
                        assetEntity.Add(new AssetEntity()
                        {
                            AssetId = Convert.ToInt64(dr["AssetId"]),
                            AssetTypeId = (AssetType)dr["AssetTypeId"],
                            AssetName = Convert.ToString(dr["AssetName"]),
                            AssetUrl = Convert.ToString(dr["AssetUrl"]),
                            TotalPost = Convert.ToInt64(dr["PostCount"]),
                            AuthorName = Convert.ToString(dr["AuthorName"]),
                            AuthorUserName = Convert.ToString(dr["AuthorUserName"]),
                            AssetPhoto = Convert.ToString(dr["AssetPhoto"]),
                            Description = Convert.ToString(dr["AssetDescription"]),
                            CreatedOn = Convert.ToDateTime(dr["CreatedOn"])
                        });
                    }
                }
            }
            return assetEntity;
        }
    }
}
