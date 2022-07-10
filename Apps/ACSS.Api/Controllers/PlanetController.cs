using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ACSS.Api.Models.Planet;
using ACSS.Api.Data;
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
        public async Task<ActionResult<IEnumerable<Planet>>> GetPlanet()
        {
          if (_context.Planet == null)
          {
              return NotFound();
          }
            return await _context.Planet.ToListAsync();
        }

        // GET: api/Planets/json
        [HttpGet("json")]
        public async Task<ActionResult<IEnumerable<KeyValuePair<string, object>>>> GetPlanetJson()
        {
            if (_context.Planet == null)
            {
                return NotFound();
            }



            Dictionary<string, object> planetData = new();

            foreach (var entity in _context.Planet.ToList())
            {
                dynamic planet = new ExpandoObject();
                planet.version = entity.GameVersion;



                dynamic baseData = new ExpandoObject();
                baseData.radius = entity.PlanetBaseData.Radius;
                baseData.radiusGravityScale = new ExpandoObject();
                baseData.gravity = entity.PlanetBaseData.Gravity;
                baseData.gravityDifficultyScale = new ExpandoObject();
                baseData.timewarpHeight = entity.PlanetBaseData.TimewarpHeight;

                if (entity.PlanetBaseData.VelocityArrowsHeight > 0)
                {
                    baseData.velocityArrowsHeight = entity.PlanetBaseData.VelocityArrowsHeight;
                }
                else
                {
                    baseData.velocityArrowsHeight = "NaN"; 
                }

                dynamic mapColor = new ExpandoObject();
                mapColor.r = entity.PlanetBaseData.Colour.Red;
                mapColor.g = entity.PlanetBaseData.Colour.Green;
                mapColor.b = entity.PlanetBaseData.Colour.Blue;
                mapColor.a = entity.PlanetBaseData.Colour.Alpha;
                baseData.mapColor = mapColor;
                planet.BASE_DATA = baseData;



                dynamic terrainData = new ExpandoObject();

                var terrainDataEntity = entity.TerrainData.FirstOrDefault();
                if (terrainDataEntity != null)
                {
                    dynamic terrainTextureData = new ExpandoObject();

                    terrainTextureData.planetTexture = terrainDataEntity.TerrainTextureData.PlanetTexture;
                    terrainTextureData.planetTextureCutout = terrainDataEntity.TerrainTextureData.PlanetTextureCutout;
                    terrainTextureData.surfaceTexture_A = terrainDataEntity.TerrainTextureData.SurfaceTextureANavigation.Title;

                    dynamic surfaceTextureSizeA = new ExpandoObject();
                    surfaceTextureSizeA.x = terrainDataEntity.TerrainTextureData.SurfaceTextureANavigation.TextureSize.X;
                    surfaceTextureSizeA.y = terrainDataEntity.TerrainTextureData.SurfaceTextureANavigation.TextureSize.Y;
                    terrainTextureData.surfaceTextureSize_A = surfaceTextureSizeA;

                    dynamic surfaceTextureSizeB = new ExpandoObject();
                    surfaceTextureSizeB.x = terrainDataEntity.TerrainTextureData.SurfaceTextureBNavigation.TextureSize.X;
                    surfaceTextureSizeB.y = terrainDataEntity.TerrainTextureData.SurfaceTextureBNavigation.TextureSize.Y;
                    terrainTextureData.surfaceTextureSize_B = surfaceTextureSizeB;

                    dynamic terrainTextureSizeC = new ExpandoObject();
                    terrainTextureSizeC.x = terrainDataEntity.TerrainTextureData.TerrainTextureCNavigation.TextureSize.X;
                    terrainTextureSizeC.y = terrainDataEntity.TerrainTextureData.TerrainTextureCNavigation.TextureSize.Y;
                    terrainTextureData.terrainTextureSize_C = terrainTextureSizeC;

                    terrainTextureData.surfaceLayerSize = terrainDataEntity.TerrainTextureData.SurfaceLayerSize;
                    terrainTextureData.minFade = terrainDataEntity.TerrainTextureData.MinFade;
                    terrainTextureData.maxFade = terrainDataEntity.TerrainTextureData.MaxFade;
                    terrainTextureData.shadowIntensity = terrainDataEntity.TerrainTextureData.ShadowIntensity;
                    terrainTextureData.shadowHeight = terrainDataEntity.TerrainTextureData.ShadowHeight;

                    terrainData.TERRAIN_TEXTURE_DATA = terrainTextureData;
                    var terrainFormulaDifficulties = new Dictionary<string, List<string>>();

                    foreach (var terrainFormulaDifficultiesEntity in terrainDataEntity.TerrainDataFormulaDifficulty) {
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

                        terrainFormulaDifficulties[terrainFormulaDifficultiesEntity.Difficulty.Title] = terrainFormulaList;
                    }

                    terrainData.terrainFormulaDifficulties = terrainFormulaDifficulties;

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

                    terrainData.textureFormula = textureFormula;
                    terrainData.verticeSize = terrainDataEntity.VerticeSize;
                    terrainData.collider = terrainDataEntity.Collider;
                    terrainData.flatZones = terrainDataEntity.TerrainDataFlatZone.ToList();
                }

                planet.TERRAIN_DATA = terrainData;

                if (entity.PlanetPostProcessing.Any())
                {
                    dynamic postProcessing = new ExpandoObject();
                    List<object> keys = new();

                    foreach (var postProcessingEntity in entity.PlanetPostProcessing)
                    {
                        dynamic key = new ExpandoObject();

                        key.height = postProcessingEntity.PostProcessingKey.Height;
                        key.shadowIntensity = postProcessingEntity.PostProcessingKey.ShadowIntensity;
                        key.starIntensity = postProcessingEntity.PostProcessingKey.StarIntensity;
                        key.hueShift = postProcessingEntity.PostProcessingKey.HueShift;
                        key.saturation = postProcessingEntity.PostProcessingKey.Saturation;
                        key.contrast = postProcessingEntity.PostProcessingKey.Contrast;
                        key.red = postProcessingEntity.PostProcessingKey.Red;
                        key.green = postProcessingEntity.PostProcessingKey.Green;
                        key.blue = postProcessingEntity.PostProcessingKey.Blue;

                        keys.Add(key);
                    }

                    postProcessing.keys = keys;

                    planet.POST_PROCESSING = postProcessing;
                }

                var orbitDataEntity = entity.PlanetOrbitDataPlanet.FirstOrDefault();

                if (orbitDataEntity != null)
                {
                    dynamic orbitData = new ExpandoObject();

                    orbitData.parent = orbitDataEntity.ParentPlanet.Title;
                    orbitData.semiMajorAxis = orbitDataEntity.SemiMajorAxis;
                    orbitData.smaDifficultyScale = new ExpandoObject();
                    orbitData.eccentricity = orbitDataEntity.Eccentricity;
                    orbitData.argumentOfPeriapsis = orbitDataEntity.ArgumentOfPeriapsis;
                    orbitData.directory = orbitDataEntity.Direction;
                    orbitData.multiplierSOI = orbitDataEntity.MultiplierSOI;
                    orbitData.soiDifficultyScale = new ExpandoObject();

                    planet.ORBIT_DATA = orbitData;
                }

                dynamic achievementData = new ExpandoObject();
                achievementData.Landed = entity.PlanetAchievementData.Landed;
                achievementData.Takeoff = entity.PlanetAchievementData.Takeoff;
                achievementData.Atmosphere = entity.PlanetAchievementData.Atmosphere;
                achievementData.Orbit = entity.PlanetAchievementData.Orbit;
                achievementData.Crash = entity.PlanetAchievementData.Crash;
                planet.ACHIEVEMENT_DATA = achievementData;

                if (entity.PlanetLandmark.Any())
                {
                    List<object> landmarks = new();

                    foreach (var landmarkEntity in entity.PlanetLandmark)
                    {
                        dynamic landmark = new ExpandoObject();
                        landmark.name = landmarkEntity.Landmark.Title;
                        landmark.angle = landmarkEntity.Landmark.Angle;
                        landmark.startAngle = landmarkEntity.Landmark.StartAngle;
                        landmark.endAngle = landmarkEntity.Landmark.EndAngle;
                        landmarks.Add(landmark);
                    }

                    planet.LANDMARKS = landmarks;
                }

                planetData[entity.Title] = planet;
            }

            return planetData;
        }

        // GET: api/Planets/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Planet>> GetPlanet(int id)
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
        public async Task<IActionResult> PutPlanet(int id, Planet planet)
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
        public async Task<ActionResult<Planet>> PostPlanet(Planet planet)
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
