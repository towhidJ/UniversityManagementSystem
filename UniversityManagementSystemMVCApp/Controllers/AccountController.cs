using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using UniversityManagementSystemMVCApp.Models;
using Membership = UniversityManagementSystemMVCApp.Models.Membership;

namespace UniversityManagementSystemMVCApp.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(Membership model)
        {
            using (var context = new LoginEntities())
            {
                bool IsValid = context.User.Any(x => x.UserName == model.UserName && x.Password == model.Password);
                if (IsValid)
                {
                    FormsAuthentication.SetAuthCookie(model.UserName,false);
                    return RedirectToAction("Index", "Home");
                }
                ModelState.AddModelError("","Invalid Username or PAssword");
                return View();
            }
            
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }
    }
}