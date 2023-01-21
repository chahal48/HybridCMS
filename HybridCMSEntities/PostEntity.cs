using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
        public string CreatedOn { get; set; }
        public string ViewsCount { get; set; }
    }
}
