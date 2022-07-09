SELECT *
FROM Planet AS p
	LEFT JOIN PlanetBaseData AS pbd ON
		p.Id = pbd.PlanetId
	LEFT JOIN Colour AS clr ON
		pbd.ColourId = clr.Id
	LEFT JOIN PlanetAtmospherePhysicsData AS papd ON
		p.Id = papd.PlanetId
	LEFT JOIN PlanetAtmosphereVisualsData AS pavd ON
		p.Id = pavd.PlanetId
	LEFT JOIN Gradient AS g ON
		pavd.GradientId = g.Id
	LEFT JOIN Cloud AS cld ON
		pavd.CloudId = cld.Id
	LEFT JOIN FogKeySet AS fks ON
		pavd.FogKeySetId = fks.Id
	LEFT JOIN PlanetAchievementData AS pad ON
		p.Id = pad.PlanetId