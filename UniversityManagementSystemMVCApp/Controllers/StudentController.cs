using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemMVCApp.Manager;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Controllers
{
    [Authorize]
    public class StudentController : Controller
    {
        SmSEntities db = new SmSEntities();
        //
        // GET: /Student/
        private DepartmentManager departmentManager;
        private StudentManager studentManager;

        public StudentController()
        {
            departmentManager = new DepartmentManager();
            studentManager = new StudentManager();
        }
        [HttpGet]
        [Authorize(Roles = "Admin")]
        public ActionResult Save()
        {
            ViewBag.Departments = departmentManager.GetSelectListItemsForDropdown();
            return View();
        }

        [HttpPost]
        [Authorize(Roles = "Admin")]
        public ActionResult Save(Student student)
        {
            student.RegistrationNo = registrationNumber(student.DepartmentId, student.RegisterDate);
            ViewBag.Departments = departmentManager.GetSelectListItemsForDropdown();
            ViewBag.StudentReg = student.RegistrationNo;
            
            ViewBag.Message = studentManager.Save(student);
            ViewBag.Departments = departmentManager.GetSelectListItemsForDropdown();
            return View();
        }


        public ActionResult Show()
        {
            var studentList = db.StudentTBs.ToList();
            return View(studentList);
        }

        public string registrationNumber(int departmentId, DateTime registerdate)
        {
            string departmentCode = departmentManager.GetDepartmentById(departmentId).DepartmentCode;
            int year = registerdate.Year;

            int num = 0;
            int count = studentManager.GetAllStudent(departmentId);
            count = count + 1;
            string countString = count.ToString();
            if (countString.Length == 1)
            {
                string newNumber = "00" + countString;
                string RegistrationNo = departmentCode + "-" + year.ToString() + "-" + newNumber;
                return RegistrationNo;
            }
            else if (countString.Length == 2)
            {
                string newNumber = "0" + countString;
                string RegistrationNo = departmentCode + "-" + year.ToString() + "-" + newNumber;
                return RegistrationNo;
            }
            else
            {
                string newNumber = countString;
                string RegistrationNo = departmentCode + "-" + year.ToString() + "-" + newNumber;
                return RegistrationNo;
            }
        }

    }
}