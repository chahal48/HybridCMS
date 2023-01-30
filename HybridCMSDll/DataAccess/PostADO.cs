using HybridCMSDll.ADO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HybridCMSEntities;

namespace HybridCMSDll.DataAccess
{
    public partial class SQLPost
    {
        public bool AddPost(PostEntity obj)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_AddPost",
                    new SqlParameter("@AssetId", obj.AssetId),
                    new SqlParameter("@PostHeading", obj.PostHeading),
                    new SqlParameter("@PostDescription", obj.PostDescription),
                    new SqlParameter("@EncodedHtml", obj.EncodedHtml),
                    new SqlParameter("@ImageName", obj.ImageName));

                return ReturnBool(Result);
            }
        }
        public List<PostEntity> GetAllAssetByUserId(Int64 AssetId)
        {
            List<PostEntity> list = new List<PostEntity>();
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                using (IDataReader dr = exec.ExecuteReader(CommandType.StoredProcedure, "usp_GetAllPostByAssetId",
                    new SqlParameter("@AssetId", AssetId)
                    ))
                {
                    while (dr.Read())
                    {
                        list.Add(new PostEntity()
                        {
                            PostId = Convert.ToInt64(dr["PostId"]),
                            AssetId = Convert.ToInt64(dr["AssetId"]),
                            PostHeading = Convert.ToString(dr["PostHeading"]),
                            PostDescription = Convert.ToString(dr["PostDescription"]),
                            EncodedHtml = Convert.ToString(dr["EncodedHtml"]),
                            ImageName = Convert.ToString(dr["ImageName"]),
                            CreatedOn = Convert.ToDateTime(dr["CreatedOn"])
                        });
                    }
                }
            }
            return list;
        }
        public bool CheckValidUserIdandPostId(Int64 UserId, string PostId)
        {
            int Result = 0;
            if (UserId <= 0 || string.IsNullOrEmpty(PostId))
            {
                return ReturnBool(Result);
            }
            if (long.TryParse(PostId,out long resultPostId))
            {
                using (ADOExecution exec = new ADOExecution(GetConnectionString()))
                {
                    var obj = exec.ExecuteScalar(CommandType.StoredProcedure, "usp_CheckValidUserAndPost",
                        new SqlParameter("@PostId", resultPostId),
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
        public PostMap GetPostByPostId(Int64 PostId)
        {
            PostMap postMap = new PostMap();
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                using (IDataReader dr = exec.ExecuteReader(CommandType.StoredProcedure, "usp_GetPostByPostId",
                    new SqlParameter("@PostId", PostId)
                    ))
                {
                    while (dr.Read())
                    {
                        postMap = new PostMap()
                        {
                            PostId = Convert.ToInt64(dr["PostId"]),
                            AssetId = Convert.ToInt64(dr["AssetId"]),
                            URL = Convert.ToString(dr["URL"]),
                            PostHeading = Convert.ToString(dr["PostHeading"]),
                            PostDescription = Convert.ToString(dr["PostDescription"]),
                            EncodedHtml = Convert.ToString(dr["EncodedHtml"]),
                            AuthorName = Convert.ToString(dr["AuthorName"]),
                            AssetName = Convert.ToString(dr["AssetName"]),
                            PostPhoto = Convert.ToString(dr["PostPhoto"]),
                            AuthorPhoto = Convert.ToString(dr["AuthorPhoto"]),
                            PostedDate = Convert.ToDateTime(dr["PostedDate"])
                        };
                    }
                }
            }
            return postMap;
        }
        public bool EditPost(PostEntity obj)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_UpdatePost",
                    new SqlParameter("@PostId", obj.PostId),
                    new SqlParameter("@PostHeading", obj.PostHeading),
                    new SqlParameter("@PostDescription", obj.PostDescription),
                    new SqlParameter("@EncodedHtml", obj.EncodedHtml),
                    new SqlParameter("@ImageName", obj.ImageName));

                return ReturnBool(Result);
            }
        }
        public bool DeletePost(Int64 PostId)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_DeletePost",
                    new SqlParameter("@PostId", PostId));

                return ReturnBool(Result);
            }
        }
        public List<PostMap> GetLatestPost()
        {
            List<PostMap> list = new List<PostMap>();
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                using (IDataReader dr = exec.ExecuteReader(CommandType.StoredProcedure, "usp_GetLatestPost"))
                {
                    while (dr.Read())
                    {
                        list.Add(new PostMap()
                        {
                            PostId = Convert.ToInt64(dr["PostId"]),
                            AssetId = Convert.ToInt64(dr["AssetId"]),
                            URL = Convert.ToString(dr["URL"]),
                            PostHeading = Convert.ToString(dr["PostHeading"]),
                            PostDescription = Convert.ToString(dr["PostDescription"]),
                            EncodedHtml = Convert.ToString(dr["EncodedHtml"]),
                            AuthorName = Convert.ToString(dr["AuthorName"]),
                            AssetName = Convert.ToString(dr["AssetName"]),
                            PostPhoto = Convert.ToString(dr["PostPhoto"]),
                            AuthorPhoto = Convert.ToString(dr["AuthorPhoto"]),
                            PostedDate = Convert.ToDateTime(dr["PostedDate"])
                        });
                    }
                }
            }
            return list;
        }
    }
}
