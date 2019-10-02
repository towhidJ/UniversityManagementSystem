using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Controllers
{
    public class LoginController : Controller
    {
        private string connectionString =
            WebConfigurationManager.ConnectionStrings["LoginString"].ConnectionString;
        //
        // GET: /Login/
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(Logi log)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlDataAdapter da = new SqlDataAdapter("Select count(*) From login Where username = '" + log.Username + "' and password = '" +log.Password+ "'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows[0][0].ToString() == "1")
            {
                return View();
            }
            else
            {
                ViewBag.Message = "Username Or Password Incorret";
                
                return View();
            }
            
        }
	}
}