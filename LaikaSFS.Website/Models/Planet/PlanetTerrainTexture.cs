using System.Text.Json.Serialization;

namespace LaikaSFS.Website.Models.Planet;

public class PlanetTerrainTexture {
    [JsonPropertyName("planetTexture")]
    public string? PlanetTexture { get; set; }
    [JsonPropertyName("planetTextureCutout")]
    public decimal PlanetTextureCutout { get; set; }
    [JsonPropertyName("surfaceTexture_A")]
    public string? SurfaceTextureA { get; set; }
    [JsonPropertyName("surfaceTextureSize_A")]
    public PlanetTextureSize? SurfaceTextureSizeA { get; set; }
    [JsonPropertyName("surfaceTexture_B")]
    public string? SurfaceTextureB { get; set; }
    [JsonPropertyName("surfaceTextureSize_B")]
    public PlanetTextureSize? SurfaceTextureSizeB { get; set; }
    [JsonPropertyName("terrainTexture_C")]
    public string? TerrainTextureC { get; set; }
    [JsonPropertyName("terrainTextureSize_C")]
    public PlanetTextureSize? TerrainTextureSizeC { get; set; }
    [JsonPropertyName("surfaceLayerSize")]
    public decimal SurfaceLayerSize { get; set; }
    [JsonPropertyName("minFade")]
    public decimal MinFade { get; set; }
    [JsonPropertyName("maxFade")]
    public decimal MaxFade { get; set; }
    [JsonPropertyName("shadowIntensity")]
    public decimal ShadowIntensity { get; set; }
    [JsonPropertyName("shadowHeight")]
    public decimal ShadowHeight { get; set; }
}
