using System.Text.Json.Serialization;

namespace ACSS.Lib.Models.Planet;

public class PlanetLocation {
    [JsonPropertyName("name")]
    public string? Name { get; set; }
    [JsonPropertyName("angle")]
    public decimal Angle { get; set; }
    [JsonPropertyName("startAngle")]
    public decimal StartAngle { get; set; }
    [JsonPropertyName("endAngle")]
    public decimal EndAngle { get; set; }
}
