using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystemMVCApp.Getway;
using UniversityManagementSystemMVCApp.Models;
using UniversityManagementSystemMVCApp.Models.ViewModel;

namespace UniversityManagementSystemMVCApp.Manager
{
    public class AllocateClassRoomManager
    {
        private AllocateClassRoomGetway allocateClassRoomGetway;
        public AllocateClassRoomManager()
        {
            allocateClassRoomGetway = new AllocateClassRoomGetway();
        }
        public string Save(AllocateClass allocateClass)
        {
            if (allocateClass.FromTime > allocateClass.ToTime)
            {
                return "This Time is not Avaiable";
            }
            bool isTimeClassAllocateValid = IsTimeClassAllocateValid(allocateClass.DayId, allocateClass.RoomId, allocateClass.FromTime, allocateClass.ToTime);
            if (isTimeClassAllocateValid == false)
            {
                int rowAffect = allocateClassRoomGetway.Save(allocateClass);
                if (rowAffect > 0)
                {
                    return "Save Successfully";
                }
                else
                {
                    return "Save Failed";
                }
            }
            return "The Shedule Time Class Aleardy Exixts";
        }

        private bool IsTimeClassAllocateValid(int DayId, int RoomId, DateTime FromTime, DateTime ToTime)
        {
            List<AllocateClass> allocateClassroomses = allocateClassRoomGetway.GetTimeAllocate(DayId, RoomId, FromTime, ToTime);

            foreach (AllocateClass allocate in allocateClassroomses)
            {
                if ((allocate.DayId == DayId && RoomId == allocate.RoomId) &&
                    (FromTime < allocate.FromTime && ToTime > allocate.ToTime) ||
                    (FromTime < allocate.FromTime && ToTime > allocate.ToTime) || (FromTime == allocate.FromTime) ||
                    (allocate.FromTime < FromTime && allocate.ToTime > FromTime))
                {
                    return true;
                }
            }
            return false;
        }

        
        //<--------Unallocate Classs---------->

        public string UpdateClass()
        {
            int rowAffect = allocateClassRoomGetway.UpdateClass();
            if (rowAffect > 0)
            {
                return "Unallocate Successfully";
            }
            else
            {
                return "Unallocate Failed";
            }

        }
        public bool isActionExist()
        {
            return allocateClassRoomGetway.isActionExist();
        }
    }
}