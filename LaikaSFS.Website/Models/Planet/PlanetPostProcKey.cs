using System.Text.Json.Serialization;

namespace LaikaSFS.Website.Models.Planet;

public class PlanetPostProcKey {
    [JsonPropertyName("height")]
    public decimal Height { get; set; }
    [JsonPropertyName("shadowIntensity")]
    public decimal ShadowIntensity { get; set; }
    [JsonPropertyName("starIntensity")]
    public decimal StarIntensity { get; set; }
    [JsonPropertyName("hueShift")]
    public decimal HueShift { get; set; }
    [JsonPropertyName("saturation")]
    public decimal Saturation { get; set; }
    [JsonPropertyName("contrast")]
    public decimal Contrast { get; set; }
    [JsonPropertyName("red")]
    public decimal Red { get; set; }
    [JsonPropertyName("green")]
    public decimal Green { get; set; }
    [JsonPropertyName("blue")]
    public decimal Blue { get; set; }
}
