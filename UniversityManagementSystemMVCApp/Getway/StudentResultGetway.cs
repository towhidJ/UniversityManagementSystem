using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Getway
{
    public class StudentResultGetway:BaseGetway
    {
        public int Save(StudentResult studentResult)
        {
            string query = "INSERT INTO StudentResultTB(StudentId,CourseId,GradeLetterId) VALUES('" + studentResult.StudentId + "','" + studentResult.CourseId + "','" + studentResult.GradeLetterId + "')";
            Command = new SqlCommand(query,Connection);
            Connection.Open();
            int rowAffact = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffact;
        }

        public bool IsResultExists(StudentResult studentResult)
        {
            string query = "SELECT * FROM StudentResultTB WHERE StudentId ='" + studentResult.StudentId + "' AND CourseId = '" +studentResult.CourseId + "'";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool IsExists = Reader.HasRows;
            Connection.Close();
            return IsExists;
        }

        public List<StudentResult> GetAllStudentResults(int studentId)
        {
            string query =
                "SELECT CourseName,CourseCode,Credit,ISNULL(GradeLetterMarkes,'Not Graded Yet') AS Grade ,ISNULL(GradePoint,'Not Graded Yet') AS GP FROM EnrollCourseTB AS EC LEFT JOIN(SELECT CourseId,GradeLetterId FROM StudentResultTB AS SR WHERE SR.StudentId = " + studentId + ") AS SR ON SR.CourseId = EC.CourseId LEFT JOIN CourseTB AS C ON C.Id = EC.CourseId LEFT JOIN GradeLetterTB AS GL ON GL.Id =SR.GradeLetterId WHERE EC.StudentId =" + studentId;
            Command = new SqlCommand(query,Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<StudentResult>studentsResults = new List<StudentResult>();
            while (Reader.Read())
            {
                StudentResult studentResult = new StudentResult();
                studentResult.CourseCode = Reader["CourseCode"].ToString();
                studentResult.CourseName = Reader["CourseName"].ToString();
                studentResult.Grade = Reader["Grade"].ToString();
                studentResult.GP = Reader["GP"].ToString();
                studentResult.Credit = Convert.ToDouble(Reader["Credit"]);
                studentsResults.Add(studentResult);
            }
            Connection.Close();
            return studentsResults;
        }


    }
}