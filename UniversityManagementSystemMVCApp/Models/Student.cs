using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace UniversityManagementSystemMVCApp.Models
{
    public class Student
    {
        public int Id { get; set; }
        public int Uid { get; set; }
        [Required]
        [Display(Name = "Department")]
        public int DepartmentId { get; set; }

        public int RoleId { get; set; }
        [Required]
        [Display(Name = "Student Name")]
        public string StudentName { get; set; }
        [Required]
        [EmailAddress]
        [Remote("IsEmailUnique", "Account", ErrorMessage = "This Email Already Registread")]
        public string Email { get; set; }
        [Required]
        public string Password { get; set; }
        [Required]
        //[MaxLength(11)]
        [StringLength(14, MinimumLength = 11)]
        [Display(Name = "Contact No")]
        public string ContactNo { get; set; }
        
        
        [Display(Name = "Date")]
        [Required]
        [DisplayFormat(DataFormatString = "{0:d}")]
        public DateTime RegisterDate { get; set; }

        public string Address { get; set; }
        public string RegistrationNo { get; set; }
        public string DepartmentName { get; set; }
    }
}