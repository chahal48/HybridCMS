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
        public LoginEntity LoginCMS(string Username, string EnctypePassword)
        {
            return iUser.LoginCMS(Username, EnctypePassword);
        }
        public string EncryptPassword(string password)
        {
            return iUser.EncryptPassword(password);
        }
        public string DecryptPassword(string encryptpass)
        {
            return iUser.DecryptPassword(encryptpass);
        }
        public bool ChangePassword(CMSChangePasswordView obj, Int64 id)
        {
            return iUser.ChangePassword(obj, id);
        }
    }
}
