using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HybridCMSEntities
{
    public class UserEntity
    {
        public Int64 UserId { get; set; }
        public RoleType RoleType { get; set; }
        public string Name { get; set; }
        public string UserName { get; set; }
        public string EmailAddress { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedOn { get; set; }
        public Int64 TotalAsset { get; set; }
        public Int64 PublishedAsset { get; set; }
        public Int64 TotalPost { get; set; }
        public Int64 TotalComment { get; set; }
    }
}
