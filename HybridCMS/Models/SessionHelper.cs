using HybridCMSBll;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Xml;

namespace HybridCMS.Models
{
    /// <summary>
    /// Static Session facade class
    /// </summary>
    public static class SessionHelper
    {
        #region Private Constants
        private const string _EmailorUsername = "EmailorUsername";
        private const string _Password = "Password";
        #endregion

        #region Public Static Methods
        public static void InitializeSession()
        {
            if ((HttpContext.Current.Session[_EmailorUsername] == null || HttpContext.Current.Session[_Password] == null) && HttpContext.Current.Request.Cookies["HybridCMS"] != null)
            {
                HttpCookie HybridCMS = HttpContext.Current.Request.Cookies["HybridCMS"];

                EmailorUsername = HybridCMS[_EmailorUsername];
                Password = HybridCMS[_Password];

            }
        }
        /// <summary>
        /// Clears Session
        /// </summary>
        public static void ClearSession()
        {
            HttpContext.Current.Session.Clear();
        }
        /// <summary>
        /// Abandons Session
        /// </summary>
        public static void Abandon()
        {
            ClearSession();
            HttpContext.Current.Session.Abandon();
        }
        public static void ClearHybridCMS()
        {
            Abandon();
            HttpContext.Current.Response.Cookies.Clear();
            if (HttpContext.Current.Request.Cookies["HybridCMS"] != null)
            {
                HttpCookie HybridCMS = new HttpCookie("HybridCMS");
                HybridCMS.Expires = DateTime.Now.AddDays(-30);
                HttpContext.Current.Response.Cookies.Add(HybridCMS);
            }
        }
        public static void SaveHybridCMS(string keyName, string keyPass)
        {
            HttpCookie HybridCMS = new HttpCookie("HybridCMS");

            HybridCMS[_EmailorUsername] = keyName;
            HybridCMS[_Password] = keyPass;

            HybridCMS.Expires = DateTime.Now.AddDays(30);
            HttpContext.Current.Response.Cookies.Add(HybridCMS);
        }
        public static LoginEntity authenticateUser()
        {
            UserBll userBll = new UserBll();
            LoginEntity loginEntity = new LoginEntity();
            try
            {
                loginEntity = userBll.LoginCMS(EmailorUsername: EmailorUsername, Password: Password);
            }
            catch { }

            return loginEntity;
        }
        #endregion

        #region Public Static Properties
        /// <summary>
        /// Gets/Sets Session for EmailOrUserName
        /// </summary>
        public static string EmailorUsername
        {
            get
            {
                return Convert.ToString(HttpContext.Current.Session["EmailorUsername"]);
            }
            set
            {
                HttpContext.Current.Session["EmailorUsername"] = value;
            }
        }
        /// <summary>
        /// Gets/Sets Session for Password
        /// </summary>
        public static string Password
        {
            get
            {
                return Convert.ToString(HttpContext.Current.Session["Password"]);
            }
            set
            {
                HttpContext.Current.Session["Password"] = value;
            }
        }
        #endregion
    }
}