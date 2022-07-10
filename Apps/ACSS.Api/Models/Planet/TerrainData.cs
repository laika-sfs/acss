using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Api.Models.Planet
{
    public partial class TerrainData
    {
        public TerrainData()
        {
            TerrainDataFlatZone = new HashSet<TerrainDataFlatZone>();
            TerrainDataFormulaDifficulty = new HashSet<TerrainDataFormulaDifficulty>();
            TerrainDataTextureFormula = new HashSet<TerrainDataTextureFormula>();
        }

        [Key]
        public int Id { get; set; }
        public int PlanetId { get; set; }
        public int TerrainTextureDataId { get; set; }
        [Column(TypeName = "decimal(21, 3)")]
        public decimal VerticeSize { get; set; }
        public bool Collider { get; set; }

        [ForeignKey("PlanetId")]
        [InverseProperty("TerrainData")]
        public virtual Planet Planet { get; set; } = null!;
        [ForeignKey("TerrainTextureDataId")]
        [InverseProperty("TerrainData")]
        public virtual TerrainTextureData TerrainTextureData { get; set; } = null!;
        [InverseProperty("TerrainData")]
        public virtual ICollection<TerrainDataFlatZone> TerrainDataFlatZone { get; set; }
        [InverseProperty("TerrainData")]
        public virtual ICollection<TerrainDataFormulaDifficulty> TerrainDataFormulaDifficulty { get; set; }
        [InverseProperty("TerrainData")]
        public virtual ICollection<TerrainDataTextureFormula> TerrainDataTextureFormula { get; set; }
    }
}
