using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using LaikaSFS.Website.Models.Planet;
using Microsoft.EntityFrameworkCore;

namespace LaikaSFS.Website.Models.Planet
{
    [Table("Planet", Schema = "Planet")]
    [Index("Title", "GameVersion", Name = "UQ_Planet", IsUnique = true)]
    public partial class Planet
    {
        public Planet()
        {
            PlanetLandmark = new HashSet<PlanetLandmark>();
            PlanetOrbitDataParentPlanet = new HashSet<PlanetOrbitData>();
            PlanetOrbitDataPlanet = new HashSet<PlanetOrbitData>();
            PlanetPostProcessing = new HashSet<PlanetPostProcessing>();
            TerrainData = new HashSet<TerrainData>();
        }

        [Key]
        public int Id { get; set; }
        [StringLength(50)]
        public string Title { get; set; } = null!;
        [Column(TypeName = "decimal(2, 1)")]
        public decimal GameVersion { get; set; }

        [InverseProperty("Planet")]
        public virtual PlanetAchievementData PlanetAchievementData { get; set; } = null!;
        [InverseProperty("Planet")]
        public virtual PlanetAtmospherePhysicsData PlanetAtmospherePhysicsData { get; set; } = null!;
        [InverseProperty("Planet")]
        public virtual PlanetAtmosphereVisualsData PlanetAtmosphereVisualsData { get; set; } = null!;
        [InverseProperty("Planet")]
        public virtual PlanetBaseData PlanetBaseData { get; set; } = null!;
        [InverseProperty("Planet")]
        public virtual ICollection<PlanetLandmark> PlanetLandmark { get; set; }
        [InverseProperty("ParentPlanet")]
        public virtual ICollection<PlanetOrbitData> PlanetOrbitDataParentPlanet { get; set; }
        [InverseProperty("Planet")]
        public virtual ICollection<PlanetOrbitData> PlanetOrbitDataPlanet { get; set; }
        [InverseProperty("Planet")]
        public virtual ICollection<PlanetPostProcessing> PlanetPostProcessing { get; set; }
        [InverseProperty("Planet")]
        public virtual ICollection<TerrainData> TerrainData { get; set; }

        public PlanetData ToJson() {
            PlanetData planetData = new() {
                Version = GameVersion
            };

            if (PlanetBaseData != null) {
                planetData.BaseData = new() {
                    Radius = PlanetBaseData.Radius,
                    Gravity = PlanetBaseData.Gravity,
                    TimewarpHeight = PlanetBaseData.TimewarpHeight,
                    VelocityArrowsHeight = PlanetBaseData.VelocityArrowsHeight,
                    Colour = new() {
                        Red = PlanetBaseData.Colour.Red,
                        Green = PlanetBaseData.Colour.Green,
                        Blue = PlanetBaseData.Colour.Blue,
                        Alpha = PlanetBaseData.Colour.Alpha
                    }
                };
            }

            if (PlanetAchievementData != null) {
                planetData.AchievementData = new() {
                    Landed = PlanetAchievementData.Landed,
                    Takeoff = PlanetAchievementData.Takeoff,
                    Atmosphere = PlanetAchievementData.Atmosphere,
                    Orbit = PlanetAchievementData.Orbit,
                    Crash = PlanetAchievementData.Crash
                };
            }

            var terrainDataEntity = TerrainData.FirstOrDefault();

            if (PlanetAtmospherePhysicsData != null) {
                planetData.AtmospherePhysicsData = new() {
                    Height = PlanetAtmospherePhysicsData.Height,
                    Density = PlanetAtmospherePhysicsData.Density,
                    Curve = PlanetAtmospherePhysicsData.Curve,
                    ParachuteMultiplier = PlanetAtmospherePhysicsData.ParachuteMultiplier,
                    UpperAtmosphere = PlanetAtmospherePhysicsData.UpperAtmosphere,
                    ShockwaveIntensity = PlanetAtmospherePhysicsData.ShockwaveIntensity,
                    MinHeatingVelocityMultiplier = PlanetAtmospherePhysicsData.MinHeatingVelocityMultiplier
                };
            }

            if (PlanetAtmosphereVisualsData != null) {
                planetData.AtmosphereVisualsData = new() {
                    Gradient = new() {
                        PositionZ = PlanetAtmosphereVisualsData.Gradient.PositionZ,
                        Height = PlanetAtmosphereVisualsData.Gradient.Height,
                        Texture = PlanetAtmosphereVisualsData.Gradient.Texture
                    },
                    Clouds = new() {
                        Texture = PlanetAtmosphereVisualsData.Clouds.Texture,
                        StartHeight = PlanetAtmosphereVisualsData.Clouds.StartHeight,
                        Width = PlanetAtmosphereVisualsData.Clouds.Width,
                        Height = PlanetAtmosphereVisualsData.Clouds.Height,
                        Alpha = PlanetAtmosphereVisualsData.Clouds.Alpha,
                        Velocity = PlanetAtmosphereVisualsData.Clouds.Velocity
                    },
                    Fog = new() {
                        Keys = new()
                    }
                };


                foreach (var fogKeyLinkEntity in PlanetAtmosphereVisualsData.FogKeySet.FogKeyLink) {
                    if (fogKeyLinkEntity.FogKey != null) {

                        planetData.AtmosphereVisualsData.Fog.Keys.Add(new() {
                            Colour = new() {
                                Red = fogKeyLinkEntity.FogKey.Colour.Red,
                                Green = fogKeyLinkEntity.FogKey.Colour.Green,
                                Blue = fogKeyLinkEntity.FogKey.Colour.Blue,
                                Alpha = fogKeyLinkEntity.FogKey.Colour.Alpha
                            },
                            Distance = fogKeyLinkEntity.FogKey.Distance
                        });
                    }
                }
            }

            if (terrainDataEntity != null) {
                planetData.TerrainData = new() {
                    TerrainTextureData = new() {
                        PlanetTexture = terrainDataEntity.TerrainTextureData.PlanetTexture,
                        PlanetTextureCutout = terrainDataEntity.TerrainTextureData.PlanetTextureCutout,
                        SurfaceTextureA = terrainDataEntity.TerrainTextureData.SurfaceTextureANavigation.Title,
                        SurfaceTextureSizeA = new() {
                            X = terrainDataEntity.TerrainTextureData.SurfaceTextureANavigation.TextureSize.X,
                            Y = terrainDataEntity.TerrainTextureData.SurfaceTextureANavigation.TextureSize.Y
                        },
                        SurfaceTextureB = terrainDataEntity.TerrainTextureData.SurfaceTextureBNavigation.Title,
                        SurfaceTextureSizeB = new() {
                            X = terrainDataEntity.TerrainTextureData.SurfaceTextureBNavigation.TextureSize.X,
                            Y = terrainDataEntity.TerrainTextureData.SurfaceTextureBNavigation.TextureSize.Y
                        },
                        TerrainTextureC = terrainDataEntity.TerrainTextureData.TerrainTextureCNavigation.Title,
                        TerrainTextureSizeC = new() {
                            X = terrainDataEntity.TerrainTextureData.TerrainTextureCNavigation.TextureSize.X,
                            Y = terrainDataEntity.TerrainTextureData.TerrainTextureCNavigation.TextureSize.Y
                        },
                        SurfaceLayerSize = terrainDataEntity.TerrainTextureData.SurfaceLayerSize,
                        MinFade = terrainDataEntity.TerrainTextureData.MinFade,
                        MaxFade = terrainDataEntity.TerrainTextureData.MaxFade,
                        ShadowIntensity = terrainDataEntity.TerrainTextureData.ShadowIntensity,
                        ShadowHeight = terrainDataEntity.TerrainTextureData.ShadowHeight
                    },
                    TerrainFormulaDifficulties = new()
                };

                var terrainFormulaDifficulties = new Dictionary<string, List<string>>();

                foreach (var terrainFormulaDifficultiesEntity in terrainDataEntity.TerrainDataFormulaDifficulty) {

                    var terrainFormulaList = new List<string>();

                    var terrainFormulaSet = terrainFormulaDifficultiesEntity.TerrainFormulaSet;

                    if (terrainFormulaSet != null) {
                        foreach (var terrainFormulaLink in terrainFormulaSet.TerrainFormulaLink.OrderBy(terForm => terForm.TerrainFormulaOrder)) {
                            var terrainFormula = terrainFormulaLink.TerrainFormula;
                            string formula = $"{terrainFormula.Title} = AddHeightMap({terrainFormula.Heightmap.Title}, {terrainFormula.Width:0.#}, {terrainFormula.Height:0.#}";

                            if (terrainFormula.Modifier != null || terrainFormula.AddOnFormula != null) {
                                if (terrainFormula.Modifier == null) {
                                    formula += ", null";
                                }
                                else {
                                    formula += $", {terrainFormula.Modifier.Title}";
                                }

                                if (terrainFormula.AddOnFormula == null) {
                                    formula += ", null";
                                }
                                else {
                                    formula += $", {terrainFormula.AddOnFormula.Title}";
                                }
                            }

                            formula += ")";

                            terrainFormulaList.Add(formula);
                        }
                    }

                    planetData.TerrainData.TerrainFormulaDifficulties[terrainFormulaDifficultiesEntity.Difficulty.Title] = terrainFormulaList;
                }

                List<string> textureFormula = new();

                foreach (var textureFormulaEntity in terrainDataEntity.TerrainDataTextureFormula) {
                    string formula = string.Empty;

                    if (textureFormulaEntity.TextureFormula.Heightmap == null &&
                        textureFormulaEntity.TextureFormula.Width == null &&
                        textureFormulaEntity.TextureFormula.Height == null &&
                        textureFormulaEntity.TextureFormula.Modifier != null &&
                        textureFormulaEntity.TextureFormula.AddOnFormula == null) {
                        formula += $"{textureFormulaEntity.TextureFormula.Title} = ApplyCurve({textureFormulaEntity.TextureFormula.Modifier.Title})";
                    }
                    else if (textureFormulaEntity.TextureFormula.Heightmap != null &&
                            textureFormulaEntity.TextureFormula.Width != null &&
                            textureFormulaEntity.TextureFormula.Height != null) {
                        formula += $"{textureFormulaEntity.TextureFormula.Title} = AddHeightMap({textureFormulaEntity.TextureFormula.Heightmap.Title}, {textureFormulaEntity.TextureFormula.Width.Value:0.#}, {textureFormulaEntity.TextureFormula.Height.Value:0.#}";

                        if (textureFormulaEntity.TextureFormula.Modifier != null || textureFormulaEntity.TextureFormula.AddOnFormula != null) {
                            if (textureFormulaEntity.TextureFormula.Modifier == null) {
                                formula += ", null";
                            }
                            else {
                                formula += $", {textureFormulaEntity.TextureFormula.Modifier.Title}";
                            }

                            if (textureFormulaEntity.TextureFormula.AddOnFormula == null) {
                                formula += ", null";
                            }
                            else {
                                formula += $", {textureFormulaEntity.TextureFormula.AddOnFormula.Title}";
                            }
                        }

                        formula += ")";
                    }

                    textureFormula.Add(formula);
                }

                planetData.TerrainData.TextureFormula = textureFormula;
                planetData.TerrainData.VerticeSize = terrainDataEntity.VerticeSize;
                planetData.TerrainData.Collider = terrainDataEntity.Collider;

                planetData.TerrainData.FlatZones = new();

                foreach (var terrainDataFlatZone in terrainDataEntity.TerrainDataFlatZone) {
                    planetData.TerrainData.FlatZones.Add(new() {
                        Height = terrainDataFlatZone.FlatZone.Height,
                        Angle = terrainDataFlatZone.FlatZone.Angle,
                        Width = terrainDataFlatZone.FlatZone.Width,
                        Transition = terrainDataFlatZone.FlatZone.Transition
                    });
                }
            }

            if (PlanetPostProcessing.Any()) {
                planetData.PostProcessing = new() {
                    Keys = new()
                };

                foreach (var postProcessingEntity in PlanetPostProcessing) {
                    planetData.PostProcessing.Keys.Add(new() {
                        Height = postProcessingEntity.PostProcessingKey.Height,
                        ShadowIntensity = postProcessingEntity.PostProcessingKey.ShadowIntensity,
                        StarIntensity = postProcessingEntity.PostProcessingKey.StarIntensity,
                        HueShift = postProcessingEntity.PostProcessingKey.HueShift,
                        Saturation = postProcessingEntity.PostProcessingKey.Saturation,
                        Contrast = postProcessingEntity.PostProcessingKey.Contrast,
                        Red = postProcessingEntity.PostProcessingKey.Red,
                        Green = postProcessingEntity.PostProcessingKey.Green,
                        Blue = postProcessingEntity.PostProcessingKey.Blue
                    });
                }
            }

            var orbitDataEntity = PlanetOrbitDataPlanet.FirstOrDefault();

            if (orbitDataEntity != null) {
                planetData.OrbitData = new() {
                    Parent = orbitDataEntity.ParentPlanet.Title,
                    SemiMajorAxis = orbitDataEntity.SemiMajorAxis,
                    Eccentricity = orbitDataEntity.Eccentricity,
                    ArgumentOfPeriapsis = orbitDataEntity.ArgumentOfPeriapsis,
                    Direction = orbitDataEntity.Direction,
                    MultiplierSOI = orbitDataEntity.MultiplierSOI
                };
            }

            if (PlanetLandmark.Any()) {
                planetData.Landmarks = new();

                foreach (var landmarkEntity in PlanetLandmark) {
                    planetData.Landmarks.Add(new() {
                        Name = landmarkEntity.Landmark.Title,
                        Angle = landmarkEntity.Landmark.Angle,
                        StartAngle = landmarkEntity.Landmark.StartAngle,
                        EndAngle = landmarkEntity.Landmark.EndAngle
                    });
                }
            }

            return planetData;
        }
    }
}
