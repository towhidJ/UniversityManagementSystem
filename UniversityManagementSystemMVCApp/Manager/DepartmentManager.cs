using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemMVCApp.Getway;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Manager
{
    public class DepartmentManager
    {
        private DepartmentGetway departmentGetway;

        public DepartmentManager()
        {
            departmentGetway = new DepartmentGetway();
        }
        public string Save(Department department)
        {
            bool isDepartmentNameExists = departmentGetway.IsDepartmentNameExists(department.DepartmentName);
            bool isDepartmentCodeExists = departmentGetway.IsDepartmentCodeExists(department.DepartmentCode);

            if (isDepartmentNameExists)
            {
                return "Department Name Already Exists";
            }
            else if (isDepartmentCodeExists)
            {
                return "Department Code Already Exists";
            }
            else
            {
                int rowAffact = departmentGetway.Save(department);
                if (rowAffact > 0)
                {
                    return "Department Record Add Succefull";
                }
                return "Department Record Add Failed";
            }

            
                        
        }

        public List<Department> ShowAllDepartments()
        {
            return departmentGetway.ShowAllDepartments();
        }

        public List<SelectListItem> GetSelectListItemsForDropdown()
        {
            List<Department> departments = ShowAllDepartments();

            List<SelectListItem> selectListItems = new List<SelectListItem>();
            selectListItems.Add(new SelectListItem()
            {
                Text = "--Select--",
                Value = ""
            });
            foreach (Department department in departments)
            {
                SelectListItem selectListItem = new SelectListItem();
                selectListItem.Text = department.DepartmentName;
                selectListItem.Value = department.Id.ToString();
                selectListItems.Add(selectListItem);
            }
            return selectListItems;
        }

        public Department GetDepartmentById(int departmentId)
        {
            return departmentGetway.GetDepartmentById(departmentId);
        }
    }
}