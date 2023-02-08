using HybridCMS.Models;
using HybridCMSBll;
using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace HybridCMS.Controllers
{
    public class CMSPostsController : ApiController
    {
        PostBll postBll = new PostBll();
        AssetBll assetBll = new AssetBll();
        LoginEntity _User = new LoginEntity();

        public CMSPostsController()
        {
            SessionHelper.InitializeSession();
            _User = SessionHelper.authenticateUser();
        }

        [Route("api/Post")]
        public IHttpActionResult GetPosts()
        {
            return Ok(1);
        }
    }
}
