using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HybridCMSEntities
{
    public class BookmarkPostEntity
    {
        public Int64 UserId { get; set; }
        public Int64 PostId { get; set; }
        public bool IsBookMarked { get; set; }
        public string AssetUrl { get; set; }
    }
}
