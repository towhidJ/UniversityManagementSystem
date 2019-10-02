using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityManagementSystemMVCApp.Models
{
    public class Student
    {
        public int Id { get; set; }
        [Required]
        [Display(Name = "Department")]
        public int DepartmentId { get; set; }
        [Required]
        [Display(Name = "Student Name")]
        public string StudentName { get; set; }
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        [Required]
        //[MaxLength(11)]
        [StringLength(14, MinimumLength = 11)]
        [Display(Name = "Contact No")]
        public string ContactNo { get; set; }
        
        
        [Display(Name = "Date")]
        [Required]
        public DateTime RegisterDate { get; set; }

        public string Address { get; set; }
        public string RegistrationNo { get; set; }
        public string DepartmentName { get; set; }
    }
}