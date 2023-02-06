using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace HybridCMS.Models
{
    public class PostViewModel
    {
        public Int64 AssetId { get; set; }
        public Int64 PostId { get; set; }
        public string AssetUrl { get; set; }

        [Required(ErrorMessage = "Heading is Required!!")]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Heading character length should be in between 5 to 50.")]
        public string Heading { get; set; }

        [MaxLength(500,ErrorMessage = "Description must be less than 500 characters.")]
        public string Description { get; set; }
        public string Photo { get; set; }
        public HttpPostedFileBase Image { get; set; }
    }
}