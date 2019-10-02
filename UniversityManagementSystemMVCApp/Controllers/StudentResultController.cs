using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
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
        [Authorize(Roles = "Admin")]
        public ActionResult Save()
        {

            ViewBag.RegNo = enrollCourseManager.GetSelectListItemsForDropdown();
            ViewBag.Grades = gradeLetterManager.GetSelectListItemsForDropdown();
            return View();
        }
        [HttpPost]
        public ActionResult Save(StudentResult studentResult)
        {
            ViewBag.Message = studentResultManager.Save(studentResult);
            ViewBag.RegNo = enrollCourseManager.GetSelectListItemsForDropdown();
            ViewBag.Grades = gradeLetterManager.GetSelectListItemsForDropdown();
            return View();
        }

        [HttpGet]
        [Authorize(Roles = "Admin, Student")]
        public ActionResult Show()
        {
            ViewBag.RegNo = enrollCourseManager.GetSelectListItemsForDropdown();
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
            List<StudentResult> AllCourseView = studentViewManager.GetCourseByEnrollCourse(studentId);
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