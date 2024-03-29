﻿using System.Text.Json.Serialization;

namespace LaikaSFS.Website.Models.Planet;

public class PlanetColour {
    [JsonPropertyName("r")]
    public decimal Red { get; set; }
    [JsonPropertyName("g")]
    public decimal Green { get; set; }
    [JsonPropertyName("b")]
    public decimal Blue { get; set; }
    [JsonPropertyName("a")]
    public decimal Alpha { get; set; }
}
