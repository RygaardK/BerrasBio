using System;
using System.Collections.Generic;

namespace BerrasBio.Models
{
    public partial class Salon
    {
        public Salon()
        {
            Shows = new HashSet<Show>();
        }

        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public int MaxVisitors { get; set; }

        public virtual ICollection<Show> Shows { get; set; }
    }
}
