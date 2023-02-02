using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HybridCMS.Models
{
    public class AddPostViewModal
    {
        public Int64 AssetId { get; set; }

        [Required(ErrorMessage = "Heading is Required!!")]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Heading character length should be in between 5 to 50.")]
        public string Heading { get; set; }

        [DisplayName("Description")]
        [Required(ErrorMessage = "Description is Required!!")]
        [StringLength(500, MinimumLength = 5, ErrorMessage = "Short Description character length should be in between 5 to 500.")]
        public string Description { get; set; }
        public string Photo { get; set; }
    }
}