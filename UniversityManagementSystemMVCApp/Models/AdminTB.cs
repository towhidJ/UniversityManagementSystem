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
    
    public partial class AdminTB
    {
        public int Id { get; set; }
        public Nullable<int> RoleId { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
    
        public virtual RoleTB RoleTB { get; set; }
    }
}
