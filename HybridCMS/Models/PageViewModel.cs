using HybridCMSEntities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HybridCMS.Models
{
    public class PageViewModel
    {
        public Int64 AssetId { get; set; }
        public Int64 UserId { get; set; }
        public AssetType AssetTypeId { get; set; }

        [Required(ErrorMessage = "Sorry, URL is required!!")]
        [Remote("IsUrlAvailable", "Page", HttpMethod = "Post", AdditionalFields = "initialURL")]
        public string URL { get; set; }

        [Required(ErrorMessage = "Sorry, Page title is required!!")]
        [Remote("IsPageTitleValid", "Page", HttpMethod = "Post")]
        public string PageTitle { get; set; }
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