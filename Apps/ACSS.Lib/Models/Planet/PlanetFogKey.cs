using System.Text.Json.Serialization;

namespace ACSS.Lib.Models.Planet;

public class PlanetFogKey {
    [JsonPropertyName("color")]
    public PlanetColour? Colour { get; set; }
    [JsonPropertyName("distance")]
    public decimal Distance { get; set; }
}
