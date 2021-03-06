using System.Text.Json.Serialization;

namespace ACSS.Lib.Models.Planet;

public class PlanetTextureSize {
    [JsonPropertyName("x")]
    public decimal X { get; set; }
    [JsonPropertyName("y")]
    public decimal Y { get; set; }
}
