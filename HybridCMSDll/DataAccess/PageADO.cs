using HybridCMSDll.ADO;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HybridCMSEntities;

namespace HybridCMSDll.DataAccess
{
    public partial class SQLPage
    {
        public bool AddPost(Int64 AssetId, string Heading, string Description, string EncodedHtml, string Photo)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_AddPost",
                    new SqlParameter("@AssetId", AssetId),
                    new SqlParameter("@PostHeading", Heading),
                    new SqlParameter("@PostDescription", Description),
                    new SqlParameter("@EncodedHtml", EncodedHtml),
                    new SqlParameter("@ImageName", Photo));

                return ReturnBool(Result);
            }
        }
    }
}
