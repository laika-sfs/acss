using System.Text.Json.Serialization;

namespace ACSS.Web.Models.Planet;

public class PlanetVisuals {
    [JsonPropertyName("GRADIENT")]
    public PlanetGradient? Gradient { get; set; }
    [JsonPropertyName("CLOUDS")]
    public PlanetClouds? Clouds { get; set; }
    [JsonPropertyName("FOG")]
    public PlanetFog? Fog { get; set; }
}
