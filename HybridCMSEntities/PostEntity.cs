using System;
using System.ComponentModel.DataAnnotations;

namespace HybridCMSEntities
{
    public class PostEntity
    {
        public Int64 PostId { get; set; }
        public Int64 AssetId { get; set; }
        public string AssetUrl { get; set; }
        public string AuthorName { get; set; }
        public string AuthorUserName { get; set; }
        public string AssetName { get; set; }
        public string PostHeading { get; set; }
        public string PostDescription { get; set; }
        public string PostImage { get; set; }
        public string AuthorPhoto { get; set; }

        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}")]
        public DateTime CreatedOn { get; set; }
        public bool IsDeleted { get; set; }
    }
}
