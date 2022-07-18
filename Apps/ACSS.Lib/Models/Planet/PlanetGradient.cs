using System.Text.Json.Serialization;

namespace ACSS.Lib.Models.Planet;

public class PlanetGradient {
    [JsonPropertyName("positionZ")]
    public decimal PositionZ { get; set; }
    [JsonPropertyName("height")]
    public decimal Height { get; set; }
    [JsonPropertyName("texture")]
    public string? Texture { get; set; }
}
