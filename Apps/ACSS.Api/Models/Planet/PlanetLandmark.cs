using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Api.Models.Planet;

[Index("PlanetId", "LandmarkId", Name = "UQ_PlanetLandmark", IsUnique = true)]
public partial class PlanetLandmark {
    [Key]
    public int Id { get; set; }
    public int PlanetId { get; set; }
    public int LandmarkId { get; set; }

    [ForeignKey("LandmarkId")]
    [InverseProperty("PlanetLandmark")]
    public virtual Landmark Landmark { get; set; } = null!;
    [ForeignKey("PlanetId")]
    [InverseProperty("PlanetLandmark")]
    public virtual Planet Planet { get; set; } = null!;
}
