using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HybridCMSEntities
{
    public class MasterEntity
    {
        public Int64 TotalUser { get; set; }
        public Int64 TotalAsset { get; set; }
        public Int64 TotalPost { get; set; }
        public Int64 TotalComment { get; set; }
        public Int64 TotalMail { get; set; }
    }
}
