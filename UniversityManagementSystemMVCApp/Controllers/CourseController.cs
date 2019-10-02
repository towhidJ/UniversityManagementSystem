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
    public class CourseController : Controller
    {
        //
        // GET: /Course/

        private DepartmentManager departmentManager;
        private CourseManager courseManager;
        private SemesterManager semesterManager;
        private CourseShowManager courseShowManager;
        private EnrollCourseManager enrollCourseManager;

        public CourseController()
        {
            departmentManager = new DepartmentManager();
            courseManager = new CourseManager();
            semesterManager = new SemesterManager();
            courseShowManager = new CourseShowManager();
            enrollCourseManager = new EnrollCourseManager();
        }

        


        [HttpGet]
        [Authorize(Roles = "Admin")]
        public ActionResult Save()
        {
            ViewBag.Departments = departmentManager.GetSelectListItemsForDropdown();
            ViewBag.Semesters = semesterManager.GetSelectListItemsForSemesterDropdown();
            return View();
        }

        [HttpPost]
        public ActionResult Save(Course course)
        {
            string message = courseManager.Save(course);
            ViewBag.Departments = departmentManager.GetSelectListItemsForDropdown();
            ViewBag.Semesters = semesterManager.GetSelectListItemsForSemesterDropdown();
            
            ViewBag.Message = message;
            ModelState.Clear();
            return View();
        }
        public ActionResult ShowCourse()
        {
            ViewBag.Departments = departmentManager.GetSelectListItemsForDropdown();
            return View();
        }

        public JsonResult GetAllCourseByDepartmentId(int departmentId)
        {
            ViewBag.Departments = departmentManager.GetSelectListItemsForDropdown();
            List<CourseShowView> GetAllAssignInfo = courseShowManager.GetAllCourse(departmentId);
            return Json(GetAllAssignInfo);
        }

        [Authorize(Roles = "Admin, Student")]
        public ActionResult CourseShowByStudent()
        {
            ViewBag.RegNo = enrollCourseManager.GetSelectListItemsForDropdown();
            return View();
        }

        public JsonResult GetClassCourseByRegNo(int registrationId)
        {
            EnrollCourse enrollCourse = new EnrollCourse();
            List<EnrollCourse> courseBy = enrollCourseManager.GetCourseByStudentId(registrationId);
            return Json(courseBy);
        }
    }
}