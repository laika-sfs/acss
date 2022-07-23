using System.Text.Json.Serialization;

namespace ACSS.Web.Models.Planet;

public class PlanetPostProc {
    [JsonPropertyName("keys")]
    public List<PlanetPostProcKey>? Keys { get; set; }
}
