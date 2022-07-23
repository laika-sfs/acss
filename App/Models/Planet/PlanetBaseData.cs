using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Web.Models.Planet
{
    [Table("PlanetBaseData", Schema = "Planet")]
    [Index("PlanetId", Name = "UQ_PlanetBaseData", IsUnique = true)]
    public partial class PlanetBaseData
    {
        [Key]
        public int Id { get; set; }
        public int PlanetId { get; set; }
        public int ColourId { get; set; }
        [Column(TypeName = "decimal(36, 18)")]
        public decimal Radius { get; set; }
        [Column(TypeName = "decimal(36, 18)")]
        public decimal Gravity { get; set; }
        [Column(TypeName = "decimal(36, 18)")]
        public decimal TimewarpHeight { get; set; }
        [Column(TypeName = "decimal(36, 18)")]
        public decimal VelocityArrowsHeight { get; set; }

        [ForeignKey("ColourId")]
        [InverseProperty("PlanetBaseData")]
        public virtual Colour Colour { get; set; } = null!;
        [ForeignKey("PlanetId")]
        [InverseProperty("PlanetBaseData")]
        public virtual Planet Planet { get; set; } = null!;
    }
}
