using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityManagementSystemMVCApp.Models
{
    public class Course
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Pleasee enter you Code")]
        [StringLength(20, MinimumLength = 5, ErrorMessage = "Code must be 5 character long")]
        public string CourseCode { get; set; }
        [Required]
        public string CourseName { get; set; }
        [Required(ErrorMessage = "Pleasee enter you number")]
        [Range(0.5, 5, ErrorMessage = "Enter number between 0.5 to 5")]
        public float Credit { get; set; }
        [Required]
        public string Description { get; set; }
        [Required]
        [Display(Name = "Department")]
        public int DepartmentId { get; set; }
        [Required]
        [Display(Name = "Semester")]
        public int SemesterId { get; set; }

        public int Action { get; set; }
    }
}