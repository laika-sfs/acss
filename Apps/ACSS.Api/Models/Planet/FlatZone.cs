using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Api.Models.Planet;

[Index("Height", "Angle", "Width", "Transition", Name = "UQ_FlatZone", IsUnique = true)]
[Index("Title", Name = "UQ_FlatZone_Title", IsUnique = true)]
public partial class FlatZone {
    public FlatZone() {
        TerrainDataFlatZone = new HashSet<TerrainDataFlatZone>();
    }

    [Key]
    public int Id { get; set; }
    [StringLength(50)]
    public string Title { get; set; } = null!;
    [Column(TypeName = "decimal(36, 18)")]
    public decimal Height { get; set; }
    [Column(TypeName = "decimal(36, 18)")]
    public decimal Angle { get; set; }
    [Column(TypeName = "decimal(36, 18)")]
    public decimal Width { get; set; }
    [Column(TypeName = "decimal(36, 18)")]
    public decimal Transition { get; set; }

    [InverseProperty("FlatZone")]
    public virtual ICollection<TerrainDataFlatZone> TerrainDataFlatZone { get; set; }
}
