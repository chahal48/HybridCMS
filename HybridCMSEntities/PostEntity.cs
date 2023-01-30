using System;
using System.ComponentModel.DataAnnotations;

namespace HybridCMSEntities
{
    public class PostEntity
    {
        public Int64 PostId { get; set; }
        public Int64 AssetId { get; set; }
        public string PostHeading { get; set; }
        public string PostDescription { get; set; }
        public string EncodedHtml { get; set; }
        public string ImageName { get; set; }

        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}")]
        public DateTime CreatedOn { get; set; }
    }
}
