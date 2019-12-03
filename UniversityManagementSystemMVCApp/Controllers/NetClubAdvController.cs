using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemMVCApp.Models;

namespace UniversityManagementSystemMVCApp.Controllers
{
    public class NetClubAdvController : Controller
    {
        private SmSEntities db = new SmSEntities();

        // GET: NetClubAdv
        public ActionResult Index()
        {
            var netClubAdvTBs = db.NetClubAdvTBs.Include(n => n.TeacherTB);
            return View(netClubAdvTBs.ToList());
        }

        public ActionResult show()
        {
            var netClubAdvTBs = db.NetClubAdvTBs.Include(n => n.TeacherTB);
            return View(netClubAdvTBs.ToList());
        }

        // GET: NetClubAdv/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NetClubAdvTB netClubAdvTB = db.NetClubAdvTBs.Find(id);
            if (netClubAdvTB == null)
            {
                return HttpNotFound();
            }
            return View(netClubAdvTB);
        }

        // GET: NetClubAdv/Create
        public ActionResult Create()
        {
            ViewBag.TeacherId = new SelectList(db.TeacherTBs, "Id", "TeacherName");
            return View();
        }

        // POST: NetClubAdv/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,TeacherId,JoinDate")] NetClubAdvTB netClubAdvTB)
        {
            if (ModelState.IsValid)
            {
                db.NetClubAdvTBs.Add(netClubAdvTB);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.TeacherId = new SelectList(db.TeacherTBs, "Id", "TeacherName", netClubAdvTB.TeacherId);
            return View(netClubAdvTB);
        }

        // GET: NetClubAdv/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NetClubAdvTB netClubAdvTB = db.NetClubAdvTBs.Find(id);
            if (netClubAdvTB == null)
            {
                return HttpNotFound();
            }
            ViewBag.TeacherId = new SelectList(db.TeacherTBs, "Id", "TeacherName", netClubAdvTB.TeacherId);
            return View(netClubAdvTB);
        }

        // POST: NetClubAdv/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,TeacherId,JoinDate")] NetClubAdvTB netClubAdvTB)
        {
            if (ModelState.IsValid)
            {
                db.Entry(netClubAdvTB).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TeacherId = new SelectList(db.TeacherTBs, "Id", "TeacherName", netClubAdvTB.TeacherId);
            return View(netClubAdvTB);
        }

        // GET: NetClubAdv/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NetClubAdvTB netClubAdvTB = db.NetClubAdvTBs.Find(id);
            if (netClubAdvTB == null)
            {
                return HttpNotFound();
            }
            return View(netClubAdvTB);
        }

        // POST: NetClubAdv/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NetClubAdvTB netClubAdvTB = db.NetClubAdvTBs.Find(id);
            db.NetClubAdvTBs.Remove(netClubAdvTB);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
