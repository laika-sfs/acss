using System.Text.Json.Serialization;

namespace ACSS.Lib.Models.Planet;

public class PlanetFlatZone {
    [JsonPropertyName("height")]
    public decimal Height { get; set; }
    [JsonPropertyName("angle")]
    public decimal Angle { get; set; }
    [JsonPropertyName("width")]
    public decimal Width { get; set; }
    [JsonPropertyName("transition")]
    public decimal Transition { get; set; }
}
