using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystemMVCApp.Models;
using UniversityManagementSystemMVCApp.Models.ViewModel;

namespace UniversityManagementSystemMVCApp.Getway
{
    public class CourseGetway:BaseGetway
    {
        public int Save(Course course)
        {
            string query =
                "INSERT INTO CourseTB(CourseCode,CourseName,Credit,Description,DepartmentId,SemesterId,Action) VALUES('" +
                course.CourseCode + "','" + course.CourseName + "','" + course.Credit + "','" + course.Description +
                "','" + course.DepartmentId + "','" + course.SemesterId + "','"+1+"')";

            Command = new SqlCommand(query,Connection);
            Connection.Open();
            int rowAffact = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffact;
        }

        public bool IsCourseNameExists(string name)
        {

            string query = "SELECT * FROM CourseTB WHERE CourseName = '" + name + "' AND Action=1";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool isNameExists = Reader.HasRows;
            Connection.Close();
            return isNameExists;
        }

        public bool IsCourseCodeExists(string code)
        {

            string query = "SELECT * FROM CourseTB WHERE CourseCode = '" + code + "' AND Action=1";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool isCodeExists = Reader.HasRows;
            Connection.Close();
            return isCodeExists;
        }

        //public List<CourseAssignView> GetCourseCodeByTeacherId(int teacherId)
        //{
        //    var query = "SELECT Id,TeacherName,CreditToBeTaken,ReminingCredit FROM TeacherTB WHERE Id='" + teacherId + "'";
        //    Command = new SqlCommand(query, Connection);
        //    Connection.Open();
        //    Reader = Command.ExecuteReader();
        //    Reader.Read();
        //    List<CourseAssignView> teachers = new List<CourseAssignView>();
        //    if (Reader.HasRows)
        //    {
        //        CourseAssignView teacher = new CourseAssignView();
        //        teacher.TeacherId = Convert.ToInt32(Reader["Id"]);
        //        teacher.TeacherName = Reader["TeacherName"].ToString();
        //        teacher.CreditToBeTaken = Convert.ToSingle(Reader["CreditToBeTaken"]);
        //        teacher.ReminingCredit = Convert.ToSingle(Reader["ReminingCredit"]);
        //        teachers.Add(teacher);
        //    }
        //    Connection.Close();
        //    return teachers;
        //}


        public List<Course> GetCourseByDepartmentId(int departmentId)
        {
            var query = "SELECT Id,CourseName,CourseCode,Credit FROM CourseTB WHERE DepartmentId='" + departmentId + "' AND Action = 1";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Course> departments = new List<Course>();
            while (Reader.Read())
            {
                Course course = new Course();
                course.Credit = Convert.ToSingle(Reader["Credit"]);
                course.Id = Convert.ToInt32(Reader["Id"]);
                course.CourseName = Reader["CourseName"].ToString();
                course.CourseCode = Reader["CourseCode"].ToString();

                departments.Add(course);
            }
            Connection.Close();
            return departments;
        }

        public List<Course> GetCourseByCourseId(int courseId)
        {
            var query = "SELECT Id,CourseName,CourseCode,Credit FROM CourseTB WHERE Id='" + courseId + "' AND Action = 1 ";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Course> departments = new List<Course>();
            while (Reader.Read())
            {
                Course course = new Course();
                course.Credit = Convert.ToSingle(Reader["Credit"]);
                course.Id = Convert.ToInt32(Reader["Id"]);
                course.CourseName = Reader["CourseName"].ToString();
                course.CourseCode = Reader["CourseCode"].ToString();

                departments.Add(course);
            }
            Connection.Close();
            Reader.Close();
            return departments;
        }
        public List<Course> GetAllCourseByAction()
        {
            string query = "SELECT * FROM CourseTB WHERE Action=1";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Course> courses = new List<Course>();
            while (Reader.Read())
            {
                Course course = new Course();
                course.Id = Convert.ToInt32(Reader["Id"]);
                course.Action = 1;
                courses.Add(course);
            }
            Reader.Close();
            Connection.Close();
            return courses;
        }

        public int UpdateCourse()
        {
            string query = "UPDATE CourseTB SET Action=0";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            int rowAffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffect;
        }

        public bool isActionExist()
        {
            string query = "SELECT * FROM CourseTB WHERE Action=1";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool IsExsists = Reader.HasRows;
            Connection.Close();
            return IsExsists;
        }

    }
}