DECLARE @PlanetId INT
DECLARE @ColourId INT
DECLARE @GradientId INT
DECLARE @CloudId INT
DECLARE @FogKeySetId INT

INSERT INTO Planet (
	Title, 
	GameVersion
) VALUES (
	'Sun', 
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
	'SunMapColour',
	1.0,
	0.97,
	0.785,
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
	34817000.0,
	247.0,
	500000.0,
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
	300000.0,
	0.005,
	13.0,
	1.0,
	0.5,
	0.5,
	1.0
)

INSERT INTO Gradient (
	Title,
	PositionZ,
	Height,
	Texture
) VALUES (
	'Sun',
	40000,
	800000000.0,
	'Atmo_Sun'
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
	'Sun',
	'None',
	0.0,
	0.0,
	0.0,
	0.0,
	0.0
)

SET @CloudId = SCOPE_IDENTITY()

INSERT INTO FogKeySet (
	Title
) VALUES (
	'None'
)

SET @FogKeySetId = SCOPE_IDENTITY()

INSERT INTO PlanetAtmosphereVisualsData (
	PlanetId,
	GradientId,
	CloudId,
	FogKeySetId
) VALUES (
	@PlanetId,
	@GradientId,
	@CloudId,
	@FogKeySetId
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
	0,
	0,
	0,
	1,
	0
)