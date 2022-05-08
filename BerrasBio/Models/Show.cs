using System;
using System.Collections.Generic;

namespace BerrasBio.Models
{
    public partial class Show
    {
        public Show()
        {
            Bookings = new HashSet<Booking>();
        }

        public int Id { get; set; }
        public int MovieId { get; set; }
        public int SalonId { get; set; }
        public DateTime ShowTime { get; set; }

        public virtual Movie? Movie { get; set; } = null!;
        public virtual Salon? Salon { get; set; } = null!;
        //public virtual Booking? Salon { get; set; } = null!;
        public virtual ICollection<Booking> Bookings { get; set; }
    }
}
