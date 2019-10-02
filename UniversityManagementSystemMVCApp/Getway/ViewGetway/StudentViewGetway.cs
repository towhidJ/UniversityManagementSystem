using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using UniversityManagementSystemMVCApp.Models;
using UniversityManagementSystemMVCApp.Models.ViewModel;

namespace UniversityManagementSystemMVCApp.Getway.ViewGetway
{
    public class StudentViewGetway:BaseGetway
    {
        //public List<StudentView> ShowAllStudent()
        //{
        //    string query = "SELECT DepartmentName,StudentName,StudentTB.Id AS StudentId,Email,RegistrationNo FROM StudentTB INNER JOIN DepartmentTB ON StudentTB.DepartmentId = DepartmentTB.Id";
        //    Command = new SqlCommand(query, Connection);
        //    Connection.Open();
        //    Reader = Command.ExecuteReader();
        //    List<StudentView> studentViews = new List<StudentView>();
        //    while (Reader.Read())
        //    {
        //        StudentView studentView = new StudentView();
        //        studentView.StudentId = Convert.ToInt32(Reader["StudentId"]);
        //        studentView.DepartmentName = Reader["DepartmentName"].ToString();
        //        studentView.RegistrationNo = Reader["RegistrationNo"].ToString();
        //        studentView.Email = Reader["Email"].ToString();
        //        studentView.StudentName = Reader["StudentName"].ToString();


        //        studentViews.Add(studentView);
        //    }
        //    Connection.Close();
        //    return studentViews;
        //}



        public List<StudentView> GetStudentById(int StudentId)
        {
            string query = "SELECT CourseTB.Id AS CourseId ,CourseTB.CourseName,StudentTB.DepartmentId,DepartmentTB.DepartmentName,StudentName,StudentTB.Id AS StudentId,Email FROM DepartmentTB INNER JOIN CourseTB ON CourseTB.DepartmentId = DepartmentTB.Id INNER JOIN StudentTB ON StudentTB.DepartmentId = DepartmentTB.Id  WHERE StudentTB.Id = " + StudentId;
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<StudentView> studentViews = new List<StudentView>();
            while (Reader.Read())
            {
                StudentView studentView = new StudentView();
                studentView.StudentId = Convert.ToInt32(Reader["StudentId"]);
                studentView.DepartmentName = Reader["DepartmentName"].ToString();
                studentView.Email = Reader["Email"].ToString();
                studentView.StudentName = Reader["StudentName"].ToString();
                studentView.CourseName = Reader["CourseName"].ToString();
                studentView.CourseId = Convert.ToInt32(Reader["CourseId"]);



                studentViews.Add(studentView);
            }
            Connection.Close();
            return studentViews;
        }

        //<-----Course find Student id--for Enroll course->
        public List<StudentView> GetCourseById(int StudentId)
        {
            string query = "SELECT CourseTB.Id AS CourseId ,CourseTB.CourseName,StudentTB.DepartmentId,DepartmentTB.DepartmentName,StudentName,StudentTB.Id AS StudentId,Email FROM DepartmentTB INNER JOIN CourseTB ON CourseTB.DepartmentId = DepartmentTB.Id INNER JOIN StudentTB ON StudentTB.DepartmentId = DepartmentTB.Id  WHERE CourseTB.Action=1 AND StudentTB.Id = " + StudentId;
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<StudentView> studentViews = new List<StudentView>();
            while (Reader.Read())
            {
                StudentView studentView = new StudentView();
                studentView.StudentId = Convert.ToInt32(Reader["StudentId"]);
                studentView.CourseName = Reader["CourseName"].ToString();
                studentView.CourseId = Convert.ToInt32(Reader["CourseId"]);



                studentViews.Add(studentView);
            }
            Connection.Close();
            return studentViews;
        }

        //<-----Save Result------>
        public List<StudentResult> GetStudentByEnrollCourse(int StudentId)
        {
            string query = "SELECT EnrollCourseTB.CourseId AS CourseId ,CourseTB.CourseName,StudentTB.DepartmentId,DepartmentTB.DepartmentName,StudentName,StudentTB.Id AS StudentId,Email FROM StudentTB INNER JOIN EnrollCourseTB ON EnrollCourseTB.StudentId = StudentTB.Id INNER JOIN DepartmentTB ON StudentTB.DepartmentId = DepartmentTB.Id INNER JOIN CourseTB ON CourseTB.Id = EnrollCourseTB.CourseId WHERE EnrollCourseTB.StudentId = " + StudentId;
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<StudentResult> studentViews = new List<StudentResult>();
            while (Reader.Read())
            {
                StudentResult studentView = new StudentResult();
                studentView.StudentId = Convert.ToInt32(Reader["StudentId"]);
                studentView.DepartmentName = Reader["DepartmentName"].ToString();
                studentView.Email = Reader["Email"].ToString();
                studentView.StudentName = Reader["StudentName"].ToString();
                studentView.CourseName = Reader["CourseName"].ToString();
                studentView.CourseId = Convert.ToInt32(Reader["CourseId"]);



                studentViews.Add(studentView);
            }
            Connection.Close();
            return studentViews;
        }


        public List<StudentResult> GetCourseByEnrollCourse(int StudentId)
        {
            string query = "SELECT CourseName,EnrollCourseTB.CourseId From CourseTB INNER JOIN EnrollCourseTB ON EnrollCourseTB.CourseId = CourseTB.Id WHERE Action =1 AND EnrollCourseTB.StudentId = " + StudentId;
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<StudentResult> studentViews = new List<StudentResult>();
            while (Reader.Read())
            {
                StudentResult studentView = new StudentResult();
                studentView.CourseId = Convert.ToInt32(Reader["CourseId"]);
                studentView.CourseName = Reader["CourseName"].ToString();
                studentViews.Add(studentView);
            }
            Connection.Close();
            return studentViews;
        }
    }
}