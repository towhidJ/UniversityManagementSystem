using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.Mvc;
using System.Web.Security;
using UniversityManagementSystemMVCApp.Models;
using Membership = UniversityManagementSystemMVCApp.Models.Membership;

namespace UniversityManagementSystemMVCApp.Controllers
{
    public class AccountController : Controller
    {
        private SmSEntities db = new SmSEntities();
        // GET: Account
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(Membership model)
        {
            using (var context = new SmSEntities())
            {
                bool AdminIsValid = context.AdminTBs.Any(x => x.Email == model.Email && x.Password == model.Password);
                bool StudentIsValid = context.StudentTBs.Any(x => x.Email == model.Email && x.Password == model.Password);
                bool TeacherIsValid = context.TeacherTBs.Any(x => x.Email == model.Email && x.Password == model.Password);


                if (AdminIsValid)
                {
                    FormsAuthentication.SetAuthCookie(model.Email,false);

                    return RedirectToAction("Index", "Home");

                }
                else if (StudentIsValid)
                {
                    FormsAuthentication.SetAuthCookie(model.Email, false);

                    return RedirectToAction("Index", "Home");
                }
                else if (TeacherIsValid)
                {
                    FormsAuthentication.SetAuthCookie(model.Email, false);
                    var name = db.TeacherTBs.Single(c => c.Email == model.Email).TeacherName;
                    
                    return RedirectToAction("Index", "Home");
                }
                ModelState.AddModelError("","Invalid Username or PAssword");
                return View();
            }
            
        }



        [AllowAnonymous]
        public JsonResult IsEmailUnique(string Email)
        {
            bool isAdminValid = db.AdminTBs.Any(x => x.Email == Email);
            bool isStudentValid = db.TeacherTBs.Any(x => x.Email == Email);
            bool isTeacherValid = db.StudentTBs.Any(x => x.Email == Email);

            if (isAdminValid)
            {
                return Json(!isAdminValid, JsonRequestBehavior.AllowGet);
            }
            else if (isStudentValid)
            {
                return Json(!isStudentValid, JsonRequestBehavior.AllowGet);
            }
            else if (isTeacherValid)
            {
                return Json(!isTeacherValid, JsonRequestBehavior.AllowGet);
            }
            return Json(!isAdminValid || !isStudentValid || !isTeacherValid, JsonRequestBehavior.AllowGet);
            //return Json( !isAdminValid || !isDoctorValid, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }
    }
}