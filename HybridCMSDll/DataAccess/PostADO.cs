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
    }
}
