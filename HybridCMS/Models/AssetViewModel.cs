using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace HybridCMS.Models
{
    public class AssetViewModel
    {
        public Int64 AssetId { get; set; }

        [Required(ErrorMessage ="Name is Required!!")]
        public string Name { get; set; }
        public Int64 UserId { get; set; }
        public int AssetTypeId { get; set; }
        [DisplayName("Display URL")]
        [Required(ErrorMessage ="URL is Required!!")]
        public string URL { get; set; }
        public string Description { get; set; }
        [DisplayName("Photo")]
        public string ProfilePicture { get; set; }
    }
}