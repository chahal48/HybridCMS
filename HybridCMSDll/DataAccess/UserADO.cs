using HybridCMSDll.ADO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using HybridCMSEntities;
using System.Data.Common;

namespace HybridCMSDll.DataAccess
{
    public partial class SQLUser
    {
        #region password encryption decryption
        /// <summary>
        /// Code for password encryption
        /// </summary>
        /// <param name="password">string</param>
        /// <returns></returns>
        public string EncryptPassword(string password)
        {
            string EncrptKey = "2013;[pnuLIT)WebCodeExpert";
            byte[] byKey = { };
            byte[] IV = { 18, 52, 86, 120, 144, 171, 205, 239 };
            byKey = System.Text.Encoding.UTF8.GetBytes(EncrptKey.Substring(0, 8));
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            byte[] inputByteArray = Encoding.UTF8.GetBytes(password);
            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(byKey, IV), CryptoStreamMode.Write);
            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();
            return Convert.ToBase64String(ms.ToArray());
        }
        /// <summary>
        /// Code for password decryption
        /// </summary>
        /// <param name="encryptpass">string</param>
        /// <returns></returns>
        public string DecryptPassword(string encryptpass)
        {
            try
            {
                encryptpass = encryptpass.Replace(" ", "+");
                string DecryptKey = "2013;[pnuLIT)WebCodeExpert";
                byte[] byKey = { };
                byte[] IV = { 18, 52, 86, 120, 144, 171, 205, 239 };
                byte[] inputByteArray = new byte[encryptpass.Length];
                byKey = System.Text.Encoding.UTF8.GetBytes(DecryptKey.Substring(0, 8));
                DESCryptoServiceProvider des = new DESCryptoServiceProvider();
                inputByteArray = Convert.FromBase64String(encryptpass.Replace(" ", "+"));
                MemoryStream ms = new MemoryStream();
                CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(byKey, IV), CryptoStreamMode.Write);
                cs.Write(inputByteArray, 0, inputByteArray.Length);
                cs.FlushFinalBlock();
                System.Text.Encoding encoding = System.Text.Encoding.UTF8;
                return encoding.GetString(ms.ToArray());
            }
            catch
            {
                return string.Empty;
            }
        }
        #endregion

        public bool ChangePassword(string CurrentPassword, string NewPassword, Int64 id)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_ChangeUserPassword",
                    new SqlParameter("@UserId", id),
                    new SqlParameter("@CurrentPassword", EncryptPassword(CurrentPassword)),
                    new SqlParameter("@NewPassword", EncryptPassword(NewPassword))
                    );

                return ReturnBool(Result);
            }
        }

        public LoginEntity LoginCMS(string EmailorUsername, string Password)
        {
            LoginEntity loginEntity = new LoginEntity();
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                using (IDataReader dr = exec.ExecuteReader(CommandType.StoredProcedure, "usp_CMSLogin",
                    new SqlParameter("@EmailorUsername", EmailorUsername), new SqlParameter("@Password", EncryptPassword(Password))
                    ))
                {
                    while (dr.Read())
                    {
                        loginEntity.Id = Convert.ToInt32(dr["Id"]);
                        loginEntity.Name = dr["Name"].ToString();
                        loginEntity.EmailId = dr["EmailId"].ToString();
                        loginEntity.Photo = dr["Photo"].ToString();
                        //loginEntity.Password = dr["Password"].ToString();
                        loginEntity.RoleId = Convert.ToInt32(dr["RoleId"]);
                        //loginEntity.RoleId = 9;
                    }
                    return loginEntity;
                }
            }
        }
        public string CheckEmailorUsernameExists(string EmailorUsername)
        {
            string EnailAddress = string.Empty;
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                using (IDataReader dr = exec.ExecuteReader(CommandType.StoredProcedure, "usp_CheckEmailorUsernameExists",
                    new SqlParameter("@EmailorUsername", EmailorUsername)
                    ))
                {
                    while (dr.Read())
                    {
                        EnailAddress = Convert.ToString(dr["EmailAddress"]);
                    }
                    return EnailAddress;
                }
            }
        }
        public bool CheckValidToken(string Token)
        {
            int Result = 0;
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                var obj = exec.ExecuteScalar(CommandType.StoredProcedure, "usp_CheckValidToken",
                    new SqlParameter("@Token", Token));

                if (obj != null)
                {
                    Result = Convert.ToInt32(obj);
                }

                return ReturnBool(Result);
            }
        }
        public bool CheckEmailAlreadyExists(string Email)
        {
            int Result = 0;
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                var obj = exec.ExecuteScalar(CommandType.StoredProcedure, "usp_CheckEmailAlreadyExists",
                    new SqlParameter("@EmailAddress", Email));

                if (obj != null)
                {
                    Result = Convert.ToInt32(obj);
                }

                return ReturnBool(Result);
            }
        }
        public bool CheckUserNameAlreadyExists(string Username)
        {
            int Result = 0;
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                var obj = exec.ExecuteScalar(CommandType.StoredProcedure, "usp_CheckUserNameAlreadyExists",
                    new SqlParameter("@UserName", Username));

                if (obj != null)
                {
                    Result = Convert.ToInt32(obj);
                }

                return ReturnBool(Result);
            }
        }
        public bool GenerateTokenForResetPassword(string EmailorUsername, string TokenId)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_GenerateTokenForResetPassword",
                    new SqlParameter("@EmailorUsername", EmailorUsername),
                    new SqlParameter("@Token", TokenId)
                    );

                return ReturnBool(Result);
            }
        }
        public bool ChangeUserPasswordByToken(string Password, string TokenId)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_ChangeUserPasswordByToken",
                    new SqlParameter("@Password", EncryptPassword(Password)),
                    new SqlParameter("@Token", TokenId)
                    );

                return ReturnBool(Result);
            }
        }
        public LoginEntity UserDetails(string Username)
        {
            LoginEntity loginEntity = new LoginEntity();
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                using (IDataReader dr = exec.ExecuteReader(CommandType.StoredProcedure, "usp_UserDetail",
                    new SqlParameter("@Username", Username)
                    ))
                {
                    while (dr.Read())
                    {
                        loginEntity.Id = Convert.ToInt32(dr["Id"]);
                        loginEntity.Name = dr["Name"].ToString();
                        loginEntity.EmailId = dr["EmailId"].ToString();
                        loginEntity.Photo = dr["Photo"].ToString();
                        loginEntity.IsDeleted = Convert.ToBoolean(dr["IsDeleted"]);
                    }
                    return loginEntity;
                }
            }
        }
        public bool SignUp(LoginEntity obj)
        {
            using (ADOExecution exec = new ADOExecution(GetConnectionString()))
            {
                int Result = exec.ExecuteNonQuery(CommandType.StoredProcedure, "usp_AddUser",
                    new SqlParameter("@Name", obj.Name),
                    new SqlParameter("@UserName", obj.UserName),
                    new SqlParameter("@EmailAddress", obj.EmailId),
                    new SqlParameter("@Password", EncryptPassword(obj.Password))
                    );

                return ReturnBool(Result);
            }
        }
    }
}
