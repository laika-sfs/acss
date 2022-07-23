using System.Text.Json.Serialization;

namespace LaikaSFS.Website.Models.Planet;

public class PlanetOrbit {
    [JsonPropertyName("parent")]
    public string? Parent { get; set; }
    [JsonPropertyName("semiMajorAxis")]
    public decimal SemiMajorAxis { get; set; }
    [JsonPropertyName("smaDifficultyScale")]
    public object SemiMinorAxis { get; set; } = new();
    [JsonPropertyName("eccentricity")]
    public decimal Eccentricity { get; set; }
    [JsonPropertyName("argumentOfPeriapsis")]
    public decimal ArgumentOfPeriapsis { get; set; }
    [JsonPropertyName("direction")]
    public decimal Direction { get; set; }
    [JsonPropertyName("multiplierSOI")]
    public decimal MultiplierSOI { get; set; }
    [JsonPropertyName("soiDifficultyScale")]
    public object SOIDifficultyScale { get; set; } = new();
}
