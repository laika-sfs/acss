using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace LaikaSFS.Website.Models.Planet
{
    [Table("TerrainFormula", Schema = "Planet")]
    [Index("Title", "HeightmapId", "Width", "Height", "ModifierId", "AddOnFormulaId", Name = "UQ_TerrainFormula", IsUnique = true)]
    public partial class TerrainFormula
    {
        public TerrainFormula()
        {
            InverseAddOnFormula = new HashSet<TerrainFormula>();
            TerrainFormulaLink = new HashSet<TerrainFormulaLink>();
        }

        [Key]
        public int Id { get; set; }
        [StringLength(50)]
        public string Title { get; set; } = null!;
        public int HeightmapId { get; set; }
        [Column(TypeName = "decimal(36, 18)")]
        public decimal Width { get; set; }
        [Column(TypeName = "decimal(36, 18)")]
        public decimal Height { get; set; }
        public int? ModifierId { get; set; }
        public int? AddOnFormulaId { get; set; }

        [ForeignKey("AddOnFormulaId")]
        [InverseProperty("InverseAddOnFormula")]
        public virtual TerrainFormula? AddOnFormula { get; set; }
        [ForeignKey("HeightmapId")]
        [InverseProperty("TerrainFormula")]
        public virtual Heightmap Heightmap { get; set; } = null!;
        [ForeignKey("ModifierId")]
        [InverseProperty("TerrainFormula")]
        public virtual Modifier? Modifier { get; set; }
        [InverseProperty("AddOnFormula")]
        public virtual ICollection<TerrainFormula> InverseAddOnFormula { get; set; }
        [InverseProperty("TerrainFormula")]
        public virtual ICollection<TerrainFormulaLink> TerrainFormulaLink { get; set; }
    }
}
