using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HybridCMS.Models
{
    public class BlogViewModel
    {
        public Int64 AssetId { get; set; }
        public Int64 UserId { get; set; }
        public AssetType AssetTypeId { get; set; }

        [Required(ErrorMessage = "Sorry, URL is required!!")]
        [Remote("IsUrlAvailable", "Blog", HttpMethod = "Post", AdditionalFields = "initialURL")]
        public string URL { get; set; }

        [Required(ErrorMessage = "Sorry, Blog title is required!!")]
        [Remote("IsBlogTitleValid", "Blog", HttpMethod = "Post")]
        public string BlogTitle { get; set; }
        [AllowHtml]
        public string Description { get; set; }
        public string Picture { get; set; }
        public HttpPostedFileBase Image { get; set; }
        public string initialURL
        {
            get
            {
                return URL ?? string.Empty;
            }
        }
    }
}