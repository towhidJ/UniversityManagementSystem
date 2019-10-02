using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace UniversityManagementSystemMVCApp.Getway
{
    public class BaseGetway
    {
        public SqlConnection Connection { get; set; }
        public SqlCommand Command { get; set; }
        public SqlDataReader Reader { get; set; }
        public BaseGetway()
        {
            string conn = WebConfigurationManager.ConnectionStrings["UniversityDBConnectingString"].ConnectionString;
            Connection = new SqlConnection(conn);
        }
    }
}