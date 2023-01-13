using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HybridCMSEntities
{
    public class LoginEntity
    {
        public Int64 Id { get; set; }
        public string Name { get; set; }
        public string UserName { get; set; }
        public string EmailId { get; set; }
        public string Photo { get; set; }
        public string Password { get; set; }
        public int RoleId { get; set; }
    }
}
