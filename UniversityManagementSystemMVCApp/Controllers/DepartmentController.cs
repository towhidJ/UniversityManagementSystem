using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemMVCApp.Manager;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Controllers
{
    public class DepartmentController : Controller
    {
        //
        // GET: /Department/
        DepartmentManager departmentManager = new DepartmentManager();
        [HttpGet]
        [Authorize(Roles = "Admin")]
        public ActionResult Save()
        {
            return View();
        }
        [HttpPost]
        [Authorize(Roles = "Admin")]
        public ActionResult Save(Department department)
        {
            ViewBag.Message = departmentManager.Save(department);
            return View();
        }

        public ActionResult Show(Department department)
        {
            List<Department> departments = departmentManager.ShowAllDepartments();
            return View(departments);
        }
	}
}