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
        public List<PostEntity> GetLatestPost()
        {
            return iPost.GetLatestPost();
        }
        public bool CreatePost(PostEntity obj)
        {
            return iPost.CreatePost(obj);
        }
        public bool UpdatePost(PostEntity obj)
        {
            return iPost.UpdatePost(obj);
        }
        public List<PostEntity> GetAllPostByAssetId(Int64 AssetId)
        {
            return iPost.GetAllPostByAssetId(AssetId);
        }
        public bool CheckValidUserIdandPostId(Int64 UserId, string PostId)
        {
            return iPost.CheckValidUserIdandPostId(UserId: UserId, PostId: PostId);
        }
        public PostEntity GetPostByPostId(Int64 PostId)
        {
            return iPost.GetPostByPostId(PostId);
        }
        public bool DeletePost(Int64 PostId)
        {
            return iPost.DeletePost(PostId);
        }
        public BookmarkPostEntity CheckBookmarkOnPost(Int64 UserId, Int64 PostId)
        {
            return iPost.CheckBookmarkOnPost(UserId: UserId, PostId: PostId);
        }
        public bool setPostBookmark(Int64 UserId, Int64 PostId)
        {
            return iPost.setPostBookmark(UserId: UserId, PostId: PostId);
        }
    }
}
