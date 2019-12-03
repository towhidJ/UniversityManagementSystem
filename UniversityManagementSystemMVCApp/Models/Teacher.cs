using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace UniversityManagementSystemMVCApp.Models
{
    public class Teacher
    {
        public int Id { get; set; }
        [Required]
        [Display(Name = "Department")]
        public int DepartmentId { get; set; }

        public int RoleId { get; set; }
        [Required]
        [Display(Name = "Designation")]
        public int DesignationId { get; set; }
        [Required]
        public string TeacherName { get; set; }
        [Required]
        public string Address { get; set; }
        [Required]
        [EmailAddress]
        [Remote("IsEmailUnique", "Account", ErrorMessage = "This Email Already Registread")]
        public string Email { get; set; }

        [Required]
        [StringLength(20, MinimumLength = 6, ErrorMessage = "Password Must be 6 to 20 digit")]
        public string Password { get; set; }

        [Required]
        [StringLength(14, MinimumLength = 11, ErrorMessage = "Contact No must be 11 number long")]
        public string ContactNo { get; set; }
        [Required(ErrorMessage = "Pleasee enter you Credit")]
        [Range(1, 100, ErrorMessage = "You are not type of negative value")]
        [Display(Name = "CreditToBeTaken")]
        public double CreditToBeTaken { get; set; }

        public double ReminingCredit { get; set; }
    }
}