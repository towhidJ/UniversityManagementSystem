using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemMVCApp.Getway;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Manager
{
    public class RoomManager
    {
        private RoomGetway roomGetway;

        public RoomManager()
        {
            roomGetway = new RoomGetway();
        }
        public List<Room> GetAllRooms()
        {
            return roomGetway.GetAllRooms();
        }

        public List<SelectListItem> GetSelectListRoomsForDropdown()
        {
            List<Room> rooms = GetAllRooms();

            List<SelectListItem> selectListItems = new List<SelectListItem>();
            selectListItems.Add(new SelectListItem()
            {
                Text = "--Select--",
                Value = ""
            });
            foreach (Room room in rooms)
            {
                SelectListItem selectListItem = new SelectListItem();
                selectListItem.Text = room.RoomNo;
                selectListItem.Value = room.Id.ToString();
                selectListItems.Add(selectListItem);
            }
            return selectListItems;
        }
    }
}