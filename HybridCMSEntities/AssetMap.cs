using System;

namespace HybridCMSEntities
{
    public class AssetMap
    {
        public Int64 AssetId { get; set; }
        public string AssetName { get; set; }
        public AssetType AssetTypeId { get; set; }
        public string AssetUrl { get; set; }
        public Int64 PostCount { get; set; }
        public string AuthorName { get; set; }
        public string AuthorUserName { get; set; }
        public string AssetPhoto { get; set; }
        public string AssetDescription { get; set; }
        public DateTime CreatedOn { get; set; }
    }
}
