using System.Text.Json.Serialization;

namespace LaikaSFS.Website.Models.Planet;

public class PlanetAchievements {
    [JsonPropertyName("Landed")]
    public bool Landed { get; set; }
    [JsonPropertyName("Takeoff")]
    public bool Takeoff { get; set; }
    [JsonPropertyName("Atmosphere")]
    public bool Atmosphere { get; set; }
    [JsonPropertyName("Orbit")]
    public bool Orbit { get; set; }
    [JsonPropertyName("Crash")]
    public bool Crash { get; set; }
}
