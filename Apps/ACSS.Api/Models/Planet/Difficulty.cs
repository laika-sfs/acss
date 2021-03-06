using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Api.Models.Planet;

[Index("Title", Name = "UQ_Difficulty", IsUnique = true)]
public partial class Difficulty {
    public Difficulty() {
        TerrainDataFormulaDifficulty = new HashSet<TerrainDataFormulaDifficulty>();
    }

    [Key]
    public int Id { get; set; }
    [StringLength(50)]
    public string Title { get; set; } = null!;

    [InverseProperty("Difficulty")]
    public virtual ICollection<TerrainDataFormulaDifficulty> TerrainDataFormulaDifficulty { get; set; }
}
