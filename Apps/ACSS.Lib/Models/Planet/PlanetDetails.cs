using System.Text.Json.Serialization;

namespace ACSS.Lib.Models.Planet
{
    public class PlanetDetails
    {
        [JsonPropertyName("radius")]
        public decimal Radius { get; set; }
        [JsonPropertyName("radiusGravityScale")]
        public object RadiusGravityScale { get; set; } = new();
        [JsonPropertyName("gravity")]
        public decimal Gravity { get; set; }
        [JsonPropertyName("gravityDifficultyScale")]
        public object GravityDifficultyScale { get; set; } = new();
        [JsonPropertyName("timewarpHeight")]
        public decimal TimewarpHeight { get; set; }
        [JsonPropertyName("velocityArrowsHeight")]
        public decimal VelocityArrowsHeight { get; set; }
        [JsonPropertyName("mapColor")]
        public PlanetColour? Colour { get; set; }
    }
}
