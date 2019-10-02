using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityManagementSystemMVCApp.Models.ViewModel
{
    public class CourseAssignView
    {
        [Required]
        public int DepartmentId { get; set; }
        [Required]
        public int TeacherId { get; set; }
        [Required]
        public string CourseCode { get; set; }

        public string CourseName { get; set; }
        public string DepartmentName { get; set; }
        public string TeacherName { get; set; }
        public float CreditToBeTaken { get; set; }
        public float ReminingCredit { get; set; }
        public int CourseId { get; set; }
        public float Credit { get; set; }
    }
}