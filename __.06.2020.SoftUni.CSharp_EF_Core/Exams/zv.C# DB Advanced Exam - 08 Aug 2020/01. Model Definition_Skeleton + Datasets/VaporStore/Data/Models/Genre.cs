﻿using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace VaporStore.Data.Models
{
    public class Genre
    {
        public int Id { get; set; }

        [Required
        ]
        public string Name { get; set; }

        public virtual ICollection<Game> Games { get; set; }
            = new HashSet<Game>();
    }
}