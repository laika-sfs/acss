using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Api.Models.Planet;

[Index("Title", Name = "UQ_Modifier", IsUnique = true)]
public partial class Modifier {
    public Modifier() {
        TerrainFormula = new HashSet<TerrainFormula>();
        TextureFormula = new HashSet<TextureFormula>();
    }

    [Key]
    public int Id { get; set; }
    [StringLength(50)]
    public string Title { get; set; } = null!;

    [InverseProperty("Modifier")]
    public virtual ICollection<TerrainFormula> TerrainFormula { get; set; }
    [InverseProperty("Modifier")]
    public virtual ICollection<TextureFormula> TextureFormula { get; set; }
}
