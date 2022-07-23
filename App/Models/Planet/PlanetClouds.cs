using System.Text.Json.Serialization;

namespace ACSS.Web.Models.Planet;

public class PlanetClouds {
    [JsonPropertyName("texture")]
    public string? Texture { get; set; }
    [JsonPropertyName("startHeight")]
    public decimal StartHeight { get; set; }
    [JsonPropertyName("width")]
    public decimal Width { get; set; }
    [JsonPropertyName("height")]
    public decimal Height { get; set; }
    [JsonPropertyName("alpha")]
    public decimal Alpha { get; set; }
    [JsonPropertyName("velocity")]
    public decimal Velocity { get; set; }
}
