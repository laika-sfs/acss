using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Api.Models.Planet
{
    [Index("Texture", "StartHeight", "Width", "Height", "Alpha", "Velocity", Name = "UQ_Cloud", IsUnique = true)]
    [Index("Title", Name = "UQ_Cloud_Title", IsUnique = true)]
    public partial class Cloud
    {
        public Cloud()
        {
            PlanetAtmosphereVisualsData = new HashSet<PlanetAtmosphereVisualsData>();
        }

        [Key]
        public int Id { get; set; }
        [StringLength(50)]
        public string Title { get; set; } = null!;
        [StringLength(50)]
        public string Texture { get; set; } = null!;
        [Column(TypeName = "decimal(21, 3)")]
        public decimal StartHeight { get; set; }
        [Column(TypeName = "decimal(21, 3)")]
        public decimal Width { get; set; }
        [Column(TypeName = "decimal(21, 3)")]
        public decimal Height { get; set; }
        [Column(TypeName = "decimal(21, 3)")]
        public decimal Alpha { get; set; }
        [Column(TypeName = "decimal(21, 3)")]
        public decimal Velocity { get; set; }

        [InverseProperty("Cloud")]
        public virtual ICollection<PlanetAtmosphereVisualsData> PlanetAtmosphereVisualsData { get; set; }
    }
}
