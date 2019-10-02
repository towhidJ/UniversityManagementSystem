using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Getway
{
    public class SemesterGetway:BaseGetway
    {
        public List<Semester> GetAllSemesters()
        {
            string query = "SELECT * FROM SemesterTB";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Semester> semesterList = new List<Semester>();
            while (Reader.Read())
            {
                Semester semester = new Semester();
                semester.Id = Convert.ToInt32(Reader["Id"]);
                semester.SemesterName = Reader["SemesterName"].ToString();

                semesterList.Add(semester);
            }
            Connection.Close();
            return semesterList;
        }


    }
}