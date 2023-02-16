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
    public class CommentBll
    {
        IComment iComment;
        public CommentBll()
        {
            iComment = new SQLComment();
        }
        public bool Create(CommentEntity obj)
        {
            return iComment.Create(obj);
        }
        public List<CommentEntity> GetCommentsByPostIdByPageNo(Int64 PostId, int PageNumber)
        {
            return iComment.GetCommentsByPostIdByPageNo(PostId: PostId, PageNumber: PageNumber);
        }
        public bool CheckValidUserIdandCommentId(Int64 UserId, Int64 CommentId)
        {
            return iComment.CheckValidUserIdandCommentId(UserId: UserId, CommentId: CommentId);
        }
        public bool DeleteComment(Int64 CommentId)
        {
            return iComment.DeleteComment(CommentId);
        }
    }
}
