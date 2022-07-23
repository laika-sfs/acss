using System.Text.Json.Serialization;

namespace ACSS.Web.Models.Planet;

public class PlanetDetails {
    [JsonPropertyName("radius")]
    public decimal Radius { get; set; }
    [JsonPropertyName("radiusDifficultyScale")]
    public object RadiusDifficultyScale { get; set; } = new();
    [JsonPropertyName("gravity")]
    public decimal Gravity { get; set; }
    [JsonPropertyName("gravityDifficultyScale")]
    public object GravityDifficultyScale { get; set; } = new();
    [JsonPropertyName("timewarpHeight")]
    public decimal TimewarpHeight { get; set; }
    [JsonPropertyName("velocityArrowsHeight")]
    public decimal VelocityArrowsHeight { get; set; }
    [JsonPropertyName("mapColor")]
    public PlanetColour? Colour { get; set; }
}
