using System;
using System.ComponentModel.DataAnnotations;

namespace HybridCMSEntities
{
    public class PostMap
    {
        public Int64 PostId { get; set; }
        public Int64 AssetId { get; set; }
        public string URL { get; set; }
        public string PostHeading { get; set; }
        public string PostDescription { get; set; }
        public string EncodedHtml { get; set; }
        public string AuthorName { get; set; }
        public string AssetName { get; set; }
        public string PostPhoto { get; set; }
        public string AuthorPhoto { get; set; }

        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}")]
        public DateTime PostedDate { get; set; }
    }
}
