using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace BerrasBio.Models
{
    public partial class Movie
    {
        public Movie()
        {
            Shows = new HashSet<Show>();
        }

        public int Id { get; set; }
        public string Name { get; set; } = null!;
        [Url]
        public string? CoverUrl { get; set; }
        public string? Description { get; set; }
        public decimal Price { get; set; }

        public virtual ICollection<Show> Shows { get; set; }
    }
}
