using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Api.Models.Planet
{
    [Index("TerrainDataId", "FlatZoneId", Name = "UQ_TerrainDataFlatZone", IsUnique = true)]
    public partial class TerrainDataFlatZone
    {
        [Key]
        public int Id { get; set; }
        public int TerrainDataId { get; set; }
        public int FlatZoneId { get; set; }

        [ForeignKey("FlatZoneId")]
        [InverseProperty("TerrainDataFlatZone")]
        public virtual FlatZone FlatZone { get; set; } = null!;
        [ForeignKey("TerrainDataId")]
        [InverseProperty("TerrainDataFlatZone")]
        public virtual TerrainData TerrainData { get; set; } = null!;
    }
}
