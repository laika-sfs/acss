DECLARE @PlanetId INT
DECLARE @ColourId INT
DECLARE @PlanetBaseId INT
DECLARE @PlanetAtmospherePhysicsDataId INT
DECLARE @GradientId INT
DECLARE @CloudId INT
DECLARE @FogKeyColourId1 INT
DECLARE @FogKeyId1 INT
DECLARE @FogKeyColourId2 INT
DECLARE @FogKeyId2 INT
DECLARE @FogKeyColourId3 INT
DECLARE @FogKeyId3 INT
DECLARE @FogKeySetId INT
DECLARE @FogKeyLinkId1 INT
DECLARE @FogKeyLinkId2 INT
DECLARE @FogKeyLinkId3 INT
DECLARE @SurfaceTextureSizeAId INT
DECLARE @SurfaceTextureAId INT
DECLARE @SurfaceTextureSizeBId INT
DECLARE @SurfaceTextureBId INT
DECLARE @TerrainTextureSizeCId INT
DECLARE @TerrainTextureCId INT
DECLARE @TerrainTextureDataId INT
DECLARE @TerrainDataId INT
DECLARE @TerrainFormulaId1 INT
DECLARE @TerrainFormulaId2 INT
DECLARE @TerrainFormulaId3 INT
DECLARE @TerrainFormulaSetId INT
DECLARE @TerrainFormulaLinkId1 INT
DECLARE @TerrainFormulaLinkId2 INT
DECLARE @TerrainFormulaLinkId3 INT
DECLARE @FlatZoneId INT
DECLARE @TerrainDataFlatZoneId INT
DECLARE @PostProcessingKeyId1 INT
DECLARE @PlanetPostProcessingId1 INT
DECLARE @PostProcessingKeyId2 INT
DECLARE @PlanetPostProcessingId2 INT
DECLARE @PlanetOrbitDataId INT
DECLARE @PlanetAchievementDataId INT

INSERT INTO Planet (
    Title,
    GameVersion
) VALUES (
    'Earth',
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
    'EarthMapColour',
    0.450,
    0.680,
    1.0,
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
    315000.0,
    9.8,
    25000.0,
    5000.0
)

SET @PlanetBaseId = SCOPE_IDENTITY()

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
    30000.0,
    0.005,
    10.0,
    1.0,
    0.33,
    0.66,
    1.0
)

SET @PlanetAtmospherePhysicsDataId = SCOPE_IDENTITY()

INSERT INTO Gradient (
    Title,
    PositionZ,
    Height,
    Texture
) VALUES (
    'Earth',
    3500.0,
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
    'Earth',
    'noicecycle2',
    -25000,
    459375.0,
    367500,
    1.5,
    1.6
)

SET @CloudId = SCOPE_IDENTITY()

INSERT INTO Colour (
    Title,
    Red,
    Green,
    Blue,
    Alpha
) VALUES (
    'EarthFogKey1',
    0.461,
    0.463,
    0.364,
    0.098
)

SET @FogKeyColourId1 = SCOPE_IDENTITY()

INSERT INTO FogKey (
    ColourId,
    Distance
) VALUES (
    @FogKeyColourId1,
    500.0
)

SET @FogKeyId1 = SCOPE_IDENTITY()

INSERT INTO Colour (
    Title,
    Red,
    Green,
    Blue,
    Alpha
) VALUES (
    'EarthFogKey2',
    0.647,
    0.848,
    0.890,
    0.117
)

SET @FogKeyColourId2 = SCOPE_IDENTITY()

INSERT INTO FogKey (
    ColourId,
    Distance
) VALUES (
    @FogKeyColourId2,
    3000.0
)

SET @FogKeyId2 = SCOPE_IDENTITY()

INSERT INTO Colour (
    Title,
    Red,
    Green,
    Blue,
    Alpha
) VALUES (
    'EarthFogKey3',
    0.647,
    0.848,
    1.0,
    0.416
)

SET @FogKeyColourId3 = SCOPE_IDENTITY()

INSERT INTO FogKey (
    ColourId,
    Distance
) VALUES (
    @FogKeyColourId3,
    30000.0
)

SET @FogKeyId3 = SCOPE_IDENTITY()

INSERT INTO FogKeySet (
    Title
) VALUES (
    'Earth'
)

SET @FogKeySetId = SCOPE_IDENTITY()

INSERT INTO FogKeyLink (
    FogKeyId,
    FogKeySetId
) VALUES (
    @FogKeyId1,
    @FogKeySetId
)

SET @FogKeyLinkId1 = SCOPE_IDENTITY()

INSERT INTO FogKeyLink (
    FogKeyId,
    FogKeySetId
) VALUES (
    @FogKeyId2,
    @FogKeySetId
)

SET @FogKeyLinkId2 = SCOPE_IDENTITY()

INSERT INTO FogKeyLink (
    FogKeyId,
    FogKeySetId
) VALUES (
    @FogKeyId3,
    @FogKeySetId
)

SET @FogKeyLinkId3 = SCOPE_IDENTITY()

INSERT INTO TextureSize (
    X,
    Y
) VALUES (
    20.0,
    8.0
)

SET @SurfaceTextureSizeAId = SCOPE_IDENTITY()

INSERT INTO Texture (
    Title,
    TextureSizeId
) VALUES (
    'Blured',
    @SurfaceTextureSizeAId
)

SET @SurfaceTextureAId = SCOPE_IDENTITY()

INSERT INTO TextureSize (
    X,
    Y
) VALUES (
    -1.0,
    -1.0
)

SET @SurfaceTextureSizeBId = SCOPE_IDENTITY()

INSERT INTO Texture (
    Title,
    TextureSizeId
) VALUES (
    'None',
    @SurfaceTextureSizeBId
)

SET @SurfaceTextureBId = SCOPE_IDENTITY()

INSERT INTO TextureSize (
    X,
    Y
) VALUES (
    100.0,
    30.0
)

SET @TerrainTextureSizeCId = SCOPE_IDENTITY()

INSERT INTO Texture (
    Title,
    TextureSizeId
) VALUES (
    'Blured',
    @TerrainTextureSizeCId
)

SET @TerrainTextureCId = SCOPE_IDENTITY()

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
    'Earth',
    'NewEarth',
    1.0,
    @SurfaceTextureAId,
    @SurfaceTextureBId,
    @TerrainTextureCId,
    40.0,
    0.0,
    1.0,
    1.25,
    15.0
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
    4.0,
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
    (SELECT Id FROM Heightmap WHERE Title = 'Perlin'),
    19030.801,
    35,
    NULL,
    NULL
)

SET @TerrainFormulaId1 = SCOPE_IDENTITY()

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
    2452.544,
    5,
    NULL,
    NULL
)

SET @TerrainFormulaId2 = SCOPE_IDENTITY()

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
    1319.468,
    1,
    NULL,
    NULL
)

SET @TerrainFormulaId3 = SCOPE_IDENTITY()

INSERT INTO TerrainFormulaSet (
    Title
) VALUES (
    'EarthNormal'
)

SET @TerrainFormulaSetId = SCOPE_IDENTITY()

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormulaId1,
	@TerrainFormulaSetId
)

SET @TerrainFormulaLinkId1 = SCOPE_IDENTITY()

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormulaId2,
	@TerrainFormulaSetId
)

SET @TerrainFormulaLinkId2 = SCOPE_IDENTITY()

INSERT INTO TerrainFormulaLink (
	TerrainFormulaId,
	TerrainFormulaSetId
) VALUES (
	@TerrainFormulaId3,
	@TerrainFormulaSetId
)

SET @TerrainFormulaLinkId3 = SCOPE_IDENTITY()

INSERT INTO TerrainDataFormulaDifficulty (
	TerrainDataId,
	DifficultyId,
	TerrainFormulaSetId
) VALUES (
	@TerrainDataId,
	(SELECT Id FROM Difficulty WHERE Title = 'normal'),
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

SET @FlatZoneId = SCOPE_IDENTITY()

INSERT INTO TerrainDataFlatZone (
	TerrainDataId,
	FlatZoneId
) VALUES (
	@TerrainDataId,
	@FlatZoneId
)

SET @TerrainDataFlatZoneId = SCOPE_IDENTITY()

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
    'Earth1',
    0.0,
    1.35,
    0.0,
    0.0,
    0.95,
    1.22,
    1.12,
    1.08,
    0.85
)

SET @PostProcessingKeyId1 = SCOPE_IDENTITY()

INSERT INTO PlanetPostProcessing (
    PlanetId,
    PostProcessingKeyId
) VALUES (
    @PlanetId,
    @PostProcessingKeyId1
)

SET @PlanetPostProcessingId1 = SCOPE_IDENTITY()

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
    'Earth2',
    25000.0,
    1.65,
    0.0,
    0.0,
    0.95,
    1.24,
    1.0,
    1.0,
    1.0
)

SET @PostProcessingKeyId2 = SCOPE_IDENTITY()

INSERT INTO PlanetPostProcessing (
    PlanetId,
    PostProcessingKeyId
) VALUES (
    @PlanetId,
    @PostProcessingKeyId2
)

SET @PlanetPostProcessingId2 = SCOPE_IDENTITY()

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
    2992000000,
    0.0,
    0.0,
    1,
    1.0
)

SET @PlanetOrbitDataId = SCOPE_IDENTITY()

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

SET @PlanetAchievementDataId = SCOPE_IDENTITY()