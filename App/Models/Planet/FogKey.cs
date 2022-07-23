using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Web.Models.Planet
{
    [Table("FogKey", Schema = "Planet")]
    [Index("ColourId", "Distance", Name = "UQ_FogKey", IsUnique = true)]
    public partial class FogKey
    {
        public FogKey()
        {
            FogKeyLink = new HashSet<FogKeyLink>();
        }

        [Key]
        public int Id { get; set; }
        public int ColourId { get; set; }
        [Column(TypeName = "decimal(36, 18)")]
        public decimal Distance { get; set; }

        [ForeignKey("ColourId")]
        [InverseProperty("FogKey")]
        public virtual Colour Colour { get; set; } = null!;
        [InverseProperty("FogKey")]
        public virtual ICollection<FogKeyLink> FogKeyLink { get; set; }
    }
}
