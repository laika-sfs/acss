using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Api.Models.Planet;

[Index("PlanetId", "PostProcessingKeyId", Name = "UQ_PlanetPostProcessing", IsUnique = true)]
public partial class PlanetPostProcessing {
    [Key]
    public int Id { get; set; }
    public int PlanetId { get; set; }
    public int PostProcessingKeyId { get; set; }

    [ForeignKey("PlanetId")]
    [InverseProperty("PlanetPostProcessing")]
    public virtual Planet Planet { get; set; } = null!;
    [ForeignKey("PostProcessingKeyId")]
    [InverseProperty("PlanetPostProcessing")]
    public virtual PostProcessingKey PostProcessingKey { get; set; } = null!;
}
