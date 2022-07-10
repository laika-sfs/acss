using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Api.Models.Planet
{
    [Index("Title", Name = "UQ_FogKeyList_Title", IsUnique = true)]
    public partial class FogKeySet
    {
        public FogKeySet()
        {
            FogKeyLink = new HashSet<FogKeyLink>();
            PlanetAtmosphereVisualsData = new HashSet<PlanetAtmosphereVisualsData>();
        }

        [Key]
        public int Id { get; set; }
        [StringLength(50)]
        public string Title { get; set; } = null!;

        [InverseProperty("FogKeySet")]
        public virtual ICollection<FogKeyLink> FogKeyLink { get; set; }
        [InverseProperty("FogKeySet")]
        public virtual ICollection<PlanetAtmosphereVisualsData> PlanetAtmosphereVisualsData { get; set; }
    }
}
