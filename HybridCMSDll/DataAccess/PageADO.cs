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
        public bool AddPage(string Name, Int64 UserId, string URL, string Description, string Photo)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_AddPage",
                    new SqlParameter("@Name", Name),
                    new SqlParameter("@UserId", UserId),
                    new SqlParameter("@URL", URL),
                    new SqlParameter("@Description", Description),
                    new SqlParameter("@ProfilePicture", Photo));

                return ReturnBool(Result);
            }
        }
        public List<AdminPageListView> GetAllPageByUserId(Int64 UserId)
        {
            List<AdminPageListView> AdminPageList = new List<AdminPageListView>();
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                using (IDataReader dr = exec.ExecuteReader(CommandType.StoredProcedure, "usp_GetAllPageByUserId",
                    new SqlParameter("@UserId", UserId)
                    ))
                {
                    while (dr.Read())
                    {
                        AdminPageList.Add(new AdminPageListView() 
                        {
                            PageId = Convert.ToInt64(dr["Id"]),
                            Name   = Convert.ToString(dr["Name"]),
                            URL   = Convert.ToString(dr["URL"])
                        });
                    }
                }
            }
            return AdminPageList;
        }
    }
}
