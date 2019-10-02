using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystemMVCApp.Getway.ViewGetway;
using UniversityManagementSystemMVCApp.Models.ViewModel;

namespace UniversityManagementSystemMVCApp.Manager.ViewManager
{
    public class CourseShowManager
    {
        private CourseShowGetway courseShowGetway;

        public CourseShowManager()
        {
            courseShowGetway = new CourseShowGetway();
        }
        public List<CourseShowView> GetAllCourse(int departmentId)
        {
            return courseShowGetway.GetAllCourse(departmentId);
        }
    }
}