using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityManagementSystemMVCApp.Models.ViewModel
{
    public class StudentView
    {
        public int StudentId { get; set; }
        public string StudentName { get; set; }
        public string Email { get; set; }
        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; }
        [Required]
        public int CourseId { get; set; }
        public string CourseName { get; set; }
        [Required]
        public string RegistrationNo { get; set; }
    }
}