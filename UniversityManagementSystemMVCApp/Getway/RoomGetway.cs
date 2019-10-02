using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Getway
{
    public class RoomGetway:BaseGetway
    {
        public List<Room> GetAllRooms()
        {
            string query = "SELECT * FROM RoomNoTB";
            Command  = new SqlCommand(query,Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Room>rooms = new List<Room>();
            while (Reader.Read())
            {
                Room room = new Room();
                room.Id = Convert.ToInt32(Reader["Id"]);
                room.RoomNo = Reader["RoomNo"].ToString();
                rooms.Add(room);
            }
            Connection.Close();
            return rooms;
        }
    }
}