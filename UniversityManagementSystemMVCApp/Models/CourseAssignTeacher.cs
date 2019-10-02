using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityManagementSystemMVCApp.Models
{
    public class CourseAssignTeacher
    {
        public int Id { get; set; }
        [Required]
        [Display(Name = "Department")]
        public int DepartmentId { get; set; }
        [Required]
        [Display(Name = "Teacher")]
        public int TeacherId { get; set; }
        [Required]
        [Display(Name = "Course Code")]
        public int CourseId { get; set; }

       // public int CourseCode { get; set; }
    }
}