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
    public class TeacherManager
    {
        private TeacherGetway teacherGetway;

        public TeacherManager()
        {
            teacherGetway = new TeacherGetway();
        }
        public string Save(Teacher teacher)
        {
            bool isEmailExists = teacherGetway.IsEmailExists(teacher.Email);

            if (isEmailExists)
            {
                return "Email Alardy Exists";
            }
            else
            {
                int rowAffact = teacherGetway.Save(teacher);
                if (rowAffact > 0)
                {
                    return "Teacher Recoard Add Succefull";
                }
                return "Teacher Recoard Add Failed";
            }
        }

        public List<Teacher> GetTeacherId(int teacherId)
        {
            return teacherGetway.GetTeacherId(teacherId);
        }

        public List<Teacher> GetTeacherByDepartmentId(int departmentId)
        {
            return teacherGetway.GetTeacherByDepartmentId(departmentId);
        }

        public List<SelectListItem> GetSelectListItemsForDropdown()
        {
            List<Teacher> teachers = teacherGetway.ShowAllTeachers();

            List<SelectListItem> selectListItems = new List<SelectListItem>();
            selectListItems.Add(new SelectListItem()
            {
                Text = "--Select--",
                Value = ""
            });
            foreach (Teacher teacher in teachers)
            {
                SelectListItem selectListItem = new SelectListItem();
                selectListItem.Text = teacher.TeacherName;
                selectListItem.Value = teacher.Id.ToString();
                selectListItems.Add(selectListItem);
            }
            return selectListItems;
        }

        public string UpdateTeacher()
        {
            int rowAffact = teacherGetway.UpdateTeacher();
            if (rowAffact > 0)
            {
                return "Finish";
            }

            return "Faild";
        }

        public bool isTeacherExist(Teacher teacher)
        {
            return teacherGetway.isTeacherExist(teacher);
        }
    }
}