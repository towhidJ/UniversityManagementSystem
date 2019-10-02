using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystemMVCApp.Models;
using UniversityManagementSystemMVCApp.Models.ViewModel;

namespace UniversityManagementSystemMVCApp.Getway
{
    public class EnrollCourseGetway:BaseGetway
    {
        private EnrollCourse enrollCourse;
        public int Save(EnrollCourse enrollCourse)
        {
            string query = "INSERT INTO EnrollCourseTB(StudentId,CourseId,Date)  VALUES('" + enrollCourse.StudentId + "','" + enrollCourse.CourseId + "','" + enrollCourse.Date + "')";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            int rowAffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffect;
        }

        public bool IsCourseExsists(EnrollCourse enrollCourse)
        {
            string query = "SELECT * FROM EnrollCourseTB WHERE CourseId=" + enrollCourse.CourseId + " AND StudentId=" + enrollCourse.StudentId + "";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool IsExsists = Reader.HasRows;
            Connection.Close();
            return IsExsists;
        }


        public List<EnrollCourse> AllStudent()
        {
            string query = "SELECT DISTINCT EnrollCourseTB.StudentId AS Id,StudentTB.RegistrationNo  FROM EnrollCourseTB INNER JOIN StudentTB ON StudentTB.Id = EnrollCourseTB.StudentId ";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<EnrollCourse> studentList = new List<EnrollCourse>();
            while (Reader.Read())
            {
                EnrollCourse student = new EnrollCourse();
                student.Id = Convert.ToInt32(Reader["Id"]);
                student.RegistrationNo = Reader["RegistrationNo"].ToString();
                studentList.Add(student);

            }
            Connection.Close();
            return studentList;
        }


        public List<EnrollCourse> GetCourseByStudentId( int registrationId)
        {
            string query = "SELECT * FROM StudentCourseView WHERE StudentId='"+ registrationId + "'";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<EnrollCourse> courseList = new List<EnrollCourse>();
            Hashtable ht = new Hashtable();
            while (Reader.Read())
            {
                string studentId = Reader["StudentId"].ToString();
                string courseName = Reader["CourseName"].ToString();
                string studentName = Reader["StudentName"].ToString();



                string scheduleInfo = courseName +",<br>";

                if (scheduleInfo == "")
                {
                    scheduleInfo = "Not Scheduled Yet";
                }

                if (!ht.ContainsKey(studentId))
                {
                    enrollCourse = new EnrollCourse();
                    enrollCourse.StudentName = studentName;
                    enrollCourse.CourseBy = scheduleInfo;
                    ht[studentId] = enrollCourse;
                    courseList.Add(enrollCourse);
                }
                else
                {
                    enrollCourse = (EnrollCourse)ht[studentId];
                    enrollCourse.CourseBy = enrollCourse.CourseBy + scheduleInfo;
                }
            }
            Connection.Close();
            return courseList;
        }
    }
}