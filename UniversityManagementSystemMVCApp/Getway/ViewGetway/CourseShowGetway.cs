using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystemMVCApp.Models.ViewModel;

namespace UniversityManagementSystemMVCApp.Getway.ViewGetway
{
    public class CourseShowGetway:BaseGetway
    {
        public List<CourseShowView> GetAllCourse(int departmentId)
        {
            string query = "SELECT DepartmentTB.DepartmentCode, CourseTB.CourseCode,CourseTB.CourseName, ISNULL (TeacherTB.TeacherName,'Not Assign Yet') AS TeacherName From CourseTB LEFT JOIN CourseAssignTB ON CourseAssignTB.CourseId = CourseTB.Id LEFT JOIN TeacherTB ON TeacherTB.Id = CourseAssignTB.TeacherId INNER JOIN DepartmentTB ON CourseTB.DepartmentId = DepartmentTB.Id WHERE DepartmentTB.Id ='"+departmentId+"'";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<CourseShowView> showCourseViews = new List<CourseShowView>();

            while (Reader.Read())
            {
                CourseShowView showCourse = new CourseShowView();
                showCourse.CourseName = Reader["CourseName"].ToString();
                showCourse.CourseCode = Reader["CourseCode"].ToString();
                showCourse.DepartmentCode = Reader["DepartmentCode"].ToString();
                showCourse.TeacherName = Reader["TeacherName"].ToString();
                showCourseViews.Add(showCourse);
            }
            Connection.Close();
            return showCourseViews;
        }
    }
}