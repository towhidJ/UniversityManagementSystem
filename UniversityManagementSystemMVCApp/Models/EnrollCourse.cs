using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityManagementSystemMVCApp.Models
{
    public class EnrollCourse
    {
        public int Id { get; set; }
        [Display(Name = "Student Reg. No.")]
        [Required]
        public int StudentId { get; set; }

        public string StudentName { get; set; }
        public string CourseName { get; set; }
        [Required]
        public int CourseId { get; set; }
        [Required]
        [DataType(DataType.Date)]
        public DateTime Date { get; set; }

        public string RegistrationNo { get; set; }

        public string CourseBy { get; set; }
        public string CourseCode { get; set; }
    }
}