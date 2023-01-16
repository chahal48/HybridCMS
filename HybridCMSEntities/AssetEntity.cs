using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HybridCMSEntities
{
    public class AssetEntity
    {
        public Int64 AssetId { get; set; }
        public string Name { get; set; }
        public Int64 UserId { get; set; }
        public int AssetTypeId { get; set; }
        public string URL { get; set; }
        public string Description { get; set; }
        public string ProfilePicture { get; set; }

    }
}
