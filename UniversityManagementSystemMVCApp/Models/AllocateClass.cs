using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityManagementSystemMVCApp.Models
{
    public class AllocateClass
    {
        public int Id { get; set; }
        [Required]
        public int DepartmentId { get; set; }
        [Required]
        public int CourseId { get; set; }
        [Required]
        public int RoomId { get; set; }
        [Required]
        public int DayId { get; set; }
        [DataType(DataType.Time)]
        [Display(Name = "From")]
        public DateTime FromTime { get; set; }
        [DataType(DataType.Time)]
        [Display(Name = "To")]
        public DateTime ToTime { get; set; }


    }
}