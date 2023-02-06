using System;
using System.ComponentModel;
using System.Data.SqlTypes;
using System.Security.Policy;

namespace HybridCMSEntities
{
    public class AssetEntity
    {
        public Int64 AssetId { get; set; }
        public Int64 UserId { get; set; }
        [DisplayName("Type")]
        public AssetType AssetTypeId { get; set; }
        public string AssetUrl { get; set; }
        public string AssetName { get; set; }

        [DisplayName("Author")]
        public string AuthorName { get; set; }        
        public string AuthorUserName { get; set; }        
        public string Description { get; set; }
        public string AssetPhoto { get; set; }
        [DisplayName("Posts")]
        public Int64 TotalPost { get; set; }
        [DisplayName("Created")]
        public DateTime CreatedOn { get; set; }
        [DisplayName("Published/Draft")]
        public bool IsPublished { get; set; }
        public string CreatedDateInString {
            get
            {
                return String.Format("{0:ddd, d MMM, yyyy}", CreatedOn);
            }
        }
        public DateTime PublishedOn { get; set;}
        [DisplayName("Published")]
        public string PublishedDateInString {
            get
            {
                return String.Format("{0:ddd, d MMM, yyyy}", PublishedOn);
            }
        }
    }
}
