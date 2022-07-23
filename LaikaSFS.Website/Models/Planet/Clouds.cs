using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace LaikaSFS.Website.Models.Planet
{
    [Table("Clouds", Schema = "Planet")]
    [Index("Texture", "StartHeight", "Width", "Height", "Alpha", "Velocity", Name = "UQ_Clouds", IsUnique = true)]
    [Index("Title", Name = "UQ_Clouds_Title", IsUnique = true)]
    public partial class Clouds
    {
        public Clouds()
        {
            PlanetAtmosphereVisualsData = new HashSet<PlanetAtmosphereVisualsData>();
        }

        [Key]
        public int Id { get; set; }
        [StringLength(50)]
        public string Title { get; set; } = null!;
        [StringLength(50)]
        public string Texture { get; set; } = null!;
        [Column(TypeName = "decimal(36, 18)")]
        public decimal StartHeight { get; set; }
        [Column(TypeName = "decimal(36, 18)")]
        public decimal Width { get; set; }
        [Column(TypeName = "decimal(36, 18)")]
        public decimal Height { get; set; }
        [Column(TypeName = "decimal(36, 18)")]
        public decimal Alpha { get; set; }
        [Column(TypeName = "decimal(36, 18)")]
        public decimal Velocity { get; set; }

        [InverseProperty("Clouds")]
        public virtual ICollection<PlanetAtmosphereVisualsData> PlanetAtmosphereVisualsData { get; set; }
    }
}
