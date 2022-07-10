using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using ACSS.Api.Models.Planet;

namespace ACSS.Api.Data
{
    public partial class PlanetContext : DbContext
    {
        public PlanetContext()
        {
        }

        public PlanetContext(DbContextOptions<PlanetContext> options)
            : base(options)
        {
        }

        public virtual DbSet<AuditLog> AuditLog { get; set; } = null!;
        public virtual DbSet<Cloud> Cloud { get; set; } = null!;
        public virtual DbSet<Colour> Colour { get; set; } = null!;
        public virtual DbSet<Difficulty> Difficulty { get; set; } = null!;
        public virtual DbSet<FlatZone> FlatZone { get; set; } = null!;
        public virtual DbSet<FogKey> FogKey { get; set; } = null!;
        public virtual DbSet<FogKeyLink> FogKeyLink { get; set; } = null!;
        public virtual DbSet<FogKeySet> FogKeySet { get; set; } = null!;
        public virtual DbSet<Gradient> Gradient { get; set; } = null!;
        public virtual DbSet<Heightmap> Heightmap { get; set; } = null!;
        public virtual DbSet<Landmark> Landmark { get; set; } = null!;
        public virtual DbSet<Modifier> Modifier { get; set; } = null!;
        public virtual DbSet<Planet> Planet { get; set; } = null!;
        public virtual DbSet<PlanetAchievementData> PlanetAchievementData { get; set; } = null!;
        public virtual DbSet<PlanetAtmospherePhysicsData> PlanetAtmospherePhysicsData { get; set; } = null!;
        public virtual DbSet<PlanetAtmosphereVisualsData> PlanetAtmosphereVisualsData { get; set; } = null!;
        public virtual DbSet<PlanetBaseData> PlanetBaseData { get; set; } = null!;
        public virtual DbSet<PlanetLandmark> PlanetLandmark { get; set; } = null!;
        public virtual DbSet<PlanetOrbitData> PlanetOrbitData { get; set; } = null!;
        public virtual DbSet<PlanetPostProcessing> PlanetPostProcessing { get; set; } = null!;
        public virtual DbSet<PostProcessingKey> PostProcessingKey { get; set; } = null!;
        public virtual DbSet<TerrainData> TerrainData { get; set; } = null!;
        public virtual DbSet<TerrainDataFlatZone> TerrainDataFlatZone { get; set; } = null!;
        public virtual DbSet<TerrainDataFormulaDifficulty> TerrainDataFormulaDifficulty { get; set; } = null!;
        public virtual DbSet<TerrainDataTextureFormula> TerrainDataTextureFormula { get; set; } = null!;
        public virtual DbSet<TerrainFormula> TerrainFormula { get; set; } = null!;
        public virtual DbSet<TerrainFormulaLink> TerrainFormulaLink { get; set; } = null!;
        public virtual DbSet<TerrainFormulaSet> TerrainFormulaSet { get; set; } = null!;
        public virtual DbSet<TerrainTextureData> TerrainTextureData { get; set; } = null!;
        public virtual DbSet<Texture> Texture { get; set; } = null!;
        public virtual DbSet<TextureFormula> TextureFormula { get; set; } = null!;
        public virtual DbSet<TextureSize> TextureSize { get; set; } = null!;

        //        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        //        {
        //            if (!optionsBuilder.IsConfigured)
        //            {
        //#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        //                optionsBuilder.UseSqlServer("Data Source=192.168.2.90\\DEV;Initial Catalog=SFS;User ID=sa;Password=hosannah7PADDY4sash_pedestal");
        //            }
        //        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<FogKey>(entity =>
            {
                entity.HasOne(d => d.Colour)
                    .WithMany(p => p.FogKey)
                    .HasForeignKey(d => d.ColourId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_FogKey_Colour");
            });

            modelBuilder.Entity<FogKeyLink>(entity =>
            {
                entity.HasOne(d => d.FogKey)
                    .WithMany(p => p.FogKeyLink)
                    .HasForeignKey(d => d.FogKeyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_FogKeyLink_FogKey");

                entity.HasOne(d => d.FogKeySet)
                    .WithMany(p => p.FogKeyLink)
                    .HasForeignKey(d => d.FogKeySetId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_FogKeyLink_FogKeySet");
            });

            modelBuilder.Entity<PlanetAchievementData>(entity =>
            {
                entity.HasOne(d => d.Planet)
                    .WithOne(p => p.PlanetAchievementData)
                    .HasForeignKey<PlanetAchievementData>(d => d.PlanetId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PlanetAchievementData_Planet");
            });

            modelBuilder.Entity<PlanetAtmospherePhysicsData>(entity =>
            {
                entity.HasOne(d => d.Planet)
                    .WithOne(p => p.PlanetAtmospherePhysicsData)
                    .HasForeignKey<PlanetAtmospherePhysicsData>(d => d.PlanetId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PlanetAtmospherePhysicsData_Planet");
            });

            modelBuilder.Entity<PlanetAtmosphereVisualsData>(entity =>
            {
                entity.HasOne(d => d.Cloud)
                    .WithMany(p => p.PlanetAtmosphereVisualsData)
                    .HasForeignKey(d => d.CloudId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PlanetAtmosphereVisualsData_Cloud");

                entity.HasOne(d => d.FogKeySet)
                    .WithMany(p => p.PlanetAtmosphereVisualsData)
                    .HasForeignKey(d => d.FogKeySetId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PlanetAtmosphereVisualsData_FogKeySet");

                entity.HasOne(d => d.Gradient)
                    .WithMany(p => p.PlanetAtmosphereVisualsData)
                    .HasForeignKey(d => d.GradientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PlanetAtmosphereVisualsData_Gradient");

                entity.HasOne(d => d.Planet)
                    .WithOne(p => p.PlanetAtmosphereVisualsData)
                    .HasForeignKey<PlanetAtmosphereVisualsData>(d => d.PlanetId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PlanetAtmosphereVisualsData_Planet");
            });

            modelBuilder.Entity<PlanetBaseData>(entity =>
            {
                entity.HasOne(d => d.Colour)
                    .WithMany(p => p.PlanetBaseData)
                    .HasForeignKey(d => d.ColourId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PlanetBaseData_Colour");

                entity.HasOne(d => d.Planet)
                    .WithOne(p => p.PlanetBaseData)
                    .HasForeignKey<PlanetBaseData>(d => d.PlanetId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PlanetBaseData_Planet");
            });

            modelBuilder.Entity<PlanetLandmark>(entity =>
            {
                entity.HasOne(d => d.Landmark)
                    .WithMany(p => p.PlanetLandmark)
                    .HasForeignKey(d => d.LandmarkId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PlanetLandmark_Landmark");

                entity.HasOne(d => d.Planet)
                    .WithMany(p => p.PlanetLandmark)
                    .HasForeignKey(d => d.PlanetId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PlanetLandmark_Planet");
            });

            modelBuilder.Entity<PlanetOrbitData>(entity =>
            {
                entity.HasOne(d => d.ParentPlanet)
                    .WithMany(p => p.PlanetOrbitDataParentPlanet)
                    .HasForeignKey(d => d.ParentPlanetId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PlanetOrbitData_ParentPlanet");

                entity.HasOne(d => d.Planet)
                    .WithMany(p => p.PlanetOrbitDataPlanet)
                    .HasForeignKey(d => d.PlanetId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PlanetOrbitData_Planet");
            });

            modelBuilder.Entity<PlanetPostProcessing>(entity =>
            {
                entity.HasOne(d => d.Planet)
                    .WithMany(p => p.PlanetPostProcessing)
                    .HasForeignKey(d => d.PlanetId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PlanetPostProcessing_Planet");

                entity.HasOne(d => d.PostProcessingKey)
                    .WithMany(p => p.PlanetPostProcessing)
                    .HasForeignKey(d => d.PostProcessingKeyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PlanetPostProcessing_PostProcessingKey");
            });

            modelBuilder.Entity<TerrainData>(entity =>
            {
                entity.HasOne(d => d.Planet)
                    .WithMany(p => p.TerrainData)
                    .HasForeignKey(d => d.PlanetId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TerrainData_Planet");

                entity.HasOne(d => d.TerrainTextureData)
                    .WithMany(p => p.TerrainData)
                    .HasForeignKey(d => d.TerrainTextureDataId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TerrainData_TerrainTextureData");
            });

            modelBuilder.Entity<TerrainDataFlatZone>(entity =>
            {
                entity.HasOne(d => d.FlatZone)
                    .WithMany(p => p.TerrainDataFlatZone)
                    .HasForeignKey(d => d.FlatZoneId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TerrainDataFlatZone_FlatZone");

                entity.HasOne(d => d.TerrainData)
                    .WithMany(p => p.TerrainDataFlatZone)
                    .HasForeignKey(d => d.TerrainDataId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TerrainDataFlatZone_TerrainData");
            });

            modelBuilder.Entity<TerrainDataFormulaDifficulty>(entity =>
            {
                entity.HasOne(d => d.Difficulty)
                    .WithMany(p => p.TerrainDataFormulaDifficulty)
                    .HasForeignKey(d => d.DifficultyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TerrainDataFormulaDifficulty_Difficulty");

                entity.HasOne(d => d.TerrainData)
                    .WithMany(p => p.TerrainDataFormulaDifficulty)
                    .HasForeignKey(d => d.TerrainDataId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TerrainDataFormulaDifficulty_TerrainData");

                entity.HasOne(d => d.TerrainFormulaSet)
                    .WithMany(p => p.TerrainDataFormulaDifficulty)
                    .HasForeignKey(d => d.TerrainFormulaSetId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TerrainDataFormulaDifficulty_TerrainFormulaSet");
            });

            modelBuilder.Entity<TerrainDataTextureFormula>(entity =>
            {
                entity.HasOne(d => d.TerrainData)
                    .WithMany(p => p.TerrainDataTextureFormula)
                    .HasForeignKey(d => d.TerrainDataId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TerrainDataTextureFormula_TerrainData");

                entity.HasOne(d => d.TextureFormula)
                    .WithMany(p => p.TerrainDataTextureFormula)
                    .HasForeignKey(d => d.TextureFormulaId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TerrainDataTextureFormula_TextureFormula");
            });

            modelBuilder.Entity<TerrainFormula>(entity =>
            {
                entity.HasOne(d => d.AddOnFormula)
                    .WithMany(p => p.InverseAddOnFormula)
                    .HasForeignKey(d => d.AddOnFormulaId)
                    .HasConstraintName("FK_TerrainFormula_TerrainFormula");

                entity.HasOne(d => d.Heightmap)
                    .WithMany(p => p.TerrainFormula)
                    .HasForeignKey(d => d.HeightmapId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TerrainFormula_Heightmap");

                entity.HasOne(d => d.Modifier)
                    .WithMany(p => p.TerrainFormula)
                    .HasForeignKey(d => d.ModifierId)
                    .HasConstraintName("FK_TerrainFormula_Modifier");
            });

            modelBuilder.Entity<TerrainFormulaLink>(entity =>
            {
                entity.HasOne(d => d.TerrainFormula)
                    .WithMany(p => p.TerrainFormulaLink)
                    .HasForeignKey(d => d.TerrainFormulaId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TerrainFormulaLink_TerrainFormula");

                entity.HasOne(d => d.TerrainFormulaSet)
                    .WithMany(p => p.TerrainFormulaLink)
                    .HasForeignKey(d => d.TerrainFormulaSetId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TerrainFormulaLink_TerrainFormulaSet");
            });

            modelBuilder.Entity<TerrainTextureData>(entity =>
            {
                entity.HasOne(d => d.SurfaceTextureANavigation)
                    .WithMany(p => p.TerrainTextureDataSurfaceTextureANavigation)
                    .HasForeignKey(d => d.SurfaceTextureA)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TerrainTextureData_Texture");

                entity.HasOne(d => d.SurfaceTextureBNavigation)
                    .WithMany(p => p.TerrainTextureDataSurfaceTextureBNavigation)
                    .HasForeignKey(d => d.SurfaceTextureB)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TerrainTextureData_Texture1");

                entity.HasOne(d => d.TerrainTextureCNavigation)
                    .WithMany(p => p.TerrainTextureDataTerrainTextureCNavigation)
                    .HasForeignKey(d => d.TerrainTextureC)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TerrainTextureData_Texture2");
            });

            modelBuilder.Entity<Texture>(entity =>
            {
                entity.HasOne(d => d.TextureSize)
                    .WithMany(p => p.Texture)
                    .HasForeignKey(d => d.TextureSizeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Texture_TextureSize");
            });

            modelBuilder.Entity<TextureFormula>(entity =>
            {
                entity.HasOne(d => d.AddOnFormula)
                    .WithMany(p => p.InverseAddOnFormula)
                    .HasForeignKey(d => d.AddOnFormulaId)
                    .HasConstraintName("FK_TextureFormula_TextureFormula");

                entity.HasOne(d => d.Heightmap)
                    .WithMany(p => p.TextureFormula)
                    .HasForeignKey(d => d.HeightmapId)
                    .HasConstraintName("FK_TextureFormula_Heightmap");

                entity.HasOne(d => d.Modifier)
                    .WithMany(p => p.TextureFormula)
                    .HasForeignKey(d => d.ModifierId)
                    .HasConstraintName("FK_TextureFormula_Modifier");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
