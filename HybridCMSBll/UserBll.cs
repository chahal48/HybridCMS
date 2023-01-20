using HybridCMSDll.DataAccess;
using HybridCMSDll.Interface;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HybridCMSBll
{
    public class UserBll
    {
        IUser iUser;
        public UserBll()
        {
            iUser = new SQLUser();
        }
        public LoginEntity LoginCMS(string EmailorUsername, string Password)
        {
            return iUser.LoginCMS(EmailorUsername: EmailorUsername, Password: Password);
        }
        public string EncryptPassword(string password)
        {
            return iUser.EncryptPassword(password);
        }
        public string DecryptPassword(string encryptpass)
        {
            return iUser.DecryptPassword(encryptpass);
        }
        public string CheckEmailorUsernameExists(string EmailorUsername)
        {
            return iUser.CheckEmailorUsernameExists(EmailorUsername);
        }
        public bool ChangePassword(string CurrentPassword,string NewPassword, Int64 id)
        {
            return iUser.ChangePassword(CurrentPassword: CurrentPassword,NewPassword: NewPassword, id);
        }
        public bool GenerateTokenForResetPassword(string EmailorUsername, string TokenId)
        {
            return iUser.GenerateTokenForResetPassword(EmailorUsername: EmailorUsername, TokenId: TokenId);
        }
        public bool CheckValidToken(string Token)
        {
            return iUser.CheckValidToken(Token);
        }
        public bool ChangeUserPasswordByToken(string Password, string TokenId)
        {
            return iUser.ChangeUserPasswordByToken(Password: Password,TokenId: TokenId);
        }

    }
}
