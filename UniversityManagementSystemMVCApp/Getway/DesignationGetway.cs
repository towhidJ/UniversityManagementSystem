using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Getway
{
    public class DesignationGetway:BaseGetway
    {
        public List<Designation> GetAllDesignation()
        {
            string query = "SELECT * FROM DesignationTB";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Designation> designationList = new List<Designation>();
            while (Reader.Read())
            {
                Designation designation = new Designation();
                designation.Id = Convert.ToInt32(Reader["Id"]);
                designation.DesignationName = Reader["DesignationName"].ToString();

                designationList.Add(designation);
            }
            Connection.Close();
            return designationList;
        }
    }
}