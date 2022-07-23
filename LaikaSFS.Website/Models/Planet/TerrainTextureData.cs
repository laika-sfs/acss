using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace LaikaSFS.Website.Models.Planet
{
    [Table("TerrainTextureData", Schema = "Planet")]
    [Index("PlanetTexture", "PlanetTextureCutout", "SurfaceTextureA", "SurfaceTextureB", "TerrainTextureC", "SurfaceLayerSize", "MinFade", "MaxFade", "ShadowIntensity", "ShadowHeight", Name = "UQ_TerrainTexture", IsUnique = true)]
    [Index("Title", Name = "UQ_TerrainTextureData_Title", IsUnique = true)]
    public partial class TerrainTextureData
    {
        public TerrainTextureData()
        {
            TerrainData = new HashSet<TerrainData>();
        }

        [Key]
        public int Id { get; set; }
        [StringLength(50)]
        public string Title { get; set; } = null!;
        [StringLength(50)]
        public string PlanetTexture { get; set; } = null!;
        [Column(TypeName = "decimal(36, 18)")]
        public decimal PlanetTextureCutout { get; set; }
        public int SurfaceTextureA { get; set; }
        public int SurfaceTextureB { get; set; }
        public int TerrainTextureC { get; set; }
        [Column(TypeName = "decimal(36, 18)")]
        public decimal SurfaceLayerSize { get; set; }
        [Column(TypeName = "decimal(36, 18)")]
        public decimal MinFade { get; set; }
        [Column(TypeName = "decimal(36, 18)")]
        public decimal MaxFade { get; set; }
        [Column(TypeName = "decimal(36, 18)")]
        public decimal ShadowIntensity { get; set; }
        [Column(TypeName = "decimal(36, 18)")]
        public decimal ShadowHeight { get; set; }

        [ForeignKey("SurfaceTextureA")]
        [InverseProperty("TerrainTextureDataSurfaceTextureANavigation")]
        public virtual Texture SurfaceTextureANavigation { get; set; } = null!;
        [ForeignKey("SurfaceTextureB")]
        [InverseProperty("TerrainTextureDataSurfaceTextureBNavigation")]
        public virtual Texture SurfaceTextureBNavigation { get; set; } = null!;
        [ForeignKey("TerrainTextureC")]
        [InverseProperty("TerrainTextureDataTerrainTextureCNavigation")]
        public virtual Texture TerrainTextureCNavigation { get; set; } = null!;
        [InverseProperty("TerrainTextureData")]
        public virtual ICollection<TerrainData> TerrainData { get; set; }
    }
}
