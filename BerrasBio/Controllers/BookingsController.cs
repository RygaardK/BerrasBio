#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using BerrasBio.Models;

namespace BerrasBio.Controllers
{
    public class BookingsController : Controller
    {
        private readonly BerrasTempoContext _context;

        public BookingsController(BerrasTempoContext context)
        {
            _context = context;
        }

        // GET: Bookings
        public async Task<IActionResult> Index()
        {
            var berrasTempoContext = _context.Bookings.Include(b => b.Show);
            return View(await berrasTempoContext.ToListAsync());
        }

        // GET: Bookings/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var booking = await _context.Bookings
                .Include(b => b.Show)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (booking == null)
            {
                return NotFound();
            }
            return View(booking);
        }

        // GET: Bookings/Create
        public /*async Task*/IActionResult Create(int id)
        {
            Booking b = new Booking();
            b.ShowId = id;
            ViewData["ShowId"] = new SelectList(_context.Shows, "Id", "Id");
            return View(b);
        }

        //b = await _context.Bookings
        //            .Include(s => s.Show)
        //            .ThenInclude(s => s.Salon)
        //            .Include(s => s.Show)
        //            .ThenInclude(s => s.Movie)
        //            .Include(s => s.Show)
        //            .FirstOrDefaultAsync(s => s.Show.Id == id);

        // POST: Bookings/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ShowId,NumberOfSeats")] Booking booking)
        {
            if (ModelState.IsValid)
            {
                var showing = _context.Shows
                                 .Where(s => s.Id == booking.ShowId)
                                 .Include(s => s.Bookings)
                                 .Include(s => s.Salon)
                                 .Include(s => s.Movie)
                                 .SingleOrDefault();
                int seatsLeft = (int)(showing.Salon.MaxVisitors - showing.Bookings.Sum(b => b.NumberOfSeats));

                if (booking.NumberOfSeats > seatsLeft)
                {
                    return RedirectToAction("Error", "Bookings", booking);
                }

                _context.Add(booking);
                await _context.SaveChangesAsync();
                return RedirectToAction("Success", "Bookings", booking);
            }
            //ViewData["ShowId"] = new SelectList(_context.Shows, "Id", "Id", booking.ShowId);
            return RedirectToAction("Index", "Show");
        }
        public IActionResult Success(Booking booking)
        {
            var showing = _context.Shows
                                 .Where(s => s.Id == booking.ShowId)
                                 .Include(s => s.Bookings)
                                 .Include(s => s.Salon)
                                 .Include(s => s.Movie)
                                 .SingleOrDefault();
            //ViewData["totPrice"] = (_context.Movies, "Price", "Price");
            //ViewData["Total Price"] = new SelectList(_context.Shows, "Id", "Id"); 
            return View(booking);
        } 
        public IActionResult Error(Booking booking)
        {
            return View(booking);
        }

        // GET: Bookings/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var booking = await _context.Bookings.FindAsync(id);
            if (booking == null)
            {
                return NotFound();
            }
            ViewData["ShowId"] = new SelectList(_context.Shows, "Id", "Id", booking.ShowId);
            return View(booking);
        }

        // POST: Bookings/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,ShowId,NumberOfSeats")] Booking booking)
        {
            if (id != booking.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(booking);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BookingExists(booking.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["ShowId"] = new SelectList(_context.Shows, "Id", "Id", booking.ShowId);
            return View(booking);
        }

        // GET: Bookings/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var booking = await _context.Bookings
                .Include(b => b.Show)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (booking == null)
            {
                return NotFound();
            }

            return View(booking);
        }

        // POST: Bookings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var booking = await _context.Bookings.FindAsync(id);
            _context.Bookings.Remove(booking);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool BookingExists(int id)
        {
            return _context.Bookings.Any(e => e.Id == id);
        }
    }
}
