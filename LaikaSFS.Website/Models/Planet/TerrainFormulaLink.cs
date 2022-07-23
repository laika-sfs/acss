using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace LaikaSFS.Website.Models.Planet
{
    [Table("TerrainFormulaLink", Schema = "Planet")]
    public partial class TerrainFormulaLink
    {
        [Key]
        public int Id { get; set; }
        public int TerrainFormulaId { get; set; }
        public int TerrainFormulaSetId { get; set; }
        public int TerrainFormulaOrder { get; set; }

        [ForeignKey("TerrainFormulaId")]
        [InverseProperty("TerrainFormulaLink")]
        public virtual TerrainFormula TerrainFormula { get; set; } = null!;
        [ForeignKey("TerrainFormulaSetId")]
        [InverseProperty("TerrainFormulaLink")]
        public virtual TerrainFormulaSet TerrainFormulaSet { get; set; } = null!;
    }
}
