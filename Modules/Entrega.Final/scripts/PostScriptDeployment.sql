IF OBJECT_ID(N'[Entrega.Final].[dbo].[Ciudades]', N'U') IS NOT NULL
BEGIN
    DECLARE @Ciudades AS TABLE (
        [CiudadID]	[INT]			NOT NULL
        ,[Nombre]	[NVARCHAR](MAX)	NULL
    );

    INSERT @Ciudades VALUES (1, N'Barros Blancos');
    INSERT @Ciudades VALUES (2, N'Bella Unión');
    INSERT @Ciudades VALUES (3, N'Lagomar');
    INSERT @Ciudades VALUES (4, N'Las Piedras');
    INSERT @Ciudades VALUES (5, N'Libertad');
    INSERT @Ciudades VALUES (6, N'Mercedes');
    INSERT @Ciudades VALUES (7, N'Montevideo');
    INSERT @Ciudades VALUES (8, N'Paysandu');
    INSERT @Ciudades VALUES (9, N'Salto');
    INSERT @Ciudades VALUES (10, N'San Jose de Carrasco');
    INSERT @Ciudades VALUES (11, N'San Jose de Mayo');
    INSERT @Ciudades VALUES (12, N'Nueva Palmira');

    SET IDENTITY_INSERT [Entrega.Final].[dbo].[Ciudades] ON;
    MERGE INTO [Entrega.Final].[dbo].[Ciudades] AS [TARGET]
    USING @Ciudades AS [SOURCE]
    ON [TARGET].[CiudadID] = [SOURCE].[CiudadID]
    WHEN MATCHED THEN
        UPDATE SET
            [TARGET].[Nombre] = [SOURCE].[Nombre]
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([CiudadID], [Nombre])
        VALUES ([SOURCE].[CiudadID], [SOURCE].[Nombre]);
    SET IDENTITY_INSERT [Entrega.Final].[dbo].[Ciudades] OFF;
END;