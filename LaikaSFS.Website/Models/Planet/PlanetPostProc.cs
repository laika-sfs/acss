using System.Text.Json.Serialization;

namespace LaikaSFS.Website.Models.Planet;

public class PlanetPostProc {
    [JsonPropertyName("keys")]
    public List<PlanetPostProcKey>? Keys { get; set; }
}
