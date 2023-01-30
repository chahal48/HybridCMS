using System;

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
        public bool IsDeleted { get; set; }
    }
}
