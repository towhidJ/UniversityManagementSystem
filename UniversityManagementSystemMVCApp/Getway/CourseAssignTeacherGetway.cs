using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.EnterpriseServices.Internal;
using System.Linq;
using System.Web;
using System.Web.Mvc.Html;
using UniversityManagementSystemMVCApp.Models;
using UniversityManagementSystemMVCApp.Models.ViewModel;

namespace UniversityManagementSystemMVCApp.Getway
{
    public class CourseAssignTeacherGetway:BaseGetway
    {

        public int Save(CourseAssignTeacher courseAssignTeacher)
        {
            string query =
                "INSERT INTO CourseAssignTB(DepartmentId,TeacherId,CourseId) VALUES('" + courseAssignTeacher.DepartmentId + "','" + courseAssignTeacher.TeacherId + "','" + courseAssignTeacher.CourseId + "')";

            Command = new SqlCommand(query, Connection);
            Connection.Open();
            int rowAffact = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffact;
        }

        public bool IsSubjectExsists(CourseAssignTeacher courseAssignTeacher)
        {

            string query = "SELECT * FROM CourseAssignTB WHERE CourseId='" + courseAssignTeacher.CourseId+ "'";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool IsExsists = Reader.HasRows;
            Connection.Close();
            return IsExsists;
        }


        public Course GetCourseId(int id)
        {
            string query = "SELECT Id,CourseName,Credit FROM CourseTB WHERE Id=" + id;
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            Reader.Read();
            Course course = new Course();
            if (Reader.HasRows)
            {
                course.Id = Convert.ToInt32(Reader["Id"]);
                course.Credit = Convert.ToSingle(Reader["Credit"]);
                course.CourseName = Reader["CourseName"].ToString();
            }
            Connection.Close();
            return course;
        }


        public Teacher GetAvailableCreditByTeacherId(int teacherId)
        {
            string query = "SELECT ReminingCredit FROM TeacherTB WHERE Id=" + teacherId + "";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            Reader.Read();
            Teacher teacher = new Teacher();
            if (Reader.HasRows)
            {
                teacher.ReminingCredit = Convert.ToSingle(Reader["ReminingCredit"]);
            }
            Reader.Close();
            Connection.Close();
            return teacher;
        }
        public int UpdateTeacher(int Id, float remainingCredit)
        {

            string query = "UPDATE TeacherTB SET ReminingCredit='" + remainingCredit + "' WHERE Id=" + Id + "";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            int rowAffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffect;
        }


        public List<ShowAssignView> GetAllAssignCourse(int departmentId)
        {
            string query = "SELECT * FROM ShowAssignView WHERE DepartmentId = " + departmentId+ "AND Action = 1";
            Command = new SqlCommand(query,Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<ShowAssignView>showAssignViews = new List<ShowAssignView>();

            while (Reader.Read())
            {
                ShowAssignView showAssign = new ShowAssignView();
                showAssign.Id = Convert.ToInt32(Reader["Id"]);
                showAssign.DepartmentId = Convert.ToInt32(Reader["DepartmentId"]);
                showAssign.CourseName = Reader["CourseName"].ToString();
                showAssign.CourseCode = Reader["CourseCode"].ToString();
                showAssign.SemesterName = Reader["SemesterName"].ToString();
                showAssign.TeacherName = Reader["TeacherName"].ToString();
                showAssignViews.Add(showAssign);
            }
            Connection.Close();
            return showAssignViews;
        }
       
    }
}