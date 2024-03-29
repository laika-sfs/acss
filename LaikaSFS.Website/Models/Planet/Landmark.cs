﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace LaikaSFS.Website.Models.Planet
{
    [Table("Landmark", Schema = "Planet")]
    [Index("Title", Name = "UQ_Landmark_Title", IsUnique = true)]
    public partial class Landmark
    {
        public Landmark()
        {
            PlanetLandmark = new HashSet<PlanetLandmark>();
        }

        [Key]
        public int Id { get; set; }
        [StringLength(50)]
        public string Title { get; set; } = null!;
        [Column(TypeName = "decimal(36, 18)")]
        public decimal Angle { get; set; }
        [Column(TypeName = "decimal(36, 18)")]
        public decimal StartAngle { get; set; }
        [Column(TypeName = "decimal(36, 18)")]
        public decimal EndAngle { get; set; }

        [InverseProperty("Landmark")]
        public virtual ICollection<PlanetLandmark> PlanetLandmark { get; set; }
    }
}
