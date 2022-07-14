using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ACSS.Api.Models.Planet;
using ACSS.Api.Data;
using ACSS.Lib.Models.Planet;
using System.Dynamic;

namespace ACSS.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PlanetController : ControllerBase
    {
        private readonly PlanetContext _context;

        public PlanetController(PlanetContext context)
        {
            _context = context;
        }

        // GET: api/Planets
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Models.Planet.Planet>>> GetPlanet()
        {
            if (_context.Planet == null)
            {
                return NotFound();
            }
            return await _context.Planet.ToListAsync();
        }

        // GET: api/Planets/json
        [HttpGet("json")]
        public async Task<ActionResult<IEnumerable<KeyValuePair<string, Lib.Models.Planet.PlanetData>>>> GetPlanetJson()
        {
            if (_context.Planet == null)
            {
                return NotFound();
            }



            Dictionary<string, Lib.Models.Planet.PlanetData> planetDataList = new();
            List<Models.Planet.Planet> planetList = await _context.Planet.ToListAsync();

            foreach (var planet in planetList)
            {
                Lib.Models.Planet.PlanetData planetData = new Lib.Models.Planet.PlanetData()
                {
                    Version = planet.GameVersion,
                    BaseData = new()
                    {
                        Radius = planet.PlanetBaseData.Radius,
                        Gravity = planet.PlanetBaseData.Gravity,
                        TimewarpHeight = planet.PlanetBaseData.TimewarpHeight,
                        VelocityArrowsHeight = planet.PlanetBaseData.VelocityArrowsHeight,
                        Colour = new()
                        {
                            Red = planet.PlanetBaseData.Colour.Red,
                            Green = planet.PlanetBaseData.Colour.Green,
                            Blue = planet.PlanetBaseData.Colour.Blue,
                            Alpha = planet.PlanetBaseData.Colour.Alpha
                        }
                    },
                    AchievementData = new()
                    {
                        Landed = planet.PlanetAchievementData.Landed,
                        Takeoff = planet.PlanetAchievementData.Takeoff,
                        Atmosphere = planet.PlanetAchievementData.Atmosphere,
                        Orbit = planet.PlanetAchievementData.Orbit,
                        Crash = planet.PlanetAchievementData.Crash
                    }
                };

                var terrainDataEntity = planet.TerrainData.FirstOrDefault();

                if (planet.PlanetAtmospherePhysicsData != null)
                {
                    planetData.AtmospherePhysicsData = new()
                    {
                        Height = planet.PlanetAtmospherePhysicsData.Height,
                        Density = planet.PlanetAtmospherePhysicsData.Density,
                        Curve = planet.PlanetAtmospherePhysicsData.Curve,
                        ParachuteMultiplier = planet.PlanetAtmospherePhysicsData.ParachuteMultiplier,
                        UpperAtmosphere = planet.PlanetAtmospherePhysicsData.UpperAtmosphere,
                        ShockwaveIntensity = planet.PlanetAtmospherePhysicsData.ShockwaveIntensity,
                        MinHeatingVelocityMultiplier = planet.PlanetAtmospherePhysicsData.MinHeatingVelocityMultiplier
                    };
                }

                if (planet.PlanetAtmosphereVisualsData != null)
                {
                    planetData.AtmosphereVisualsData = new()
                    {
                        Gradient = new()
                        {
                            PositionZ = planet.PlanetAtmosphereVisualsData.Gradient.PositionZ,
                            Height = planet.PlanetAtmosphereVisualsData.Gradient.Height,
                            Texture = planet.PlanetAtmosphereVisualsData.Gradient.Texture
                        },
                        Clouds = new()
                        {
                            Texture = planet.PlanetAtmosphereVisualsData.Cloud.Texture,
                            StartHeight = planet.PlanetAtmosphereVisualsData.Cloud.StartHeight,
                            Width = planet.PlanetAtmosphereVisualsData.Cloud.Width,
                            Height = planet.PlanetAtmosphereVisualsData.Cloud.Height,
                            Alpha = planet.PlanetAtmosphereVisualsData.Cloud.Alpha,
                            Velocity = planet.PlanetAtmosphereVisualsData.Cloud.Velocity
                        },
                        Fog = new()
                    };


                    foreach (var fogKeyLinkEntity in planet.PlanetAtmosphereVisualsData.FogKeySet.FogKeyLink)
                    {
                        if (planetData.AtmosphereVisualsData.Fog.Keys != null)
                        {
                            planetData.AtmosphereVisualsData.Fog.Keys.Add(new()
                            {
                                Colour = new()
                                {
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

                if (terrainDataEntity != null)
                {
                    planetData.TerrainData = new()
                    {
                        TerrainTextureData = new()
                        {
                            PlanetTexture = terrainDataEntity.TerrainTextureData.PlanetTexture,
                            PlanetTextureCutout = terrainDataEntity.TerrainTextureData.PlanetTextureCutout,
                            SurfaceTextureA = terrainDataEntity.TerrainTextureData.SurfaceTextureANavigation.Title,
                            SurfaceTextureSizeA = new()
                            {
                                X = terrainDataEntity.TerrainTextureData.SurfaceTextureANavigation.TextureSize.X,
                                Y = terrainDataEntity.TerrainTextureData.SurfaceTextureANavigation.TextureSize.Y
                            },
                            SurfaceTextureB = terrainDataEntity.TerrainTextureData.SurfaceTextureBNavigation.Title,
                            SurfaceTextureSizeB = new()
                            {
                                X = terrainDataEntity.TerrainTextureData.SurfaceTextureBNavigation.TextureSize.X,
                                Y = terrainDataEntity.TerrainTextureData.SurfaceTextureBNavigation.TextureSize.Y
                            },
                            TerrainTextureC = terrainDataEntity.TerrainTextureData.TerrainTextureCNavigation.Title,
                            TerrainTextureSizeC = new()
                            {
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

                    foreach (var terrainFormulaDifficultiesEntity in terrainDataEntity.TerrainDataFormulaDifficulty)
                    {

                        var terrainFormulaList = new List<string>();

                        var terrainFormulaSet = terrainFormulaDifficultiesEntity.TerrainFormulaSet;

                        if (terrainFormulaSet != null)
                        {
                            foreach (var terrainFormulaLink in terrainFormulaSet.TerrainFormulaLink)
                            {
                                var terrainFormula = terrainFormulaLink.TerrainFormula;
                                string formula = $"{terrainFormula.Title} = AddHeightMap({terrainFormula.Heightmap.Title}, {terrainFormula.Width}, {terrainFormula.Height}";

                                if (terrainFormula.Modifier != null || terrainFormula.AddOnFormula != null)
                                {
                                    if (terrainFormula.Modifier == null)
                                    {
                                        formula += ", null";
                                    }
                                    else
                                    {
                                        formula += $", {terrainFormula.Modifier.Title}";
                                    }

                                    if (terrainFormula.AddOnFormula == null)
                                    {
                                        formula += ", null";
                                    }
                                    else
                                    {
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

                    foreach (var textureFormulaEntity in terrainDataEntity.TerrainDataTextureFormula)
                    {
                        string formula = string.Empty;

                        if (textureFormulaEntity.TextureFormula.Heightmap == null &&
                            textureFormulaEntity.TextureFormula.Width == null &&
                            textureFormulaEntity.TextureFormula.Height == null &&
                            textureFormulaEntity.TextureFormula.Modifier != null &&
                            textureFormulaEntity.TextureFormula.AddOnFormula == null)
                        {
                            formula += $"{textureFormulaEntity.TextureFormula.Title} = ApplyCurve({textureFormulaEntity.TextureFormula.Modifier.Title})";
                        }
                        else if (textureFormulaEntity.TextureFormula.Heightmap != null &&
                                textureFormulaEntity.TextureFormula.Width != null &&
                                textureFormulaEntity.TextureFormula.Height != null)
                        {
                            formula += $"{textureFormulaEntity.TextureFormula.Title} = AddHeightMap({textureFormulaEntity.TextureFormula.Heightmap.Title}, {textureFormulaEntity.TextureFormula.Width}, {textureFormulaEntity.TextureFormula.Height}";

                            if (textureFormulaEntity.TextureFormula.Modifier != null || textureFormulaEntity.TextureFormula.AddOnFormula != null)
                            {
                                if (textureFormulaEntity.TextureFormula.Modifier == null)
                                {
                                    formula += ", null";
                                }
                                else
                                {
                                    formula += $", {textureFormulaEntity.TextureFormula.Modifier.Title}";
                                }

                                if (textureFormulaEntity.TextureFormula.AddOnFormula == null)
                                {
                                    formula += ", null";
                                }
                                else
                                {
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

                    foreach (var terrainDataFlatZone in terrainDataEntity.TerrainDataFlatZone)
                    {
                        planetData.TerrainData.FlatZones.Add(new()
                        {
                            Height = terrainDataFlatZone.FlatZone.Height,
                            Angle = terrainDataFlatZone.FlatZone.Angle,
                            Width = terrainDataFlatZone.FlatZone.Width,
                            Transition = terrainDataFlatZone.FlatZone.Transition
                        });
                    }
                }

                if (planet.PlanetPostProcessing.Any())
                {
                    planetData.PostProcessing = new()
                    {
                        Keys = new()
                    };

                    foreach (var postProcessingEntity in planet.PlanetPostProcessing)
                    {
                        planetData.PostProcessing.Keys.Add(new()
                        {
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

                var orbitDataEntity = planet.PlanetOrbitDataPlanet.FirstOrDefault();

                if (orbitDataEntity != null)
                {
                    planetData.OrbitData = new()
                    {
                        Parent = orbitDataEntity.ParentPlanet.Title,
                        SemiMajorAxis = orbitDataEntity.SemiMajorAxis,
                        Eccentricity = orbitDataEntity.Eccentricity,
                        ArgumentOfPeriapsis = orbitDataEntity.ArgumentOfPeriapsis,
                        Direction = orbitDataEntity.Direction,
                        MultiplierSOI = orbitDataEntity.MultiplierSOI
                    };
                }

                if (planet.PlanetLandmark.Any())
                {
                    planetData.Landmarks = new();

                    foreach (var landmarkEntity in planet.PlanetLandmark)
                    {
                        planetData.Landmarks.Add(new()
                        {
                            Name = landmarkEntity.Landmark.Title,
                            Angle = landmarkEntity.Landmark.Angle,
                            StartAngle = landmarkEntity.Landmark.StartAngle,
                            EndAngle = landmarkEntity.Landmark.EndAngle
                        });
                    }
                }

                planetDataList[planet.Title] = planetData;
            }

            return planetDataList;
        }

        // GET: api/Planets/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Models.Planet.Planet>> GetPlanet(int id)
        {
            if (_context.Planet == null)
            {
                return NotFound();
            }
            var planet = await _context.Planet.FindAsync(id);

            if (planet == null)
            {
                return NotFound();
            }

            return planet;
        }

        // PUT: api/Planets/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPlanet(int id, Models.Planet.Planet planet)
        {
            if (id != planet.Id)
            {
                return BadRequest();
            }

            _context.Entry(planet).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PlanetExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Planets
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Models.Planet.Planet>> PostPlanet(Models.Planet.Planet planet)
        {
            if (_context.Planet == null)
            {
                return Problem("Entity set 'PlanetContext.Planet'  is null.");
            }
            _context.Planet.Add(planet);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetPlanet", new { id = planet.Id }, planet);
        }

        // DELETE: api/Planets/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePlanet(int id)
        {
            if (_context.Planet == null)
            {
                return NotFound();
            }
            var planet = await _context.Planet.FindAsync(id);
            if (planet == null)
            {
                return NotFound();
            }

            _context.Planet.Remove(planet);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool PlanetExists(int id)
        {
            return (_context.Planet?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
