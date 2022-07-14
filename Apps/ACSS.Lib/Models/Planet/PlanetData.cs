using System.Text.Json.Serialization;

namespace ACSS.Lib.Models.Planet
{
    public class PlanetData
    {
        [JsonPropertyName("version")]
        public decimal Version { get; set; }
        [JsonPropertyName("BASE_DATA")]
        public PlanetDetails? BaseData { get; set; }
        [JsonPropertyName("ATMOSPHERE_PHYSICS_DATA")]
        public PlanetPhysics? AtmospherePhysicsData { get; set; }
        [JsonPropertyName("ATMOSPHERE_VISUALS_DATA")]
        public PlanetVisuals? AtmosphereVisualsData { get; set; }
        [JsonPropertyName("TERRAIN_DATA")]
        public PlanetTerrain? TerrainData { get; set; }
        [JsonPropertyName("POST_PROCESSING")]
        public PlanetPostProc? PostProcessing { get; set; }
        [JsonPropertyName("ORBIT_DATA")]
        public PlanetOrbit? OrbitData { get; set; }
        [JsonPropertyName("ACHIEVEMENT_DATA")]
        public PlanetAchievements? AchievementData { get; set; }
        [JsonPropertyName("LANDMARKS")]
        public List<PlanetLocation>? Landmarks { get; set; }
    }
}
