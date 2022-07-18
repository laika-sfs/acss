using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Api.Models.Planet;

[Index("PlanetId", Name = "UQ_PlanetAtmospherePhysicsData", IsUnique = true)]
public partial class PlanetAtmospherePhysicsData {
    [Key]
    public int Id { get; set; }
    public int PlanetId { get; set; }
    [Column(TypeName = "decimal(36, 18)")]
    public decimal Height { get; set; }
    [Column(TypeName = "decimal(36, 18)")]
    public decimal Density { get; set; }
    [Column(TypeName = "decimal(36, 18)")]
    public decimal Curve { get; set; }
    [Column(TypeName = "decimal(36, 18)")]
    public decimal ParachuteMultiplier { get; set; }
    [Column(TypeName = "decimal(36, 18)")]
    public decimal UpperAtmosphere { get; set; }
    [Column(TypeName = "decimal(36, 18)")]
    public decimal ShockwaveIntensity { get; set; }
    [Column(TypeName = "decimal(36, 18)")]
    public decimal MinHeatingVelocityMultiplier { get; set; }

    [ForeignKey("PlanetId")]
    [InverseProperty("PlanetAtmospherePhysicsData")]
    public virtual Planet Planet { get; set; } = null!;
}
