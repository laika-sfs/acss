using System.Text.Json.Serialization;

namespace ACSS.Lib.Models.Planet
{
    public class PlanetFog
    {
        [JsonPropertyName("keys")]
        public List<PlanetFogKey>? Keys { get; set; }
    }
}
