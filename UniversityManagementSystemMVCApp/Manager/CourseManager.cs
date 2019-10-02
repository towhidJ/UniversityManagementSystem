using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystemMVCApp.Getway;
using UniversityManagementSystemMVCApp.Models;
using UniversityManagementSystemMVCApp.Models.ViewModel;

namespace UniversityManagementSystemMVCApp.Manager
{
    public class CourseManager
    {
        private CourseGetway courseGetway;

        public CourseManager()
        {
            courseGetway = new CourseGetway();
        }

        public string Save(Course course)
        {
            bool isCourseNameExists = courseGetway.IsCourseNameExists(course.CourseName);
            bool isCourseCodeExists = courseGetway.IsCourseCodeExists(course.CourseCode);

            if (isCourseNameExists)
            {
                return "Course Name Alardy Exists";
            }
            else if (isCourseCodeExists)
            {
                return "Course Code Alardy Exists";
            }
            else
            {
                int rowAffact = courseGetway.Save(course);
                if (rowAffact > 0)
                {
                    return "Course Recoard Add Succefull";
                }
                return "Course Recoard Add Failed";
            }
        }

        public List<Course> GetCourseByDepartmentId(int departmentId)
        {
            return courseGetway.GetCourseByDepartmentId(departmentId);
        }
        public List<Course> GetCourseByCourseId(int courseId)
        {
            return courseGetway.GetCourseByCourseId(courseId);
        }

        public List<Course> GetAllCourseAction()
        {
            return courseGetway.GetAllCourseByAction();
        }
        public bool isActionExist()
        {
            return courseGetway.isActionExist();
        }
        public string updateCourseAction()
        {
            int rowAffect = courseGetway.UpdateCourse();
            if (rowAffect > 0)
            {
                return "Unassign Successfully";
            }
            else
            {
                return "Unassign Failed";
            }

        }
    }
}