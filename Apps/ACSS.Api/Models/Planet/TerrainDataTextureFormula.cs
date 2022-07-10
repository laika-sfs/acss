using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Api.Models.Planet
{
    public partial class TerrainDataTextureFormula
    {
        [Key]
        public int Id { get; set; }
        public int TerrainDataId { get; set; }
        public int TextureFormulaId { get; set; }

        [ForeignKey("TerrainDataId")]
        [InverseProperty("TerrainDataTextureFormula")]
        public virtual TerrainData TerrainData { get; set; } = null!;
        [ForeignKey("TextureFormulaId")]
        [InverseProperty("TerrainDataTextureFormula")]
        public virtual TextureFormula TextureFormula { get; set; } = null!;
    }
}
