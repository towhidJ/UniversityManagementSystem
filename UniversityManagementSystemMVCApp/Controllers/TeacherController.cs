using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemMVCApp.Manager;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Controllers
{
    public class TeacherController : Controller
    {
        //
        // GET: /Teacher/
        private DepartmentManager departmentManager;
        private DesignationManager designationManager;
        private TeacherManager teacherManager;

        public TeacherController()
        {
            designationManager = new DesignationManager();
            departmentManager = new DepartmentManager();
            teacherManager = new TeacherManager();
        }

        [HttpGet]
        [Authorize(Roles = "Admin")]
        public ActionResult Save()
        {
            ViewBag.Departments = departmentManager.GetSelectListItemsForDropdown();
            ViewBag.Designation = designationManager.GetSelectListItemsForDesignationDropdown();
            return View();
        }
        [HttpPost]
        public ActionResult Save(Teacher teacher)
        {
            string message = teacherManager.Save(teacher);
            ViewBag.Departments = departmentManager.GetSelectListItemsForDropdown();
            ViewBag.Designation = designationManager.GetSelectListItemsForDesignationDropdown();
            ViewBag.Message = message;
            return View();
        }
	}
}