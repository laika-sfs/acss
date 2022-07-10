using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Api.Models.Planet
{
    public partial class PlanetOrbitData
    {
        [Key]
        public int Id { get; set; }
        public int PlanetId { get; set; }
        public int ParentPlanetId { get; set; }
        [Column(TypeName = "decimal(21, 3)")]
        public decimal SemiMajorAxis { get; set; }
        [Column(TypeName = "decimal(21, 3)")]
        public decimal Eccentricity { get; set; }
        [Column(TypeName = "decimal(21, 3)")]
        public decimal ArgumentOfPeriapsis { get; set; }
        [Column(TypeName = "decimal(21, 3)")]
        public decimal Direction { get; set; }
        [Column(TypeName = "decimal(21, 3)")]
        public decimal MultiplierSOI { get; set; }

        [ForeignKey("ParentPlanetId")]
        [InverseProperty("PlanetOrbitDataParentPlanet")]
        public virtual Planet ParentPlanet { get; set; } = null!;
        [ForeignKey("PlanetId")]
        [InverseProperty("PlanetOrbitDataPlanet")]
        public virtual Planet Planet { get; set; } = null!;
    }
}
