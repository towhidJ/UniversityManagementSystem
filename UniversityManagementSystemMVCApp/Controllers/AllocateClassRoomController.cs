using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemMVCApp.Getway.ViewGetway;
using UniversityManagementSystemMVCApp.Manager;
using UniversityManagementSystemMVCApp.Manager.ViewManager;
using UniversityManagementSystemMVCApp.Models;
using UniversityManagementSystemMVCApp.Models.ViewModel;

namespace UniversityManagementSystemMVCApp.Controllers
{
    [Authorize]
    public class AllocateClassRoomController : Controller
    {
        private DepartmentManager departmentManager;
        private RoomManager roomManager;
        private DayManager dayManager;
        private CourseManager courseManager;
        private ClassScheduleManager classScheduleManager;
        private AllocateClassRoomManager allocateClassRoomManager;

        public AllocateClassRoomController()
        {
            departmentManager = new DepartmentManager();
            courseManager = new CourseManager();
            allocateClassRoomManager = new AllocateClassRoomManager();
            roomManager = new RoomManager();
            dayManager = new DayManager();
            classScheduleManager = new ClassScheduleManager();
        }
        //
        // GET: /AllocateClassRoom/
        [HttpGet]
        [Authorize(Roles = "Admin")]
        public ActionResult Save()
        {
            ViewBag.Departments = departmentManager.GetSelectListItemsForDropdown();
            ViewBag.Rooms = roomManager.GetSelectListRoomsForDropdown();
            ViewBag.Days = dayManager.GetSelectListDaysForDropdown();
            return View();
        }
        [HttpPost]
        public ActionResult Save(AllocateClass allocateClass)
        {
            ViewBag.Message = allocateClassRoomManager.Save(allocateClass);
            ViewBag.Departments = departmentManager.GetSelectListItemsForDropdown();
            ViewBag.Rooms = roomManager.GetSelectListRoomsForDropdown();
            ViewBag.Days = dayManager.GetSelectListDaysForDropdown();
            return View();
        }

        public JsonResult GetCourseByDepartmentId(int departmentId)
        {
            List<Course> GetCourseByDepartment = courseManager.GetCourseByDepartmentId(departmentId);
            return Json(GetCourseByDepartment);
        }


        //<---- ClassSchedule----->

        [HttpGet]
        public ActionResult ClassSchedule()
        {
            ViewBag.Departments = departmentManager.GetSelectListItemsForDropdown();
            return View();
        }
        [HttpPost]
        public ActionResult ClassSchedule(AllocateClass allocateClass)
        {
            ViewBag.Departments = departmentManager.GetSelectListItemsForDropdown();
            return View();
        }

        public JsonResult GetClassScheduleByDepartmentId(int departmentId)
        {
            AllocateClass allocateClass = new AllocateClass();
            List<ClassScheduleView> courseBy = classScheduleManager.GetCourseByDepartmentId(departmentId);
            List<ClassScheduleView> GetCourseByDepartment = classScheduleManager.GetCourseByDepartmentId(departmentId);
            List<ClassScheduleView> schedules = classScheduleManager.GetClassSchedule(departmentId);
            //string getSchedule = classScheduleManager.GetAllSchedule(departmentId);
            //foreach (var course in GetCourseByDepartment)
            //{
                
            //    if (getSchedule == "")
            //    {
            //        getSchedule = "Not Scheduled Yet";
            //    }
            //    ClassScheduleView schedule = new ClassScheduleView();
            //    schedule.CourseCode = course.CourseCode;
            //    schedule.CourseName = course.CourseName;
            //    schedule.Schedule = getSchedule;
            //    schedules.Add(schedule);
            //}
            return Json(schedules);
        }
    }
}