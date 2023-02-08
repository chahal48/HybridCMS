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
        public bool CreatePost(PostEntity obj)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_AddPost",
                    new SqlParameter("@AssetId", obj.AssetId),
                    new SqlParameter("@PostHeading", obj.PostHeading),
                    new SqlParameter("@PostDescription", obj.PostDescription),
                    new SqlParameter("@ImageName", obj.PostImage));

                return ReturnBool(Result);
            }
        }
        public List<PostEntity> GetAllPostByAssetId(Int64 AssetId)
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
                            AssetUrl = Convert.ToString(dr["AssetUrl"]),
                            PostHeading = Convert.ToString(dr["PostHeading"]),
                            PostDescription = Convert.ToString(dr["PostDescription"]),
                            PostImage = Convert.ToString(dr["ImageName"]),
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
        public PostEntity GetPostByPostId(Int64 PostId)
        {
            PostEntity postEntity = new PostEntity();
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                using (IDataReader dr = exec.ExecuteReader(CommandType.StoredProcedure, "usp_GetPostByPostId",
                    new SqlParameter("@PostId", PostId)
                    ))
                {
                    while (dr.Read())
                    {
                        postEntity = new PostEntity()
                        {
                            PostId = Convert.ToInt64(dr["PostId"]),
                            AssetId = Convert.ToInt64(dr["AssetId"]),
                            AssetUrl = Convert.ToString(dr["URL"]),
                            PostHeading = Convert.ToString(dr["PostHeading"]),
                            PostDescription = Convert.ToString(dr["PostDescription"]),
                            AuthorName = Convert.ToString(dr["AuthorName"]),
                            AssetName = Convert.ToString(dr["AssetName"]),
                            PostImage = Convert.ToString(dr["PostPhoto"]),
                            AuthorPhoto = Convert.ToString(dr["AuthorPhoto"]),
                            CreatedOn = Convert.ToDateTime(dr["PostedDate"])
                        };
                    }
                }
            }
            return postEntity;
        }
        public bool UpdatePost(PostEntity obj)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_UpdatePost",
                    new SqlParameter("@PostId", obj.PostId),
                    new SqlParameter("@PostHeading", obj.PostHeading),
                    new SqlParameter("@PostDescription", obj.PostDescription),
                    new SqlParameter("@ImageName", obj.PostImage));

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
        public List<PostEntity> GetLatestPost()
        {
            List<PostEntity> list = new List<PostEntity>();
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                using (IDataReader dr = exec.ExecuteReader(CommandType.StoredProcedure, "usp_GetLatestPost"))
                {
                    while (dr.Read())
                    {
                        list.Add(new PostEntity()
                        {
                            PostId = Convert.ToInt64(dr["PostId"]),
                            AssetId = Convert.ToInt64(dr["AssetId"]),
                            AssetUrl = Convert.ToString(dr["URL"]),
                            PostHeading = Convert.ToString(dr["PostHeading"]),
                            PostDescription = Convert.ToString(dr["PostDescription"]),
                            AuthorName = Convert.ToString(dr["AuthorName"]),
                            AssetName = Convert.ToString(dr["AssetName"]),
                            PostImage = Convert.ToString(dr["PostPhoto"]),
                            AuthorPhoto = Convert.ToString(dr["AuthorPhoto"]),
                            CreatedOn = Convert.ToDateTime(dr["PostedDate"])
                        });
                    }
                }
            }
            return list;
        }
        public BookmarkPostEntity CheckBookmarkOnPost(Int64 UserId,Int64 PostId)
        {
            BookmarkPostEntity obj = new BookmarkPostEntity();
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                using (IDataReader dr = exec.ExecuteReader(CommandType.StoredProcedure, "usp_GetPostBookmarkByUserIdandPostId",
                    new SqlParameter("@UserId", UserId),
                    new SqlParameter("@PostId", PostId)
                    ))
                {
                    while (dr.Read())
                    {
                        obj = new BookmarkPostEntity()
                        {
                            PostId = Convert.ToInt64(dr["PostId"]),
                            UserId = Convert.ToInt64(dr["UserId"]),
                            IsBookMarked = Convert.ToBoolean(dr["IsBookmarked"]),
                        };
                    }
                }
            }
            return obj;
        }
        public bool setPostBookmark(Int64 UserId,Int64 PostId)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_setPostBookmark",
                    new SqlParameter("@UserId", UserId),
                    new SqlParameter("@PostId", PostId));

                return ReturnBool(Result);
            }
        }
        public List<PostEntity> GetAllBookmarkedPostByUserId(Int64 UserId)
        {
            List<PostEntity> list = new List<PostEntity>();
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                using (IDataReader dr = exec.ExecuteReader(CommandType.StoredProcedure, "usp_GetAllBookmarkedPostByUserId",
                    new SqlParameter("@UserId", UserId)
                    ))
                {
                    while (dr.Read())
                    {
                        list.Add(new PostEntity()
                        {                            
                            PostId = Convert.ToInt64(dr["PostId"]),
                            AssetId = Convert.ToInt64(dr["AssetId"]),
                            AssetUrl = Convert.ToString(dr["URL"]),
                            PostHeading = Convert.ToString(dr["PostHeading"]),
                            PostDescription = Convert.ToString(dr["PostDescription"]),
                            AuthorPhoto = Convert.ToString(dr["AuthorPhoto"]),
                            AuthorName = Convert.ToString(dr["AuthorName"]),
                            CreatedOn = Convert.ToDateTime(dr["PostedDate"])
                        });
                    }
                }
            }
            return list;
        }
    }
}
