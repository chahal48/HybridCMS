using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HybridCMS.Models
{
    public class EditPostViewModal
    {
        public Int64 PostId { get; set; }

        [Required(ErrorMessage = "Heading is Required!!")]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Heading character length should be in between 5 to 50.")]
        public string Heading { get; set; }

        [DisplayName("Short Description")]
        [Required(ErrorMessage = "Description is Required!!")]
        [StringLength(100, MinimumLength = 5, ErrorMessage = "Short Description character length should be in between 5 to 100.")]
        public string Description { get; set; }

        [AllowHtml]
        [DisplayName("Description")]
        public string EncodedHtml { get; set; }
        public string Photo { get; set; }
    }
}