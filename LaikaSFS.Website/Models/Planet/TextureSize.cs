using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace LaikaSFS.Website.Models.Planet
{
    [Table("TextureSize", Schema = "Planet")]
    [Index("X", "Y", Name = "UQ_TextureSize", IsUnique = true)]
    public partial class TextureSize
    {
        public TextureSize()
        {
            Texture = new HashSet<Texture>();
        }

        [Key]
        public int Id { get; set; }
        [Column(TypeName = "decimal(36, 18)")]
        public decimal X { get; set; }
        [Column(TypeName = "decimal(36, 18)")]
        public decimal Y { get; set; }

        [InverseProperty("TextureSize")]
        public virtual ICollection<Texture> Texture { get; set; }
    }
}
