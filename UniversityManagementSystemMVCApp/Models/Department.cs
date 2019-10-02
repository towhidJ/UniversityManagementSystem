using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityManagementSystemMVCApp.Models
{
    public class Department
    {
        public int Id { get; set; }
        [Required]
        [Display(Name = "Department Code")]
        [StringLength(10, MinimumLength = 3)]
        public string DepartmentCode { get; set; }
        [Required]
        [Display (Name = "Department Name")]
        [StringLength(50, MinimumLength = 7)]
        public string DepartmentName { get; set; }
    }
}