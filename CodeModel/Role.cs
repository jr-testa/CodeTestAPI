//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CodeModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class Role
    {
        public Role()
        {
            this.UserRoles = new HashSet<UserRole>();
        }
    
        public int RoleID { get; set; }
        public string RoleName { get; set; }
    
        public virtual ICollection<UserRole> UserRoles { get; set; }
    }
}
