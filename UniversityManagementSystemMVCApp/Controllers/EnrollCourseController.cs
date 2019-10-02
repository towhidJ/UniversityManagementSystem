using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemMVCApp.Manager;
using UniversityManagementSystemMVCApp.Manager.ViewManager;
using UniversityManagementSystemMVCApp.Models;
using UniversityManagementSystemMVCApp.Models.ViewModel;

namespace UniversityManagementSystemMVCApp.Controllers
{
    public class EnrollCourseController : Controller
    {
        //
        // GET: /EnrollCourse/

        private StudentViewManager studentViewManager;
        private EnrollCourseManager enrollCourseManager;
        private StudentManager studentManager;

        public EnrollCourseController()
        {
            enrollCourseManager = new EnrollCourseManager();
            studentViewManager = new StudentViewManager();
            studentManager = new StudentManager();
        }
        [Authorize(Roles = "Admin,Student")]
        public ActionResult Save()
        {

            ViewBag.RegNo = studentManager.GetSelectListItemsForDropdown();
            return View();
        }
        [HttpPost]
        [Authorize(Roles = "Admin,Student")]
        public ActionResult Save(EnrollCourse enrollCourse)
        {
            ViewBag.Message = enrollCourseManager.Save(enrollCourse);
            ViewBag.RegNo = studentManager.GetSelectListItemsForDropdown();
            return View();
        }

        public JsonResult RegistrationNo(int studentId)
        {
            List<StudentView> AllStudentView = studentViewManager.GetStudentById(studentId);
            return Json(AllStudentView);
        }

        public JsonResult CourseByRegistrationNo(int studentId)
        {
            List<StudentView> AllCourse = studentViewManager.GetCourseById(studentId);
            return Json(AllCourse);
        }
    }
}