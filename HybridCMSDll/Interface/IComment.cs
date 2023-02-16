using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HybridCMSDll.Interface
{
    public interface IComment
    {
        bool Create(CommentEntity obj);
        List<CommentEntity> GetCommentsByPostIdByPageNo(Int64 PostId, int PageNumber);
        bool CheckValidUserIdandCommentId(Int64 UserId, Int64 CommentId);
        bool DeleteComment(Int64 CommentId);
    }
}
