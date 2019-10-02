using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystemMVCApp.Models;
using UniversityManagementSystemMVCApp.Models.ViewModel;

namespace UniversityManagementSystemMVCApp.Getway
{
    public class AllocateClassRoomGetway:BaseGetway
    {

        //------AllocateClassRoom------//
        public int Save(AllocateClass allocateClass)
        {
            string query = "INSERT INTO ClassAllocateTB(DepartmentId,CourseId,DayId,RoomId,FromTime,ToTime,Action) VALUES('"+allocateClass.DepartmentId+"','"+allocateClass.CourseId+"','"+allocateClass.DayId+"','"+allocateClass.RoomId+"','"+allocateClass.FromTime+"','"+allocateClass.ToTime+"','"+1+"')";
            Command = new SqlCommand(query,Connection);
            Connection.Open();
            int rowAffact = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffact;

        }

        public List<AllocateClass> GetTimeAllocate(int dayId, int roomId, DateTime fromTime, DateTime toTime)
        {
            string query = "SELECT * FROM ClassAllocateTB WHERE RoomId=" + roomId + " AND DayId=" + dayId + " AND Action = 1";
            Command = new SqlCommand(query, Connection);
            List<AllocateClass> allocateClassroomses = new List<AllocateClass>();
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                AllocateClass allocate = new AllocateClass();
                allocate.Id = Convert.ToInt32(Reader["Id"]);
                allocate.DepartmentId = Convert.ToInt32(Reader["DepartmentId"]);
                allocate.CourseId = Convert.ToInt32(Reader["CourseId"]);
                allocate.DayId = Convert.ToInt32(Reader["DayId"]);
                allocate.RoomId = Convert.ToInt32(Reader["RoomId"]);
                allocate.FromTime = Convert.ToDateTime(Reader["FromTime"]);
                allocate.ToTime = Convert.ToDateTime(Reader["ToTime"]);
                allocateClassroomses.Add(allocate);
            }
            Connection.Close();
            return allocateClassroomses;
        }



       //<-------Unallocated Class------->//

       public int UpdateClass()
       {
           string query = "UPDATE ClassAllocateTB SET Action=0";
           Command = new SqlCommand(query, Connection);
           Connection.Open();
           int rowAffect = Command.ExecuteNonQuery();
           Connection.Close();
           return rowAffect;
       }

       public bool isActionExist()
       {
           string query = "SELECT * FROM ClassAllocateTB WHERE Action=1";
           Command = new SqlCommand(query, Connection);
           Connection.Open();
           Reader = Command.ExecuteReader();
           bool IsExsists = Reader.HasRows;
           Connection.Close();
           return IsExsists;
       }
        
    }
}