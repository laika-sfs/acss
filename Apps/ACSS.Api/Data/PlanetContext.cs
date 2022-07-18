using Microsoft.EntityFrameworkCore;
using ACSS.Api.Models.Planet;
using ACSS.Lib.Models.Planet;

namespace ACSS.Api.Data;

public partial class PlanetContext : DbContext {
    public PlanetContext() {
    }

    public PlanetContext(DbContextOptions<PlanetContext> options)
        : base(options) {
    }

    public virtual DbSet<AuditLog> AuditLog { get; set; } = null!;
    public virtual DbSet<Clouds> Clouds { get; set; } = null!;
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

    protected override void OnModelCreating(ModelBuilder modelBuilder) {
        modelBuilder.Entity<FogKey>(entity => {
            entity.HasOne(d => d.Colour)
                .WithMany(p => p.FogKey)
                .HasForeignKey(d => d.ColourId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_FogKey_Colour");
        });

        modelBuilder.Entity<FogKeyLink>(entity => {
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

        modelBuilder.Entity<PlanetAchievementData>(entity => {
            entity.HasOne(d => d.Planet)
                .WithOne(p => p.PlanetAchievementData)
                .HasForeignKey<PlanetAchievementData>(d => d.PlanetId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PlanetAchievementData_Planet");
        });

        modelBuilder.Entity<PlanetAtmospherePhysicsData>(entity => {
            entity.HasOne(d => d.Planet)
                .WithOne(p => p.PlanetAtmospherePhysicsData)
                .HasForeignKey<PlanetAtmospherePhysicsData>(d => d.PlanetId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PlanetAtmospherePhysicsData_Planet");
        });

        modelBuilder.Entity<PlanetAtmosphereVisualsData>(entity => {
            entity.HasOne(d => d.Clouds)
                .WithMany(p => p.PlanetAtmosphereVisualsData)
                .HasForeignKey(d => d.CloudsId)
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

        modelBuilder.Entity<PlanetBaseData>(entity => {
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

        modelBuilder.Entity<PlanetLandmark>(entity => {
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

        modelBuilder.Entity<PlanetOrbitData>(entity => {
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

        modelBuilder.Entity<PlanetPostProcessing>(entity => {
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

        modelBuilder.Entity<TerrainData>(entity => {
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

        modelBuilder.Entity<TerrainDataFlatZone>(entity => {
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

        modelBuilder.Entity<TerrainDataFormulaDifficulty>(entity => {
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

        modelBuilder.Entity<TerrainDataTextureFormula>(entity => {
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

        modelBuilder.Entity<TerrainFormula>(entity => {
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

        modelBuilder.Entity<TerrainFormulaLink>(entity => {
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

        modelBuilder.Entity<TerrainTextureData>(entity => {
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

        modelBuilder.Entity<Texture>(entity => {
            entity.HasOne(d => d.TextureSize)
                .WithMany(p => p.Texture)
                .HasForeignKey(d => d.TextureSizeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Texture_TextureSize");
        });

        modelBuilder.Entity<TextureFormula>(entity => {
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

    public Planet CreatePlanetFromJson(PlanetData planetData, string title) {
        Planet planet = new Planet();

        planet.Title = title;
        planet.GameVersion = planetData.Version;

        if (planetData.BaseData != null) {
            planet.PlanetBaseData = new() {
                Radius = planetData.BaseData.Radius,
                Gravity = planetData.BaseData.Gravity,
                TimewarpHeight = planetData.BaseData.TimewarpHeight,
                VelocityArrowsHeight = planetData.BaseData.VelocityArrowsHeight
            };

            if (planetData.BaseData.Colour != null) {
                Colour? mapColour = Colour.Where(clr =>
                    clr.Red == planetData.BaseData.Colour.Red &&
                    clr.Green == planetData.BaseData.Colour.Green &&
                    clr.Blue == planetData.BaseData.Colour.Blue &&
                    clr.Alpha == planetData.BaseData.Colour.Alpha).FirstOrDefault();

                planet.PlanetBaseData.Colour = mapColour == null ? new() {
                    Title = $"{title}MapColour",
                    Red = planetData.BaseData.Colour.Red,
                    Green = planetData.BaseData.Colour.Green,
                    Blue = planetData.BaseData.Colour.Blue,
                    Alpha = planetData.BaseData.Colour.Alpha
                } : mapColour;
            }
        }

        if (planetData.AtmospherePhysicsData != null) {
            planet.PlanetAtmospherePhysicsData = new() {
                Height = planetData.AtmospherePhysicsData.Height,
                Density = planetData.AtmospherePhysicsData.Density,
                Curve = planetData.AtmospherePhysicsData.Curve,
                ParachuteMultiplier = planetData.AtmospherePhysicsData.ParachuteMultiplier,
                UpperAtmosphere = planetData.AtmospherePhysicsData.UpperAtmosphere,
                ShockwaveIntensity = planetData.AtmospherePhysicsData.ShockwaveIntensity,
                MinHeatingVelocityMultiplier = planetData.AtmospherePhysicsData.MinHeatingVelocityMultiplier
            };
        }

        if (planetData.AtmosphereVisualsData != null) {
            planet.PlanetAtmosphereVisualsData = new();

            if (planetData.AtmosphereVisualsData.Gradient != null) {
                planet.PlanetAtmosphereVisualsData.Gradient = new() {
                    Title = title,
                    PositionZ = planetData.AtmosphereVisualsData.Gradient.PositionZ,
                    Height = planetData.AtmosphereVisualsData.Gradient.Height,
                    Texture = planetData.AtmosphereVisualsData.Gradient.Texture != null ? planetData.AtmosphereVisualsData.Gradient.Texture : string.Empty
                };
            }

            if (planetData.AtmosphereVisualsData.Clouds != null) {
                planet.PlanetAtmosphereVisualsData.Clouds = new() {
                    Title = title,
                    Texture = planetData.AtmosphereVisualsData.Clouds.Texture != null ? planetData.AtmosphereVisualsData.Clouds.Texture : string.Empty,
                    StartHeight = planetData.AtmosphereVisualsData.Clouds.StartHeight,
                    Width = planetData.AtmosphereVisualsData.Clouds.Width,
                    Height = planetData.AtmosphereVisualsData.Clouds.Height,
                    Alpha = planetData.AtmosphereVisualsData.Clouds.Alpha,
                    Velocity = planetData.AtmosphereVisualsData.Clouds.Velocity
                };
            }

            if (planetData.AtmosphereVisualsData.Fog != null && planetData.AtmosphereVisualsData.Fog.Keys != null) {
                planet.PlanetAtmosphereVisualsData.FogKeySet = new() {
                    Title = title
                };

                int count = 0;
                foreach (var fog in planetData.AtmosphereVisualsData.Fog.Keys) {
                    ++count;
                    if (fog != null && fog.Colour != null) {
                        planet.PlanetAtmosphereVisualsData.FogKeySet.FogKeyLink.Add(new() {
                            FogKey = new() {
                                Colour = new() {
                                    Title = $"{title}{count}",
                                    Red = fog.Colour.Red,
                                    Green = fog.Colour.Green,
                                    Blue = fog.Colour.Blue,
                                    Alpha = fog.Colour.Alpha
                                },
                                Distance = fog.Distance
                            }
                        });
                    }
                }
            }
        }

        if (planetData.TerrainData != null && planetData.TerrainData.TerrainTextureData != null) {
            PlanetTextureSize? texSizeA = planetData.TerrainData.TerrainTextureData.SurfaceTextureSizeA;
            PlanetTextureSize? texSizeB = planetData.TerrainData.TerrainTextureData.SurfaceTextureSizeB;
            PlanetTextureSize? texSizeC = planetData.TerrainData.TerrainTextureData.TerrainTextureSizeC;

            TextureSize? TextureSizeA = texSizeA != null ? TextureSize.Where(texSize => texSize.X == texSizeA.X && texSize.Y == texSizeA.Y).FirstOrDefault() : null;
            TextureSize? TextureSizeB = texSizeB != null ? TextureSize.Where(texSize => texSize.X == texSizeB.X && texSize.Y == texSizeB.Y).FirstOrDefault() : null;
            TextureSize? TextureSizeC = texSizeC != null ? TextureSize.Where(texSize => texSize.X == texSizeC.X && texSize.Y == texSizeC.Y).FirstOrDefault() : null;

            planet.TerrainData.Add(new() {
                TerrainTextureData = new() {
                    Title = title,
                    PlanetTexture = planetData.TerrainData.TerrainTextureData.PlanetTexture != null ? planetData.TerrainData.TerrainTextureData.PlanetTexture : string.Empty,
                    PlanetTextureCutout = planetData.TerrainData.TerrainTextureData.PlanetTextureCutout,
                    SurfaceTextureANavigation = new() {
                        Title = planetData.TerrainData.TerrainTextureData.SurfaceTextureA != null ? planetData.TerrainData.TerrainTextureData.SurfaceTextureA : string.Empty,
                        TextureSize = TextureSizeA == null ? new() {
                            X = planetData.TerrainData.TerrainTextureData.SurfaceTextureSizeA != null ? planetData.TerrainData.TerrainTextureData.SurfaceTextureSizeA.X : 0,
                            Y = planetData.TerrainData.TerrainTextureData.SurfaceTextureSizeA != null ? planetData.TerrainData.TerrainTextureData.SurfaceTextureSizeA.Y : 0
                        } : TextureSizeA
                    },
                    SurfaceTextureBNavigation = new() {
                        Title = planetData.TerrainData.TerrainTextureData.SurfaceTextureB != null ? planetData.TerrainData.TerrainTextureData.SurfaceTextureB : string.Empty,
                        TextureSize = TextureSizeB == null ? new() {
                            X = planetData.TerrainData.TerrainTextureData.SurfaceTextureSizeB != null ? planetData.TerrainData.TerrainTextureData.SurfaceTextureSizeB.X : 0,
                            Y = planetData.TerrainData.TerrainTextureData.SurfaceTextureSizeB != null ? planetData.TerrainData.TerrainTextureData.SurfaceTextureSizeB.Y : 0
                        } : TextureSizeB
                    },
                    TerrainTextureCNavigation = new() {
                        Title = planetData.TerrainData.TerrainTextureData.TerrainTextureC != null ? planetData.TerrainData.TerrainTextureData.TerrainTextureC : string.Empty,
                        TextureSize = TextureSizeC == null ? new() {
                            X = planetData.TerrainData.TerrainTextureData.TerrainTextureSizeC != null ? planetData.TerrainData.TerrainTextureData.TerrainTextureSizeC.X : 0,
                            Y = planetData.TerrainData.TerrainTextureData.TerrainTextureSizeC != null ? planetData.TerrainData.TerrainTextureData.TerrainTextureSizeC.Y : 0
                        } : TextureSizeC
                    },
                    SurfaceLayerSize = planetData.TerrainData.TerrainTextureData.SurfaceLayerSize,
                    MinFade = planetData.TerrainData.TerrainTextureData.MinFade,
                    MaxFade = planetData.TerrainData.TerrainTextureData.MaxFade,
                    ShadowIntensity = planetData.TerrainData.TerrainTextureData.ShadowIntensity,
                    ShadowHeight = planetData.TerrainData.TerrainTextureData.ShadowHeight
                },
                VerticeSize = planetData.TerrainData.VerticeSize,
                Collider = planetData.TerrainData.Collider
            });

            if (planetData.TerrainData.TerrainFormulaDifficulties != null) {
                foreach (var formulaDifficulty in planetData.TerrainData.TerrainFormulaDifficulties) {
                    Difficulty? difficulty = Difficulty.Where(diff => diff.Title == formulaDifficulty.Key).FirstOrDefault();

                    if (difficulty != null) {
                        TerrainDataFormulaDifficulty terrainDataFormulaDifficulty = new() {
                            Difficulty = difficulty,
                            TerrainFormulaSet = new() {
                                Title = title
                            }
                        };

                        int orderSequence = 0;

                        foreach (var formula in formulaDifficulty.Value) {
                            if (formula != null) {
                                ++orderSequence;
                                string formulaTitle = formula.Split("=")[0].Trim();
                                string[] parameters = formula.Split("(")[1].Replace(")", "").Replace(" ", "").Split(",");

                                TerrainFormula terrainFormula = new();

                                if (parameters.Length == 1) {
                                    Modifier? modifier = Modifier.Where(mod => mod.Title == parameters[0]).FirstOrDefault();

                                    if (modifier != null) {
                                        terrainFormula.Title = formula.Split("=")[0].Trim();
                                        terrainFormula.Modifier = modifier;
                                    }
                                }
                                else if (parameters.Length >= 3) {
                                    Heightmap? heightmap = Heightmap.Where(hmap => hmap.Title == parameters[0]).FirstOrDefault();
                                    Modifier? modifier = parameters.Length >= 4 ? Modifier.Where(mod => mod.Title == parameters[3]).FirstOrDefault() : null;
                                    TerrainFormulaLink? checkAddOnFormula = parameters.Length >= 5 ? terrainDataFormulaDifficulty.TerrainFormulaSet.TerrainFormulaLink.Where(terForm => terForm.TerrainFormula.Title == parameters[4]).FirstOrDefault() : null;
                                    TerrainFormula? addOnFormula = null;

                                    if (checkAddOnFormula != null) {
                                        addOnFormula = checkAddOnFormula.TerrainFormula;
                                    }
                                    if (heightmap != null) {
                                        terrainFormula.Title = formula.Split("=")[0].Trim();
                                        terrainFormula.Heightmap = heightmap;
                                        terrainFormula.Width = decimal.Parse(parameters[1]);
                                        terrainFormula.Height = decimal.Parse(parameters[2]);
                                        terrainFormula.Modifier = modifier;
                                        terrainFormula.AddOnFormula = addOnFormula;
                                    }
                                }

                                TerrainFormula? existingFormula = TerrainFormula.Where(terForm =>
                                    terForm.Title == terrainFormula.Title &&
                                    terForm.Heightmap == terrainFormula.Heightmap &&
                                    terForm.Width == terrainFormula.Width &&
                                    terForm.Height == terrainFormula.Height &&
                                    terForm.Modifier == terrainFormula.Modifier &&
                                    terForm.AddOnFormula == terrainFormula.AddOnFormula
                                ).FirstOrDefault();

                                if (existingFormula != null) {
                                    terrainFormula = existingFormula;
                                }
                                else {
                                    Add(terrainFormula);
                                    SaveChanges();
                                }

                                terrainDataFormulaDifficulty.TerrainFormulaSet.TerrainFormulaLink.Add(new() {
                                    TerrainFormulaOrder = orderSequence,
                                    TerrainFormula = terrainFormula
                                });
                            }
                        }

                        planet.TerrainData.Last().TerrainDataFormulaDifficulty.Add(terrainDataFormulaDifficulty);
                    }
                }
            }

            if (planetData.TerrainData.TextureFormula != null) {
                foreach (var formula in planetData.TerrainData.TextureFormula) {
                    string formulaTitle = formula.Split("=")[0].Trim();
                    string[] parameters = formula.Split("(")[1].Replace(")", "").Replace(" ", "").Split(",");

                    TextureFormula textureFormula = new();

                    if (parameters.Length == 1) {
                        Modifier? modifier = Modifier.Where(mod => mod.Title == parameters[0]).FirstOrDefault();

                        if (modifier != null) {
                            textureFormula.Title = formula.Split("=")[0].Trim();
                            textureFormula.Modifier = modifier;
                        }
                    }
                    else if (parameters.Length >= 3) {
                        Heightmap? heightmap = Heightmap.Where(hmap => hmap.Title == parameters[0]).FirstOrDefault();
                        Modifier? modifier = parameters.Length >= 4 ? Modifier.Where(mod => mod.Title == parameters[3]).FirstOrDefault() : null;
                        TerrainDataTextureFormula? checkAddOnFormula = parameters.Length >= 5 ? planet.TerrainData.Last().TerrainDataTextureFormula.Where(texForm => texForm.TextureFormula.Title == parameters[4]).FirstOrDefault() : null;
                        TextureFormula? addOnFormula = null;

                        if (checkAddOnFormula != null) {
                            addOnFormula = checkAddOnFormula.TextureFormula;
                        }

                        if (heightmap != null) {
                            textureFormula.Title = formula.Split("=")[0].Trim();
                            textureFormula.Heightmap = heightmap;
                            textureFormula.Width = decimal.Parse(parameters[1]);
                            textureFormula.Height = decimal.Parse(parameters[2]);
                            textureFormula.Modifier = modifier;
                            textureFormula.AddOnFormula = addOnFormula;
                        }
                    }

                    TextureFormula? existingFormula = TextureFormula.Where(texForm =>
                                    texForm.Title == textureFormula.Title &&
                                    texForm.Heightmap == textureFormula.Heightmap &&
                                    texForm.Width == textureFormula.Width &&
                                    texForm.Height == textureFormula.Height &&
                                    texForm.Modifier == textureFormula.Modifier &&
                                    texForm.AddOnFormula == textureFormula.AddOnFormula
                                ).FirstOrDefault();

                    if (existingFormula != null) {
                        textureFormula = existingFormula;
                    }
                    else {
                        Add(textureFormula);
                        SaveChanges();
                    }

                    planet.TerrainData.Last().TerrainDataTextureFormula.Add(new() {
                        TextureFormula = textureFormula
                    });
                }
            }

            if (planetData.TerrainData.FlatZones != null) {
                int count = 0;

                foreach (var flatZone in planetData.TerrainData.FlatZones) {
                    ++count;
                    planet.TerrainData.Last().TerrainDataFlatZone.Add(new() {
                        FlatZone = new() {
                            Title = $"{title}{count}",
                            Height = flatZone.Height,
                            Angle = flatZone.Angle,
                            Width = flatZone.Width,
                            Transition = flatZone.Transition
                        }
                    });
                }
            }

            if (planetData.PostProcessing != null && planetData.PostProcessing.Keys != null) {
                int count = 0;
                foreach (var key in planetData.PostProcessing.Keys) {
                    ++count;
                    planet.PlanetPostProcessing.Add(new() {
                        PostProcessingKey = new() {
                            Title = $"{title}{count}",
                            Height = key.Height,
                            ShadowIntensity = key.ShadowIntensity,
                            StarIntensity = key.StarIntensity,
                            HueShift = key.HueShift,
                            Saturation = key.Saturation,
                            Contrast = key.Contrast,
                            Red = key.Red,
                            Green = key.Green,
                            Blue = key.Blue
                        }
                    });
                }
            }

            if (planetData.OrbitData != null) {
                Planet? parentPlanet = Planet.Where(plnt => plnt.Title == planetData.OrbitData.Parent).FirstOrDefault();

                if (parentPlanet != null) {
                    planet.PlanetOrbitDataPlanet.Add(new() {
                        ParentPlanet = parentPlanet,
                        SemiMajorAxis = planetData.OrbitData.SemiMajorAxis,
                        Eccentricity = planetData.OrbitData.Eccentricity,
                        ArgumentOfPeriapsis = planetData.OrbitData.ArgumentOfPeriapsis,
                        Direction = planetData.OrbitData.Direction,
                        MultiplierSOI = planetData.OrbitData.MultiplierSOI
                    });
                }
            }

            if (planetData.AchievementData != null) {
                planet.PlanetAchievementData = new() {
                    Landed = planetData.AchievementData.Landed,
                    Takeoff = planetData.AchievementData.Takeoff,
                    Atmosphere = planetData.AchievementData.Atmosphere,
                    Orbit = planetData.AchievementData.Orbit,
                    Crash = planetData.AchievementData.Crash
                };
            }

            if (planetData.Landmarks != null) {
                foreach (var landmark in planetData.Landmarks) {
                    planet.PlanetLandmark.Add(new() {
                        Landmark = new() {
                            Title = landmark.Name != null ? landmark.Name : string.Empty,
                            Angle = landmark.Angle,
                            StartAngle = landmark.StartAngle,
                            EndAngle = landmark.EndAngle
                        }
                    });
                }
            }
        }

        return planet;
    }
}
