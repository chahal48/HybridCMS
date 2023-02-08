using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HybridCMSDll.Interface
{
    public interface IPost
    {
        bool CreatePost(PostEntity obj);
        bool UpdatePost(PostEntity obj);
        List<PostEntity> GetLatestPost();
        List<PostEntity> GetAllPostByAssetId(Int64 AssetId);
        bool CheckValidUserIdandPostId(Int64 UserId, string PostId);
        PostEntity GetPostByPostId(Int64 PostId);
        bool DeletePost(Int64 PostId);
        BookmarkPostEntity CheckBookmarkOnPost(Int64 UserId, Int64 PostId);
        bool setPostBookmark(Int64 UserId, Int64 PostId);
        List<PostEntity> GetAllBookmarkedPostByUserId(Int64 UserId);
    }
}
