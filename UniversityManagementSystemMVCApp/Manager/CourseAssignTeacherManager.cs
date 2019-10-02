using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystemMVCApp.Getway;
using UniversityManagementSystemMVCApp.Models;
using UniversityManagementSystemMVCApp.Models.ViewModel;

namespace UniversityManagementSystemMVCApp.Manager
{
    public class CourseAssignTeacherManager
    {
        private CourseAssignTeacherGetway courseAssignTeacherGetway;

        public CourseAssignTeacherManager()
        {
            courseAssignTeacherGetway = new CourseAssignTeacherGetway();
        }
        public string Save(CourseAssignTeacher courseAssignTeacher)
        {

            if (courseAssignTeacherGetway.IsSubjectExsists(courseAssignTeacher))
            {
                return "The Course is already Assigned";
            }
            else
            {
                float Credit = Convert.ToSingle(courseAssignTeacherGetway.GetCourseId(courseAssignTeacher.CourseId).Credit);
                float AvailableCredit = Convert.ToSingle(courseAssignTeacherGetway.GetAvailableCreditByTeacherId(courseAssignTeacher.TeacherId).ReminingCredit);
                float RemainingCredit = (AvailableCredit - Credit);


                int rowAffect = courseAssignTeacherGetway.UpdateTeacher(courseAssignTeacher.TeacherId, RemainingCredit);
                if (rowAffect > 0)
                {
                    int affect = courseAssignTeacherGetway.Save(courseAssignTeacher);
                    if (affect > 0)
                    {
                        return "Save Successfully";

                    }
                    else
                    {
                        return "Failed";
                    }
                }

                else
                {
                    return "Failed";
                }
            }

        }

        public List<ShowAssignView> GetAllAssignCourse(int departmentId)
        {
            return courseAssignTeacherGetway.GetAllAssignCourse(departmentId);
        }

        
    }
}