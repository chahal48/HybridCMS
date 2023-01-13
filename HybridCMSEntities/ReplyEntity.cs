using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
