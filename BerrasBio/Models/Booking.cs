using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace BerrasBio.Models
{
    public partial class Booking
    {
        public int Id { get; set; }
        public int ShowId { get; set; }
        [Display(Name = "Number of seats")]
        [Range(1, 12, ErrorMessage = "Minimum: 1 Seat. Maximum 12 Seats")]
        public int NumberOfSeats { get; set; }

        public virtual Show? Show { get; set; } = null!;
    }
}
