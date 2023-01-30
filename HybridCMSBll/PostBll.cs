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
        public List<PostMap> GetLatestPost()
        {
            return iPost.GetLatestPost();
        }
        public bool AddPost(PostEntity obj)
        {
            return iPost.AddPost(obj);
        }
        public bool EditPost(PostEntity obj)
        {
            return iPost.EditPost(obj);
        }
        public List<PostEntity> GetAllAssetByUserId(Int64 AssetId)
        {
            return iPost.GetAllAssetByUserId(AssetId);
        }
        public bool CheckValidUserIdandPostId(Int64 UserId, string PostId)
        {
            return iPost.CheckValidUserIdandPostId(UserId: UserId, PostId: PostId);
        }
        public PostMap GetPostByPostId(Int64 PostId)
        {
            return iPost.GetPostByPostId(PostId);
        }
        public bool DeletePost(Int64 PostId)
        {
            return iPost.DeletePost(PostId);
        }
    }
}
