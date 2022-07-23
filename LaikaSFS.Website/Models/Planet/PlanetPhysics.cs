using System.Text.Json.Serialization;

namespace LaikaSFS.Website.Models.Planet;

public class PlanetPhysics {
    [JsonPropertyName("height")]
    public decimal Height { get; set; }
    [JsonPropertyName("density")]
    public decimal Density { get; set; }
    [JsonPropertyName("curve")]
    public decimal Curve { get; set; }
    [JsonPropertyName("curveScale")]
    public object CurveScale { get; set; } = new();
    [JsonPropertyName("parachuteMultiplier")]
    public decimal ParachuteMultiplier { get; set; }
    [JsonPropertyName("upperAtmosphere")]
    public decimal UpperAtmosphere { get; set; }
    [JsonPropertyName("heightDifficultyScale")]
    public object HeightDifficultyScale { get; set; } = new();
    [JsonPropertyName("shockwaveIntensity")]
    public decimal ShockwaveIntensity { get; set; }
    [JsonPropertyName("minHeatingVelocityMultiplier")]
    public decimal MinHeatingVelocityMultiplier { get; set; }
}
