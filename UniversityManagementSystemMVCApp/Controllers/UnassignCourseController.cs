using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;
using UniversityManagementSystemMVCApp.Manager;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Controllers
{
    [Authorize]
    public class UnassignCourseController : Controller
    {
        private CourseManager courseManager;
        private TeacherManager teacherManager;

        public UnassignCourseController()
        {
            courseManager = new CourseManager();
            teacherManager = new TeacherManager();
        }
        //
        // GET: /UnassignCourse/

        [HttpGet]
        public ActionResult Unassign()
        {
            return View();
        }
        [HttpPost]
        [Authorize(Roles = "Admin")]
        public ActionResult Unassign(Course course)
        {
            ViewBag.T = teacherManager.UpdateTeacher();
            if (courseManager.isActionExist())
            {
                
                ViewBag.Message = courseManager.updateCourseAction();

            }
            else
            {
                ViewBag.Message = "Already Unassigned";
            }
            return View();
        }

        //public string UpdateTeacher(Teacher teacher)
        //{
        //    if (teacherManager.isTeacherExist(teacher))
        //    {
        //        foreach (var tec in teacherManager.GetTeacherByDepartmentId(teacher.DepartmentId))
        //        {
        //            string message = teacherManager.UpdateTeacher(teacher);
        //            return message;
        //        }
        //    }

        //    return "no";
        //}

        public JsonResult UnassignJson()
        {
            ViewBag.T = teacherManager.UpdateTeacher();
            string message;
            if (courseManager.isActionExist())
            {
                
                message = courseManager.updateCourseAction();

            }
            else
            {
                message = "Already Unassigned";
            }
            return Json(message);
        }
    }
}