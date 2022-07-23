using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Web.Models.Planet
{
    [Table("PlanetAtmosphereVisualsData", Schema = "Planet")]
    [Index("PlanetId", Name = "UQ_PlanetAtmosphereVisualsData", IsUnique = true)]
    public partial class PlanetAtmosphereVisualsData
    {
        [Key]
        public int Id { get; set; }
        public int PlanetId { get; set; }
        public int GradientId { get; set; }
        public int CloudsId { get; set; }
        public int FogKeySetId { get; set; }

        [ForeignKey("CloudsId")]
        [InverseProperty("PlanetAtmosphereVisualsData")]
        public virtual Clouds Clouds { get; set; } = null!;
        [ForeignKey("FogKeySetId")]
        [InverseProperty("PlanetAtmosphereVisualsData")]
        public virtual FogKeySet FogKeySet { get; set; } = null!;
        [ForeignKey("GradientId")]
        [InverseProperty("PlanetAtmosphereVisualsData")]
        public virtual Gradient Gradient { get; set; } = null!;
        [ForeignKey("PlanetId")]
        [InverseProperty("PlanetAtmosphereVisualsData")]
        public virtual Planet Planet { get; set; } = null!;
    }
}
