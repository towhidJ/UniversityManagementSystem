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
    public class CodingClubAdvController : Controller
    {
        private SmSEntities db = new SmSEntities();

        // GET: CodingClubAdv
        public ActionResult Index()
        {
            var codingClubAdvTBs = db.CodingClubAdvTBs.Include(c => c.TeacherTB);
            return View(codingClubAdvTBs.ToList());
        }

        public ActionResult show()
        {
            var codingClubAdvTBs = db.CodingClubAdvTBs.Include(c => c.TeacherTB);
            return View(codingClubAdvTBs.ToList());
        }

        // GET: CodingClubAdv/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CodingClubAdvTB codingClubAdvTB = db.CodingClubAdvTBs.Find(id);
            if (codingClubAdvTB == null)
            {
                return HttpNotFound();
            }
            return View(codingClubAdvTB);
        }

        // GET: CodingClubAdv/Create
        public ActionResult Create()
        {
            ViewBag.TeacherId = new SelectList(db.TeacherTBs, "Id", "TeacherName");
            return View();
        }

        // POST: CodingClubAdv/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,TeacherId,JoinDate")] CodingClubAdvTB codingClubAdvTB)
        {
            if (ModelState.IsValid)
            {
                db.CodingClubAdvTBs.Add(codingClubAdvTB);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.TeacherId = new SelectList(db.TeacherTBs, "Id", "TeacherName", codingClubAdvTB.TeacherId);
            return View(codingClubAdvTB);
        }

        // GET: CodingClubAdv/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CodingClubAdvTB codingClubAdvTB = db.CodingClubAdvTBs.Find(id);
            if (codingClubAdvTB == null)
            {
                return HttpNotFound();
            }
            ViewBag.TeacherId = new SelectList(db.TeacherTBs, "Id", "TeacherName", codingClubAdvTB.TeacherId);
            return View(codingClubAdvTB);
        }

        // POST: CodingClubAdv/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,TeacherId,JoinDate")] CodingClubAdvTB codingClubAdvTB)
        {
            if (ModelState.IsValid)
            {
                db.Entry(codingClubAdvTB).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TeacherId = new SelectList(db.TeacherTBs, "Id", "TeacherName", codingClubAdvTB.TeacherId);
            return View(codingClubAdvTB);
        }

        // GET: CodingClubAdv/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CodingClubAdvTB codingClubAdvTB = db.CodingClubAdvTBs.Find(id);
            if (codingClubAdvTB == null)
            {
                return HttpNotFound();
            }
            return View(codingClubAdvTB);
        }

        // POST: CodingClubAdv/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CodingClubAdvTB codingClubAdvTB = db.CodingClubAdvTBs.Find(id);
            db.CodingClubAdvTBs.Remove(codingClubAdvTB);
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
