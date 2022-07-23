using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Web.Models.Planet
{
    [Table("TerrainDataFormulaDifficulty", Schema = "Planet")]
    [Index("TerrainDataId", "DifficultyId", "TerrainFormulaSetId", Name = "UQ_TerrainDataFormulaDifficulty", IsUnique = true)]
    public partial class TerrainDataFormulaDifficulty
    {
        [Key]
        public int Id { get; set; }
        public int TerrainDataId { get; set; }
        public int DifficultyId { get; set; }
        public int TerrainFormulaSetId { get; set; }

        [ForeignKey("DifficultyId")]
        [InverseProperty("TerrainDataFormulaDifficulty")]
        public virtual Difficulty Difficulty { get; set; } = null!;
        [ForeignKey("TerrainDataId")]
        [InverseProperty("TerrainDataFormulaDifficulty")]
        public virtual TerrainData TerrainData { get; set; } = null!;
        [ForeignKey("TerrainFormulaSetId")]
        [InverseProperty("TerrainDataFormulaDifficulty")]
        public virtual TerrainFormulaSet TerrainFormulaSet { get; set; } = null!;
    }
}
