using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HybridCMS.Models
{
    /// <summary>
    /// Static Session facade class
    /// </summary>
    public static class SessionHelper
    {
        #region Private Constants
        private const string CMSId = "CMSId";
        private const string CMSRoleId = "CMSRoleId";
        private const string CMSUserName = "CMSUserName";
        private const string CMSName = "CMSName";
        private const string CMSEmail = "CMSEmail";
        private const string CMSPass = "CMSPass";
        private const string CMSPhoto = "CMSPhoto";
        #endregion

        #region Public Static Methods
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
        /// <summary>
        /// Set value to session based on it`s key
        /// </summary>
        /// <param name="sessionName"></param>
        /// <param name="value"></param>
        private static void assignSessionValue(string sessionName, string value)
        {
            HttpContext.Current.Session[sessionName] = value;
        }
        /// <summary>
        /// Get value from session based on it`s key
        /// </summary>
        /// <param name="sessionName"></param>
        /// <returns></returns>
        private static string getSessionValue(string sessionName)
        {
            return Convert.ToString(HttpContext.Current.Session[sessionName]);
        }
        #endregion

        #region Public Static Properties
        /// <summary>
        /// Gets/Sets Session for CMSId
        /// </summary>
        public static string cmsId
        {
            get
            {
                return getSessionValue(CMSId) ?? string.Empty;
            }
            set { assignSessionValue(CMSId, value); }
        }
        /// <summary>
        /// Gets/Sets Session for CMSRoleId
        /// </summary>
        public static string cmsRoleId
        {
            get
            {
                return getSessionValue(CMSRoleId) ?? string.Empty;
            }
            set { assignSessionValue(CMSRoleId, value); }
        }
        /// <summary>
        /// Gets/Sets Session for CMSUserName
        /// </summary>
        public static string cmsUserName
        {
            get
            {
                return getSessionValue(CMSUserName) ?? string.Empty;
            }
            set { assignSessionValue(CMSUserName, value); }
        }
        /// <summary>
        /// Gets/Sets Session for CMSName
        /// </summary>
        public static string cmsName
        {
            get
            {
                return getSessionValue(CMSName) ?? string.Empty;
            }
            set { assignSessionValue(CMSName, value); }
        }
        /// <summary>
        /// Gets/Sets Session for CMSEmail
        /// </summary>
        public static string cmsEmail
        {
            get
            {
                return getSessionValue(CMSEmail) ?? string.Empty;
            }
            set { assignSessionValue(CMSEmail, value); }
        }
        /// <summary>
        /// Gets/Sets Session for CMSPass
        /// </summary>
        public static string cmsPass
        {
            get
            {
                return getSessionValue(CMSPass) ?? string.Empty;
            }
            set { assignSessionValue(CMSPass, value); }
        }
        /// <summary>
        /// Gets/Sets Session for CMSPhoto
        /// </summary>
        public static string cmsPhoto
        {
            get
            {
                return getSessionValue(CMSPhoto) ?? string.Empty;
            }
            set { assignSessionValue(CMSPhoto, value); }
        }
        #endregion

        
    }
    //Use as: SessionHelper.UserId="user1";
    //        string user=SessionHelper.UserId;
    //        SessionHelper.Abandon();
}