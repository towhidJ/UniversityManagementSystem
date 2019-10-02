using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemMVCApp.Getway;
using UniversityManagementSystemMVCApp.Models;
using UniversityManagementSystemMVCApp.Models.ViewModel;

namespace UniversityManagementSystemMVCApp.Manager
{
    public class StudentManager
    {
        private StudentGetway studentGetway;

        public StudentManager()
        {
            studentGetway = new StudentGetway();
        }
        public string Save(Student student)
        {
            if (studentGetway.IsNameExsists(student))
            {
                return "This Email Already Exist";
            }
            else
            {
                int rowAffect = studentGetway.Save(student);
                if (rowAffect > 0)
                {
                    return "Registered Successfully\n" + student.StudentName + "\nRegistration No: " + student.RegistrationNo + "\nAddress: " + student.Address + "\nEmail: " + student.Email + "\nPhone: " + student.ContactNo;
                }
                else
                {
                    return "Failed";
                }
            }
        }
        public int GetAllStudent(int departmentId)
        {
            return studentGetway.GetAllStudent(departmentId);
        }
        public Student StudentById(int studentId)
        {
            return studentGetway.StudentById(studentId);
        }


        public List<SelectListItem> GetSelectListItemsForDropdown()
        {
            List<Student> students = studentGetway.AllStudent();

            List<SelectListItem> selectListItems = new List<SelectListItem>();
            selectListItems.Add(new SelectListItem()
            {
                Text = "--Select--",
                Value = ""
            });
            foreach (Student student in students)
            {
                SelectListItem selectListItem = new SelectListItem();
                selectListItem.Text = student.RegistrationNo;
                selectListItem.Value = student.Id.ToString();
                selectListItems.Add(selectListItem);
            }
            return selectListItems;
        }

       
    }
}