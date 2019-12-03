using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Rotativa;
using UniversityManagementSystemMVCApp.Manager;
using UniversityManagementSystemMVCApp.Manager.ViewManager;
using UniversityManagementSystemMVCApp.Models;
using UniversityManagementSystemMVCApp.Models.ViewModel;

namespace UniversityManagementSystemMVCApp.Controllers
{
    [Authorize]
    public class StudentResultController : Controller
    {
        SmSEntities db = new SmSEntities();
        private StudentViewManager studentViewManager;
        private EnrollCourseManager enrollCourseManager;
        private StudentManager studentManager;
        private GradeLetterManager gradeLetterManager;
        private StudentResultManager studentResultManager;
        private Student student;

        public StudentResultController()
        {
            enrollCourseManager = new EnrollCourseManager();
            studentViewManager = new StudentViewManager();
            studentManager = new StudentManager();
            gradeLetterManager = new GradeLetterManager();
            studentResultManager = new StudentResultManager();
            student = new Student();
        }
        [Authorize(Roles = "Admin,Teacher")]
        public ActionResult Save()
        {
            var user = User.Identity.Name;
            var uid = db.TeacherTBs.Single(c => c.Email == user).Id;

            //ViewBag.RegNo = enrollCourseManager.GetSelectListItemsForDropdown();
            ViewBag.RegNo = enrollCourseManager.AllStudentByTeacherId(uid);
            ViewBag.Grades = gradeLetterManager.GetSelectListItemsForDropdown();
            return View();
        }
        [HttpPost]
        public ActionResult Save(StudentResult studentResult)
        {
            var user = User.Identity.Name;
            var uid = db.TeacherTBs.Single(c => c.Email == user).Id;
            ViewBag.Message = studentResultManager.Save(studentResult);
            //ViewBag.RegNo = enrollCourseManager.GetSelectListItemsForDropdown();
            ViewBag.RegNo = enrollCourseManager.AllStudentByTeacherId(uid);
            ViewBag.Grades = gradeLetterManager.GetSelectListItemsForDropdown();
            return View();
        }

        [HttpGet]
        [Authorize(Roles = "Admin, Student")]
        public ActionResult Show()
        {
            //ViewBag.RegNo = enrollCourseManager.GetSelectListItemsForDropdown();
            SmSEntities db = new SmSEntities();
            var user = User.Identity.Name;
            var uid = db.StudentTBs.Single(c => c.Email == user).Id;
            ViewBag.RegNo = enrollCourseManager.StudentResultByEmail(uid);
            return View();
        }
        //[HttpPost]
        //public ActionResult Show(StudentResult studentResult)
        //{
        //    ViewBag.RegNo = enrollCourseManager.GetSelectListItemsForDropdown();
        //    return View();
        //}
        public ActionResult ExportPDF(StudentResult studentResult)
        {
            ViewBag.StudentId = studentResult.StudentId;
            ViewBag.Dep = studentManager.StudentById(studentResult.StudentId).DepartmentName;
            ViewBag.Email = studentManager.StudentById(studentResult.StudentId).Email;
            ViewBag.Name = studentManager.StudentById(studentResult.StudentId).StudentName;
            ViewBag.Reg = studentManager.StudentById(studentResult.StudentId).RegistrationNo;
            ViewBag.Depertment = studentResult.DepartmentName;            
            ViewBag.All = studentResultManager.GetAllStudentResults(studentResult.StudentId).ToList();
            //List<StudentResult> GetAllStudentResults = studentResultManager.GetAllStudentResults(studentId);
            return View();
        }
        public JsonResult RegistrationNo(int studentId)
        {
            List<StudentResult> AllStudentView = studentViewManager.GetStudentByEnrollCourse(studentId);
            return Json(AllStudentView);
        }
        public JsonResult CourseByRegistrationNo(int studentId)
        {
            var user = User.Identity.Name;
            var teacherId = db.TeacherTBs.Single(c => c.Email == user).Id;
            //List<StudentResult> AllCourseView = studentViewManager.GetCourseByEnrollCourse(studentId);
            List<StudentResult> AllCourseView = studentViewManager.GetCourseByEnrollCourse(studentId,teacherId);
            return Json(AllCourseView);
        }

        public JsonResult ShowResult(int studentId)
        {
            List<StudentResult> GetAllStudentResults = studentResultManager.GetAllStudentResults(studentId);
            return Json(GetAllStudentResults);
        }

        public ActionResult Result(int studentId)
        {

            return new ActionAsPdf("ExportPDF", new { studentId = studentId });
        }

        
    }

}