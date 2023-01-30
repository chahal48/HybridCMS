using System;
using System.ComponentModel;

namespace HybridCMSEntities
{
    public class AssetEntity
    {
        public Int64 AssetId { get; set; }
        public Int64 UserId { get; set; }
        public AssetType AssetTypeId { get; set; }
        public string URL { get; set; }
        public string Name { get; set; }        
        public string Description { get; set; }
        public string ProfilePicture { get; set; }
        public Int64 TotalPost { get; set; }
    }
}
