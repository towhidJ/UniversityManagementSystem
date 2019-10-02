using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagementSystemMVCApp.Models.ViewModel
{
    public class CourseShowView
    {
        public string DepartmentCode { get; set; }
        public int DepartmentId { get; set; }
        public string CourseCode { get; set; }
        public string TeacherName { get; set; }
        public string CourseName { get; set; }
        public int CourseId { get; set; }
    }
}