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
    public class NetworkingClubController : Controller
    {
        private SmSEntities db = new SmSEntities();

        // GET: NetworkingClub
        public ActionResult Index()
        {
            var networkingClubTBs = db.NetworkingClubTBs.Include(n => n.StudentTB);
            return View(networkingClubTBs.ToList());
        }

        public ActionResult show()
        {
            var networkingClubTBs = db.NetworkingClubTBs.Include(n => n.StudentTB);
            return View(networkingClubTBs.ToList());
        }

        // GET: NetworkingClub/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NetworkingClubTB networkingClubTB = db.NetworkingClubTBs.Find(id);
            if (networkingClubTB == null)
            {
                return HttpNotFound();
            }
            return View(networkingClubTB);
        }

        // GET: NetworkingClub/Create
        public ActionResult Create()
        {
            ViewBag.StudentId = new SelectList(db.StudentTBs, "Id", "StudentName");
            return View();
        }

        // POST: NetworkingClub/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,StudentId,ExpDate,Type")] NetworkingClubTB networkingClubTB)
        {
            if (ModelState.IsValid)
            {
                db.NetworkingClubTBs.Add(networkingClubTB);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.StudentId = new SelectList(db.StudentTBs, "Id", "StudentName", networkingClubTB.StudentId);
            return View(networkingClubTB);
        }

        // GET: NetworkingClub/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NetworkingClubTB networkingClubTB = db.NetworkingClubTBs.Find(id);
            if (networkingClubTB == null)
            {
                return HttpNotFound();
            }
            ViewBag.StudentId = new SelectList(db.StudentTBs, "Id", "StudentName", networkingClubTB.StudentId);
            return View(networkingClubTB);
        }

        // POST: NetworkingClub/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,StudentId,ExpDate,Type")] NetworkingClubTB networkingClubTB)
        {
            if (ModelState.IsValid)
            {
                db.Entry(networkingClubTB).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.StudentId = new SelectList(db.StudentTBs, "Id", "StudentName", networkingClubTB.StudentId);
            return View(networkingClubTB);
        }

        // GET: NetworkingClub/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NetworkingClubTB networkingClubTB = db.NetworkingClubTBs.Find(id);
            if (networkingClubTB == null)
            {
                return HttpNotFound();
            }
            return View(networkingClubTB);
        }

        // POST: NetworkingClub/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NetworkingClubTB networkingClubTB = db.NetworkingClubTBs.Find(id);
            db.NetworkingClubTBs.Remove(networkingClubTB);
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
