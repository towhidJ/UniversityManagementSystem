using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using UniversityManagementSystemMVCApp.Models;
using UniversityManagementSystemMVCApp.Models.ViewModel;

namespace UniversityManagementSystemMVCApp.Getway.ViewGetway
{
    public class ClassScheduleGetway:BaseGetway
    {


        public List<ClassScheduleView> GetCourseByDepartmentId(int departmentId)
        {
            string query = "SELECT * FROM ClassAllocatedView WHERE DepartmentId='" + departmentId + "' AND CourseAction=1 AND Action = 1 ";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<ClassScheduleView> departments = new List<ClassScheduleView>();
            while (Reader.Read())
            {
                ClassScheduleView course = new ClassScheduleView();
                course.CourseId = Convert.ToInt32(Reader["CourseId"]);
                course.CourseName = Reader["CourseName"].ToString();
                course.CourseCode = Reader["CourseCode"].ToString();

                departments.Add(course);
            }
            Connection.Close();
            return departments;
        }


        public List<ClassScheduleView> GetCourseIdByDepId(int departmentId)
        {
            string query = "SELECT * FROM ClassAllocatedView WHERE DepartmentId='" + departmentId + "' AND Action = 1";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            List<ClassScheduleView>GetCourse = new List<ClassScheduleView>();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                ClassScheduleView schedule = new ClassScheduleView();
                schedule.CourseId = Convert.ToInt32(Reader["CourseId"]);
                GetCourse.Add(schedule);
            }
            Connection.Close();
            return GetCourse;
        }
        //<---Corse Schdule --->

        //public List<ClassScheduleView> GetAllSchedule(int departmentId)
        //{
        //    string query = "SELECT * FROM ClassAllocatedView WHERE DepartmentId=" + departmentId + " ";
        //    Command = new SqlCommand(query, Connection);
        //    Connection.Open();
        //    Reader = Command.ExecuteReader();
        //    List<ClassScheduleView> scheduleList = new List<ClassScheduleView>();
        //    while (Reader.Read())
        //    {
        //        ClassScheduleView schedule = new ClassScheduleView();
        //        schedule.CourseCode = Reader["CourseCode"].ToString();
        //        schedule.CourseName = Reader["CourseName"].ToString();
        //        schedule.RoomNo = Reader["RoomNo"].ToString();
        //        schedule.DayName = Reader["DayName"].ToString();
        //        schedule.FromTime = Convert.ToDateTime(Reader["FromTime"].ToString());
        //        schedule.ToTime = Convert.ToDateTime(Reader["ToTime"].ToString());
        //        scheduleList.Add(schedule);
        //    }
        //    Connection.Close();
        //    return scheduleList;
        //}




        public List<ClassScheduleView> GetClassSchedule(int departmentId)
        {
            string query = "SELECT * FROM ClassAllocatedView WHERE DepartmentId=" + departmentId + " AND Action = 1 ";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            
            List<ClassScheduleView> scheduleList = new List<ClassScheduleView>();
            Hashtable ht = new Hashtable();
            Reader = Command.ExecuteReader();
            ClassScheduleView schedule;
            while (Reader.Read())
            {
                string courseCode = Reader["CourseCode"].ToString();
                string courseName = Reader["CourseName"].ToString();
                string roomNo = Reader["RoomNo"].ToString();
                string dayName = Reader["DayName"].ToString();
                string fromTime = Reader["FromTime"].ToString();
                string toTime = Reader["ToTime"].ToString();

                string scheduleInfo = "R.No: " + roomNo + ", " + dayName + ", " + fromTime +
                                       " - " + toTime + ";<br />";

                if (scheduleInfo == "")
                {
                    scheduleInfo = "Not Scheduled Yet";
                }

                if (!ht.ContainsKey(courseCode))
                {
                    schedule = new ClassScheduleView();
                    schedule.CourseCode = courseCode;
                    schedule.CourseName = courseName;
                    schedule.Schedule = scheduleInfo;
                    ht[courseCode] = schedule;
                    scheduleList.Add(schedule);
                }
                else
                {
                    schedule = (ClassScheduleView) ht[courseCode];
                    schedule.Schedule = schedule.Schedule + scheduleInfo;
                }
                
            }
            Connection.Close();
            return scheduleList;
        } 


    }
}