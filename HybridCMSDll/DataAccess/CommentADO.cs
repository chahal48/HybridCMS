using HybridCMSDll.ADO;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace HybridCMSDll.DataAccess
{
    public partial class SQLComment
    {
        public bool Create(CommentEntity obj)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_AddPostComment",
                    new SqlParameter("@UserId", obj.UserId),
                    new SqlParameter("@PostId", obj.PostId),
                    new SqlParameter("@Comment", obj.Comment));

                return ReturnBool(Result);
            }
        }
        public List<CommentEntity> GetCommentsByPostIdByPageNo(Int64 PostId,int PageNumber)
        {
            List<CommentEntity> list = new List<CommentEntity>();
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                using (IDataReader dr = exec.ExecuteReader(CommandType.StoredProcedure, "usp_GetPostCommentByPostId",
                    new SqlParameter("@PostId", PostId),
                    new SqlParameter("@PageNumber", PageNumber)
                    ))
                {
                    while (dr.Read())
                    {
                        list.Add(new CommentEntity()
                        {
                            CommentId = Convert.ToInt64(dr["CommentId"]),
                            PostId = Convert.ToInt64(dr["PostId"]),
                            UserId = Convert.ToInt64(dr["UserId"]),
                            Name = Convert.ToString(dr["Name"]),
                            Comment = Convert.ToString(dr["Comment"]),
                            PageNumber = Convert.ToInt32(dr["PageNumber"]),
                            CreatedOn = Convert.ToDateTime(dr["CreatedOn"])
                        });
                    }
                }
            }
            return list;
        }
        public bool CheckValidUserIdandCommentId(Int64 UserId, Int64 CommentId)
        {
            int Result = 0;
            if (CommentId>0 && UserId>0)
            {
                using (ADOExecution exec = new ADOExecution(GetConnectionString()))
                {
                    var obj = exec.ExecuteScalar(CommandType.StoredProcedure, "usp_CheckValidUserIdAndCommentId",
                        new SqlParameter("@CommentId", CommentId),
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
        public bool DeleteComment(Int64 CommentId)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_DeletePostComment",
                    new SqlParameter("@CommentId", CommentId));

                return ReturnBool(Result);
            }
        }
    }
}
