using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Api.Models.Planet
{
    [Index("PlanetId", Name = "UQ_PlanetAchievementData", IsUnique = true)]
    public partial class PlanetAchievementData
    {
        [Key]
        public int Id { get; set; }
        public int PlanetId { get; set; }
        public bool Landed { get; set; }
        public bool Takeoff { get; set; }
        public bool Atmosphere { get; set; }
        public bool Orbit { get; set; }
        public bool Crash { get; set; }

        [ForeignKey("PlanetId")]
        [InverseProperty("PlanetAchievementData")]
        public virtual Planet Planet { get; set; } = null!;
    }
}
