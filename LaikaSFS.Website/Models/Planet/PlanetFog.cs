using System.Text.Json.Serialization;

namespace LaikaSFS.Website.Models.Planet;

public class PlanetFog {
    [JsonPropertyName("keys")]
    public List<PlanetFogKey>? Keys { get; set; }
}
