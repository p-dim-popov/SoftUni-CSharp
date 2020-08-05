﻿using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace MusicHub.Data.Models
{
    public class Writer
    {
        public int Id { get; set; }
        [MaxLength(20), Required]
        public string Name { get; set; }
        public string Pseudonym { get; set; }
        public virtual ICollection<Song> Songs { get; set; } 
        = new HashSet<Song>();
    }
}