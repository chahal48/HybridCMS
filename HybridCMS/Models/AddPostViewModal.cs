using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace HybridCMS.Models
{
    public class AddPostViewModal
    {
        public Int64 AssetId { get; set; }

        [Required(ErrorMessage = "Heading is Required!!")]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Heading character length should be in between 5 to 50.")]
        public string Heading { get; set; }

        [Required(ErrorMessage = "Description is Required!!")]
        [StringLength(100, MinimumLength = 20, ErrorMessage = "Description character length should be in between 20 to 100.")]
        public string Description { get; set; }
        public string EncodedHtml { get; set; }
        public string Photo { get; set; }
    }
}