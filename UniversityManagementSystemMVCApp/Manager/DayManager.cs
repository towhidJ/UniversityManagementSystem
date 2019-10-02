using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemMVCApp.Getway;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Manager
{
    public class DayManager
    {
        private DayGetway dayGetway;

        public DayManager()
        {
            dayGetway = new DayGetway();
        }

        public List<Day> GetAllDays()
        {
            return dayGetway.GetAllDays();
        }


        public List<SelectListItem> GetSelectListDaysForDropdown()
        {
            List<Day> days = GetAllDays();

            List<SelectListItem> selectListItems = new List<SelectListItem>();
            selectListItems.Add(new SelectListItem()
            {
                Text = "--Select--",
                Value = ""
            });
            foreach (Day day in days)
            {
                SelectListItem selectListItem = new SelectListItem();
                selectListItem.Text = day.DayName;
                selectListItem.Value = day.Id.ToString();
                selectListItems.Add(selectListItem);
            }
            return selectListItems;
        }
    }
}