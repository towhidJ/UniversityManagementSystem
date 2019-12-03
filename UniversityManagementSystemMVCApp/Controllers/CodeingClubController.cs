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
    public class CodeingClubController : Controller
    {
        private SmSEntities db = new SmSEntities();

        // GET: CodeingClub
        public ActionResult Index()
        {
            var codeingClubTBs = db.CodeingClubTBs.Include(c => c.StudentTB);
            return View(codeingClubTBs.ToList());
        }

        public ActionResult show()
        {
            var codeingClubTBs = db.CodeingClubTBs.Include(c => c.StudentTB);
            return View(codeingClubTBs.ToList());
        }

        // GET: CodeingClub/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CodeingClubTB codeingClubTB = db.CodeingClubTBs.Find(id);
            if (codeingClubTB == null)
            {
                return HttpNotFound();
            }
            return View(codeingClubTB);
        }

        // GET: CodeingClub/Create
        public ActionResult Create()
        {
            ViewBag.StudentId = new SelectList(db.StudentTBs, "Id", "StudentName");
            return View();
        }

        // POST: CodeingClub/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,ExpDate,Type,StudentId")] CodeingClubTB codeingClubTB)
        {
            if (ModelState.IsValid)
            {
                db.CodeingClubTBs.Add(codeingClubTB);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.StudentId = new SelectList(db.StudentTBs, "Id", "StudentName", codeingClubTB.StudentId);
            return View(codeingClubTB);
        }

        // GET: CodeingClub/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CodeingClubTB codeingClubTB = db.CodeingClubTBs.Find(id);
            if (codeingClubTB == null)
            {
                return HttpNotFound();
            }
            ViewBag.StudentId = new SelectList(db.StudentTBs, "Id", "StudentName", codeingClubTB.StudentId);
            return View(codeingClubTB);
        }

        // POST: CodeingClub/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,ExpDate,Type,StudentId")] CodeingClubTB codeingClubTB)
        {
            if (ModelState.IsValid)
            {
                db.Entry(codeingClubTB).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.StudentId = new SelectList(db.StudentTBs, "Id", "StudentName", codeingClubTB.StudentId);
            return View(codeingClubTB);
        }

        // GET: CodeingClub/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CodeingClubTB codeingClubTB = db.CodeingClubTBs.Find(id);
            if (codeingClubTB == null)
            {
                return HttpNotFound();
            }
            return View(codeingClubTB);
        }

        // POST: CodeingClub/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CodeingClubTB codeingClubTB = db.CodeingClubTBs.Find(id);
            db.CodeingClubTBs.Remove(codeingClubTB);
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
