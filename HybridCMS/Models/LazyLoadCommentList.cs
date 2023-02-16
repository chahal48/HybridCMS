using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HybridCMS.Models
{
    public class LazyLoadCommentList
    {
        public Int64 PostId { get; set; }
        public int PageNumber { get; set; }
    }
}