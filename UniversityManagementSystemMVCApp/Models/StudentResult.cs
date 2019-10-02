using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Security.AccessControl;
using System.Web;

namespace UniversityManagementSystemMVCApp.Models
{
    public class StudentResult
    {
        public int Id { get; set; }
        [Required]
        public int StudentId { get; set; }
        [Required]
        public string StudentName { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]
        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; }

        [Required]
        [Display(Name = "Course")]
        public int CourseId { get; set; }

        public string CourseCode { get; set; }
        [Required]
        [Display(Name = "Grade Letter")]
        public int GradeLetterId { get; set; }
        public string Grade { get; set; }

        public string GP { get; set; }        
        public string CourseName { get; set; }
        public double Credit { get; set; } 
    }
}