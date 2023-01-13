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
        bool ChangePassword(CMSChangePasswordView obj, Int64 id);
        LoginEntity LoginCMS(string Username, string EnctypePassword);
        string EncryptPassword(string password);
        string DecryptPassword(string encryptpass);
    }
}
