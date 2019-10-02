using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Getway
{
    public class DepartmentGetway:BaseGetway
    {
        public int Save(Department department)
        {
            string query = "INSERT INTO DepartmentTB(DepartmentCode,DepartmentName) VALUES('" + department.DepartmentCode + "','" + department.DepartmentName + "')";
            Command  = new SqlCommand(query,Connection);
            Connection.Open();
            int rowAffact = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffact;

        }


        public bool IsDepartmentNameExists(string name)
        {

            string query = "SELECT * FROM DepartmentTB WHERE DepartmentName = '" + name + "'";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool isNameExists = Reader.HasRows;
            Connection.Close();
            return isNameExists;
        }

        public bool IsDepartmentCodeExists(string code)
        {

            string query = "SELECT * FROM DepartmentTB WHERE DepartmentCode = '" + code + "'";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool isCodeExists = Reader.HasRows;
            Connection.Close();
            return isCodeExists;
        }


        public List<Department> ShowAllDepartments()
        {
            string query = "SELECT * FROM DepartmentTB";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Department> departments = new List<Department>();
            while (Reader.Read())
            {
                Department department = new Department();
                department.Id = Convert.ToInt32(Reader["Id"]);
                department.DepartmentName = Reader["DepartmentName"].ToString();
                department.DepartmentCode = Reader["DepartmentCode"].ToString();
                departments.Add(department);
            }
            Connection.Close();
            return departments;
        }

        public Department GetDepartmentById(int departmentId)
        {
            string query = "SELECT * FROM DepartmentTB WHERE Id = " + departmentId;
            Command = new SqlCommand(query, Connection);

            Connection.Open();
            Reader = Command.ExecuteReader();
            Reader.Read();
            Department department = null;
            if (Reader.HasRows)
            {
                department = new Department();
                department.Id = Convert.ToInt32(Reader["Id"]);
                department.DepartmentCode = Reader["DepartmentCode"].ToString();
                department.DepartmentName = Reader["DepartmentName"].ToString();
            }
            Reader.Close();
            Connection.Close();
            return department;
        }

    }
}