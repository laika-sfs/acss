using System.Text.Json.Serialization;

namespace LaikaSFS.Website.Models.Planet;

public class PlanetFogKey {
    [JsonPropertyName("color")]
    public PlanetColour? Colour { get; set; }
    [JsonPropertyName("distance")]
    public decimal Distance { get; set; }
}
