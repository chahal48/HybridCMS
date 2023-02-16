using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HybridCMSEntities
{
    public class CommentEntity
    {
        public Int64 CommentId { get; set; }
        public Int64 PostId { get; set; }
        public Int64 UserId { get; set; }
        public string Comment { get; set; }
        public string Name { get; set; }
        public DateTime CreatedOn { get; set; }
        public int PageNumber { get; set; }
        public bool IsDeleted { get; set; }
    }
}
