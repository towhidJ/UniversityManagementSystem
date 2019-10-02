using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemMVCApp.Getway;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Manager
{
    public class SemesterManager
    {
        private SemesterGetway semesterGateway;

        public SemesterManager()
        {
            semesterGateway = new SemesterGetway();
        }

        public List<SelectListItem> GetSelectListItemsForSemesterDropdown()
        {
            List<Semester> semesters = semesterGateway.GetAllSemesters();
            List<SelectListItem> selectListItems = new List<SelectListItem>();
            selectListItems.Add(new SelectListItem()
            {
                Text = "--Select--",
                Value = ""
            });
            foreach (Semester semester in semesters)
            {
                SelectListItem selectListItem = new SelectListItem();
                selectListItem.Text = semester.SemesterName;
                selectListItem.Value = semester.Id.ToString();
                selectListItems.Add(selectListItem);
            }
            return selectListItems;
        } 
    }
}