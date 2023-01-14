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
        [DisplayName("Username")]
        [Required(ErrorMessage = "Username is required!!")]
        [StringLength(20, MinimumLength = 3, ErrorMessage = "Username character length should be in between 3 to 20.")]
        public string UserName { get; set; }

        [Required(ErrorMessage = "Password is required!!")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        [Display(Name = "Remember me")]
        public bool RemenberMe { get; set; }
    }
}