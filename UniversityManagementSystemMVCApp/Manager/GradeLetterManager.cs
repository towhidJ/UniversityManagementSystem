using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemMVCApp.Getway;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Manager
{
    public class GradeLetterManager
    {
        private GradeLetterGetway gradeLetterGetway;

        public GradeLetterManager()
        {
            gradeLetterGetway = new GradeLetterGetway();
        }
        public List<SelectListItem> GetSelectListItemsForDropdown()
        {
            List<GradeLetter> gradeLetters = gradeLetterGetway.AllGradeLetters();

            List<SelectListItem> selectListItems = new List<SelectListItem>();
            selectListItems.Add(new SelectListItem()
            {
                Text = "--Select--",
                Value = ""
            });
            foreach (GradeLetter grade in gradeLetters)
            {
                SelectListItem selectListItem = new SelectListItem();
                selectListItem.Text = grade.GradeLetterMarkes;
                selectListItem.Value = grade.Id.ToString();
                selectListItems.Add(selectListItem);
            }
            return selectListItems;
        }
    }
}