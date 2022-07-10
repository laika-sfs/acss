using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Api.Models.Planet
{
    [Index("PositionZ", "Height", "Texture", Name = "UQ_Gradient", IsUnique = true)]
    [Index("Title", Name = "UQ_Gradient_Title", IsUnique = true)]
    public partial class Gradient
    {
        public Gradient()
        {
            PlanetAtmosphereVisualsData = new HashSet<PlanetAtmosphereVisualsData>();
        }

        [Key]
        public int Id { get; set; }
        [StringLength(50)]
        public string Title { get; set; } = null!;
        [Column(TypeName = "decimal(21, 3)")]
        public decimal PositionZ { get; set; }
        [Column(TypeName = "decimal(21, 3)")]
        public decimal Height { get; set; }
        [StringLength(50)]
        public string Texture { get; set; } = null!;

        [InverseProperty("Gradient")]
        public virtual ICollection<PlanetAtmosphereVisualsData> PlanetAtmosphereVisualsData { get; set; }
    }
}
