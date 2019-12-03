using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mime;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Controllers
{
    [Authorize]
    [AllowAnonymous]
    public class HomeController : Controller
    {
        SmSEntities db = new SmSEntities();
        Student student = new Student();

        private readonly UserManager<ApplicationUser> _userManager;


        [AllowAnonymous]
        public ActionResult Index()
        {
            //if (!User.Identity.IsAuthenticated)
            //{
            //    return RedirectToAction("Login", "Account");
            //}
            return View();
        }
        [AllowAnonymous]
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        [AllowAnonymous]
        public ActionResult Contact()
        {
            ViewBag.Message = "Prima,Keya";
            
            
            return View();
        }
    }
}