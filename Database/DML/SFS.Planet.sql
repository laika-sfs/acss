USE [SFS]
GO
SET IDENTITY_INSERT [Planet].[Clouds] ON 
GO
INSERT [Planet].[Clouds] ([Id], [Title], [Texture], [StartHeight], [Width], [Height], [Alpha], [Velocity]) VALUES (1, N'Sun', N'None', CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[Clouds] ([Id], [Title], [Texture], [StartHeight], [Width], [Height], [Alpha], [Velocity]) VALUES (2, N'Venus', N'DayNightVenus', CAST(-33333.333330000000000000 AS Decimal(36, 18)), CAST(612500.000000000000000000 AS Decimal(36, 18)), CAST(490000.000000000000000000 AS Decimal(36, 18)), CAST(1.500000000000000000 AS Decimal(36, 18)), CAST(-0.006520000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[Clouds] ([Id], [Title], [Texture], [StartHeight], [Width], [Height], [Alpha], [Velocity]) VALUES (3, N'Earth', N'noicecycle2', CAST(-25000.000000000000000000 AS Decimal(36, 18)), CAST(459375.000000000000000000 AS Decimal(36, 18)), CAST(367500.000000000000000000 AS Decimal(36, 18)), CAST(1.500000000000000000 AS Decimal(36, 18)), CAST(1.600000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[Clouds] ([Id], [Title], [Texture], [StartHeight], [Width], [Height], [Alpha], [Velocity]) VALUES (4, N'Mars', N'DayNightMars', CAST(-16666.666670000000000000 AS Decimal(36, 18)), CAST(306250.000000000000000000 AS Decimal(36, 18)), CAST(245000.000000000000000000 AS Decimal(36, 18)), CAST(1.500000000000000000 AS Decimal(36, 18)), CAST(0.868220000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[Clouds] ([Id], [Title], [Texture], [StartHeight], [Width], [Height], [Alpha], [Velocity]) VALUES (5, N'Jupiter', N'Earth_Clouds', CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1187500.000000000000000000 AS Decimal(36, 18)), CAST(950000.000000000000000000 AS Decimal(36, 18)), CAST(0.649999976158142100 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[Clouds] ([Id], [Title], [Texture], [StartHeight], [Width], [Height], [Alpha], [Velocity]) VALUES (6, N'Europa', N'None', CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)))
GO
SET IDENTITY_INSERT [Planet].[Clouds] OFF
GO
SET IDENTITY_INSERT [Planet].[FogKeySet] ON 
GO
INSERT [Planet].[FogKeySet] ([Id], [Title]) VALUES (3, N'Earth')
GO
INSERT [Planet].[FogKeySet] ([Id], [Title]) VALUES (6, N'Europa')
GO
INSERT [Planet].[FogKeySet] ([Id], [Title]) VALUES (5, N'Jupiter')
GO
INSERT [Planet].[FogKeySet] ([Id], [Title]) VALUES (4, N'Mars')
GO
INSERT [Planet].[FogKeySet] ([Id], [Title]) VALUES (1, N'Sun')
GO
INSERT [Planet].[FogKeySet] ([Id], [Title]) VALUES (2, N'Venus')
GO
SET IDENTITY_INSERT [Planet].[FogKeySet] OFF
GO
SET IDENTITY_INSERT [Planet].[Gradient] ON 
GO
INSERT [Planet].[Gradient] ([Id], [Title], [PositionZ], [Height], [Texture]) VALUES (1, N'Sun', CAST(40000.000000000000000000 AS Decimal(36, 18)), CAST(800000000.000000000000000000 AS Decimal(36, 18)), N'Atmo_Sun')
GO
INSERT [Planet].[Gradient] ([Id], [Title], [PositionZ], [Height], [Texture]) VALUES (2, N'Venus', CAST(500.000000000000000000 AS Decimal(36, 18)), CAST(45000.000000000000000000 AS Decimal(36, 18)), N'Transparent')
GO
INSERT [Planet].[Gradient] ([Id], [Title], [PositionZ], [Height], [Texture]) VALUES (3, N'Earth', CAST(3500.000000000000000000 AS Decimal(36, 18)), CAST(45000.000000000000000000 AS Decimal(36, 18)), N'Transparent')
GO
INSERT [Planet].[Gradient] ([Id], [Title], [PositionZ], [Height], [Texture]) VALUES (4, N'Mars', CAST(4000.000000000000000000 AS Decimal(36, 18)), CAST(30000.000000000000000000 AS Decimal(36, 18)), N'Transparent')
GO
INSERT [Planet].[Gradient] ([Id], [Title], [PositionZ], [Height], [Texture]) VALUES (5, N'Jupiter', CAST(40000.000000000000000000 AS Decimal(36, 18)), CAST(1130000.000000000000000000 AS Decimal(36, 18)), N'Atmo_Jupiter2')
GO
INSERT [Planet].[Gradient] ([Id], [Title], [PositionZ], [Height], [Texture]) VALUES (6, N'Europa', CAST(2500.000000000000000000 AS Decimal(36, 18)), CAST(15000.000000000000000000 AS Decimal(36, 18)), N'Atmo_Europa')
GO
SET IDENTITY_INSERT [Planet].[Gradient] OFF
GO
SET IDENTITY_INSERT [Planet].[Planet] ON 
GO
INSERT [Planet].[Planet] ([Id], [Title], [GameVersion]) VALUES (13, N'Callisto', CAST(1.5 AS Decimal(2, 1)))
GO
INSERT [Planet].[Planet] ([Id], [Title], [GameVersion]) VALUES (8, N'Deimos', CAST(1.5 AS Decimal(2, 1)))
GO
INSERT [Planet].[Planet] ([Id], [Title], [GameVersion]) VALUES (4, N'Earth', CAST(1.5 AS Decimal(2, 1)))
GO
INSERT [Planet].[Planet] ([Id], [Title], [GameVersion]) VALUES (11, N'Europa', CAST(1.5 AS Decimal(2, 1)))
GO
INSERT [Planet].[Planet] ([Id], [Title], [GameVersion]) VALUES (12, N'Ganymede', CAST(1.5 AS Decimal(2, 1)))
GO
INSERT [Planet].[Planet] ([Id], [Title], [GameVersion]) VALUES (10, N'Io', CAST(1.5 AS Decimal(2, 1)))
GO
INSERT [Planet].[Planet] ([Id], [Title], [GameVersion]) VALUES (9, N'Jupiter', CAST(1.5 AS Decimal(2, 1)))
GO
INSERT [Planet].[Planet] ([Id], [Title], [GameVersion]) VALUES (6, N'Mars', CAST(1.5 AS Decimal(2, 1)))
GO
INSERT [Planet].[Planet] ([Id], [Title], [GameVersion]) VALUES (2, N'Mercury', CAST(1.5 AS Decimal(2, 1)))
GO
INSERT [Planet].[Planet] ([Id], [Title], [GameVersion]) VALUES (5, N'Moon', CAST(1.5 AS Decimal(2, 1)))
GO
INSERT [Planet].[Planet] ([Id], [Title], [GameVersion]) VALUES (7, N'Phobos', CAST(1.5 AS Decimal(2, 1)))
GO
INSERT [Planet].[Planet] ([Id], [Title], [GameVersion]) VALUES (1, N'Sun', CAST(1.5 AS Decimal(2, 1)))
GO
INSERT [Planet].[Planet] ([Id], [Title], [GameVersion]) VALUES (3, N'Venus', CAST(1.5 AS Decimal(2, 1)))
GO
SET IDENTITY_INSERT [Planet].[Planet] OFF
GO
SET IDENTITY_INSERT [Planet].[PlanetAtmosphereVisualsData] ON 
GO
INSERT [Planet].[PlanetAtmosphereVisualsData] ([Id], [PlanetId], [GradientId], [CloudsId], [FogKeySetId]) VALUES (1, 1, 1, 1, 1)
GO
INSERT [Planet].[PlanetAtmosphereVisualsData] ([Id], [PlanetId], [GradientId], [CloudsId], [FogKeySetId]) VALUES (2, 3, 2, 2, 2)
GO
INSERT [Planet].[PlanetAtmosphereVisualsData] ([Id], [PlanetId], [GradientId], [CloudsId], [FogKeySetId]) VALUES (3, 4, 3, 3, 3)
GO
INSERT [Planet].[PlanetAtmosphereVisualsData] ([Id], [PlanetId], [GradientId], [CloudsId], [FogKeySetId]) VALUES (4, 6, 4, 4, 4)
GO
INSERT [Planet].[PlanetAtmosphereVisualsData] ([Id], [PlanetId], [GradientId], [CloudsId], [FogKeySetId]) VALUES (5, 9, 5, 5, 5)
GO
INSERT [Planet].[PlanetAtmosphereVisualsData] ([Id], [PlanetId], [GradientId], [CloudsId], [FogKeySetId]) VALUES (6, 11, 6, 6, 6)
GO
SET IDENTITY_INSERT [Planet].[PlanetAtmosphereVisualsData] OFF
GO
SET IDENTITY_INSERT [Planet].[Colour] ON 
GO
INSERT [Planet].[Colour] ([Id], [Title], [Red], [Green], [Blue], [Alpha]) VALUES (1, N'SunMapColour', CAST(1.000000000000000000 AS Decimal(21, 18)), CAST(0.970000028610229500 AS Decimal(21, 18)), CAST(0.785000026226043700 AS Decimal(21, 18)), CAST(1.000000000000000000 AS Decimal(21, 18)))
GO
INSERT [Planet].[Colour] ([Id], [Title], [Red], [Green], [Blue], [Alpha]) VALUES (2, N'MercuryMapColour', CAST(0.410344839096069340 AS Decimal(21, 18)), CAST(0.372679352760314940 AS Decimal(21, 18)), CAST(0.349500596523284900 AS Decimal(21, 18)), CAST(1.000000000000000000 AS Decimal(21, 18)))
GO
INSERT [Planet].[Colour] ([Id], [Title], [Red], [Green], [Blue], [Alpha]) VALUES (3, N'Venus1', CAST(0.836079835891723600 AS Decimal(21, 18)), CAST(0.845588207244873000 AS Decimal(21, 18)), CAST(0.559580445289611800 AS Decimal(21, 18)), CAST(0.000000000000000000 AS Decimal(21, 18)))
GO
INSERT [Planet].[Colour] ([Id], [Title], [Red], [Green], [Blue], [Alpha]) VALUES (4, N'Venus2', CAST(0.815686345100402800 AS Decimal(21, 18)), CAST(0.788235366344451900 AS Decimal(21, 18)), CAST(0.709803938865661600 AS Decimal(21, 18)), CAST(1.000000000000000000 AS Decimal(21, 18)))
GO
INSERT [Planet].[Colour] ([Id], [Title], [Red], [Green], [Blue], [Alpha]) VALUES (5, N'VenusMapColour', CAST(0.789655148983001700 AS Decimal(21, 18)), CAST(0.645790874958038300 AS Decimal(21, 18)), CAST(0.497131049633026100 AS Decimal(21, 18)), CAST(1.000000000000000000 AS Decimal(21, 18)))
GO
INSERT [Planet].[Colour] ([Id], [Title], [Red], [Green], [Blue], [Alpha]) VALUES (6, N'Earth1', CAST(0.461872875690460200 AS Decimal(21, 18)), CAST(0.463235318660736100 AS Decimal(21, 18)), CAST(0.364457190036773700 AS Decimal(21, 18)), CAST(0.098039217293262480 AS Decimal(21, 18)))
GO
INSERT [Planet].[Colour] ([Id], [Title], [Red], [Green], [Blue], [Alpha]) VALUES (7, N'Earth2', CAST(0.647058844566345200 AS Decimal(21, 18)), CAST(0.848739564418792700 AS Decimal(21, 18)), CAST(0.890999972820282000 AS Decimal(21, 18)), CAST(0.117647059261798860 AS Decimal(21, 18)))
GO
INSERT [Planet].[Colour] ([Id], [Title], [Red], [Green], [Blue], [Alpha]) VALUES (8, N'Earth3', CAST(0.647058844566345200 AS Decimal(21, 18)), CAST(0.848739564418792700 AS Decimal(21, 18)), CAST(1.000000000000000000 AS Decimal(21, 18)), CAST(0.416000008583068850 AS Decimal(21, 18)))
GO
INSERT [Planet].[Colour] ([Id], [Title], [Red], [Green], [Blue], [Alpha]) VALUES (9, N'EarthMapColour', CAST(0.449999988079071040 AS Decimal(21, 18)), CAST(0.680000007152557400 AS Decimal(21, 18)), CAST(1.000000000000000000 AS Decimal(21, 18)), CAST(1.000000000000000000 AS Decimal(21, 18)))
GO
INSERT [Planet].[Colour] ([Id], [Title], [Red], [Green], [Blue], [Alpha]) VALUES (10, N'MoonMapColour', CAST(0.375000000000000000 AS Decimal(21, 18)), CAST(0.380514711141586300 AS Decimal(21, 18)), CAST(0.380514711141586300 AS Decimal(21, 18)), CAST(1.000000000000000000 AS Decimal(21, 18)))
GO
INSERT [Planet].[Colour] ([Id], [Title], [Red], [Green], [Blue], [Alpha]) VALUES (11, N'Mars1', CAST(0.682352960109710700 AS Decimal(21, 18)), CAST(0.474509835243225100 AS Decimal(21, 18)), CAST(0.407843172550201400 AS Decimal(21, 18)), CAST(0.000000000000000000 AS Decimal(21, 18)))
GO
INSERT [Planet].[Colour] ([Id], [Title], [Red], [Green], [Blue], [Alpha]) VALUES (12, N'Mars2', CAST(0.682352960109710700 AS Decimal(21, 18)), CAST(0.474352955818176270 AS Decimal(21, 18)), CAST(0.407058835029602050 AS Decimal(21, 18)), CAST(0.300000011920928960 AS Decimal(21, 18)))
GO
INSERT [Planet].[Colour] ([Id], [Title], [Red], [Green], [Blue], [Alpha]) VALUES (13, N'MarsMapColour', CAST(0.683823525905609100 AS Decimal(21, 18)), CAST(0.338274389505386350 AS Decimal(21, 18)), CAST(0.301686853170394900 AS Decimal(21, 18)), CAST(1.000000000000000000 AS Decimal(21, 18)))
GO
INSERT [Planet].[Colour] ([Id], [Title], [Red], [Green], [Blue], [Alpha]) VALUES (14, N'PhobosMapColour', CAST(0.357944548130035400 AS Decimal(21, 18)), CAST(0.307998806238174440 AS Decimal(21, 18)), CAST(0.287188082933425900 AS Decimal(21, 18)), CAST(1.000000000000000000 AS Decimal(21, 18)))
GO
INSERT [Planet].[Colour] ([Id], [Title], [Red], [Green], [Blue], [Alpha]) VALUES (15, N'DeimosMapColour', CAST(0.416000008583068850 AS Decimal(21, 18)), CAST(0.354916185140609740 AS Decimal(21, 18)), CAST(0.276849001646041870 AS Decimal(21, 18)), CAST(1.000000000000000000 AS Decimal(21, 18)))
GO
INSERT [Planet].[Colour] ([Id], [Title], [Red], [Green], [Blue], [Alpha]) VALUES (16, N'JupiterMapColour', CAST(1.000000000000000000 AS Decimal(21, 18)), CAST(0.660000000000000000 AS Decimal(21, 18)), CAST(0.430000000000000000 AS Decimal(21, 18)), CAST(1.000000000000000000 AS Decimal(21, 18)))
GO
INSERT [Planet].[Colour] ([Id], [Title], [Red], [Green], [Blue], [Alpha]) VALUES (17, N'IoMapColour', CAST(0.899999976158142100 AS Decimal(21, 18)), CAST(0.850000023841857900 AS Decimal(21, 18)), CAST(0.400000005960464500 AS Decimal(21, 18)), CAST(1.000000000000000000 AS Decimal(21, 18)))
GO
INSERT [Planet].[Colour] ([Id], [Title], [Red], [Green], [Blue], [Alpha]) VALUES (18, N'EuropaMapColour', CAST(0.750000000000000000 AS Decimal(21, 18)), CAST(0.810000002384185800 AS Decimal(21, 18)), CAST(0.850000023841857900 AS Decimal(21, 18)), CAST(1.000000000000000000 AS Decimal(21, 18)))
GO
INSERT [Planet].[Colour] ([Id], [Title], [Red], [Green], [Blue], [Alpha]) VALUES (19, N'GanymedeMapColour', CAST(0.540000000000000000 AS Decimal(21, 18)), CAST(0.490000000000000000 AS Decimal(21, 18)), CAST(0.444000000000000000 AS Decimal(21, 18)), CAST(1.000000000000000000 AS Decimal(21, 18)))
GO
INSERT [Planet].[Colour] ([Id], [Title], [Red], [Green], [Blue], [Alpha]) VALUES (20, N'CallistoMapColour', CAST(0.899999976158142100 AS Decimal(21, 18)), CAST(0.899999976158142100 AS Decimal(21, 18)), CAST(0.899999976158142100 AS Decimal(21, 18)), CAST(1.000000000000000000 AS Decimal(21, 18)))
GO
SET IDENTITY_INSERT [Planet].[Colour] OFF
GO
SET IDENTITY_INSERT [Planet].[FogKey] ON 
GO
INSERT [Planet].[FogKey] ([Id], [ColourId], [Distance]) VALUES (1, 3, CAST(100.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[FogKey] ([Id], [ColourId], [Distance]) VALUES (2, 4, CAST(50000.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[FogKey] ([Id], [ColourId], [Distance]) VALUES (3, 6, CAST(500.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[FogKey] ([Id], [ColourId], [Distance]) VALUES (4, 7, CAST(3000.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[FogKey] ([Id], [ColourId], [Distance]) VALUES (5, 8, CAST(30000.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[FogKey] ([Id], [ColourId], [Distance]) VALUES (6, 11, CAST(0.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[FogKey] ([Id], [ColourId], [Distance]) VALUES (7, 12, CAST(15000.000000000000000000 AS Decimal(36, 18)))
GO
SET IDENTITY_INSERT [Planet].[FogKey] OFF
GO
SET IDENTITY_INSERT [Planet].[PlanetBaseData] ON 
GO
INSERT [Planet].[PlanetBaseData] ([Id], [PlanetId], [ColourId], [Radius], [Gravity], [TimewarpHeight], [VelocityArrowsHeight]) VALUES (1, 1, 1, CAST(31500000.000000000000000000 AS Decimal(36, 18)), CAST(100.000000000000000000 AS Decimal(36, 18)), CAST(25000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetBaseData] ([Id], [PlanetId], [ColourId], [Radius], [Gravity], [TimewarpHeight], [VelocityArrowsHeight]) VALUES (2, 2, 2, CAST(120000.000000000000000000 AS Decimal(36, 18)), CAST(3.270000000000000000 AS Decimal(36, 18)), CAST(2500.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetBaseData] ([Id], [PlanetId], [ColourId], [Radius], [Gravity], [TimewarpHeight], [VelocityArrowsHeight]) VALUES (3, 3, 5, CAST(300000.000000000000000000 AS Decimal(36, 18)), CAST(8.870000000000000000 AS Decimal(36, 18)), CAST(35000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetBaseData] ([Id], [PlanetId], [ColourId], [Radius], [Gravity], [TimewarpHeight], [VelocityArrowsHeight]) VALUES (4, 4, 9, CAST(315000.000000000000000000 AS Decimal(36, 18)), CAST(9.800000000000000000 AS Decimal(36, 18)), CAST(25000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetBaseData] ([Id], [PlanetId], [ColourId], [Radius], [Gravity], [TimewarpHeight], [VelocityArrowsHeight]) VALUES (5, 5, 10, CAST(86500.000000000000000000 AS Decimal(36, 18)), CAST(1.420000000000000000 AS Decimal(36, 18)), CAST(5000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetBaseData] ([Id], [PlanetId], [ColourId], [Radius], [Gravity], [TimewarpHeight], [VelocityArrowsHeight]) VALUES (6, 6, 13, CAST(169500.000000000000000000 AS Decimal(36, 18)), CAST(3.610000000000000000 AS Decimal(36, 18)), CAST(15000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetBaseData] ([Id], [PlanetId], [ColourId], [Radius], [Gravity], [TimewarpHeight], [VelocityArrowsHeight]) VALUES (7, 7, 14, CAST(6000.000000000000000000 AS Decimal(36, 18)), CAST(0.087000000000000000 AS Decimal(36, 18)), CAST(2000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetBaseData] ([Id], [PlanetId], [ColourId], [Radius], [Gravity], [TimewarpHeight], [VelocityArrowsHeight]) VALUES (8, 8, 15, CAST(3250.000000000000000000 AS Decimal(36, 18)), CAST(0.054000000000000000 AS Decimal(36, 18)), CAST(1500.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetBaseData] ([Id], [PlanetId], [ColourId], [Radius], [Gravity], [TimewarpHeight], [VelocityArrowsHeight]) VALUES (9, 9, 16, CAST(3500000.000000000000000000 AS Decimal(36, 18)), CAST(25.000000000000000000 AS Decimal(36, 18)), CAST(80000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetBaseData] ([Id], [PlanetId], [ColourId], [Radius], [Gravity], [TimewarpHeight], [VelocityArrowsHeight]) VALUES (10, 10, 17, CAST(121500.000000000000000000 AS Decimal(36, 18)), CAST(4.320000000000000000 AS Decimal(36, 18)), CAST(5000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetBaseData] ([Id], [PlanetId], [ColourId], [Radius], [Gravity], [TimewarpHeight], [VelocityArrowsHeight]) VALUES (11, 11, 18, CAST(104000.000000000000000000 AS Decimal(36, 18)), CAST(2.320000000000000000 AS Decimal(36, 18)), CAST(5000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetBaseData] ([Id], [PlanetId], [ColourId], [Radius], [Gravity], [TimewarpHeight], [VelocityArrowsHeight]) VALUES (12, 12, 19, CAST(175600.000000000000000000 AS Decimal(36, 18)), CAST(5.810000000000000000 AS Decimal(36, 18)), CAST(5000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetBaseData] ([Id], [PlanetId], [ColourId], [Radius], [Gravity], [TimewarpHeight], [VelocityArrowsHeight]) VALUES (13, 13, 20, CAST(161000.000000000000000000 AS Decimal(36, 18)), CAST(4.240000000000000000 AS Decimal(36, 18)), CAST(5000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)))
GO
SET IDENTITY_INSERT [Planet].[PlanetBaseData] OFF
GO
SET IDENTITY_INSERT [Planet].[Difficulty] ON 
GO
INSERT [Planet].[Difficulty] ([Id], [Title]) VALUES (2, N'hard')
GO
INSERT [Planet].[Difficulty] ([Id], [Title]) VALUES (1, N'normal')
GO
INSERT [Planet].[Difficulty] ([Id], [Title]) VALUES (3, N'realistic')
GO
SET IDENTITY_INSERT [Planet].[Difficulty] OFF
GO
SET IDENTITY_INSERT [Planet].[TextureSize] ON 
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (1, CAST(20.000000000000000000 AS Decimal(36, 18)), CAST(8.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (2, CAST(30.000000000000000000 AS Decimal(36, 18)), CAST(14.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (3, CAST(280.000000000000000000 AS Decimal(36, 18)), CAST(145.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (4, CAST(32.000000000000000000 AS Decimal(36, 18)), CAST(14.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (5, CAST(48.000000000000000000 AS Decimal(36, 18)), CAST(20.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (6, CAST(2000.000000000000000000 AS Decimal(36, 18)), CAST(650.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (7, CAST(20.000000000000000000 AS Decimal(36, 18)), CAST(8.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (8, CAST(-1.000000000000000000 AS Decimal(36, 18)), CAST(-1.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (9, CAST(100.000000000000000000 AS Decimal(36, 18)), CAST(30.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (10, CAST(40.000000000000000000 AS Decimal(36, 18)), CAST(16.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (11, CAST(25.000000000000000000 AS Decimal(36, 18)), CAST(12.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (12, CAST(40.000000000000000000 AS Decimal(36, 18)), CAST(18.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (13, CAST(380.000000000000000000 AS Decimal(36, 18)), CAST(170.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (14, CAST(24.000000000000000000 AS Decimal(36, 18)), CAST(24.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (15, CAST(24.000000000000000000 AS Decimal(36, 18)), CAST(24.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (16, CAST(200.000000000000000000 AS Decimal(36, 18)), CAST(150.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (17, CAST(22.000000000000000000 AS Decimal(36, 18)), CAST(14.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (18, CAST(28.000000000000000000 AS Decimal(36, 18)), CAST(21.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (19, CAST(320.000000000000000000 AS Decimal(36, 18)), CAST(200.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (20, CAST(-1.000000000000000000 AS Decimal(36, 18)), CAST(-1.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (21, CAST(-1.000000000000000000 AS Decimal(36, 18)), CAST(-1.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (22, CAST(-1.000000000000000000 AS Decimal(36, 18)), CAST(-1.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (23, CAST(20.000000000000000000 AS Decimal(36, 18)), CAST(8.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (24, CAST(150.000000000000000000 AS Decimal(36, 18)), CAST(50.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (25, CAST(70.000000000000000000 AS Decimal(36, 18)), CAST(25.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (26, CAST(70.000000000000000000 AS Decimal(36, 18)), CAST(25.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (27, CAST(1200.000000000000000000 AS Decimal(36, 18)), CAST(400.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (28, CAST(40.000000000000000000 AS Decimal(36, 18)), CAST(15.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (29, CAST(50.000000000000000000 AS Decimal(36, 18)), CAST(20.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (30, CAST(800.000000000000000000 AS Decimal(36, 18)), CAST(200.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (31, CAST(30.000000000000000000 AS Decimal(36, 18)), CAST(10.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TextureSize] ([Id], [X], [Y]) VALUES (32, CAST(150.000000000000000000 AS Decimal(36, 18)), CAST(50.000000000000000000 AS Decimal(36, 18)))
GO
SET IDENTITY_INSERT [Planet].[TextureSize] OFF
GO
SET IDENTITY_INSERT [Planet].[Texture] ON 
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (28, N'Black_Dust', 28)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (6, N'Blured', 6)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (7, N'Blured', 7)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (9, N'Blured', 9)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (16, N'Circles', 16)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (1, N'Dark_Dust', 1)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (29, N'Dark_Dust', 29)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (30, N'Dark_Dust', 30)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (4, N'Dust', 4)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (23, N'Dust', 23)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (24, N'Dust', 24)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (2, N'Hard_Rocks', 2)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (10, N'Hard_Rocks', 10)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (12, N'Hard_Rocks', 12)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (15, N'Hard_Rocks', 15)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (18, N'Hard_Rocks', 18)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (20, N'Ice', 20)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (21, N'Ice', 21)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (22, N'Ice', 22)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (25, N'Ice', 25)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (26, N'Ice', 26)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (27, N'Ice', 27)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (17, N'Limestone', 17)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (19, N'Limestone', 19)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (8, N'None', 8)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (32, N'None', 32)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (3, N'Soft_Rocks', 3)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (5, N'Soft_Rocks', 5)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (11, N'Soft_Rocks', 11)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (13, N'Soft_Rocks', 13)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (14, N'Soft_Rocks', 14)
GO
INSERT [Planet].[Texture] ([Id], [Title], [TextureSizeId]) VALUES (31, N'Soft_Rocks', 31)
GO
SET IDENTITY_INSERT [Planet].[Texture] OFF
GO
SET IDENTITY_INSERT [Planet].[TerrainTextureData] ON 
GO
INSERT [Planet].[TerrainTextureData] ([Id], [Title], [PlanetTexture], [PlanetTextureCutout], [SurfaceTextureA], [SurfaceTextureB], [TerrainTextureC], [SurfaceLayerSize], [MinFade], [MaxFade], [ShadowIntensity], [ShadowHeight]) VALUES (1, N'Mercury', N'Mercury', CAST(1.000000000000000000 AS Decimal(36, 18)), 1, 2, 3, CAST(30.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(10.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TerrainTextureData] ([Id], [Title], [PlanetTexture], [PlanetTextureCutout], [SurfaceTextureA], [SurfaceTextureB], [TerrainTextureC], [SurfaceLayerSize], [MinFade], [MaxFade], [ShadowIntensity], [ShadowHeight]) VALUES (2, N'Venus', N'NewVenus', CAST(0.944999992847442600 AS Decimal(36, 18)), 4, 5, 6, CAST(60.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.800000011920929000 AS Decimal(36, 18)), CAST(0.500000000000000000 AS Decimal(36, 18)), CAST(6.500000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TerrainTextureData] ([Id], [Title], [PlanetTexture], [PlanetTextureCutout], [SurfaceTextureA], [SurfaceTextureB], [TerrainTextureC], [SurfaceLayerSize], [MinFade], [MaxFade], [ShadowIntensity], [ShadowHeight]) VALUES (3, N'Earth', N'NewEarth', CAST(1.000000000000000000 AS Decimal(36, 18)), 7, 8, 9, CAST(40.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.250000000000000000 AS Decimal(36, 18)), CAST(15.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TerrainTextureData] ([Id], [Title], [PlanetTexture], [PlanetTextureCutout], [SurfaceTextureA], [SurfaceTextureB], [TerrainTextureC], [SurfaceLayerSize], [MinFade], [MaxFade], [ShadowIntensity], [ShadowHeight]) VALUES (4, N'Moon', N'NewMoon', CAST(-0.999000000000000000 AS Decimal(36, 18)), 1, 10, 3, CAST(50.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.250000000000000000 AS Decimal(36, 18)), CAST(10.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TerrainTextureData] ([Id], [Title], [PlanetTexture], [PlanetTextureCutout], [SurfaceTextureA], [SurfaceTextureB], [TerrainTextureC], [SurfaceLayerSize], [MinFade], [MaxFade], [ShadowIntensity], [ShadowHeight]) VALUES (5, N'Mars', N'NewMars', CAST(0.990000009536743200 AS Decimal(36, 18)), 11, 12, 13, CAST(60.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(0.850000023841857900 AS Decimal(36, 18)), CAST(25.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TerrainTextureData] ([Id], [Title], [PlanetTexture], [PlanetTextureCutout], [SurfaceTextureA], [SurfaceTextureB], [TerrainTextureC], [SurfaceLayerSize], [MinFade], [MaxFade], [ShadowIntensity], [ShadowHeight]) VALUES (6, N'Phobos', N'Phobos', CAST(0.935000002384185800 AS Decimal(36, 18)), 14, 15, 16, CAST(35.000000000000000000 AS Decimal(36, 18)), CAST(0.150000000000000000 AS Decimal(36, 18)), CAST(0.650000000000000000 AS Decimal(36, 18)), CAST(8.000000000000000000 AS Decimal(36, 18)), CAST(2.500000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TerrainTextureData] ([Id], [Title], [PlanetTexture], [PlanetTextureCutout], [SurfaceTextureA], [SurfaceTextureB], [TerrainTextureC], [SurfaceLayerSize], [MinFade], [MaxFade], [ShadowIntensity], [ShadowHeight]) VALUES (7, N'Deimos', N'Deimos', CAST(0.925000011920929000 AS Decimal(36, 18)), 17, 18, 19, CAST(35.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.500000000000000000 AS Decimal(36, 18)), CAST(35.000000000000000000 AS Decimal(36, 18)), CAST(3.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TerrainTextureData] ([Id], [Title], [PlanetTexture], [PlanetTextureCutout], [SurfaceTextureA], [SurfaceTextureB], [TerrainTextureC], [SurfaceLayerSize], [MinFade], [MaxFade], [ShadowIntensity], [ShadowHeight]) VALUES (8, N'Jupiter', N'Jupiter', CAST(0.995000004768371600 AS Decimal(36, 18)), 20, 21, 22, CAST(60.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.600000023841857900 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TerrainTextureData] ([Id], [Title], [PlanetTexture], [PlanetTextureCutout], [SurfaceTextureA], [SurfaceTextureB], [TerrainTextureC], [SurfaceLayerSize], [MinFade], [MaxFade], [ShadowIntensity], [ShadowHeight]) VALUES (9, N'Io', N'Io', CAST(-1.000000000000000000 AS Decimal(36, 18)), 23, 8, 24, CAST(30.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(0.750000000000000000 AS Decimal(36, 18)), CAST(15.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TerrainTextureData] ([Id], [Title], [PlanetTexture], [PlanetTextureCutout], [SurfaceTextureA], [SurfaceTextureB], [TerrainTextureC], [SurfaceLayerSize], [MinFade], [MaxFade], [ShadowIntensity], [ShadowHeight]) VALUES (10, N'Europa', N'Europa', CAST(0.990000009536743200 AS Decimal(36, 18)), 25, 26, 27, CAST(60.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.600000023841857900 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TerrainTextureData] ([Id], [Title], [PlanetTexture], [PlanetTextureCutout], [SurfaceTextureA], [SurfaceTextureB], [TerrainTextureC], [SurfaceLayerSize], [MinFade], [MaxFade], [ShadowIntensity], [ShadowHeight]) VALUES (11, N'Ganymede', N'Ganymede', CAST(1.000000000000000000 AS Decimal(36, 18)), 28, 29, 30, CAST(500.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(0.350000000000000000 AS Decimal(36, 18)), CAST(6.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[TerrainTextureData] ([Id], [Title], [PlanetTexture], [PlanetTextureCutout], [SurfaceTextureA], [SurfaceTextureB], [TerrainTextureC], [SurfaceLayerSize], [MinFade], [MaxFade], [ShadowIntensity], [ShadowHeight]) VALUES (12, N'Callisto', N'Callisto', CAST(0.999000012874603300 AS Decimal(36, 18)), 31, 8, 32, CAST(40.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.500000000000000000 AS Decimal(36, 18)), CAST(8.000000000000000000 AS Decimal(36, 18)))
GO
SET IDENTITY_INSERT [Planet].[TerrainTextureData] OFF
GO
SET IDENTITY_INSERT [Planet].[TerrainData] ON 
GO
INSERT [Planet].[TerrainData] ([Id], [PlanetId], [TerrainTextureDataId], [VerticeSize], [Collider]) VALUES (1, 2, 1, CAST(2.000000000000000000 AS Decimal(36, 18)), 1)
GO
INSERT [Planet].[TerrainData] ([Id], [PlanetId], [TerrainTextureDataId], [VerticeSize], [Collider]) VALUES (2, 3, 2, CAST(1.000000000000000000 AS Decimal(36, 18)), 1)
GO
INSERT [Planet].[TerrainData] ([Id], [PlanetId], [TerrainTextureDataId], [VerticeSize], [Collider]) VALUES (3, 4, 3, CAST(3.000000000000000000 AS Decimal(36, 18)), 1)
GO
INSERT [Planet].[TerrainData] ([Id], [PlanetId], [TerrainTextureDataId], [VerticeSize], [Collider]) VALUES (4, 5, 4, CAST(2.000000000000000000 AS Decimal(36, 18)), 1)
GO
INSERT [Planet].[TerrainData] ([Id], [PlanetId], [TerrainTextureDataId], [VerticeSize], [Collider]) VALUES (5, 6, 5, CAST(3.000000000000000000 AS Decimal(36, 18)), 1)
GO
INSERT [Planet].[TerrainData] ([Id], [PlanetId], [TerrainTextureDataId], [VerticeSize], [Collider]) VALUES (6, 7, 6, CAST(0.500000000000000000 AS Decimal(36, 18)), 1)
GO
INSERT [Planet].[TerrainData] ([Id], [PlanetId], [TerrainTextureDataId], [VerticeSize], [Collider]) VALUES (7, 8, 7, CAST(1.000000000000000000 AS Decimal(36, 18)), 1)
GO
INSERT [Planet].[TerrainData] ([Id], [PlanetId], [TerrainTextureDataId], [VerticeSize], [Collider]) VALUES (8, 9, 8, CAST(500.000000000000000000 AS Decimal(36, 18)), 1)
GO
INSERT [Planet].[TerrainData] ([Id], [PlanetId], [TerrainTextureDataId], [VerticeSize], [Collider]) VALUES (9, 10, 9, CAST(2.500000000000000000 AS Decimal(36, 18)), 1)
GO
INSERT [Planet].[TerrainData] ([Id], [PlanetId], [TerrainTextureDataId], [VerticeSize], [Collider]) VALUES (10, 11, 10, CAST(2.000000000000000000 AS Decimal(36, 18)), 1)
GO
INSERT [Planet].[TerrainData] ([Id], [PlanetId], [TerrainTextureDataId], [VerticeSize], [Collider]) VALUES (11, 12, 11, CAST(1.000000000000000000 AS Decimal(36, 18)), 1)
GO
INSERT [Planet].[TerrainData] ([Id], [PlanetId], [TerrainTextureDataId], [VerticeSize], [Collider]) VALUES (12, 13, 12, CAST(2.000000000000000000 AS Decimal(36, 18)), 1)
GO
SET IDENTITY_INSERT [Planet].[TerrainData] OFF
GO
SET IDENTITY_INSERT [Planet].[TerrainFormulaSet] ON 
GO
INSERT [Planet].[TerrainFormulaSet] ([Id], [Title]) VALUES (3, N'Earth')
GO
INSERT [Planet].[TerrainFormulaSet] ([Id], [Title]) VALUES (1, N'Mercury')
GO
INSERT [Planet].[TerrainFormulaSet] ([Id], [Title]) VALUES (2, N'Venus')
GO
SET IDENTITY_INSERT [Planet].[TerrainFormulaSet] OFF
GO
SET IDENTITY_INSERT [Planet].[TerrainDataFormulaDifficulty] ON 
GO
INSERT [Planet].[TerrainDataFormulaDifficulty] ([Id], [TerrainDataId], [DifficultyId], [TerrainFormulaSetId]) VALUES (1, 1, 1, 1)
GO
INSERT [Planet].[TerrainDataFormulaDifficulty] ([Id], [TerrainDataId], [DifficultyId], [TerrainFormulaSetId]) VALUES (2, 2, 1, 2)
GO
INSERT [Planet].[TerrainDataFormulaDifficulty] ([Id], [TerrainDataId], [DifficultyId], [TerrainFormulaSetId]) VALUES (3, 3, 1, 3)
GO
SET IDENTITY_INSERT [Planet].[TerrainDataFormulaDifficulty] OFF
GO
SET IDENTITY_INSERT [Planet].[FlatZone] ON 
GO
INSERT [Planet].[FlatZone] ([Id], [Title], [Height], [Angle], [Width], [Transition]) VALUES (1, N'Earth1', CAST(18.000000000000000000 AS Decimal(36, 18)), CAST(1.570700000000000000 AS Decimal(36, 18)), CAST(900.000000000000000000 AS Decimal(36, 18)), CAST(200.000000000000000000 AS Decimal(36, 18)))
GO
SET IDENTITY_INSERT [Planet].[FlatZone] OFF
GO
SET IDENTITY_INSERT [Planet].[TerrainDataFlatZone] ON 
GO
INSERT [Planet].[TerrainDataFlatZone] ([Id], [TerrainDataId], [FlatZoneId]) VALUES (1, 3, 1)
GO
SET IDENTITY_INSERT [Planet].[TerrainDataFlatZone] OFF
GO
SET IDENTITY_INSERT [Planet].[FogKeyLink] ON 
GO
INSERT [Planet].[FogKeyLink] ([Id], [FogKeyId], [FogKeySetId]) VALUES (1, 1, 2)
GO
INSERT [Planet].[FogKeyLink] ([Id], [FogKeyId], [FogKeySetId]) VALUES (2, 2, 2)
GO
INSERT [Planet].[FogKeyLink] ([Id], [FogKeyId], [FogKeySetId]) VALUES (3, 3, 3)
GO
INSERT [Planet].[FogKeyLink] ([Id], [FogKeyId], [FogKeySetId]) VALUES (4, 4, 3)
GO
INSERT [Planet].[FogKeyLink] ([Id], [FogKeyId], [FogKeySetId]) VALUES (5, 5, 3)
GO
INSERT [Planet].[FogKeyLink] ([Id], [FogKeyId], [FogKeySetId]) VALUES (6, 6, 4)
GO
INSERT [Planet].[FogKeyLink] ([Id], [FogKeyId], [FogKeySetId]) VALUES (7, 7, 4)
GO
SET IDENTITY_INSERT [Planet].[FogKeyLink] OFF
GO
SET IDENTITY_INSERT [Planet].[Heightmap] ON 
GO
INSERT [Planet].[Heightmap] ([Id], [Title]) VALUES (3, N'Craters')
GO
INSERT [Planet].[Heightmap] ([Id], [Title]) VALUES (7, N'Deimos')
GO
INSERT [Planet].[Heightmap] ([Id], [Title]) VALUES (2, N'Mercury')
GO
INSERT [Planet].[Heightmap] ([Id], [Title]) VALUES (1, N'Mercury_Plains')
GO
INSERT [Planet].[Heightmap] ([Id], [Title]) VALUES (4, N'Perlin')
GO
INSERT [Planet].[Heightmap] ([Id], [Title]) VALUES (5, N'Venus')
GO
INSERT [Planet].[Heightmap] ([Id], [Title]) VALUES (6, N'Venus_Plains')
GO
SET IDENTITY_INSERT [Planet].[Heightmap] OFF
GO
SET IDENTITY_INSERT [Planet].[Modifier] ON 
GO
INSERT [Planet].[Modifier] ([Id], [Title]) VALUES (1, N'Curve1')
GO
INSERT [Planet].[Modifier] ([Id], [Title]) VALUES (2, N'Curve2')
GO
INSERT [Planet].[Modifier] ([Id], [Title]) VALUES (3, N'Curve8')
GO
SET IDENTITY_INSERT [Planet].[Modifier] OFF
GO
SET IDENTITY_INSERT [Planet].[TextureFormula] ON 
GO
INSERT [Planet].[TextureFormula] ([Id], [Title], [HeightmapId], [Width], [Height], [ModifierId], [AddOnFormulaId]) VALUES (5, N'M', 7, CAST(1.500000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), NULL, NULL)
GO
INSERT [Planet].[TextureFormula] ([Id], [Title], [HeightmapId], [Width], [Height], [ModifierId], [AddOnFormulaId]) VALUES (2, N'OUTPUT', NULL, NULL, NULL, 3, NULL)
GO
INSERT [Planet].[TextureFormula] ([Id], [Title], [HeightmapId], [Width], [Height], [ModifierId], [AddOnFormulaId]) VALUES (4, N'OUTPUT', 4, CAST(5.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), NULL, NULL)
GO
INSERT [Planet].[TextureFormula] ([Id], [Title], [HeightmapId], [Width], [Height], [ModifierId], [AddOnFormulaId]) VALUES (1, N'OUTPUT', 4, CAST(50.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), 3, NULL)
GO
INSERT [Planet].[TextureFormula] ([Id], [Title], [HeightmapId], [Width], [Height], [ModifierId], [AddOnFormulaId]) VALUES (3, N'OUTPUT', 4, CAST(80.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), 3, NULL)
GO
SET IDENTITY_INSERT [Planet].[TextureFormula] OFF
GO
SET IDENTITY_INSERT [Planet].[TerrainFormula] ON 
GO
INSERT [Planet].[TerrainFormula] ([Id], [Title], [HeightmapId], [Width], [Height], [ModifierId], [AddOnFormulaId]) VALUES (9, N'M', 4, CAST(40.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), 2, NULL)
GO
INSERT [Planet].[TerrainFormula] ([Id], [Title], [HeightmapId], [Width], [Height], [ModifierId], [AddOnFormulaId]) VALUES (11, N'M2', 4, CAST(7.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), 2, NULL)
GO
INSERT [Planet].[TerrainFormula] ([Id], [Title], [HeightmapId], [Width], [Height], [ModifierId], [AddOnFormulaId]) VALUES (1, N'OUTPUT', 3, CAST(10.000000000000000000 AS Decimal(36, 18)), CAST(350.000000000000000000 AS Decimal(36, 18)), NULL, NULL)
GO
INSERT [Planet].[TerrainFormula] ([Id], [Title], [HeightmapId], [Width], [Height], [ModifierId], [AddOnFormulaId]) VALUES (2, N'OUTPUT', 3, CAST(50.000000000000000000 AS Decimal(36, 18)), CAST(100.000000000000000000 AS Decimal(36, 18)), NULL, NULL)
GO
INSERT [Planet].[TerrainFormula] ([Id], [Title], [HeightmapId], [Width], [Height], [ModifierId], [AddOnFormulaId]) VALUES (3, N'OUTPUT', 3, CAST(320.000000000000000000 AS Decimal(36, 18)), CAST(12.000000000000000000 AS Decimal(36, 18)), NULL, NULL)
GO
INSERT [Planet].[TerrainFormula] ([Id], [Title], [HeightmapId], [Width], [Height], [ModifierId], [AddOnFormulaId]) VALUES (12, N'OUTPUT', 4, CAST(20.000000000000000000 AS Decimal(36, 18)), CAST(1300.000000000000000000 AS Decimal(36, 18)), 1, 11)
GO
INSERT [Planet].[TerrainFormula] ([Id], [Title], [HeightmapId], [Width], [Height], [ModifierId], [AddOnFormulaId]) VALUES (10, N'OUTPUT', 4, CAST(70.000000000000000000 AS Decimal(36, 18)), CAST(200.000000000000000000 AS Decimal(36, 18)), 1, 9)
GO
INSERT [Planet].[TerrainFormula] ([Id], [Title], [HeightmapId], [Width], [Height], [ModifierId], [AddOnFormulaId]) VALUES (13, N'OUTPUT', 4, CAST(104.000000000000000000 AS Decimal(36, 18)), CAST(35.000000000000000000 AS Decimal(36, 18)), NULL, NULL)
GO
INSERT [Planet].[TerrainFormula] ([Id], [Title], [HeightmapId], [Width], [Height], [ModifierId], [AddOnFormulaId]) VALUES (4, N'OUTPUT', 4, CAST(300.000000000000000000 AS Decimal(36, 18)), CAST(3.000000000000000000 AS Decimal(36, 18)), NULL, NULL)
GO
INSERT [Planet].[TerrainFormula] ([Id], [Title], [HeightmapId], [Width], [Height], [ModifierId], [AddOnFormulaId]) VALUES (5, N'OUTPUT', 4, CAST(300.000000000000000000 AS Decimal(36, 18)), CAST(8.000000000000000000 AS Decimal(36, 18)), 1, NULL)
GO
INSERT [Planet].[TerrainFormula] ([Id], [Title], [HeightmapId], [Width], [Height], [ModifierId], [AddOnFormulaId]) VALUES (6, N'OUTPUT', 4, CAST(540.000000000000000000 AS Decimal(36, 18)), CAST(5.000000000000000000 AS Decimal(36, 18)), 1, NULL)
GO
INSERT [Planet].[TerrainFormula] ([Id], [Title], [HeightmapId], [Width], [Height], [ModifierId], [AddOnFormulaId]) VALUES (14, N'OUTPUT', 4, CAST(807.000000000000000000 AS Decimal(36, 18)), CAST(5.000000000000000000 AS Decimal(36, 18)), NULL, NULL)
GO
INSERT [Planet].[TerrainFormula] ([Id], [Title], [HeightmapId], [Width], [Height], [ModifierId], [AddOnFormulaId]) VALUES (7, N'OUTPUT', 4, CAST(1300.000000000000000000 AS Decimal(36, 18)), CAST(1.600000000000000000 AS Decimal(36, 18)), 1, NULL)
GO
INSERT [Planet].[TerrainFormula] ([Id], [Title], [HeightmapId], [Width], [Height], [ModifierId], [AddOnFormulaId]) VALUES (15, N'OUTPUT', 4, CAST(1500.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), NULL, NULL)
GO
INSERT [Planet].[TerrainFormula] ([Id], [Title], [HeightmapId], [Width], [Height], [ModifierId], [AddOnFormulaId]) VALUES (8, N'OUTPUT', 4, CAST(2000.000000000000000000 AS Decimal(36, 18)), CAST(1.500000000000000000 AS Decimal(36, 18)), 1, NULL)
GO
SET IDENTITY_INSERT [Planet].[TerrainFormula] OFF
GO
SET IDENTITY_INSERT [Planet].[Landmark] ON 
GO
INSERT [Planet].[Landmark] ([Id], [Title], [Angle], [StartAngle], [EndAngle]) VALUES (1, N'Caloris Planitia', CAST(169.850000000000000000 AS Decimal(36, 18)), CAST(154.000000000000000000 AS Decimal(36, 18)), CAST(185.500000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[Landmark] ([Id], [Title], [Angle], [StartAngle], [EndAngle]) VALUES (2, N'Borealis Planitia', CAST(72.000000000000000000 AS Decimal(36, 18)), CAST(64.000000000000000000 AS Decimal(36, 18)), CAST(79.000000000000000000 AS Decimal(36, 18)))
GO
SET IDENTITY_INSERT [Planet].[Landmark] OFF
GO
SET IDENTITY_INSERT [Planet].[PlanetLandmark] ON 
GO
INSERT [Planet].[PlanetLandmark] ([Id], [PlanetId], [LandmarkId]) VALUES (1, 2, 1)
GO
INSERT [Planet].[PlanetLandmark] ([Id], [PlanetId], [LandmarkId]) VALUES (2, 2, 2)
GO
SET IDENTITY_INSERT [Planet].[PlanetLandmark] OFF
GO
SET IDENTITY_INSERT [Planet].[PlanetAchievementData] ON 
GO
INSERT [Planet].[PlanetAchievementData] ([Id], [PlanetId], [Landed], [Takeoff], [Atmosphere], [Orbit], [Crash]) VALUES (1, 2, 1, 1, 1, 1, 1)
GO
INSERT [Planet].[PlanetAchievementData] ([Id], [PlanetId], [Landed], [Takeoff], [Atmosphere], [Orbit], [Crash]) VALUES (2, 3, 1, 1, 1, 1, 1)
GO
INSERT [Planet].[PlanetAchievementData] ([Id], [PlanetId], [Landed], [Takeoff], [Atmosphere], [Orbit], [Crash]) VALUES (3, 4, 1, 1, 1, 1, 1)
GO
INSERT [Planet].[PlanetAchievementData] ([Id], [PlanetId], [Landed], [Takeoff], [Atmosphere], [Orbit], [Crash]) VALUES (4, 5, 1, 1, 1, 1, 1)
GO
INSERT [Planet].[PlanetAchievementData] ([Id], [PlanetId], [Landed], [Takeoff], [Atmosphere], [Orbit], [Crash]) VALUES (5, 6, 1, 1, 1, 1, 1)
GO
INSERT [Planet].[PlanetAchievementData] ([Id], [PlanetId], [Landed], [Takeoff], [Atmosphere], [Orbit], [Crash]) VALUES (6, 7, 1, 1, 1, 1, 1)
GO
INSERT [Planet].[PlanetAchievementData] ([Id], [PlanetId], [Landed], [Takeoff], [Atmosphere], [Orbit], [Crash]) VALUES (7, 8, 1, 1, 1, 1, 1)
GO
INSERT [Planet].[PlanetAchievementData] ([Id], [PlanetId], [Landed], [Takeoff], [Atmosphere], [Orbit], [Crash]) VALUES (8, 9, 1, 1, 1, 1, 1)
GO
INSERT [Planet].[PlanetAchievementData] ([Id], [PlanetId], [Landed], [Takeoff], [Atmosphere], [Orbit], [Crash]) VALUES (9, 10, 1, 1, 1, 1, 1)
GO
INSERT [Planet].[PlanetAchievementData] ([Id], [PlanetId], [Landed], [Takeoff], [Atmosphere], [Orbit], [Crash]) VALUES (10, 11, 1, 1, 1, 1, 1)
GO
INSERT [Planet].[PlanetAchievementData] ([Id], [PlanetId], [Landed], [Takeoff], [Atmosphere], [Orbit], [Crash]) VALUES (11, 12, 1, 1, 1, 1, 1)
GO
INSERT [Planet].[PlanetAchievementData] ([Id], [PlanetId], [Landed], [Takeoff], [Atmosphere], [Orbit], [Crash]) VALUES (12, 13, 1, 1, 1, 1, 1)
GO
SET IDENTITY_INSERT [Planet].[PlanetAchievementData] OFF
GO
SET IDENTITY_INSERT [Planet].[PlanetAtmospherePhysicsData] ON 
GO
INSERT [Planet].[PlanetAtmospherePhysicsData] ([Id], [PlanetId], [Height], [Density], [Curve], [ParachuteMultiplier], [UpperAtmosphere], [ShockwaveIntensity], [MinHeatingVelocityMultiplier]) VALUES (1, 1, CAST(300000.000000000000000000 AS Decimal(36, 18)), CAST(0.005000000000000000 AS Decimal(36, 18)), CAST(10.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(0.330000000000000000 AS Decimal(36, 18)), CAST(0.660000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetAtmospherePhysicsData] ([Id], [PlanetId], [Height], [Density], [Curve], [ParachuteMultiplier], [UpperAtmosphere], [ShockwaveIntensity], [MinHeatingVelocityMultiplier]) VALUES (2, 3, CAST(40000.000000000000000000 AS Decimal(36, 18)), CAST(0.024000000000000000 AS Decimal(36, 18)), CAST(13.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(0.330000000000000000 AS Decimal(36, 18)), CAST(0.660000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetAtmospherePhysicsData] ([Id], [PlanetId], [Height], [Density], [Curve], [ParachuteMultiplier], [UpperAtmosphere], [ShockwaveIntensity], [MinHeatingVelocityMultiplier]) VALUES (3, 4, CAST(30000.000000000000000000 AS Decimal(36, 18)), CAST(0.005000000000000000 AS Decimal(36, 18)), CAST(10.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(0.330000000000000000 AS Decimal(36, 18)), CAST(0.660000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetAtmospherePhysicsData] ([Id], [PlanetId], [Height], [Density], [Curve], [ParachuteMultiplier], [UpperAtmosphere], [ShockwaveIntensity], [MinHeatingVelocityMultiplier]) VALUES (4, 6, CAST(20000.000000000000000000 AS Decimal(36, 18)), CAST(0.001000000000000000 AS Decimal(36, 18)), CAST(9.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(0.330000000000000000 AS Decimal(36, 18)), CAST(0.660000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetAtmospherePhysicsData] ([Id], [PlanetId], [Height], [Density], [Curve], [ParachuteMultiplier], [UpperAtmosphere], [ShockwaveIntensity], [MinHeatingVelocityMultiplier]) VALUES (5, 9, CAST(100000.000000000000000000 AS Decimal(36, 18)), CAST(0.025000000000000000 AS Decimal(36, 18)), CAST(15.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(0.330000000000000000 AS Decimal(36, 18)), CAST(0.660000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)))
GO
SET IDENTITY_INSERT [Planet].[PlanetAtmospherePhysicsData] OFF
GO
SET IDENTITY_INSERT [Planet].[PlanetOrbitData] ON 
GO
INSERT [Planet].[PlanetOrbitData] ([Id], [PlanetId], [ParentPlanetId], [SemiMajorAxis], [Eccentricity], [ArgumentOfPeriapsis], [Direction], [MultiplierSOI]) VALUES (1, 2, 1, CAST(1247000000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.250000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetOrbitData] ([Id], [PlanetId], [ParentPlanetId], [SemiMajorAxis], [Eccentricity], [ArgumentOfPeriapsis], [Direction], [MultiplierSOI]) VALUES (2, 3, 1, CAST(2043000000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.250000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetOrbitData] ([Id], [PlanetId], [ParentPlanetId], [SemiMajorAxis], [Eccentricity], [ArgumentOfPeriapsis], [Direction], [MultiplierSOI]) VALUES (3, 4, 1, CAST(2992000000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetOrbitData] ([Id], [PlanetId], [ParentPlanetId], [SemiMajorAxis], [Eccentricity], [ArgumentOfPeriapsis], [Direction], [MultiplierSOI]) VALUES (4, 5, 4, CAST(8770000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetOrbitData] ([Id], [PlanetId], [ParentPlanetId], [SemiMajorAxis], [Eccentricity], [ArgumentOfPeriapsis], [Direction], [MultiplierSOI]) VALUES (5, 6, 1, CAST(4558000000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(0.850000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetOrbitData] ([Id], [PlanetId], [ParentPlanetId], [SemiMajorAxis], [Eccentricity], [ArgumentOfPeriapsis], [Direction], [MultiplierSOI]) VALUES (6, 7, 6, CAST(1340000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.250000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetOrbitData] ([Id], [PlanetId], [ParentPlanetId], [SemiMajorAxis], [Eccentricity], [ArgumentOfPeriapsis], [Direction], [MultiplierSOI]) VALUES (7, 8, 6, CAST(3970000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.250000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetOrbitData] ([Id], [PlanetId], [ParentPlanetId], [SemiMajorAxis], [Eccentricity], [ArgumentOfPeriapsis], [Direction], [MultiplierSOI]) VALUES (8, 9, 1, CAST(15570000000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.300000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetOrbitData] ([Id], [PlanetId], [ParentPlanetId], [SemiMajorAxis], [Eccentricity], [ArgumentOfPeriapsis], [Direction], [MultiplierSOI]) VALUES (9, 10, 9, CAST(16868000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(2.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetOrbitData] ([Id], [PlanetId], [ParentPlanetId], [SemiMajorAxis], [Eccentricity], [ArgumentOfPeriapsis], [Direction], [MultiplierSOI]) VALUES (10, 11, 9, CAST(26836000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.500000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetOrbitData] ([Id], [PlanetId], [ParentPlanetId], [SemiMajorAxis], [Eccentricity], [ArgumentOfPeriapsis], [Direction], [MultiplierSOI]) VALUES (11, 12, 9, CAST(42816000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.250000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PlanetOrbitData] ([Id], [PlanetId], [ParentPlanetId], [SemiMajorAxis], [Eccentricity], [ArgumentOfPeriapsis], [Direction], [MultiplierSOI]) VALUES (12, 13, 9, CAST(75200000.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.250000000000000000 AS Decimal(36, 18)))
GO
SET IDENTITY_INSERT [Planet].[PlanetOrbitData] OFF
GO
SET IDENTITY_INSERT [Planet].[PostProcessingKey] ON 
GO
INSERT [Planet].[PostProcessingKey] ([Id], [Title], [Height], [ShadowIntensity], [StarIntensity], [HueShift], [Saturation], [Contrast], [Red], [Green], [Blue]) VALUES (1, N'Mercury1', CAST(10000.000000000000000000 AS Decimal(36, 18)), CAST(1.750000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.950000000000000000 AS Decimal(36, 18)), CAST(1.200000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PostProcessingKey] ([Id], [Title], [Height], [ShadowIntensity], [StarIntensity], [HueShift], [Saturation], [Contrast], [Red], [Green], [Blue]) VALUES (2, N'Mercury2', CAST(15000.000000000000000000 AS Decimal(36, 18)), CAST(1.750000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.950000000000000000 AS Decimal(36, 18)), CAST(1.200000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PostProcessingKey] ([Id], [Title], [Height], [ShadowIntensity], [StarIntensity], [HueShift], [Saturation], [Contrast], [Red], [Green], [Blue]) VALUES (3, N'Venus1', CAST(500.000000000000000000 AS Decimal(36, 18)), CAST(1.350000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(14.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.180000000000000000 AS Decimal(36, 18)), CAST(1.110000000000000000 AS Decimal(36, 18)), CAST(1.080000000000000000 AS Decimal(36, 18)), CAST(0.850000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PostProcessingKey] ([Id], [Title], [Height], [ShadowIntensity], [StarIntensity], [HueShift], [Saturation], [Contrast], [Red], [Green], [Blue]) VALUES (4, N'Venus2', CAST(40000.000000000000000000 AS Decimal(36, 18)), CAST(1.649999976158142000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.100000023841858000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PostProcessingKey] ([Id], [Title], [Height], [ShadowIntensity], [StarIntensity], [HueShift], [Saturation], [Contrast], [Red], [Green], [Blue]) VALUES (5, N'Earth1', CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.350000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.950000000000000000 AS Decimal(36, 18)), CAST(1.220000000000000000 AS Decimal(36, 18)), CAST(1.120000000000000000 AS Decimal(36, 18)), CAST(1.080000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PostProcessingKey] ([Id], [Title], [Height], [ShadowIntensity], [StarIntensity], [HueShift], [Saturation], [Contrast], [Red], [Green], [Blue]) VALUES (6, N'Earth2', CAST(25000.000000000000000000 AS Decimal(36, 18)), CAST(1.650000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.950000000000000000 AS Decimal(36, 18)), CAST(1.240000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PostProcessingKey] ([Id], [Title], [Height], [ShadowIntensity], [StarIntensity], [HueShift], [Saturation], [Contrast], [Red], [Green], [Blue]) VALUES (7, N'Mars1', CAST(3500.000000000000000000 AS Decimal(36, 18)), CAST(1.400000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(0.950000000000000000 AS Decimal(36, 18)), CAST(1.100000000000000000 AS Decimal(36, 18)), CAST(1.040000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PostProcessingKey] ([Id], [Title], [Height], [ShadowIntensity], [StarIntensity], [HueShift], [Saturation], [Contrast], [Red], [Green], [Blue]) VALUES (8, N'Mars2', CAST(20000.000000000000000000 AS Decimal(36, 18)), CAST(1.650000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.050000000000000000 AS Decimal(36, 18)), CAST(1.100000000000000000 AS Decimal(36, 18)), CAST(1.040000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PostProcessingKey] ([Id], [Title], [Height], [ShadowIntensity], [StarIntensity], [HueShift], [Saturation], [Contrast], [Red], [Green], [Blue]) VALUES (9, N'Jupiter1', CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.399999976158142000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.949999988079071000 AS Decimal(36, 18)), CAST(1.100000023841858000 AS Decimal(36, 18)), CAST(0.959999978542327900 AS Decimal(36, 18)), CAST(0.980000019073486300 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PostProcessingKey] ([Id], [Title], [Height], [ShadowIntensity], [StarIntensity], [HueShift], [Saturation], [Contrast], [Red], [Green], [Blue]) VALUES (10, N'Jupiter2', CAST(100000.000000000000000000 AS Decimal(36, 18)), CAST(1.649999976158142000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.949999988079071000 AS Decimal(36, 18)), CAST(1.100000023841858000 AS Decimal(36, 18)), CAST(0.959999978542327900 AS Decimal(36, 18)), CAST(0.980000019073486300 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PostProcessingKey] ([Id], [Title], [Height], [ShadowIntensity], [StarIntensity], [HueShift], [Saturation], [Contrast], [Red], [Green], [Blue]) VALUES (11, N'Io1', CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(1.649999976158142000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(0.949999988079071000 AS Decimal(36, 18)), CAST(1.100000023841858000 AS Decimal(36, 18)), CAST(0.959999978542327900 AS Decimal(36, 18)), CAST(0.980000019073486300 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PostProcessingKey] ([Id], [Title], [Height], [ShadowIntensity], [StarIntensity], [HueShift], [Saturation], [Contrast], [Red], [Green], [Blue]) VALUES (12, N'Europa1', CAST(500.000000000000000000 AS Decimal(36, 18)), CAST(1.399999976158142000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(5.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.049999952316284200 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)))
GO
INSERT [Planet].[PostProcessingKey] ([Id], [Title], [Height], [ShadowIntensity], [StarIntensity], [HueShift], [Saturation], [Contrast], [Red], [Green], [Blue]) VALUES (13, N'Europa2', CAST(15000.000000000000000000 AS Decimal(36, 18)), CAST(1.649999976158142000 AS Decimal(36, 18)), CAST(0.000000000000000000 AS Decimal(36, 18)), CAST(5.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.024999976158142000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)), CAST(1.000000000000000000 AS Decimal(36, 18)))
GO
SET IDENTITY_INSERT [Planet].[PostProcessingKey] OFF
GO
SET IDENTITY_INSERT [Planet].[PlanetPostProcessing] ON 
GO
INSERT [Planet].[PlanetPostProcessing] ([Id], [PlanetId], [PostProcessingKeyId]) VALUES (1, 2, 1)
GO
INSERT [Planet].[PlanetPostProcessing] ([Id], [PlanetId], [PostProcessingKeyId]) VALUES (2, 2, 2)
GO
INSERT [Planet].[PlanetPostProcessing] ([Id], [PlanetId], [PostProcessingKeyId]) VALUES (3, 3, 3)
GO
INSERT [Planet].[PlanetPostProcessing] ([Id], [PlanetId], [PostProcessingKeyId]) VALUES (4, 3, 4)
GO
INSERT [Planet].[PlanetPostProcessing] ([Id], [PlanetId], [PostProcessingKeyId]) VALUES (5, 4, 5)
GO
INSERT [Planet].[PlanetPostProcessing] ([Id], [PlanetId], [PostProcessingKeyId]) VALUES (6, 4, 6)
GO
INSERT [Planet].[PlanetPostProcessing] ([Id], [PlanetId], [PostProcessingKeyId]) VALUES (7, 6, 7)
GO
INSERT [Planet].[PlanetPostProcessing] ([Id], [PlanetId], [PostProcessingKeyId]) VALUES (8, 6, 8)
GO
INSERT [Planet].[PlanetPostProcessing] ([Id], [PlanetId], [PostProcessingKeyId]) VALUES (9, 9, 9)
GO
INSERT [Planet].[PlanetPostProcessing] ([Id], [PlanetId], [PostProcessingKeyId]) VALUES (10, 9, 10)
GO
INSERT [Planet].[PlanetPostProcessing] ([Id], [PlanetId], [PostProcessingKeyId]) VALUES (11, 10, 11)
GO
INSERT [Planet].[PlanetPostProcessing] ([Id], [PlanetId], [PostProcessingKeyId]) VALUES (12, 11, 12)
GO
INSERT [Planet].[PlanetPostProcessing] ([Id], [PlanetId], [PostProcessingKeyId]) VALUES (13, 11, 13)
GO
SET IDENTITY_INSERT [Planet].[PlanetPostProcessing] OFF
GO
SET IDENTITY_INSERT [Planet].[TerrainDataTextureFormula] ON 
GO
INSERT [Planet].[TerrainDataTextureFormula] ([Id], [TerrainDataId], [TextureFormulaId]) VALUES (1, 1, 1)
GO
INSERT [Planet].[TerrainDataTextureFormula] ([Id], [TerrainDataId], [TextureFormulaId]) VALUES (2, 1, 2)
GO
INSERT [Planet].[TerrainDataTextureFormula] ([Id], [TerrainDataId], [TextureFormulaId]) VALUES (3, 1, 2)
GO
INSERT [Planet].[TerrainDataTextureFormula] ([Id], [TerrainDataId], [TextureFormulaId]) VALUES (4, 4, 3)
GO
INSERT [Planet].[TerrainDataTextureFormula] ([Id], [TerrainDataId], [TextureFormulaId]) VALUES (5, 4, 2)
GO
INSERT [Planet].[TerrainDataTextureFormula] ([Id], [TerrainDataId], [TextureFormulaId]) VALUES (6, 4, 2)
GO
INSERT [Planet].[TerrainDataTextureFormula] ([Id], [TerrainDataId], [TextureFormulaId]) VALUES (7, 6, 4)
GO
INSERT [Planet].[TerrainDataTextureFormula] ([Id], [TerrainDataId], [TextureFormulaId]) VALUES (8, 7, 5)
GO
SET IDENTITY_INSERT [Planet].[TerrainDataTextureFormula] OFF
GO
SET IDENTITY_INSERT [Planet].[TerrainFormulaLink] ON 
GO
INSERT [Planet].[TerrainFormulaLink] ([Id], [TerrainFormulaId], [TerrainFormulaSetId], [TerrainFormulaOrder]) VALUES (1, 1, 1, 1)
GO
INSERT [Planet].[TerrainFormulaLink] ([Id], [TerrainFormulaId], [TerrainFormulaSetId], [TerrainFormulaOrder]) VALUES (2, 2, 1, 2)
GO
INSERT [Planet].[TerrainFormulaLink] ([Id], [TerrainFormulaId], [TerrainFormulaSetId], [TerrainFormulaOrder]) VALUES (3, 3, 1, 3)
GO
INSERT [Planet].[TerrainFormulaLink] ([Id], [TerrainFormulaId], [TerrainFormulaSetId], [TerrainFormulaOrder]) VALUES (4, 4, 1, 4)
GO
INSERT [Planet].[TerrainFormulaLink] ([Id], [TerrainFormulaId], [TerrainFormulaSetId], [TerrainFormulaOrder]) VALUES (5, 5, 2, 1)
GO
INSERT [Planet].[TerrainFormulaLink] ([Id], [TerrainFormulaId], [TerrainFormulaSetId], [TerrainFormulaOrder]) VALUES (6, 6, 2, 2)
GO
INSERT [Planet].[TerrainFormulaLink] ([Id], [TerrainFormulaId], [TerrainFormulaSetId], [TerrainFormulaOrder]) VALUES (7, 7, 2, 3)
GO
INSERT [Planet].[TerrainFormulaLink] ([Id], [TerrainFormulaId], [TerrainFormulaSetId], [TerrainFormulaOrder]) VALUES (8, 8, 2, 4)
GO
INSERT [Planet].[TerrainFormulaLink] ([Id], [TerrainFormulaId], [TerrainFormulaSetId], [TerrainFormulaOrder]) VALUES (9, 9, 2, 5)
GO
INSERT [Planet].[TerrainFormulaLink] ([Id], [TerrainFormulaId], [TerrainFormulaSetId], [TerrainFormulaOrder]) VALUES (10, 10, 2, 6)
GO
INSERT [Planet].[TerrainFormulaLink] ([Id], [TerrainFormulaId], [TerrainFormulaSetId], [TerrainFormulaOrder]) VALUES (11, 11, 2, 7)
GO
INSERT [Planet].[TerrainFormulaLink] ([Id], [TerrainFormulaId], [TerrainFormulaSetId], [TerrainFormulaOrder]) VALUES (12, 12, 2, 8)
GO
INSERT [Planet].[TerrainFormulaLink] ([Id], [TerrainFormulaId], [TerrainFormulaSetId], [TerrainFormulaOrder]) VALUES (13, 13, 3, 1)
GO
INSERT [Planet].[TerrainFormulaLink] ([Id], [TerrainFormulaId], [TerrainFormulaSetId], [TerrainFormulaOrder]) VALUES (14, 14, 3, 2)
GO
INSERT [Planet].[TerrainFormulaLink] ([Id], [TerrainFormulaId], [TerrainFormulaSetId], [TerrainFormulaOrder]) VALUES (15, 15, 3, 3)
GO
SET IDENTITY_INSERT [Planet].[TerrainFormulaLink] OFF
GO
