using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Web.Models.Planet
{
    [Table("FogKeyLink", Schema = "Planet")]
    public partial class FogKeyLink
    {
        [Key]
        public int Id { get; set; }
        public int FogKeyId { get; set; }
        public int FogKeySetId { get; set; }

        [ForeignKey("FogKeyId")]
        [InverseProperty("FogKeyLink")]
        public virtual FogKey FogKey { get; set; } = null!;
        [ForeignKey("FogKeySetId")]
        [InverseProperty("FogKeyLink")]
        public virtual FogKeySet FogKeySet { get; set; } = null!;
    }
}
