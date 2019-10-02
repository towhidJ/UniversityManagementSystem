using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystemMVCApp.Getway.ViewGetway;
using UniversityManagementSystemMVCApp.Models.ViewModel;

namespace UniversityManagementSystemMVCApp.Manager.ViewManager
{
    public class ClassScheduleManager
    {
        private ClassScheduleGetway classScheduleGetway;

        public ClassScheduleManager()
        {
            classScheduleGetway = new ClassScheduleGetway();
        }

        public List<ClassScheduleView> GetCourseByDepartmentId(int departmentId)
        {
            return classScheduleGetway.GetCourseByDepartmentId(departmentId);
        }

        public List<ClassScheduleView> GetCourseIdByDepId(int departmentId)
        {
            return classScheduleGetway.GetCourseIdByDepId(departmentId);
        }
        //<---Course Schedule--->
        //public string GetAllSchedule(int department)
        //{
        //    List<ClassScheduleView> AllSchedule = classScheduleGetway.GetAllSchedule(department);
        //    string scheduleInfo = "";
        //    foreach (var schedule in AllSchedule)
        //    {
        //        scheduleInfo += "R.No: " + schedule.RoomNo + ", " + schedule.DayName + ", " + schedule.FromTime.ToShortTimeString() +
        //                        " - " + schedule.ToTime.ToShortTimeString() + ";<br />";
        //    }
        //    return scheduleInfo;
        //}

        public List<ClassScheduleView> GetClassSchedule(int departmentId)
        {
            return classScheduleGetway.GetClassSchedule(departmentId);
        }
    }
}