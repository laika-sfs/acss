﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace LaikaSFS.Website.Models.Planet
{
    [Table("Colour", Schema = "Planet")]
    [Index("Red", "Green", "Blue", "Alpha", Name = "UQ_Colour", IsUnique = true)]
    [Index("Title", Name = "UQ_Colour_Title", IsUnique = true)]
    public partial class Colour
    {
        public Colour()
        {
            FogKey = new HashSet<FogKey>();
            PlanetBaseData = new HashSet<PlanetBaseData>();
        }

        [Key]
        public int Id { get; set; }
        [StringLength(50)]
        public string Title { get; set; } = null!;
        [Column(TypeName = "decimal(21, 18)")]
        public decimal Red { get; set; }
        [Column(TypeName = "decimal(21, 18)")]
        public decimal Green { get; set; }
        [Column(TypeName = "decimal(21, 18)")]
        public decimal Blue { get; set; }
        [Column(TypeName = "decimal(21, 18)")]
        public decimal Alpha { get; set; }

        [InverseProperty("Colour")]
        public virtual ICollection<FogKey> FogKey { get; set; }
        [InverseProperty("Colour")]
        public virtual ICollection<PlanetBaseData> PlanetBaseData { get; set; }
    }
}
