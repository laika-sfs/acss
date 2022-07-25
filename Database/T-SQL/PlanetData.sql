SELECT *
FROM Planet.Planet AS p
	LEFT JOIN Planet.PlanetBaseData AS pbd ON
		p.Id = pbd.PlanetId
	LEFT JOIN Planet.Colour AS clr ON
		pbd.ColourId = clr.Id
	LEFT JOIN Planet.PlanetAtmospherePhysicsData AS papd ON
		p.Id = papd.PlanetId
	LEFT JOIN Planet.PlanetAtmosphereVisualsData AS pavd ON
		p.Id = pavd.PlanetId
	LEFT JOIN Planet.Gradient AS g ON
		pavd.GradientId = g.Id
	LEFT JOIN Planet.Clouds AS cld ON
		pavd.CloudsId = cld.Id
	LEFT JOIN Planet.FogKeySet AS fks ON
		pavd.FogKeySetId = fks.Id
	LEFT JOIN Planet.PlanetAchievementData AS pad ON
		p.Id = pad.PlanetId