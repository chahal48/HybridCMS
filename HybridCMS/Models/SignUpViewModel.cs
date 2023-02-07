using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HybridCMS.Models
{
    public class SignUpViewModel
    {
        [Required(ErrorMessage = "Name is required!!")]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Name character length should be in between 5 to 50.")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Username is required!!")]
        [RegularExpression("^[A-Za-z -]*$", ErrorMessage = "Sorry, only letters (a-z) are allowed.")]
        [StringLength(20, MinimumLength = 5, ErrorMessage = "Username character length should be in between 5 to 20.")]
        [Remote("IsUsernameAvailable", "User", HttpMethod = "Post", ErrorMessage = "Username already exist.")]
        public string Username { get; set; }
        [Required(ErrorMessage = "Email is required!!")]
        [RegularExpression("^([\\w-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([\\w-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$", ErrorMessage = "Sorry, email is invalid.")]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Email character length should be in between 5 to 50.")]
        [Remote("IsEmailAvailable", "User", HttpMethod = "Post", ErrorMessage = "Email already exist.")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Password is required!!")]
        [DataType(DataType.Password)]
        [StringLength(20, MinimumLength = 5, ErrorMessage = "Password character length should be in between 5 to 20.")]
        public string Password { get; set; }

        [DisplayName("Confirm Password")]
        [Required(ErrorMessage = "Confirm Password is required!!")]
        [DataType(DataType.Password)]
        [System.ComponentModel.DataAnnotations.Compare("Password", ErrorMessage = "The confirm password and password fields do not match.")]
        [StringLength(20, MinimumLength = 5, ErrorMessage = "Confirm password character length should be in between 5 to 20.")]
        public string ConfirmPassword { get; set; }
        [Display(Name = "Show Password")]
        public bool ShowPassword { get; set; }
    }
}