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
    public class PostBll
    {
        IPost iPost;
        public PostBll()
        {
            iPost = new SQLPost();
        }
        public bool AddPost(PostEntity obj)
        {
            return iPost.AddPost(obj);
        }
    }
}
