using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Getway
{
    public class GradeLetterGetway:BaseGetway
    {
        public List<GradeLetter> AllGradeLetters()
        {
            string query = "SELECT * FROM GradeLetterTB";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<GradeLetter> gradeLetters = new List<GradeLetter>();
            while (Reader.Read())
            {
                GradeLetter grade = new GradeLetter();
                grade.Id = Convert.ToInt32(Reader["Id"]);
                grade.GradeLetterMarkes = Reader["GradeLetterMarkes"].ToString();
                gradeLetters.Add(grade);

            }
            Connection.Close();
            return gradeLetters;
        }
    }
}