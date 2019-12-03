using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystemMVCApp.Models;
using UniversityManagementSystemMVCApp.Models.ViewModel;

namespace UniversityManagementSystemMVCApp.Getway
{
    public class TeacherGetway:BaseGetway
    {
        public int Save(Teacher teacher)
        {
            string query =
                "INSERT INTO TeacherTB(TeacherName,Address,RoleId,Password,Email,ContactNo,DepartmentId,DesignationId,CreditToBeTaken,ReminingCredit) VALUES('" +
                teacher.TeacherName + "','" + teacher.Address + "','" + 3+ "','" + teacher.Password + "','" + teacher.Email +
                "','" + teacher.ContactNo + "','" + teacher.DepartmentId + "','" + teacher.DesignationId + "','" + teacher.CreditToBeTaken + "','" + teacher.CreditToBeTaken + "')";

            Command = new SqlCommand(query, Connection);
            Connection.Open();
            int rowAffact = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffact;
        }

        public bool IsEmailExists(string email)
        {

            string query = "SELECT * FROM TeacherTB WHERE Email = '" + email + "'";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool isEmailExists = Reader.HasRows;
            Connection.Close();
            return isEmailExists;
        }

        public List<Teacher> ShowAllTeachers()
        {
            string query = "SELECT Id,TeacherName FROM TeacherTB";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Teacher> teachers = new List<Teacher>();
            while (Reader.Read())
            {
                Teacher teacher = new Teacher();
                teacher.Id = Convert.ToInt32(Reader["Id"]);
                teacher.TeacherName = Reader["TeacherName"].ToString();
                teachers.Add(teacher);
            }
            Connection.Close();
            return teachers;
        }


        public List<Teacher> GetTeacherByDepartmentId(int departmentId)
        {
            string query = "SELECT Id,TeacherName FROM TeacherTB WHERE DepartmentId='" + departmentId + "'";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Teacher> teachers = new List<Teacher>();
            while (Reader.Read())
            {
                Teacher teacher = new Teacher();
                teacher.Id = Convert.ToInt32(Reader["Id"]);
                teacher.TeacherName = Reader["TeacherName"].ToString();
                teachers.Add(teacher);
            }
            Connection.Close();
            return teachers;
        }

        public List<Teacher> GetTeacherId(int teacherId)
        {
            var query = "SELECT Id,TeacherName,CreditToBeTaken,ReminingCredit FROM TeacherTB WHERE Id='" + teacherId + "'";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Teacher> teachers = new List<Teacher>();
            while(Reader.Read())
            {
                Teacher teacher = new Teacher();
                teacher.Id = Convert.ToInt32(Reader["Id"]);
                teacher.TeacherName = Reader["TeacherName"].ToString();
                teacher.CreditToBeTaken = Convert.ToSingle(Reader["CreditToBeTaken"]);
                teacher.ReminingCredit = Convert.ToSingle(Reader["ReminingCredit"]);
                teachers.Add(teacher);
            }
            Connection.Close();
            Reader.Close();
            return teachers;
        }

        public int UpdateTeacher()
        {
            string query = "UPDATE TeacherTB SET ReminingCredit=CreditToBeTaken";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            int rowAffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffect;
        }

        public bool isTeacherExist(Teacher teacher)
        {
            string query = "SELECT * FROM TeacherTB WHERE DepartmentId = "+teacher.DepartmentId;
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool IsExsists = Reader.HasRows;
            Connection.Close();
            return IsExsists;
        }
    }
}