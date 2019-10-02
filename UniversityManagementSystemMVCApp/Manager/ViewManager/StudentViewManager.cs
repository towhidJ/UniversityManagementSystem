using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemMVCApp.Getway;
using UniversityManagementSystemMVCApp.Getway.ViewGetway;
using UniversityManagementSystemMVCApp.Models;
using UniversityManagementSystemMVCApp.Models.ViewModel;

namespace UniversityManagementSystemMVCApp.Manager.ViewManager
{
    public class StudentViewManager
    {
        private StudentView studentView;
        private StudentViewGetway studentViewGetway;

        public StudentViewManager()
        {
            studentView = new StudentView();
            studentViewGetway = new StudentViewGetway();
        }

        public List<StudentView> GetStudentById(int studentId)
        {
            return studentViewGetway.GetStudentById(studentId);
        }

        //<-----Course find Student id--for Enroll course->
        public List<StudentView> GetCourseById(int studentId)
        {
            return studentViewGetway.GetCourseById(studentId);
        }
        public List<StudentResult> GetStudentByEnrollCourse(int studentId)
        {
            return studentViewGetway.GetStudentByEnrollCourse(studentId);
        }
        public List<StudentResult> GetCourseByEnrollCourse(int studentId)
        {
            return studentViewGetway.GetCourseByEnrollCourse(studentId);
        }
    }
}