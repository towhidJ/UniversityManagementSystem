using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.Mvc;
using UniversityManagementSystemMVCApp.Getway;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Manager
{
    public class EnrollCourseManager
    {
        private EnrollCourseGetway enrollCourseGetway;

        public EnrollCourseManager()
        {
            enrollCourseGetway = new EnrollCourseGetway();
        }

        public string Save(EnrollCourse enrollCourse)
        {
            if (enrollCourseGetway.IsCourseExsists(enrollCourse))
            {
                return "This Course Already Exist";
            }
            else
            {
                int rowAffect = enrollCourseGetway.Save(enrollCourse);
                if (rowAffect > 0)
                {
                    return "Enrolled Successfuly";
                }
                else
                {
                    return "Enrolled Failed";
                }
            }
        }

        public List<SelectListItem> GetSelectListItemsForDropdown()
        {
            List<EnrollCourse> students = enrollCourseGetway.AllStudent();

            List<SelectListItem> selectListItems = new List<SelectListItem>();
            selectListItems.Add(new SelectListItem()
            {
                Text = "--Select--",
                Value = ""
            });
            foreach (EnrollCourse student in students)
            {
                SelectListItem selectListItem = new SelectListItem();
                selectListItem.Text = student.RegistrationNo;
                selectListItem.Value = student.Id.ToString();
                selectListItems.Add(selectListItem);
            }
            return selectListItems;
        }


        public List<SelectListItem> AllStudentByTeacherId(int teacherId)
        {
            List<EnrollCourse> students = enrollCourseGetway.AllStudentByTecherId(teacherId);

            List<SelectListItem> selectListItems = new List<SelectListItem>();
            selectListItems.Add(new SelectListItem()
            {
                Text = "--Select--",
                Value = ""
            });
            foreach (EnrollCourse student in students)
            {
                SelectListItem selectListItem = new SelectListItem();
                selectListItem.Text = student.RegistrationNo;
                selectListItem.Value = student.Id.ToString();
                selectListItems.Add(selectListItem);
            }
            return selectListItems;
        }

        public List<SelectListItem> StudentResultByEmail(int uid)
        {
            List<EnrollCourse> students = enrollCourseGetway.StudentResultById(uid);

            List<SelectListItem> selectListItems = new List<SelectListItem>();
            selectListItems.Add(new SelectListItem()
            {
                Text = "--Select--",
                Value = ""
            });
            foreach (EnrollCourse student in students)
            {
                SelectListItem selectListItem = new SelectListItem();
                selectListItem.Text = student.RegistrationNo;
                selectListItem.Value = student.Id.ToString();
                selectListItems.Add(selectListItem);
            }
            return selectListItems;
        }


        public List<EnrollCourse> GetCourseByStudentId(int registrationId)
        {
            return enrollCourseGetway.GetCourseByStudentId(registrationId);
        }
    }
}