using System;

namespace HybridCMSEntities
{
    public class ReplyEntity
    {
        public Int64 ReplyId { get; set; }

        public string Reply { get; set; }

        public Int64 CommentId { get; set; }

        public Int64 UserId { get; set; }
    }
}
