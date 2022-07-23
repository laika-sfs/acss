using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace LaikaSFS.Website.Models.Planet
{
    [Table("TextureFormula", Schema = "Planet")]
    [Index("Title", "HeightmapId", "Width", "Height", "ModifierId", "AddOnFormulaId", Name = "UQ_TextureFormula", IsUnique = true)]
    public partial class TextureFormula
    {
        public TextureFormula()
        {
            InverseAddOnFormula = new HashSet<TextureFormula>();
            TerrainDataTextureFormula = new HashSet<TerrainDataTextureFormula>();
        }

        [Key]
        public int Id { get; set; }
        [StringLength(50)]
        public string Title { get; set; } = null!;
        public int? HeightmapId { get; set; }
        [Column(TypeName = "decimal(36, 18)")]
        public decimal? Width { get; set; }
        [Column(TypeName = "decimal(36, 18)")]
        public decimal? Height { get; set; }
        public int? ModifierId { get; set; }
        public int? AddOnFormulaId { get; set; }

        [ForeignKey("AddOnFormulaId")]
        [InverseProperty("InverseAddOnFormula")]
        public virtual TextureFormula? AddOnFormula { get; set; }
        [ForeignKey("HeightmapId")]
        [InverseProperty("TextureFormula")]
        public virtual Heightmap? Heightmap { get; set; }
        [ForeignKey("ModifierId")]
        [InverseProperty("TextureFormula")]
        public virtual Modifier? Modifier { get; set; }
        [InverseProperty("AddOnFormula")]
        public virtual ICollection<TextureFormula> InverseAddOnFormula { get; set; }
        [InverseProperty("TextureFormula")]
        public virtual ICollection<TerrainDataTextureFormula> TerrainDataTextureFormula { get; set; }
    }
}
