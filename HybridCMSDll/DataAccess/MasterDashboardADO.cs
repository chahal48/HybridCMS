using HybridCMSDll.ADO;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HybridCMSDll.Interface;
using System.Security.Cryptography;
using System.Net.Mail;
using System.Xml.Linq;
using System.Security.Policy;
using System.ComponentModel.Design;

namespace HybridCMSDll.DataAccess
{
    public partial class SQLMasterDashboard
    {
        public MasterEntity GetDataForMasterDashboard()
        {
            MasterEntity masterEntity = new MasterEntity();
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                using (IDataReader dr = exec.ExecuteReader(CommandType.StoredProcedure, "usp_GetDataForMasterDashboard"))
                {
                    while (dr.Read())
                    {
                        masterEntity = new MasterEntity()
                        {
                            TotalUser = Convert.ToInt64(dr["Users"]),
                            TotalAsset = Convert.ToInt64(dr["Assets"]),
                            TotalPost = Convert.ToInt64(dr["Posts"]),
                            TotalComment = Convert.ToInt64(dr["Comments"])
                        };
                    }
                }
            }
            return masterEntity;
        }
        public List<UserEntity> GetAllUsers()
        {
            List<UserEntity> list = new List<UserEntity>();
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                using (IDataReader dr = exec.ExecuteReader(CommandType.StoredProcedure, "usp_GetAllUsers"))
                {
                    while (dr.Read())
                    {
                        list.Add(new UserEntity()
                        {
                            UserId = Convert.ToInt64(dr["UserId"]),
                            RoleType = (RoleType)(dr["RoleId"]),
                            Name = Convert.ToString(dr["Name"]),
                            UserName = Convert.ToString(dr["UserName"]),
                            EmailAddress = Convert.ToString(dr["EmailAddress"]),
                            IsDeleted = Convert.ToBoolean(dr["IsDeleted"]),
                            CreatedOn = Convert.ToDateTime(dr["CreatedOn"]),
                            TotalAsset = Convert.ToInt64(dr["TotalAsset"]),
                            PublishedAsset = Convert.ToInt64(dr["PublishedAsset"]),
                            TotalPost = Convert.ToInt64(dr["TotalPost"]),
                            TotalComment = Convert.ToInt64(dr["TotalComment"])
                        });
                    }
                }
            }
            return list;
        }
        public List<AssetEntity> GetAllAssetForMaster()
        {
            List<AssetEntity> assetList = new List<AssetEntity>();
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                using (IDataReader dr = exec.ExecuteReader(CommandType.StoredProcedure, "usp_GetAllAssetForMaster"))
                {
                    while (dr.Read())
                    {
                        assetList.Add(new AssetEntity()
                        {
                            AssetId = Convert.ToInt64(dr["AssetId"]),
                            AssetTypeId = (AssetType)dr["AssetTypeId"],
                            AssetName = Convert.ToString(dr["AssetName"]),
                            AssetUrl = Convert.ToString(dr["AssetUrl"]),
                            TotalPost = Convert.ToInt64(dr["PostCount"]),
                            IsDeleted = Convert.ToBoolean(dr["IsDeleted"]),
                            IsPublished = Convert.ToBoolean(dr["IsPublished"]),
                            PublishedOn = Convert.ToDateTime(dr["PublishedOn"]),
                            AuthorName = Convert.ToString(dr["AuthorName"]),
                            AuthorUserName = Convert.ToString(dr["AuthorUserName"]),
                            Description = Convert.ToString(dr["AssetDescription"]),
                            CreatedOn = Convert.ToDateTime(dr["CreatedOn"])
                        });
                    }
                }
            }
            return assetList;
        }
        public List<PostEntity> GetAllPostForMaster()
        {
            List<PostEntity> List = new List<PostEntity>();
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                using (IDataReader dr = exec.ExecuteReader(CommandType.StoredProcedure, "usp_GetAllPostForMaster"))
                {
                    while (dr.Read())
                    {
                        List.Add(new PostEntity()
                        {
                            PostId = Convert.ToInt64(dr["PostId"]),
                            AssetName = Convert.ToString(dr["AssetName"]),
                            AuthorName = Convert.ToString(dr["AuthorName"]),
                            AuthorUserName = Convert.ToString(dr["AuthorUserName"]),
                            PostHeading = Convert.ToString(dr["PostHeading"]),
                            IsDeleted = Convert.ToBoolean(dr["IsDeleted"]),
                            CreatedOn = Convert.ToDateTime(dr["CreatedOn"])
                        });
                    }
                }
            }
            return List;
        }
        public List<CommentEntity> GetAllCommentForMaster()
        {
            List<CommentEntity> List = new List<CommentEntity>();
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                using (IDataReader dr = exec.ExecuteReader(CommandType.StoredProcedure, "usp_GetAllCommentForMaster"))
                {
                    while (dr.Read())
                    {
                        List.Add(new CommentEntity()
                        {
                            CommentId = Convert.ToInt64(dr["CommentId"]),
                            Comment = Convert.ToString(dr["Comment"]),
                            Name = Convert.ToString(dr["Name"]),
                            IsDeleted = Convert.ToBoolean(dr["IsDeleted"]),
                            CreatedOn = Convert.ToDateTime(dr["CreatedOn"])
                        });
                    }
                }
            }
            return List;
        }
        public bool MasterDisableUser(Int64 UserId)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_MasterDisableUser",
                    new SqlParameter("@UserId", UserId));

                return ReturnBool(Result);
            }
        }
        public bool MasterEnableUser(Int64 UserId)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_MasterEnableUser",
                    new SqlParameter("@UserId", UserId));

                return ReturnBool(Result);
            }
        }
        public bool MasterDisableAsset(Int64 AssetId)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_MasterDisableAsset",
                    new SqlParameter("@AssetId", AssetId));

                return ReturnBool(Result);
            }
        }
        public bool MasterEnableAsset(Int64 AssetId)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_MasterEnableAsset",
                    new SqlParameter("@AssetId", AssetId));

                return ReturnBool(Result);
            }
        }
        public bool MasterDisablePost(Int64 PostId)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_MasterDisablePost",
                    new SqlParameter("@PostId", PostId));

                return ReturnBool(Result);
            }
        }
        public bool MasterEnablePost(Int64 PostId)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_MasterEnablePost",
                    new SqlParameter("@PostId", PostId));

                return ReturnBool(Result);
            }
        }
        public bool MasterDisableComment(Int64 CommentId)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_MasterDisableComment",
                    new SqlParameter("@CommentId", CommentId));

                return ReturnBool(Result);
            }
        }
        public bool MasterEnableComment(Int64 CommentId)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_MasterEnableComment",
                    new SqlParameter("@CommentId", CommentId));

                return ReturnBool(Result);
            }
        }
    }
}
