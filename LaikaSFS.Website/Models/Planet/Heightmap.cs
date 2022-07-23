using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace LaikaSFS.Website.Models.Planet
{
    [Table("Heightmap", Schema = "Planet")]
    [Index("Title", Name = "UQ_Heightmap", IsUnique = true)]
    public partial class Heightmap
    {
        public Heightmap()
        {
            TerrainFormula = new HashSet<TerrainFormula>();
            TextureFormula = new HashSet<TextureFormula>();
        }

        [Key]
        public int Id { get; set; }
        [StringLength(50)]
        public string Title { get; set; } = null!;

        [InverseProperty("Heightmap")]
        public virtual ICollection<TerrainFormula> TerrainFormula { get; set; }
        [InverseProperty("Heightmap")]
        public virtual ICollection<TextureFormula> TextureFormula { get; set; }
    }
}
