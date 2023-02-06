using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace HybridCMS.Models
{
    public class CMSLoginViewModel
    {
        [DisplayName("Email or Username")]
        [Required(ErrorMessage = "Email or Username is required!!")]
        public string EmailorUsername { get; set; }

        [Required(ErrorMessage = "Password is required!!")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        [Display(Name = "Remember me")]
        public bool RemenberMe { get; set; }
        [Display(Name = "Show Password")]
        public bool ShowPassword { get; set; }
    }
}