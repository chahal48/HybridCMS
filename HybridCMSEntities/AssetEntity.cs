using System;
using System.ComponentModel;
using System.Data.SqlTypes;

namespace HybridCMSEntities
{
    public class AssetEntity
    {
        public Int64 AssetId { get; set; }
        public Int64 UserId { get; set; }
        [DisplayName("Type")]
        public AssetType AssetTypeId { get; set; }
        public string URL { get; set; }
        public string Name { get; set; }

        [DisplayName("Author")]
        public string AuthorName { get; set; }        
        public string AuthorUserName { get; set; }        
        public string Description { get; set; }
        public string ProfilePicture { get; set; }
        [DisplayName("Total Post")]
        public Int64 TotalPost { get; set; }
        public DateTime CreatedOn { get; set; }
    }
}
