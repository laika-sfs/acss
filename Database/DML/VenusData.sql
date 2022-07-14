DECLARE @PlanetId INT
DECLARE @ColourId INT
DECLARE @GradientId INT
DECLARE @CloudId INT
DECLARE @FogKeySetId INT
DECLARE @FogKey1 INT
DECLARE @FogKey1Colour INT
DECLARE @FogKey2 INT
DECLARE @FogKey2Colour INT
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
DECLARE @TerrainFormula7 INT
DECLARE @TerrainFormula8 INT
DECLARE @TerrainFormula9 INT
DECLARE @TerrainFormula10 INT
DECLARE @TerrainFormulaSetId INT

INSERT INTO Planet (
    Title,
    GameVersion
) VALUES (
    'Venus',
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
    'VenusMapColour',
    0.789,
    0.645,
    0.497,
    1
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
    300000.0,
    8.87,
    35000.0,
    0.0
)

INSERT INTO PlanetAtmospherePhysicsData (
    PlanetId,
    Height,
    Density,
    Curve,
    ParachuteMultiplier,
    UpperAtmosphere,
    ShockwaveIntensity,
    MinHeatingVelocityMultiplier
) VALUES (
    @PlanetId,
    40000.0,
    0.024,
    13.0,
    1.0,
    0.33,
    0.66,
    1.0
)

INSERT INTO Gradient (
    Title,
    PositionZ,
    Height,
    Texture
) VALUES (
    'Venus',
    500,
    45000.0,
    'Transparent'
)

SET @GradientId = SCOPE_IDENTITY()

INSERT INTO Cloud (
    Title,
    Texture,
    StartHeight,
    Width,
    Height,
    Alpha,
    Velocity
) VALUES (
    'Venus',
    'DayNightVenus',
    -33333.333,
    612500.0,
    490000,
    1.5,
    -0.006
)

SET @CloudId = SCOPE_IDENTITY()

INSERT INTO Colour (
    Title,
    Red,
    Green,
    Blue,
    Alpha
) VALUES (
    'VenusFogKey1',
    0.836,
    0.845,
    0.559,
    0.0
)

SET @FogKey1Colour = SCOPE_IDENTITY()

INSERT INTO FogKey (
    ColourId,
    Distance
) VALUES (
    @FogKey1Colour,
    100.0
)

SET @FogKey1 = SCOPE_IDENTITY()

INSERT INTO Colour (
    Title,
    Red,
    Green,
    Blue,
    Alpha
) VALUES (
    'VenusFogKey2',
    0.815,
    0.788,
    0.709,
    1.0
)

SET @FogKey2Colour = SCOPE_IDENTITY()

INSERT INTO FogKey (
    ColourId,
    Distance
) VALUES (
    @FogKey2Colour,
    50000.0
)

SET @FogKey2 = SCOPE_IDENTITY()

INSERT INTO FogKeySet (
    Title
) VALUES (
    'Venus'
)

SET @FogKeySetId = SCOPE_IDENTITY()

INSERT INTO FogKeyLink (
    FogKeyId,
    FogKeySetId
) VALUES (
    @FogKey1,
    @FogKeySetId
)

INSERT INTO FogKeyLink (
    FogKeyId,
    FogKeySetId
) VALUES (
    @FogKey2,
    @FogKeySetId
)

INSERT INTO TextureSize (
    X,
    Y
) VALUES (
    32.0,
    14.0
)

SET @TextureSizeId = SCOPE_IDENTITY()

INSERT INTO Texture (
    Title,
    TextureSizeId
) VALUES (
    'Dust',
    @TextureSizeId
)

SET @SurfaceTextureA = SCOPE_IDENTITY()

INSERT INTO TextureSize (
    X,
    Y
) VALUES (
    48.0,
    20.0
)

SET @TextureSizeId = SCOPE_IDENTITY()

INSERT INTO Texture (
    Title,
    TextureSizeId
) VALUES (
    'Soft_Rocks',
    @TextureSizeId
)

SET @SurfaceTextureB = SCOPE_IDENTITY()

INSERT INTO TextureSize (
    X,
    Y
) VALUES (
    2000.0,
    650.0
)

SET @TextureSizeId = SCOPE_IDENTITY()

INSERT INTO Texture (
    Title,
    TextureSizeId
) VALUES (
    'Blured',
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
    'Venus',
    'NewVenus',
    0.944,
    @SurfaceTextureA,
    @SurfaceTextureB,
    @TerrainTextureC,
    60.0,
    0.0,
    0.800,
    0.5,
    6.5
)

SET @TerrainTextureDataId = SCOPE_IDENTITY()

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

SET @TerrainDataId = SCOPE_IDENTITY()

INSERT INTO TerrainFormula (
	Title,
	HeightmapId,
	Width,
	Height,
	ModifierId,
	AddOnFormulaId
) VALUES (
	'OUTPUT',
	(SELECT Id FROM Heightmap WHERE Title = 'Venus'),
	1884955.592,
	4000,
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
	'PLAINS',
	(SELECT Id FROM Heightmap WHERE Title = 'Venus_Plains'),
	1884955.592,
	1,
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
	(SELECT Id FROM Heightmap WHERE Title = 'Perlin'),
	6283.185,
	8,
	(SELECT Id FROM Modifier WHERE Title = 'Curve1'),
	@TerrainFormula2
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
	(SELECT Id FROM Heightmap WHERE Title = 'Perlin'),
	3490.658,
	5,
	(SELECT Id FROM Modifier WHERE Title = 'Curve1'),
	@TerrainFormula2
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
	(SELECT Id FROM Heightmap WHERE Title = 'Perlin'),
	1449.965,
	1.6,
	(SELECT Id FROM Modifier WHERE Title = 'Curve1'),
	NULL
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
	942.477,
	1.5,
	(SELECT Id FROM Modifier WHERE Title = 'Curve1'),
	@TerrainFormula2
)

SET @TerrainFormula6 = SCOPE_IDENTITY()

INSERT INTO TerrainFormula (
	Title,
	HeightmapId,
	Width,
	Height,
	ModifierId,
	AddOnFormulaId
) VALUES (
	'M',
	(SELECT Id FROM Heightmap WHERE Title = 'Perlin'),
	47123.889,
	1,
	(SELECT Id FROM Modifier WHERE Title = 'Curve2'),
	@TerrainFormula2
)

SET @TerrainFormula7 = SCOPE_IDENTITY()

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
	26927.937,
	200,
	(SELECT Id FROM Modifier WHERE Title = 'Curve1'),
	@TerrainFormula7
)

SET @TerrainFormula8 = SCOPE_IDENTITY()

INSERT INTO TerrainFormula (
	Title,
	HeightmapId,
	Width,
	Height,
	ModifierId,
	AddOnFormulaId
) VALUES (
	'M2',
	(SELECT Id FROM Heightmap WHERE Title = 'Perlin'),
	269279.370,
	1,
	(SELECT Id FROM Modifier WHERE Title = 'Curve2'),
	@TerrainFormula2
)

SET @TerrainFormula9 = SCOPE_IDENTITY()

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
	94247.779,
	1300,
	(SELECT Id FROM Modifier WHERE Title = 'Curve1'),
	@TerrainFormula9
)

SET @TerrainFormula10 = SCOPE_IDENTITY()

INSERT INTO TerrainFormulaSet (
	Title
) VALUES (
	'VenusNormal'
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

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula7,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula8,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula9,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula10,
	@TerrainFormulaSetId
)

INSERT INTO TerrainDataFormulaDifficulty (
	TerrainDataId,
	DifficultyId,
	TerrainFormulaSetId
) VALUES (
	@TerrainDataId,
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
	'OUTPUT',
	(SELECT Id FROM Heightmap WHERE Title = 'Venus'),
	3769911.184,
	8000,
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
	'PLAINS',
	(SELECT Id FROM Heightmap WHERE Title = 'Venus_Plains'),
	3769911.184,
	1,
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
	(SELECT Id FROM Heightmap WHERE Title = 'Perlin'),
	6283.185,
	8,
	(SELECT Id FROM Modifier WHERE Title = 'Curve1'),
	@TerrainFormula2
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
	(SELECT Id FROM Heightmap WHERE Title = 'Perlin'),
	3490.658,
	5,
	(SELECT Id FROM Modifier WHERE Title = 'Curve1'),
	@TerrainFormula2
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
	(SELECT Id FROM Heightmap WHERE Title = 'Perlin'),
	942.477,
	1.5,
	(SELECT Id FROM Modifier WHERE Title = 'Curve1'),
	@TerrainFormula2
)

SET @TerrainFormula6 = SCOPE_IDENTITY()

INSERT INTO TerrainFormula (
	Title,
	HeightmapId,
	Width,
	Height,
	ModifierId,
	AddOnFormulaId
) VALUES (
	'M',
	(SELECT Id FROM Heightmap WHERE Title = 'Perlin'),
	47123.889,
	1,
	(SELECT Id FROM Modifier WHERE Title = 'Curve2'),
	@TerrainFormula2
)

SET @TerrainFormula7 = SCOPE_IDENTITY()

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
	26927.937,
	200,
	(SELECT Id FROM Modifier WHERE Title = 'Curve1'),
	@TerrainFormula7
)

SET @TerrainFormula8 = SCOPE_IDENTITY()

INSERT INTO TerrainFormula (
	Title,
	HeightmapId,
	Width,
	Height,
	ModifierId,
	AddOnFormulaId
) VALUES (
	'M2',
	(SELECT Id FROM Heightmap WHERE Title = 'Perlin'),
	269279.370,
	1,
	(SELECT Id FROM Modifier WHERE Title = 'Curve2'),
	@TerrainFormula2
)

SET @TerrainFormula9 = SCOPE_IDENTITY()

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
	94247.779,
	1300,
	(SELECT Id FROM Modifier WHERE Title = 'Curve1'),
	@TerrainFormula9
)

SET @TerrainFormula10 = SCOPE_IDENTITY()

INSERT INTO TerrainFormulaSet (
	Title
) VALUES (
	'VenusHard'
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

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula7,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula8,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula9,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula10,
	@TerrainFormulaSetId
)

INSERT INTO TerrainDataFormulaDifficulty (
	TerrainDataId,
	DifficultyId,
	TerrainFormulaSetId
) VALUES (
	@TerrainDataId,
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
	'OUTPUT',
	(SELECT Id FROM Heightmap WHERE Title = 'Venus'),
	37699111.843,
	80000,
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
	'PLAINS',
	(SELECT Id FROM Heightmap WHERE Title = 'Venus_Plains'),
	37699111.843,
	1,
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
	(SELECT Id FROM Heightmap WHERE Title = 'Perlin'),
	6283.185,
	8,
	(SELECT Id FROM Modifier WHERE Title = 'Curve1'),
	@TerrainFormula2
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
	(SELECT Id FROM Heightmap WHERE Title = 'Perlin'),
	3490.658,
	5,
	(SELECT Id FROM Modifier WHERE Title = 'Curve1'),
	@TerrainFormula2
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
	(SELECT Id FROM Heightmap WHERE Title = 'Perlin'),
	942.477,
	1.5,
	(SELECT Id FROM Modifier WHERE Title = 'Curve1'),
	@TerrainFormula2
)

SET @TerrainFormula6 = SCOPE_IDENTITY()

INSERT INTO TerrainFormula (
	Title,
	HeightmapId,
	Width,
	Height,
	ModifierId,
	AddOnFormulaId
) VALUES (
	'M',
	(SELECT Id FROM Heightmap WHERE Title = 'Perlin'),
	47123.889,
	1,
	(SELECT Id FROM Modifier WHERE Title = 'Curve2'),
	@TerrainFormula2
)

SET @TerrainFormula7 = SCOPE_IDENTITY()

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
	26927.937,
	200,
	(SELECT Id FROM Modifier WHERE Title = 'Curve1'),
	@TerrainFormula7
)

SET @TerrainFormula8 = SCOPE_IDENTITY()

INSERT INTO TerrainFormula (
	Title,
	HeightmapId,
	Width,
	Height,
	ModifierId,
	AddOnFormulaId
) VALUES (
	'M2',
	(SELECT Id FROM Heightmap WHERE Title = 'Perlin'),
	269279.370,
	1,
	(SELECT Id FROM Modifier WHERE Title = 'Curve2'),
	@TerrainFormula2
)

SET @TerrainFormula9 = SCOPE_IDENTITY()

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
	94247.779,
	1300,
	(SELECT Id FROM Modifier WHERE Title = 'Curve1'),
	@TerrainFormula9
)

SET @TerrainFormula10 = SCOPE_IDENTITY()

INSERT INTO TerrainFormulaSet (
	Title
) VALUES (
	'VenusRealistic'
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

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula7,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula8,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula9,
	@TerrainFormulaSetId
)

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormula10,
	@TerrainFormulaSetId
)

INSERT INTO TerrainDataFormulaDifficulty (
	TerrainDataId,
	DifficultyId,
	TerrainFormulaSetId
) VALUES (
	@TerrainDataId,
	(SELECT Id FROM Difficulty WHERE Title = 'realistic'),
	@TerrainFormulaSetId
)

INSERT INTO FlatZone (
	Title,
	Height,
	Angle,
	Width,
	Transition
) VALUES (
	'Earth',
	18.0,
	1.57,
	900.0,
	200.0
)

INSERT INTO TerrainDataFlatZone (
	TerrainDataId,
	FlatZoneId
) VALUES (
	@TerrainDataId,
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
    'Venus1',
    500.0,
    1.35,
    0.0,
    14.0,
    1.0,
    1.18,
    1.11,
    1.08,
    0.85
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
    'Venus2',
    40000.0,
    1.649,
    0.0,
    0.0,
    1.0,
    1.1,
    1.0,
    1.0,
    1.0
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
    2043000000.0,
    0.0,
    0.0,
    1,
    1.25
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
	'Maxwell Montes',
	53.0,
	41.0,
	64.0
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
	'Atalanta Planitia',
	193.0,
	174.0,
	210.8
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
	'Lavinia Planitia',
	243.0,
	224.0,
	261.0
)

INSERT INTO PlanetLandmark (
	PlanetId,
	LandmarkId
) VALUES (
	@PlanetId,
	SCOPE_IDENTITY()
)