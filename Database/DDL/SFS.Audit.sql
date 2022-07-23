USE [SFS]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_TextureSize_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_TextureSize_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_TextureFormula_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_TextureFormula_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_Texture_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_Texture_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_TerrainTextureData_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_TerrainTextureData_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_TerrainFormulaSet_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_TerrainFormulaSet_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_TerrainFormulaLink_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_TerrainFormulaLink_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_TerrainFormula_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_TerrainFormula_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_TerrainDataTextureFormula_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_TerrainDataTextureFormula_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_TerrainDataFormulaDifficulty_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_TerrainDataFormulaDifficulty_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_TerrainDataFlatZone_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_TerrainDataFlatZone_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_TerrainData_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_TerrainData_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_PostProcessingKey_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_PostProcessingKey_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_PlanetPostProcessing_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_PlanetPostProcessing_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_PlanetOrbitData_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_PlanetOrbitData_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_PlanetLandmark_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_PlanetLandmark_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_PlanetBaseData_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_PlanetBaseData_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_PlanetAtmosphereVisualsData_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_PlanetAtmosphereVisualsData_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_PlanetAtmospherePhysicsData_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_PlanetAtmospherePhysicsData_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_PlanetAchievementData_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_PlanetAchievementData_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_Planet_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_Planet_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_Modifier_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_Modifier_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_Landmark_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_Landmark_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_Heightmap_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_Heightmap_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_Gradient_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_Gradient_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_FogKeySet_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_FogKeySet_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_FogKeyLink_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_FogKeyLink_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_FogKey_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_FogKey_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_FlatZone_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_FlatZone_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_Difficulty_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_Difficulty_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_Colour_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_Colour_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TU_Clouds_AFTER]
GO
DROP TRIGGER IF EXISTS [Planet].[TD_Clouds_AFTER]
GO
DROP TABLE IF EXISTS [Audit].[Log]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Audit].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TriggerDate] [datetime2](7) NOT NULL,
	[SourceContext] [nvarchar](100) NOT NULL,
	[Operation] [nvarchar](16) NOT NULL,
	[DatabaseName] [nvarchar](64) NOT NULL,
	[SchemaName] [nvarchar](64) NOT NULL,
	[TableName] [nvarchar](64) NOT NULL,
	[TableId] [int] NOT NULL,
	[LogData] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE     TRIGGER [Planet].[TD_Clouds_AFTER] ON [Planet].[Clouds] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'Clouds';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[Clouds] ENABLE TRIGGER [TD_Clouds_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     TRIGGER [Planet].[TU_Clouds_AFTER] ON [Planet].[Clouds] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'Clouds';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[Clouds] ENABLE TRIGGER [TU_Clouds_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   TRIGGER [Planet].[TD_Colour_AFTER] ON [Planet].[Colour] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'Colour';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[Colour] ENABLE TRIGGER [TD_Colour_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [Planet].[TU_Colour_AFTER] ON [Planet].[Colour] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'Colour';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[Colour] ENABLE TRIGGER [TU_Colour_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       TRIGGER [Planet].[TD_Difficulty_AFTER] ON [Planet].[Difficulty] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'Difficulty';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[Difficulty] ENABLE TRIGGER [TD_Difficulty_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       TRIGGER [Planet].[TU_Difficulty_AFTER] ON [Planet].[Difficulty] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'Difficulty';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[Difficulty] ENABLE TRIGGER [TU_Difficulty_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       TRIGGER [Planet].[TD_FlatZone_AFTER] ON [Planet].[FlatZone] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'FlatZone';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[FlatZone] ENABLE TRIGGER [TD_FlatZone_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       TRIGGER [Planet].[TU_FlatZone_AFTER] ON [Planet].[FlatZone] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'FlatZone';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[FlatZone] ENABLE TRIGGER [TU_FlatZone_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     TRIGGER [Planet].[TD_FogKey_AFTER] ON [Planet].[FogKey] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'FogKey';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[FogKey] ENABLE TRIGGER [TD_FogKey_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     TRIGGER [Planet].[TU_FogKey_AFTER] ON [Planet].[FogKey] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'FogKey';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[FogKey] ENABLE TRIGGER [TU_FogKey_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       TRIGGER [Planet].[TD_FogKeyLink_AFTER] ON [Planet].[FogKeyLink] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'FogKeyLink';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[FogKeyLink] ENABLE TRIGGER [TD_FogKeyLink_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       TRIGGER [Planet].[TU_FogKeyLink_AFTER] ON [Planet].[FogKeyLink] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'FogKeyLink';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[FogKeyLink] ENABLE TRIGGER [TU_FogKeyLink_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       TRIGGER [Planet].[TD_FogKeySet_AFTER] ON [Planet].[FogKeySet] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'FogKeySet';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[FogKeySet] ENABLE TRIGGER [TD_FogKeySet_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       TRIGGER [Planet].[TU_FogKeySet_AFTER] ON [Planet].[FogKeySet] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'FogKeySet';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[FogKeySet] ENABLE TRIGGER [TU_FogKeySet_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     TRIGGER [Planet].[TD_Gradient_AFTER] ON [Planet].[Gradient] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'Gradient';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[Gradient] ENABLE TRIGGER [TD_Gradient_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     TRIGGER [Planet].[TU_Gradient_AFTER] ON [Planet].[Gradient] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'Gradient';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[Gradient] ENABLE TRIGGER [TU_Gradient_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       TRIGGER [Planet].[TD_Heightmap_AFTER] ON [Planet].[Heightmap] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'Heightmap';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[Heightmap] ENABLE TRIGGER [TD_Heightmap_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       TRIGGER [Planet].[TU_Heightmap_AFTER] ON [Planet].[Heightmap] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'Heightmap';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[Heightmap] ENABLE TRIGGER [TU_Heightmap_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       TRIGGER [Planet].[TD_Landmark_AFTER] ON [Planet].[Landmark] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'Landmark';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[Landmark] ENABLE TRIGGER [TD_Landmark_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       TRIGGER [Planet].[TU_Landmark_AFTER] ON [Planet].[Landmark] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'Landmark';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[Landmark] ENABLE TRIGGER [TU_Landmark_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       TRIGGER [Planet].[TD_Modifier_AFTER] ON [Planet].[Modifier] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'Modifier';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[Modifier] ENABLE TRIGGER [TD_Modifier_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       TRIGGER [Planet].[TU_Modifier_AFTER] ON [Planet].[Modifier] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'Modifier';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[Modifier] ENABLE TRIGGER [TU_Modifier_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   TRIGGER [Planet].[TD_Planet_AFTER] ON [Planet].[Planet] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'Planet';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[Planet] ENABLE TRIGGER [TD_Planet_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   TRIGGER [Planet].[TU_Planet_AFTER] ON [Planet].[Planet] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'Planet';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[Planet] ENABLE TRIGGER [TU_Planet_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       TRIGGER [Planet].[TD_PlanetAchievementData_AFTER] ON [Planet].[PlanetAchievementData] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'PlanetAchievementData';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[PlanetAchievementData] ENABLE TRIGGER [TD_PlanetAchievementData_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       TRIGGER [Planet].[TU_PlanetAchievementData_AFTER] ON [Planet].[PlanetAchievementData] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'PlanetAchievementData';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[PlanetAchievementData] ENABLE TRIGGER [TU_PlanetAchievementData_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     TRIGGER [Planet].[TD_PlanetAtmospherePhysicsData_AFTER] ON [Planet].[PlanetAtmospherePhysicsData] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'PlanetAtmospherePhysicsData';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[PlanetAtmospherePhysicsData] ENABLE TRIGGER [TD_PlanetAtmospherePhysicsData_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     TRIGGER [Planet].[TU_PlanetAtmospherePhysicsData_AFTER] ON [Planet].[PlanetAtmospherePhysicsData] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'PlanetAtmospherePhysicsData';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[PlanetAtmospherePhysicsData] ENABLE TRIGGER [TU_PlanetAtmospherePhysicsData_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       TRIGGER [Planet].[TD_PlanetAtmosphereVisualsData_AFTER] ON [Planet].[PlanetAtmosphereVisualsData] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'PlanetAtmosphereVisualsData';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[PlanetAtmosphereVisualsData] ENABLE TRIGGER [TD_PlanetAtmosphereVisualsData_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       TRIGGER [Planet].[TU_PlanetAtmosphereVisualsData_AFTER] ON [Planet].[PlanetAtmosphereVisualsData] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'PlanetAtmosphereVisualsData';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[PlanetAtmosphereVisualsData] ENABLE TRIGGER [TU_PlanetAtmosphereVisualsData_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   TRIGGER [Planet].[TD_PlanetBaseData_AFTER] ON [Planet].[PlanetBaseData] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'PlanetBaseData';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[PlanetBaseData] ENABLE TRIGGER [TD_PlanetBaseData_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [Planet].[TU_PlanetBaseData_AFTER] ON [Planet].[PlanetBaseData] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'PlanetBaseData';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[PlanetBaseData] ENABLE TRIGGER [TU_PlanetBaseData_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       TRIGGER [Planet].[TD_PlanetLandmark_AFTER] ON [Planet].[PlanetLandmark] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'PlanetLandmark';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[PlanetLandmark] ENABLE TRIGGER [TD_PlanetLandmark_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       TRIGGER [Planet].[TU_PlanetLandmark_AFTER] ON [Planet].[PlanetLandmark] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'PlanetLandmark';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[PlanetLandmark] ENABLE TRIGGER [TU_PlanetLandmark_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       TRIGGER [Planet].[TD_PlanetOrbitData_AFTER] ON [Planet].[PlanetOrbitData] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'PlanetOrbitData';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[PlanetOrbitData] ENABLE TRIGGER [TD_PlanetOrbitData_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       TRIGGER [Planet].[TU_PlanetOrbitData_AFTER] ON [Planet].[PlanetOrbitData] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'PlanetOrbitData';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[PlanetOrbitData] ENABLE TRIGGER [TU_PlanetOrbitData_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       TRIGGER [Planet].[TD_PlanetPostProcessing_AFTER] ON [Planet].[PlanetPostProcessing] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'PlanetPostProcessing';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[PlanetPostProcessing] ENABLE TRIGGER [TD_PlanetPostProcessing_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       TRIGGER [Planet].[TU_PlanetPostProcessing_AFTER] ON [Planet].[PlanetPostProcessing] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'PlanetPostProcessing';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[PlanetPostProcessing] ENABLE TRIGGER [TU_PlanetPostProcessing_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       TRIGGER [Planet].[TD_PostProcessingKey_AFTER] ON [Planet].[PostProcessingKey] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'PostProcessingKey';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[PostProcessingKey] ENABLE TRIGGER [TD_PostProcessingKey_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       TRIGGER [Planet].[TU_PostProcessingKey_AFTER] ON [Planet].[PostProcessingKey] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'PostProcessingKey';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[PostProcessingKey] ENABLE TRIGGER [TU_PostProcessingKey_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       TRIGGER [Planet].[TD_TerrainData_AFTER] ON [Planet].[TerrainData] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'TerrainData';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[TerrainData] ENABLE TRIGGER [TD_TerrainData_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       TRIGGER [Planet].[TU_TerrainData_AFTER] ON [Planet].[TerrainData] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'TerrainData';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[TerrainData] ENABLE TRIGGER [TU_TerrainData_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       TRIGGER [Planet].[TD_TerrainDataFlatZone_AFTER] ON [Planet].[TerrainDataFlatZone] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'TerrainDataFlatZone';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[TerrainDataFlatZone] ENABLE TRIGGER [TD_TerrainDataFlatZone_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       TRIGGER [Planet].[TU_TerrainDataFlatZone_AFTER] ON [Planet].[TerrainDataFlatZone] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'TerrainDataFlatZone';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[TerrainDataFlatZone] ENABLE TRIGGER [TU_TerrainDataFlatZone_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       TRIGGER [Planet].[TD_TerrainDataFormulaDifficulty_AFTER] ON [Planet].[TerrainDataFormulaDifficulty] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'TerrainDataFormulaDifficulty';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[TerrainDataFormulaDifficulty] ENABLE TRIGGER [TD_TerrainDataFormulaDifficulty_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       TRIGGER [Planet].[TU_TerrainDataFormulaDifficulty_AFTER] ON [Planet].[TerrainDataFormulaDifficulty] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'TerrainDataFormulaDifficulty';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[TerrainDataFormulaDifficulty] ENABLE TRIGGER [TU_TerrainDataFormulaDifficulty_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     TRIGGER [Planet].[TD_TerrainDataTextureFormula_AFTER] ON [Planet].[TerrainDataTextureFormula] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'TerrainDataTextureFormula';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[TerrainDataTextureFormula] ENABLE TRIGGER [TD_TerrainDataTextureFormula_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     TRIGGER [Planet].[TU_TerrainDataTextureFormula_AFTER] ON [Planet].[TerrainDataTextureFormula] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'TerrainDataTextureFormula';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[TerrainDataTextureFormula] ENABLE TRIGGER [TU_TerrainDataTextureFormula_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       TRIGGER [Planet].[TD_TerrainFormula_AFTER] ON [Planet].[TerrainFormula] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'TerrainFormula';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[TerrainFormula] ENABLE TRIGGER [TD_TerrainFormula_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       TRIGGER [Planet].[TU_TerrainFormula_AFTER] ON [Planet].[TerrainFormula] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'TerrainFormula';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[TerrainFormula] ENABLE TRIGGER [TU_TerrainFormula_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       TRIGGER [Planet].[TD_TerrainFormulaLink_AFTER] ON [Planet].[TerrainFormulaLink] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'TerrainFormulaLink';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[TerrainFormulaLink] ENABLE TRIGGER [TD_TerrainFormulaLink_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       TRIGGER [Planet].[TU_TerrainFormulaLink_AFTER] ON [Planet].[TerrainFormulaLink] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'TerrainFormulaLink';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[TerrainFormulaLink] ENABLE TRIGGER [TU_TerrainFormulaLink_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       TRIGGER [Planet].[TD_TerrainFormulaSet_AFTER] ON [Planet].[TerrainFormulaSet] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'TerrainFormulaSet';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[TerrainFormulaSet] ENABLE TRIGGER [TD_TerrainFormulaSet_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       TRIGGER [Planet].[TU_TerrainFormulaSet_AFTER] ON [Planet].[TerrainFormulaSet] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'TerrainFormulaSet';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[TerrainFormulaSet] ENABLE TRIGGER [TU_TerrainFormulaSet_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       TRIGGER [Planet].[TD_TerrainTextureData_AFTER] ON [Planet].[TerrainTextureData] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'TerrainTextureData';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[TerrainTextureData] ENABLE TRIGGER [TD_TerrainTextureData_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       TRIGGER [Planet].[TU_TerrainTextureData_AFTER] ON [Planet].[TerrainTextureData] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'TerrainTextureData';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[TerrainTextureData] ENABLE TRIGGER [TU_TerrainTextureData_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       TRIGGER [Planet].[TD_Texture_AFTER] ON [Planet].[Texture] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'Texture';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[Texture] ENABLE TRIGGER [TD_Texture_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       TRIGGER [Planet].[TU_Texture_AFTER] ON [Planet].[Texture] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'Texture';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[Texture] ENABLE TRIGGER [TU_Texture_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     TRIGGER [Planet].[TD_TextureFormula_AFTER] ON [Planet].[TextureFormula] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'TextureFormula';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[TextureFormula] ENABLE TRIGGER [TD_TextureFormula_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     TRIGGER [Planet].[TU_TextureFormula_AFTER] ON [Planet].[TextureFormula] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'TextureFormula';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[TextureFormula] ENABLE TRIGGER [TU_TextureFormula_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       TRIGGER [Planet].[TD_TextureSize_AFTER] ON [Planet].[TextureSize] AFTER DELETE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'DELETE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'TextureSize';

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, D1.Id, D2.LogData
    FROM deleted AS D1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM deleted
                WHERE deleted.Id = D1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS D2
END;
GO
ALTER TABLE [Planet].[TextureSize] ENABLE TRIGGER [TD_TextureSize_AFTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       TRIGGER [Planet].[TU_TextureSize_AFTER] ON [Planet].[TextureSize] AFTER UPDATE AS
BEGIN
    IF (ROWCOUNT_BIG() = 0)
        RETURN;
    
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM deleted)
        RETURN;
    
    DECLARE @operationType nvarchar(16) = 'UPDATE';
    DECLARE @databaseName nvarchar(64) = 'SFS';
    DECLARE @schemaName nvarchar(64) = 'Planet';
    DECLARE @tableName nvarchar(64) = 'TextureSize';

    SELECT * INTO #ModifiedData FROM (
        SELECT * FROM deleted
        EXCEPT
        SELECT * FROM inserted
    ) AS ModifiedData;

    INSERT INTO AuditLog (TriggerDate, SourceContext, Operation, DatabaseName, SchemaName, TableName, TableId, LogData)
    SELECT SYSDATETIME(), SYSTEM_USER, @operationType, @databaseName, @schemaName, @tableName, M1.Id, M2.LogData
    FROM #ModifiedData AS M1
        CROSS APPLY (
            SELECT LogData = (
                SELECT *
                FROM #ModifiedData
                WHERE #ModifiedData.Id = M1.Id
                FOR JSON PATH,
                INCLUDE_NULL_VALUES,
                WITHOUT_ARRAY_WRAPPER
            )
        ) AS M2
END;
GO
ALTER TABLE [Planet].[TextureSize] ENABLE TRIGGER [TU_TextureSize_AFTER]
GO