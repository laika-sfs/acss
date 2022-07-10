using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Api.Models.Planet
{
    [Index("Title", "TextureSizeId", Name = "UQ_Texture", IsUnique = true)]
    public partial class Texture
    {
        public Texture()
        {
            TerrainTextureDataSurfaceTextureANavigation = new HashSet<TerrainTextureData>();
            TerrainTextureDataSurfaceTextureBNavigation = new HashSet<TerrainTextureData>();
            TerrainTextureDataTerrainTextureCNavigation = new HashSet<TerrainTextureData>();
        }

        [Key]
        public int Id { get; set; }
        [StringLength(50)]
        public string Title { get; set; } = null!;
        public int TextureSizeId { get; set; }

        [ForeignKey("TextureSizeId")]
        [InverseProperty("Texture")]
        public virtual TextureSize TextureSize { get; set; } = null!;
        [InverseProperty("SurfaceTextureANavigation")]
        public virtual ICollection<TerrainTextureData> TerrainTextureDataSurfaceTextureANavigation { get; set; }
        [InverseProperty("SurfaceTextureBNavigation")]
        public virtual ICollection<TerrainTextureData> TerrainTextureDataSurfaceTextureBNavigation { get; set; }
        [InverseProperty("TerrainTextureCNavigation")]
        public virtual ICollection<TerrainTextureData> TerrainTextureDataTerrainTextureCNavigation { get; set; }
    }
}
