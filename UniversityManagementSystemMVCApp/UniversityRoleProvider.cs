using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp
{
    public class UniversityRoleProvider : RoleProvider
    {
        public override string ApplicationName { get; set; }

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string[] GetAllRoles()
        {
            throw new NotImplementedException();
        }

        public override string[] GetRolesForUser(string username)
        {
            using (var context = new SmSEntities())
            {
                if (context.AdminTBs.Any(x => x.Email == username))
                {
                    var AdminResult = (from roleTB in context.RoleTBs
                        join adminTB in context.AdminTBs on roleTB.Id equals adminTB.RoleId
                        where adminTB.Email == username
                        select roleTB.Role).ToArray();
                    return AdminResult;
                }
                if (context.StudentTBs.Any(x => x.Email == username))
                {
                    var StudentResult = (from roleTB in context.RoleTBs
                        join studentTB in context.StudentTBs on roleTB.Id equals studentTB.RoleId
                        where studentTB.Email == username
                        select roleTB.Role).ToArray();
                    return StudentResult;
                }
                if (context.TeacherTBs.Any(x => x.Email == username))
                {
                    var TeacherResult = (from roleTB in context.RoleTBs
                        join teacherTB in context.TeacherTBs on roleTB.Id equals teacherTB.RoleId
                        where teacherTB.Email == username
                        select roleTB.Role).ToArray();
                    return TeacherResult;
                }


            }
            throw new NotImplementedException();
        }

        public override string[] GetUsersInRole(string roleName)
        {
            
            throw new NotImplementedException();
        }

        public override bool IsUserInRole(string username, string roleName)
        {
            throw new NotImplementedException();
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }
    }
}