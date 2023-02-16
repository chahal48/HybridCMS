using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace HybridCMS.Models
{
    public class PostCommentViewModel
    {
        public Int64 CommentId { get; set; }
        public Int64 PostId { get; set; }
        public Int64 UserId { get; set; }
        [DisplayName("Comment (Maximum 200 characters).")]
        public string Comment { get; set; }

    }
}