DECLARE @PlanetId INT
DECLARE @ColourId INT
DECLARE @GradientId INT
DECLARE @CloudId INT
DECLARE @FogKeySetId INT
DECLARE @TextureSizeId INT
DECLARE @SurfaceTextureA INT
DECLARE @SurfaceTextureB INT
DECLARE @TerrainTextureC INT
DECLARE @TerrainTextureDataId INT
DECLARE @TerrainDataId INT
DECLARE @TerrainFormula1 INT
DECLARE @TerrainFormula2 INT
DECLARE @TerrainFormula3 INT
DECLARE @TerrainFormula4 INT
DECLARE @TerrainFormula5 INT
DECLARE @TerrainFormula6 INT
DECLARE @TerrainFormulaSetId INT

INSERT INTO Planet (
	Title, 
	GameVersion
) VALUES (
	'Mercury', 
	1.5
)

SET @PlanetId = SCOPE_IDENTITY()

INSERT INTO Colour (
	Title,
	Red,
	Green,
	Blue,
	Alpha
) VALUES (
	'MercuryMapColour',
	0.410,
	0.373,
	0.350,
	1.0
)

SET @ColourId = SCOPE_IDENTITY()

INSERT INTO PlanetBaseData (
	PlanetId, 
	ColourId, 
	Radius, 
	Gravity, 
	TimewarpHeight, 
	VelocityArrowsHeight
) VALUES (
	@PlanetId,
	@ColourId,
	120000.0,
	3.27,
	2500.0,
	0.0
)

INSERT INTO TextureSize (
	X,
	Y
) VALUES (
	20.0,
	8.0
)

SET @TextureSizeId = SCOPE_IDENTITY()

INSERT INTO Texture (
	Title,
	TextureSizeId
) VALUES (
	'Dark_Dust',
	@TextureSizeId
)

SET @SurfaceTextureA = SCOPE_IDENTITY()

INSERT INTO TextureSize (
	X,
	Y
) VALUES (
	30.0,
	14.0
)

SET @TextureSizeId = SCOPE_IDENTITY()

INSERT INTO Texture (
	Title,
	TextureSizeId
) VALUES (
	'Hard_Rocks',
	@TextureSizeId
)

SET @SurfaceTextureB = SCOPE_IDENTITY()

INSERT INTO TextureSize (
	X,
	Y
) VALUES (
	280.0,
	145.0
)

SET @TextureSizeId = SCOPE_IDENTITY()

INSERT INTO Texture (
	Title,
	TextureSizeId
) VALUES (
	'Soft_Rocks',
	@TextureSizeId
)

SET @TerrainTextureC = SCOPE_IDENTITY()

INSERT INTO TerrainTextureData (
	Title,
	PlanetTexture,
	PlanetTextureCutout,
	SurfaceTextureA,
	SurfaceTextureB,
	TerrainTextureC,
	SurfaceLayerSize,
	MinFade,
	MaxFade,
	ShadowIntensity,
	ShadowHeight
) VALUES (
	'Mercury',
	'Mercury',
	0.945,
	@SurfaceTextureA,
	@SurfaceTextureB,
	@TerrainTextureC,
	30.0,
	0.0,
	1.0,
	13.0,
	10.0
)

SET @TerrainTextureDataId = SCOPE_IDENTITY()

INSERT INTO TerrainFormula (
	Title,
	HeightmapId,
	Width,
	Height,
	ModifierId,
	AddOnFormulaId
) VALUES (
	'PLAINS',
	(SELECT Id FROM Heightmap WHERE Title = 'Mercury_Plains'),
	753982.237,
	1,
	NULL,
	NULL
)

SET @TerrainFormula1 = SCOPE_IDENTITY()

INSERT INTO TerrainFormula (
	Title,
	HeightmapId,
	Width,
	Height,
	ModifierId,
	AddOnFormulaId
) VALUES (
	'OUTPUT',
	(SELECT Id FROM Heightmap WHERE Title = 'Mercury'),
	753982.237,
	500,
	NULL,
	NULL
)

SET @TerrainFormula2 = SCOPE_IDENTITY()

INSERT INTO TerrainFormula (
	Title,
	HeightmapId,
	Width,
	Height,
	ModifierId,
	AddOnFormulaId
) VALUES (
	'OUTPUT',
	(SELECT Id FROM Heightmap WHERE Title = 'Craters'),
	75398.223,
	350,
	NULL,
	@TerrainFormula1
)

SET @TerrainFormula3 = SCOPE_IDENTITY()

INSERT INTO TerrainFormula (
	Title,
	HeightmapId,
	Width,
	Height,
	ModifierId,
	AddOnFormulaId
) VALUES (
	'OUTPUT',
	(SELECT Id FROM Heightmap WHERE Title = 'Craters'),
	15079.645,
	100,
	NULL,
	@TerrainFormula1
)

SET @TerrainFormula4 = SCOPE_IDENTITY()

INSERT INTO TerrainFormula (
	Title,
	HeightmapId,
	Width,
	Height,
	ModifierId,
	AddOnFormulaId
) VALUES (
	'OUTPUT',
	(SELECT Id FROM Heightmap WHERE Title = 'Craters'),
	2356.194,
	12,
	NULL,
	@TerrainFormula1
)

SET @TerrainFormula5 = SCOPE_IDENTITY()

INSERT INTO TerrainFormula (
	Title,
	HeightmapId,
	Width,
	Height,
	ModifierId,
	AddOnFormulaId
) VALUES (
	'OUTPUT',
	(SELECT Id FROM Heightmap WHERE Title = 'Perlin'),
	2513.274,
	3,
	NULL,
	NULL
)

SET @TerrainFormula6 = SCOPE_IDENTITY()

INSERT INTO TerrainFormulaSet (
	Title
) VALUES (
	'MercuryNormal'
)

SET @TerrainFormulaSetId = SCOPE_IDENTITY()

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula1,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula2,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula3,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula4,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula5,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula6,
	@TerrainFormulaSetId
)

INSERT INTO TerrainData (
	PlanetId,
	TerrainTextureDataId,
	VerticeSize,
	Collider
) VALUES (
	@PlanetId,
	@TerrainTextureDataId,
	2.0,
	1
)

INSERT INTO TerrainDataFormulaDifficulty (
	TerrainDataId,
	DifficultyId,
	TerrainFormulaSetId
) VALUES (
	SCOPE_IDENTITY(),
	(SELECT Id FROM Difficulty WHERE Title = 'normal'),
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormula (
	Title,
	HeightmapId,
	Width,
	Height,
	ModifierId,
	AddOnFormulaId
) VALUES (
	'PLAINS',
	(SELECT Id FROM Heightmap WHERE Title = 'Mercury_Plains'),
	1507964.473,
	1,
	NULL,
	NULL
)

SET @TerrainFormula1 = SCOPE_IDENTITY()

INSERT INTO TerrainFormula (
	Title,
	HeightmapId,
	Width,
	Height,
	ModifierId,
	AddOnFormulaId
) VALUES (
	'OUTPUT',
	(SELECT Id FROM Heightmap WHERE Title = 'Mercury'),
	1507964.473,
	1000,
	NULL,
	NULL
)

SET @TerrainFormula2 = SCOPE_IDENTITY()

INSERT INTO TerrainFormulaSet (
	Title
) VALUES (
	'MercuryHard'
)

SET @TerrainFormulaSetId = SCOPE_IDENTITY()

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula1,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula2,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula3,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula4,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula5,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula6,
	@TerrainFormulaSetId
)

INSERT INTO TerrainData (
	PlanetId,
	TerrainTextureDataId,
	VerticeSize,
	Collider
) VALUES (
	@PlanetId,
	@TerrainTextureDataId,
	2.0,
	1
)

INSERT INTO TerrainDataFormulaDifficulty (
	TerrainDataId,
	DifficultyId,
	TerrainFormulaSetId
) VALUES (
	SCOPE_IDENTITY(),
	(SELECT Id FROM Difficulty WHERE Title = 'hard'),
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormula (
	Title,
	HeightmapId,
	Width,
	Height,
	ModifierId,
	AddOnFormulaId
) VALUES (
	'PLAINS',
	(SELECT Id FROM Heightmap WHERE Title = 'Mercury_Plains'),
	15079644.737,
	1,
	NULL,
	NULL
)

SET @TerrainFormula1 = SCOPE_IDENTITY()

INSERT INTO TerrainFormula (
	Title,
	HeightmapId,
	Width,
	Height,
	ModifierId,
	AddOnFormulaId
) VALUES (
	'OUTPUT',
	(SELECT Id FROM Heightmap WHERE Title = 'Mercury'),
	15079644.737,
	5000,
	NULL,
	NULL
)

SET @TerrainFormula2 = SCOPE_IDENTITY()

INSERT INTO TerrainFormulaSet (
	Title
) VALUES (
	'MercuryRealistic'
)

SET @TerrainFormulaSetId = SCOPE_IDENTITY()

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula1,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula2,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula3,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula4,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula5,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula6,
	@TerrainFormulaSetId
)

INSERT INTO TerrainData (
	PlanetId,
	TerrainTextureDataId,
	VerticeSize,
	Collider
) VALUES (
	@PlanetId,
	@TerrainTextureDataId,
	2.0,
	1
)

INSERT INTO TerrainDataFormulaDifficulty (
	TerrainDataId,
	DifficultyId,
	TerrainFormulaSetId
) VALUES (
	SCOPE_IDENTITY(),
	(SELECT Id FROM Difficulty WHERE Title = 'realistic'),
	@TerrainFormulaSetId
)

INSERT INTO PostProcessingKey (
	Title,
	Height,
	ShadowIntensity,
	StarIntensity,
	HueShift,
	Saturation,
	Contrast,
	Red,
	Green,
	Blue
) VALUES (
	'Mercury1',
	10000.0,
	1.75,
	0.0,
	0.0,
	0.95,
	1.2,
	1.0,
	1.0,
	1.0
)

INSERT INTO PlanetPostProcessing (
	PlanetId,
	PostProcessingKeyId
) VALUES (
	@PlanetId,
	SCOPE_IDENTITY()
)

INSERT INTO PostProcessingKey (
	Title,
	Height,
	ShadowIntensity,
	StarIntensity,
	HueShift,
	Saturation,
	Contrast,
	Red,
	Green,
	Blue
) VALUES (
	'Mercury2',
	15000.0,
	1.75,
	1.0,
	0.0,
	0.95,
	1.2,
	1.0,
	1.0,
	1.0
)

INSERT INTO PlanetPostProcessing (
	PlanetId,
	PostProcessingKeyId
) VALUES (
	@PlanetId,
	SCOPE_IDENTITY()
)

INSERT INTO PlanetOrbitData (
	PlanetId,
	ParentPlanetId,
	SemiMajorAxis,
	Eccentricity,
	ArgumentOfPeriapsis,
	Direction,
	MultiplierSOI
) VALUES (
	@PlanetId,
	(SELECT Id FROM Planet WHERE Title = 'Sun'),
	2895000000.0,
	0.2,
	29.0,
	1,
	2.0
)

INSERT INTO PlanetAchievementData (
	PlanetId,
	Landed,
	Takeoff,
	Atmosphere,
	Orbit,
	Crash
) VALUES (
	@PlanetId,
	1,
	1,
	1,
	1,
	1
)

INSERT INTO Landmark (
	Title,
	Angle,
	StartAngle,
	EndAngle
) VALUES (
	'Caloris Planitia',
	169.85,
	154.0,
	185.5
)

INSERT INTO PlanetLandmark (
	PlanetId,
	LandmarkId
) VALUES (
	@PlanetId,
	SCOPE_IDENTITY()
)

INSERT INTO Landmark (
	Title,
	Angle,
	StartAngle,
	EndAngle
) VALUES (
	'Borealis Planitia',
	72.0,
	64.0,
	79.0
)

INSERT INTO PlanetLandmark (
	PlanetId,
	LandmarkId
) VALUES (
	@PlanetId,
	SCOPE_IDENTITY()
)