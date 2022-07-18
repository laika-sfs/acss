using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Api.Models.Planet;

[Index("Title", Name = "UQ_TerrainFormulaSet", IsUnique = true)]
public partial class TerrainFormulaSet {
    public TerrainFormulaSet() {
        TerrainDataFormulaDifficulty = new HashSet<TerrainDataFormulaDifficulty>();
        TerrainFormulaLink = new HashSet<TerrainFormulaLink>();
    }

    [Key]
    public int Id { get; set; }
    [StringLength(50)]
    public string Title { get; set; } = null!;

    [InverseProperty("TerrainFormulaSet")]
    public virtual ICollection<TerrainDataFormulaDifficulty> TerrainDataFormulaDifficulty { get; set; }
    [InverseProperty("TerrainFormulaSet")]
    public virtual ICollection<TerrainFormulaLink> TerrainFormulaLink { get; set; }
}
