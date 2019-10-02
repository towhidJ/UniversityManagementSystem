using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemMVCApp.Manager;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Controllers
{
    [Authorize]
    public class UnallocatedClassController : Controller
    {
        //
        // GET: /UnallocatedClass/

        private AllocateClassRoomManager allocateClassRoomManager;

        public UnallocatedClassController()
        {
            allocateClassRoomManager = new AllocateClassRoomManager();
        }

        [HttpGet]
        [Authorize(Roles = "Admin")]
        public ActionResult UnallocatedClass()
        {
            return View();
        }
        [HttpPost]
        [Authorize(Roles = "Admin")]
        public ActionResult UnallocatedClass(AllocateClass allocateClass)
        {
            if (allocateClassRoomManager.isActionExist())
            {
                ViewBag.Message = allocateClassRoomManager.UpdateClass();
            }
            else
            {
                ViewBag.Message = "Already Unallocate";
            }
            return View();
        }
        [Authorize(Roles = "Admin")]
        public ActionResult UnassignJson()
        {
            string message;
            if (allocateClassRoomManager.isActionExist())
            {
                message = allocateClassRoomManager.UpdateClass();
            }
            else
            {
                message = "Already Unallocate";
            }
            return Json(message);
        }
    }
}