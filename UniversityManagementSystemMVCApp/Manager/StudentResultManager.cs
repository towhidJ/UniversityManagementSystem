using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystemMVCApp.Getway;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Manager
{
    public class StudentResultManager
    {
        private StudentResultGetway studentResultGetway;

        public StudentResultManager()
        {
            studentResultGetway = new StudentResultGetway();
        }
        public string Save(StudentResult studentResult)
        {

            if (studentResultGetway.IsResultExists(studentResult))
            {
                return "This Course Result Already Assign";
            }
            else
            {
               
                int rowAffect = studentResultGetway.Save(studentResult);
                if (rowAffect > 0)
                {
                    return "Course Result Assign Successfuly";
                }
                else
                {
                    return "Course Result Assign Failed";
                }
            }
        }

        public List<StudentResult> GetAllStudentResults(int studentId)
        {
            return studentResultGetway.GetAllStudentResults(studentId);
        }
    }
}