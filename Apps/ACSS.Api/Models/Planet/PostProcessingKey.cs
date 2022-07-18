using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Api.Models.Planet;

[Index("Height", "ShadowIntensity", "StarIntensity", "HueShift", "Saturation", "Contrast", "Red", "Green", "Blue", Name = "UQ_PostProcessingKey", IsUnique = true)]
[Index("Title", Name = "UQ_PostProcessingKey_Title", IsUnique = true)]
public partial class PostProcessingKey {
    public PostProcessingKey() {
        PlanetPostProcessing = new HashSet<PlanetPostProcessing>();
    }

    [Key]
    public int Id { get; set; }
    [StringLength(50)]
    public string Title { get; set; } = null!;
    [Column(TypeName = "decimal(36, 18)")]
    public decimal Height { get; set; }
    [Column(TypeName = "decimal(36, 18)")]
    public decimal ShadowIntensity { get; set; }
    [Column(TypeName = "decimal(36, 18)")]
    public decimal StarIntensity { get; set; }
    [Column(TypeName = "decimal(36, 18)")]
    public decimal HueShift { get; set; }
    [Column(TypeName = "decimal(36, 18)")]
    public decimal Saturation { get; set; }
    [Column(TypeName = "decimal(36, 18)")]
    public decimal Contrast { get; set; }
    [Column(TypeName = "decimal(36, 18)")]
    public decimal Red { get; set; }
    [Column(TypeName = "decimal(36, 18)")]
    public decimal Green { get; set; }
    [Column(TypeName = "decimal(36, 18)")]
    public decimal Blue { get; set; }

    [InverseProperty("PostProcessingKey")]
    public virtual ICollection<PlanetPostProcessing> PlanetPostProcessing { get; set; }
}
