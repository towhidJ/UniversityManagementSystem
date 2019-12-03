using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Getway
{
    public class StudentGetway:BaseGetway
    {
        //(StudentName,Email,ContactNo,Address,RegistrationNo,DepartmentId,DepartmentId,DepartmentId,RegisterDate)
        public int Save(Student student)
        {
            //student.RoleId = 1;
            string query = "INSERT INTO StudentTB(StudentName,Email,Password,RoleId,ContactNo,Address,RegistrationNo,DepartmentId,RegisterDate) VALUES('" + student.StudentName + "','" + student.Email + "','"+student.Password+"','"+1+"', '" + student.ContactNo + "','" + student.Address + "','" + student.RegistrationNo + "','" + student.DepartmentId + "','" + student.RegisterDate + "')";
            Command = new SqlCommand(query,Connection);
            Connection.Open();
            int rowAffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffect;
        }
        public bool IsNameExsists(Student student)
        {

            string query = "SELECT * FROM StudentTB WHERE Email='" + student.Email + "'";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool IsExsists = Reader.HasRows;
            Connection.Close();
            return IsExsists;
        }
        public int GetAllStudent(int departmentId)
        {
            string query = "SELECT * FROM StudentTB WHERE DepartmentId=" + departmentId + "";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();

            int count = 0;
            while (Reader.Read())
            {
                int newCount = count + 1;
                count = newCount;

            }
            Connection.Close();
            return count;
        }

        public List<Student> AllStudent()
        {
            string query = "SELECT * FROM StudentTB";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Student>studentList = new List<Student>();
            while (Reader.Read())
            {
                Student student = new Student();
                student.Id = Convert.ToInt32(Reader["Id"]);
                student.RegistrationNo = Reader["RegistrationNo"].ToString();
                studentList.Add(student);

            }
            Connection.Close();
            return studentList;
        }

        public Student StudentById(int studentId)
        {
            string query = "SELECT DepartmentName,StudentTB.Id,DepartmentId,StudentName,Email,RegistrationNo FROM StudentTB INNER  JOIN DepartmentTB ON StudentTB.DepartmentId = DepartmentTB.Id WHERE StudentTB.Id =" + studentId;
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            //List<Student> studentList = new List<Student>();
            Student student = new Student();
            while (Reader.Read())
            {
                
                student.StudentName = Reader["StudentName"].ToString();
                student.RegistrationNo = Reader["RegistrationNo"].ToString();
                student.Email = Reader["Email"].ToString();
                student.DepartmentName = Reader["DepartmentName"].ToString();

            }
            Connection.Close();
            return student;
        }
    }
}