using System.Text.Json.Serialization;

namespace ACSS.Lib.Models.Planet
{
    public class PlanetTerrain
    {
        [JsonPropertyName("TERRAIN_TEXTURE_DATA")]
        public PlanetTerrainTexture? TerrainTextureData { get; set; }
        [JsonPropertyName("terrainFormulaDifficulties")]
        public Dictionary<string, List<string>>? TerrainFormulaDifficulties { get; set; }
        [JsonPropertyName("textureFormula")]
        public List<string>? TextureFormula { get; set; }
        [JsonPropertyName("verticeSize")]
        public decimal VerticeSize { get; set; }
        [JsonPropertyName("collider")]
        public bool Collider { get; set; }
        [JsonPropertyName("flatZones")]
        public List<PlanetFlatZone>? FlatZones { get; set; }
    }
}
