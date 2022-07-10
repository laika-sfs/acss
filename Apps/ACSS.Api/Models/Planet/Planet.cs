using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ACSS.Api.Models.Planet
{
    [Index("Title", "GameVersion", Name = "UQ_Planet", IsUnique = true)]
    public partial class Planet
    {
        public Planet()
        {
            PlanetLandmark = new HashSet<PlanetLandmark>();
            PlanetOrbitDataParentPlanet = new HashSet<PlanetOrbitData>();
            PlanetOrbitDataPlanet = new HashSet<PlanetOrbitData>();
            PlanetPostProcessing = new HashSet<PlanetPostProcessing>();
            TerrainData = new HashSet<TerrainData>();
        }

        [Key]
        public int Id { get; set; }
        [StringLength(50)]
        public string Title { get; set; } = null!;
        [Column(TypeName = "decimal(2, 1)")]
        public decimal GameVersion { get; set; }

        [InverseProperty("Planet")]
        public virtual PlanetAchievementData PlanetAchievementData { get; set; } = null!;
        [InverseProperty("Planet")]
        public virtual PlanetAtmospherePhysicsData PlanetAtmospherePhysicsData { get; set; } = null!;
        [InverseProperty("Planet")]
        public virtual PlanetAtmosphereVisualsData PlanetAtmosphereVisualsData { get; set; } = null!;
        [InverseProperty("Planet")]
        public virtual PlanetBaseData PlanetBaseData { get; set; } = null!;
        [InverseProperty("Planet")]
        public virtual ICollection<PlanetLandmark> PlanetLandmark { get; set; }
        [InverseProperty("ParentPlanet")]
        public virtual ICollection<PlanetOrbitData> PlanetOrbitDataParentPlanet { get; set; }
        [InverseProperty("Planet")]
        public virtual ICollection<PlanetOrbitData> PlanetOrbitDataPlanet { get; set; }
        [InverseProperty("Planet")]
        public virtual ICollection<PlanetPostProcessing> PlanetPostProcessing { get; set; }
        [InverseProperty("Planet")]
        public virtual ICollection<TerrainData> TerrainData { get; set; }
    }
}
