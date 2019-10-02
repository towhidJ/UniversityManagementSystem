using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemMVCApp.Manager;
using UniversityManagementSystemMVCApp.Models;
using UniversityManagementSystemMVCApp.Models.ViewModel;

namespace UniversityManagementSystemMVCApp.Controllers
{
    public class CourseAssignToTeacherController : Controller
    {
        //
        // GET: /CourseAssignToTeacher/
        private DepartmentManager departmentManager;
        private TeacherManager teacherManager;
        private CourseManager courseManager;
        private CourseAssignTeacherManager courseAssignTeacherManager;

        public CourseAssignToTeacherController()
        {
            departmentManager = new DepartmentManager();
            teacherManager = new TeacherManager();
            courseManager = new CourseManager();
            courseAssignTeacherManager = new CourseAssignTeacherManager();
        }
        [HttpGet]
        [Authorize(Roles = "Admin")]
        public ActionResult Save()
        {
            ViewBag.Departments = departmentManager.GetSelectListItemsForDropdown();
            return View();
        }
        [HttpPost]
        public ActionResult Save(CourseAssignTeacher courseAssign)
        {
            ViewBag.Message = courseAssignTeacherManager.Save(courseAssign);
            ViewBag.Departments = departmentManager.GetSelectListItemsForDropdown();
            return View();
        }
        [HttpGet]
        public ActionResult Show()
        {
            ViewBag.Departments = departmentManager.GetSelectListItemsForDropdown();
            return View();
        }

        public JsonResult GetAllAssignCourseByDepartmentId(int departmentId)
        {
            ViewBag.Departments = departmentManager.GetSelectListItemsForDropdown();
            List<ShowAssignView> GetAllAssignInfo = courseAssignTeacherManager.GetAllAssignCourse(departmentId);   
            return Json(GetAllAssignInfo);
        }

        public JsonResult GetTeacherByDepartmentId(int departmentId)
        {
            List<Teacher> GetTeacherByDepartmentId = teacherManager.GetTeacherByDepartmentId(departmentId);
            return Json(GetTeacherByDepartmentId);
        }

        public JsonResult GetCreditByTeacherId(int teacherId)
        {
            List<Teacher> GetTeacherId = teacherManager.GetTeacherId(teacherId);
            return Json(GetTeacherId);
        }

        public JsonResult GetCourseByDepartmentId(int departmentId)
        {
            List<Course> GetCourseByDepartmentId = courseManager.GetCourseByDepartmentId(departmentId);

            return Json(GetCourseByDepartmentId);
        }

        public JsonResult GetCourseByCourseId(int courseId)
        {
            List<Course> GetCourseByCourseId = courseManager.GetCourseByCourseId(courseId);
            return Json(GetCourseByCourseId);
        }

        
    }
}