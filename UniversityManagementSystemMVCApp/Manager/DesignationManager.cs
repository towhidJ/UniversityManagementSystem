using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemMVCApp.Getway;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Manager
{
    public class DesignationManager
    {
        private DesignationGetway designationGetway;

        public DesignationManager()
        {
            designationGetway = new DesignationGetway();
        }
        public List<Designation> GetAllDesignation()
        {
            return designationGetway.GetAllDesignation();
        }

        public List<SelectListItem> GetSelectListItemsForDesignationDropdown()
        {
            List<Designation> designations = GetAllDesignation();
            List<SelectListItem> selectListItems = new List<SelectListItem>();
            selectListItems.Add(new SelectListItem()
            {
                Text = "--Select--",
                Value = ""
            });
            foreach (Designation designation in designations)
            {
                SelectListItem selectListItem = new SelectListItem();
                selectListItem.Text = designation.DesignationName;
                selectListItem.Value = designation.Id.ToString();
                selectListItems.Add(selectListItem);
            }
            return selectListItems;
        } 
    }
}