using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HybridCMSDll.Interface
{
    public interface IUser
    {
        string CheckEmailorUsernameExists(string EmailorUsername);
        bool ChangePassword(string CurrentPassword, string NewPassword, Int64 id);
        LoginEntity LoginCMS(string EmailorUsername, string Password);
        LoginEntity UserDetails(string Username);
        string EncryptPassword(string password);
        string DecryptPassword(string encryptpass);
        bool GenerateTokenForResetPassword(string EmailorUsername, string TokenId);
        bool CheckValidToken(string Token);
        bool ChangeUserPasswordByToken(string Password, string TokenId);
        bool CheckEmailAlreadyExists(string Email);
        bool CheckUserNameAlreadyExists(string Username);
        bool SignUp(LoginEntity obj);
    }
}
