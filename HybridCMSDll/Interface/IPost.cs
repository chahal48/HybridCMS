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
        bool AddPost(PostEntity obj);
        bool EditPost(PostEntity obj);
        List<PostMap> GetLatestPost();
        List<PostEntity> GetAllAssetByUserId(Int64 AssetId);
        bool CheckValidUserIdandPostId(Int64 UserId, string PostId);
        PostMap GetPostByPostId(Int64 PostId);
        bool DeletePost(Int64 PostId);
    }
}
