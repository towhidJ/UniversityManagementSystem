//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace UniversityManagementSystemMVCApp.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class NetClubAdvTB
    {
        public int Id { get; set; }
        public int TeacherId { get; set; }
        public Nullable<System.DateTime> JoinDate { get; set; }
    
        public virtual TeacherTB TeacherTB { get; set; }
    }
}
