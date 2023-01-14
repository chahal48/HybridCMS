using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace HybridCMS.Models
{
    public class ForgetPasswordViewModel
    {
        [DisplayName("Email or Username")]
        public string EmailorUsername { get; set; }
    }
}