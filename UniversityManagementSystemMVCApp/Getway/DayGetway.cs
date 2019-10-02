using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Getway
{
    public class DayGetway:BaseGetway
    {
        public List<Day> GetAllDays()
        {
            string query = "SELECT * FROM DayTB";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Day> days = new List<Day>();
            while (Reader.Read())
            {
                Day day = new Day();
                day.Id = Convert.ToInt32(Reader["Id"]);
                day.DayName = Reader["DayName"].ToString();
                days.Add(day);
            }
            Connection.Close();
            return days;
        }
    }
}