SET NOCOUNT ON;

IF OBJECT_ID('[03.Entrega].[dbo].[Registros]', 'U') IS NOT NULL
BEGIN
    ALTER TABLE [03.Entrega].[dbo].[Registros] DROP CONSTRAINT IF EXISTS [FK_Registos_Empresas];
    ALTER TABLE [03.Entrega].[dbo].[Registros] DROP CONSTRAINT IF EXISTS [FK_Registos_Ciudades];
    ALTER TABLE [03.Entrega].[dbo].[Registros] DROP CONSTRAINT IF EXISTS [FK_Registos_Departamentos];
    ALTER TABLE [03.Entrega].[dbo].[Registros] DROP CONSTRAINT IF EXISTS [FK_Registos_PaisesOrigen];
    ALTER TABLE [03.Entrega].[dbo].[Registros] DROP CONSTRAINT IF EXISTS [FK_Registos_PaisesProcedencia];
    ALTER TABLE [03.Entrega].[dbo].[Registros] DROP CONSTRAINT IF EXISTS [FK_Registros_DescripcionesComerciales];
    ALTER TABLE [03.Entrega].[dbo].[Registros] DROP CONSTRAINT IF EXISTS [FK_Registros_Regimenes];
    ALTER TABLE [03.Entrega].[dbo].[Registros] DROP CONSTRAINT IF EXISTS [FK_Registos_UnidadesFisicas];

    SET IDENTITY_INSERT [03.Entrega].[dbo].[Registros] OFF;
END;
GO

IF OBJECT_ID(N'[03.Entrega].[dbo].[Ciudades]', N'U') IS NOT NULL
BEGIN
    DECLARE @Ciudades AS TABLE (
        [CiudadID]	[INT]			NOT NULL
        ,[Nombre]	[NVARCHAR](MAX)	NULL
    );

    INSERT @Ciudades VALUES (1, N'Barros Blancos');
    INSERT @Ciudades VALUES (2, N'Bella Unión');
    INSERT @Ciudades VALUES (3, N'Lmar');
    INSERT @Ciudades VALUES (4, N'Las Piedras');
    INSERT @Ciudades VALUES (5, N'Libertad');
    INSERT @Ciudades VALUES (6, N'Mercedes');
    INSERT @Ciudades VALUES (7, N'Montevideo');
    INSERT @Ciudades VALUES (8, N'Paysandu');
    INSERT @Ciudades VALUES (9, N'Salto');
    INSERT @Ciudades VALUES (10, N'San Jose de Carrasco');
    INSERT @Ciudades VALUES (11, N'San Jose de Mayo');
    INSERT @Ciudades VALUES (12, N'Nueva Palmira');

    SET IDENTITY_INSERT [03.Entrega].[dbo].[Ciudades] ON;

    MERGE INTO [03.Entrega].[dbo].[Ciudades] AS [TARGET]
    USING @Ciudades AS [SOURCE]
    ON [TARGET].[CiudadID] = [SOURCE].[CiudadID]
    WHEN MATCHED THEN
        UPDATE SET
            [TARGET].[Nombre] = [SOURCE].[Nombre]
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([CiudadID], [Nombre])
        VALUES ([SOURCE].[CiudadID], [SOURCE].[Nombre]);

    SET IDENTITY_INSERT [03.Entrega].[dbo].[Ciudades] OFF;
END;
GO

IF OBJECT_ID(N'[03.Entrega].[dbo].[Departamentos]', N'U') IS NOT NULL
BEGIN
    DECLARE @Departamentos AS TABLE (
        [DepartamentoID]	[INT]			NOT NULL
        ,[Nombre]			[NVARCHAR](MAX)	NULL
    );

    INSERT @Departamentos VALUES (1, N'Artigas');
    INSERT @Departamentos VALUES (2, N'Canelones');
    INSERT @Departamentos VALUES (3, N'Montevideo');
    INSERT @Departamentos VALUES (4, N'Paysandu');
    INSERT @Departamentos VALUES (5, N'Salto');
    INSERT @Departamentos VALUES (6, N'San Jose');
    INSERT @Departamentos VALUES (7, N'San José');
    INSERT @Departamentos VALUES (8, N'Sin Registrar');
    INSERT @Departamentos VALUES (9, N'Soriano');

    SET IDENTITY_INSERT [03.Entrega].[dbo].[Departamentos] ON;

    MERGE INTO [03.Entrega].[dbo].[Departamentos] AS [TARGET]
    USING @Departamentos AS [SOURCE]
    ON [TARGET].[DepartamentoID] = [SOURCE].[DepartamentoID]
    WHEN MATCHED THEN
        UPDATE SET
            [TARGET].[Nombre] = [SOURCE].[Nombre]
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([DepartamentoID], [Nombre])
        VALUES ([SOURCE].[DepartamentoID], [SOURCE].[Nombre]);

    SET IDENTITY_INSERT [03.Entrega].[dbo].[Departamentos] OFF;
END;
GO

IF OBJECT_ID(N'[03.Entrega].[dbo].[DescripcionesComerciales]', N'U') IS NOT NULL
BEGIN
    DECLARE @DescripcionesComerciales AS TABLE (
        [DescripcionComercialID]	[INT]			NOT NULL
        ,[Nombre]				    [NVARCHAR](MAX)	NULL
    );

    INSERT @DescripcionesComerciales VALUES (1, N'DDDESC_COMER');
    INSERT @DescripcionesComerciales VALUES (2, N'102 NEUMATICOS PARA CAMIONES IT.1,2 S/DET.FAC.');
    INSERT @DescripcionesComerciales VALUES (3, N'250 UN. NEUMATICOS PARA CAMION IT.7,8 S/DET.FAC.');
    INSERT @DescripcionesComerciales VALUES (4, N'CAUCHO Y SUS MANUFACTURAS.|DE MEDIDA 11,00-24');
    INSERT @DescripcionesComerciales VALUES (5, N'CAUCHO Y SUS MANUFACTURAS.|LOS DEMÁS');
    INSERT @DescripcionesComerciales VALUES (6, N'CUBIERTAS 240 UNIDS COMERCIALES');
    INSERT @DescripcionesComerciales VALUES (7, N'CUBIERTAS 245 UNIDS COMERCIALES');
    INSERT @DescripcionesComerciales VALUES (8, N'CUBIERTAS 249 UNIDS COMERCIALES');
    INSERT @DescripcionesComerciales VALUES (9, N'CUBIERTAS 250 UNIDS COMERCIALES');
    INSERT @DescripcionesComerciales VALUES (10, N'CUBIERTAS 254 UNIDS COMERCIALES');
    INSERT @DescripcionesComerciales VALUES (11, N'CUBIERTAS 275 UNIDS COMERCIALES');
    INSERT @DescripcionesComerciales VALUES (12, N'CUBIERTAS 500 UNIDS COMERCIALES');
    INSERT @DescripcionesComerciales VALUES (13, N'CUBIERTAS DE CAMION CON CAMARA Y PROTECTOR. 303 UNIDADES.ITEM 1-75UNIDADES.ITEM 2-55 UNID.');
    INSERT @DescripcionesComerciales VALUES (14, N'CUBIERTAS DE CAMION CON CAMARA YP ROTECTOR 73 UNIDADES ITEM 1/3.CUBIERTAS DE CAMION 57 UNI');
    INSERT @DescripcionesComerciales VALUES (15, N'CUBIERTAS DE CAMION CON CAMARAS Y PROTECTOR. ITEM 2 -20 UNIDADES.ITEM 3 - 69 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (16, N'CUBIERTAS DE CAMION. 108 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (17, N'CUBIERTAS P/CAMION.- 240 UNID.-');
    INSERT @DescripcionesComerciales VALUES (18, N'CUBIERTAS P/CAMION.- 246 UNID.-');
    INSERT @DescripcionesComerciales VALUES (19, N'CUBIERTAS P/CAMION.- 250 UNID.-');
    INSERT @DescripcionesComerciales VALUES (20, N'CUBIERTAS P/CAMION.- 251 UNID.-');
    INSERT @DescripcionesComerciales VALUES (21, N'CUBIERTAS P/CAMION.- 252 UNID.-');
    INSERT @DescripcionesComerciales VALUES (22, N'CUBIERTAS P/CAMION.- 254 UNID.-');
    INSERT @DescripcionesComerciales VALUES (23, N'CUBIERTAS P/CAMION.- 256 UNID.-');
    INSERT @DescripcionesComerciales VALUES (24, N'CUBIERTAS P/CAMION.- 260 UNID.-');
    INSERT @DescripcionesComerciales VALUES (25, N'CUBIERTAS P/CAMION.- 262 UNID.-');
    INSERT @DescripcionesComerciales VALUES (26, N'CUBIERTAS P/CAMION.- 264 UNID.-');
    INSERT @DescripcionesComerciales VALUES (27, N'CUBIERTAS P/CAMION.- 279 UNID.-');
    INSERT @DescripcionesComerciales VALUES (28, N'CUBIERTAS P/CAMION.- 280 UNID.-');
    INSERT @DescripcionesComerciales VALUES (29, N'CUBIERTAS, 185 UNIDADES COMERCIALES');
    INSERT @DescripcionesComerciales VALUES (30, N'CUBIERTAS, 279 UNIDADES COMERCIALES');
    INSERT @DescripcionesComerciales VALUES (31, N'CUBIERTAS, 55 UNIDADES COMERCIALES');
    INSERT @DescripcionesComerciales VALUES (32, N'IT.1,5: NEUMATICOS 102 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (33, N'IT.1/2: NEUMATICOS 228 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (34, N'IT.1/2: NEUMATICOS 231 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (35, N'IT.1/2: NEUMATICOS 310 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (36, N'IT.1/3,5: NEUMATICOS 257 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (37, N'IT.1/3,6: NEUMATICOS 204 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (38, N'IT.1/3: NEUMATICOS 171 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (39, N'IT.1/3: NEUMATICOS 180 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (40, N'IT.1/3: NEUMATICOS 228 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (41, N'IT.1/3: NEUMATICOS 273 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (42, N'IT.1/4,8/10: NEUMATICOS 168 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (43, N'IT.1/5,10: NEUMATICOS 218 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (44, N'IT.1: NEUMATICOS 150 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (45, N'IT.1: NEUMATICOS 2 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (46, N'IT.1: NEUMATICOS 228 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (47, N'IT.11: NEUMATICOS 92 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (48, N'IT.12/13: NEUMATICOS 34 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (49, N'IT.16/21: NEUMATICOS 110 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (50, N'IT.16: NEUMATICOS 4 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (51, N'IT.18/20: NEUMATICOS 69 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (52, N'IT.18/22: NEUMATICOS 103 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (53, N'IT.19: NEUMATICOS 8 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (54, N'IT.2/3: NEUMATICOS 184 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (55, N'IT.22/25: NEUMATICOS 88 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (56, N'IT.22: NEUMATICOS 56 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (57, N'IT.23: NEUMATICOS 36 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (58, N'IT.24/25: NEUMATICOS 23 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (59, N'IT.24: NEUMATICOS 4 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (60, N'IT.3: NEUMATICOS 88 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (61, N'IT.31/34: NEUMATICOS 28 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (62, N'IT.32/35: NEUMATICOS 32 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (63, N'IT.37/38: MEUMATICOS 18 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (64, N'IT.4/5: NEUMATICOS 192 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (65, N'IT.4: NEUMATICOS 60 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (66, N'IT.5: NEUMATICOS 80 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (67, N'IT.7: NEUMATICOS 100 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (68, N'IT.7: NEUMATICOS 8 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (69, N'IT.8/10: NEUMATICOS 136 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (70, N'JINYU 275/80 R22.5 JD 880');
    INSERT @DescripcionesComerciales VALUES (71, N'JINYU 275/80 R22.5 JF609');
    INSERT @DescripcionesComerciales VALUES (72, N'JYNJU 295/80 R22.5 JD758');
    INSERT @DescripcionesComerciales VALUES (73, N'JYNJU 295/80 R22.5 JF568');
    INSERT @DescripcionesComerciales VALUES (74, N'JYNJU 295/80 R22.5 JF568 - IT:1');
    INSERT @DescripcionesComerciales VALUES (75, N'NAUMATICOS');
    INSERT @DescripcionesComerciales VALUES (76, N'NAUMATICOS PARA CAMIONES - 203 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (77, N'NEUAMTICOS FACT 300053629 IT 29,10,17,22,25,26,27');
    INSERT @DescripcionesComerciales VALUES (78, N'NEUMAITCOS PARA CAMION 250 UNID');
    INSERT @DescripcionesComerciales VALUES (79, N'NEUMAITCOS PARA CAMION 256 UNID');
    INSERT @DescripcionesComerciales VALUES (80, N'NEUMATCOS. ITEMS 1/2. - 252 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (81, N'NEUMATICO - 1 UNIDAD (C/U) (Item 5 Factura 2019UGC1015)');
    INSERT @DescripcionesComerciales VALUES (82, N'NEUMATICO PARA CAMION - 1.024 UNID.');
    INSERT @DescripcionesComerciales VALUES (83, N'NEUMATICO PARA CAMION - 1.191 UNID.');
    INSERT @DescripcionesComerciales VALUES (84, N'NEUMATICO PARA CAMION - 158 UNID.');
    INSERT @DescripcionesComerciales VALUES (85, N'NEUMATICO PARA CAMION - 187 UNID.');
    INSERT @DescripcionesComerciales VALUES (86, N'NEUMATICO PARA CAMION - 20 UNID.');
    INSERT @DescripcionesComerciales VALUES (87, N'NEUMATICO PARA CAMION - 240 UNID.');
    INSERT @DescripcionesComerciales VALUES (88, N'NEUMATICO PARA CAMION - 248 UNID.');
    INSERT @DescripcionesComerciales VALUES (89, N'NEUMATICO PARA CAMION - 32 UNID.');
    INSERT @DescripcionesComerciales VALUES (90, N'NEUMATICO PARA CAMION - 38 UNID.');
    INSERT @DescripcionesComerciales VALUES (91, N'NEUMATICO PARA CAMION - 66 UNID.');
    INSERT @DescripcionesComerciales VALUES (92, N'NEUMATICO PARA CAMION - 68 UNID.');
    INSERT @DescripcionesComerciales VALUES (93, N'NEUMATICO PARA CAMION - 76 UNID.');
    INSERT @DescripcionesComerciales VALUES (94, N'NEUMATICO PARA CAMION - 80 UNID.');
    INSERT @DescripcionesComerciales VALUES (95, N'NEUMATICO PARA CAMION - 81 UNID. (TUBOS Y FLAPS IT 1-20 UNID - IT.2 60 UNID.)');
    INSERT @DescripcionesComerciales VALUES (96, N'NEUMATICO PARA CAMION - 82 UNID.');
    INSERT @DescripcionesComerciales VALUES (97, N'NEUMATICO PARA CAMION - 88 UNID.');
    INSERT @DescripcionesComerciales VALUES (98, N'NEUMATICO PARA CAMIONES,- 135 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (99, N'NEUMATICO PARA CAMIONES,- 2423 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (100, N'NEUMATICOS');
    INSERT @DescripcionesComerciales VALUES (101, N'neumáticos');
    INSERT @DescripcionesComerciales VALUES (102, N'NEUMATICOS - 1158 UNID.ITEM 1/8.');
    INSERT @DescripcionesComerciales VALUES (103, N'NEUMATICOS - 118 UNIDAD (C/U) (Item 16/19 Factura 6000205218)');
    INSERT @DescripcionesComerciales VALUES (104, N'NEUMATICOS - 120 UNIDAD (C/U) (Item 1/2 Factura 6254434292)');
    INSERT @DescripcionesComerciales VALUES (105, N'NEUMATICOS - 1280 UNID.ITEM 1/6.FAC:18HFROL004-PCR.');
    INSERT @DescripcionesComerciales VALUES (106, N'NEUMATICOS - 130 UNIDAD (C/U) (Item 2 Factura 6254457883)');
    INSERT @DescripcionesComerciales VALUES (107, N'NEUMATICOS - 140 UNID.ITEM 8.');
    INSERT @DescripcionesComerciales VALUES (108, N'NEUMATICOS - 150 UNIDAD (C/U) (Item 3 Factura 6254413387)');
    INSERT @DescripcionesComerciales VALUES (109, N'NEUMATICOS - 166 UNIDAD (C/U) (Item 1,3 Factura 6254457883)');
    INSERT @DescripcionesComerciales VALUES (110, N'NEUMATICOS - 182 UNIDAD (C/U) (Item 1,6/7 Factura 6254428741)');
    INSERT @DescripcionesComerciales VALUES (111, N'NEUMATICOS - 20 UNID.ITEM 2-21.');
    INSERT @DescripcionesComerciales VALUES (112, N'NEUMATICOS - 204 UNIDAD (C/U) (Item 1/2 Factura 6254361799)');
    INSERT @DescripcionesComerciales VALUES (113, N'NEUMATICOS - 218 UNID.ITEM 1.');
    INSERT @DescripcionesComerciales VALUES (114, N'NEUMATICOS - 218 UNIDAD (C/U) (Item 2/5 Factura 6254441287)');
    INSERT @DescripcionesComerciales VALUES (115, N'NEUMATICOS - 220 (Item 1/3 Factura 6254388474)');
    INSERT @DescripcionesComerciales VALUES (116, N'NEUMATICOS - 220 SETS.ITEM 1-38/39-46-50/51-62.');
    INSERT @DescripcionesComerciales VALUES (117, N'NEUMATICOS - 220 UNID.ITEM 1/2.');
    INSERT @DescripcionesComerciales VALUES (118, N'NEUMATICOS - 220 UNIDAD (C/U) (Item 1 Factura 6254398621)');
    INSERT @DescripcionesComerciales VALUES (119, N'NEUMATICOS - 220 UNIDAD (C/U) (Item 1 Factura 6254442049)');
    INSERT @DescripcionesComerciales VALUES (120, N'NEUMATICOS - 220 UNIDAD (C/U) (Item 1/2 Factura 6254422596)');
    INSERT @DescripcionesComerciales VALUES (121, N'NEUMATICOS - 220 UNIDAD (C/U) (Item 1/3 Factura 6254419363)');
    INSERT @DescripcionesComerciales VALUES (122, N'NEUMATICOS - 220 UNIDAD (C/U) (Item 1/3 Factura 6254453725)');
    INSERT @DescripcionesComerciales VALUES (123, N'NEUMATICOS - 220 UNIDAD (C/U) (Item 1/3 Factura 6254460723)');
    INSERT @DescripcionesComerciales VALUES (124, N'NEUMATICOS - 220 UNIDAD (C/U) (Item 1/5 Factura 6254413890)');
    INSERT @DescripcionesComerciales VALUES (125, N'NEUMATICOS - 220 UNIDAD (C/U) (Item 1/5 Factura 6254473410)');
    INSERT @DescripcionesComerciales VALUES (126, N'NEUMATICOS - 220 UNIDAD (C/U) (Item 3/4 Factura 6254406432)');
    INSERT @DescripcionesComerciales VALUES (127, N'NEUMATICOS - 224 UNIDAD (C/U) (Item 1/5 Factura 6254465877)');
    INSERT @DescripcionesComerciales VALUES (128, N'NEUMATICOS - 230 UNIDAD (C/U) (Item 1/2 Factura 6254428899)');
    INSERT @DescripcionesComerciales VALUES (129, N'NEUMATICOS - 230 UNIDAD (C/U) (Item 1/5 Factura 6254457045)');
    INSERT @DescripcionesComerciales VALUES (130, N'NEUMATICOS - 240 UNIDAD (C/U) (Item 1 Factura 6254356948)');
    INSERT @DescripcionesComerciales VALUES (131, N'NEUMATICOS - 240 UNIDAD (C/U) (Item 1 Factura 6254356950)');
    INSERT @DescripcionesComerciales VALUES (132, N'NEUMATICOS - 240 UNIDAD (C/U) (Item 1/3 Factura 6254402252)');
    INSERT @DescripcionesComerciales VALUES (133, N'NEUMATICOS - 240 UNIDAD (C/U) (Item 1/4 Factura 6254448440)');
    INSERT @DescripcionesComerciales VALUES (134, N'NEUMATICOS - 240 UNIDAD (C/U) (Item 1-3/4 Factura 6254396951)');
    INSERT @DescripcionesComerciales VALUES (135, N'NEUMATICOS - 250 UNIDAD (C/U) (Item 1/3 Factura 6254394426)');
    INSERT @DescripcionesComerciales VALUES (136, N'NEUMATICOS - 250 UNIDAD (C/U) (Item 1/3 Factura 6254424347)');
    INSERT @DescripcionesComerciales VALUES (137, N'NEUMATICOS - 250 UNIDAD (C/U) (Item 1/3 Factura TLM010-URU-0220)');
    INSERT @DescripcionesComerciales VALUES (138, N'NEUMATICOS - 250 UNIDAD (C/U) (Item 1/5 Factura 6254398738)');
    INSERT @DescripcionesComerciales VALUES (139, N'NEUMATICOS - 252 UNIDAD (C/U) (Item 1/2 Factura 2019UGC1111)');
    INSERT @DescripcionesComerciales VALUES (140, N'NEUMATICOS - 252 unidades - item 1 al 3');
    INSERT @DescripcionesComerciales VALUES (141, N'NEUMATICOS - 252 unidades- item 1 al 2');
    INSERT @DescripcionesComerciales VALUES (142, N'NEUMATICOS - 252 unidades- item 1 al 4');
    INSERT @DescripcionesComerciales VALUES (143, N'NEUMATICOS - 258 UNIDAD (C/U) (Item 1/3 Factura 2020UGC0212)');
    INSERT @DescripcionesComerciales VALUES (144, N'NEUMATICOS - 260 UNIDAD (C/U) (Item 1/2 Factura 6254437238)');
    INSERT @DescripcionesComerciales VALUES (145, N'NEUMATICOS - 262 UNIDAD (C/U) (Item 1/3 Factura LAAZ-FBLU2020-6)');
    INSERT @DescripcionesComerciales VALUES (146, N'NEUMATICOS - 264 UNIDAD (C/U) (Item 1 Factura 2019UGC0217)');
    INSERT @DescripcionesComerciales VALUES (147, N'NEUMATICOS - 264 UNIDAD (C/U) (Item 1 Factura 2019UGC0902)');
    INSERT @DescripcionesComerciales VALUES (148, N'NEUMATICOS - 264 UNIDAD (C/U) (Item 1/2 Factura 2019UGC1215)');
    INSERT @DescripcionesComerciales VALUES (149, N'NEUMATICOS - 264 UNIDAD (C/U) (Item 1/3 Factura 2019UGC0614)');
    INSERT @DescripcionesComerciales VALUES (150, N'NEUMATICOS - 264 UNIDAD (C/U) (Item 1/4 Factura 2019UGC0501)');
    INSERT @DescripcionesComerciales VALUES (151, N'NEUMATICOS - 266 UNIDAD (C/U) (Item 1/2 Factura 2019UGC1202)');
    INSERT @DescripcionesComerciales VALUES (152, N'NEUMATICOS - 270 UNIDAD (C/U) (Item 1 Factura 2020UGC0605)');
    INSERT @DescripcionesComerciales VALUES (153, N'NEUMATICOS - 274 UNIDAD (C/U) (Item 1/2 Factura 6254434756)');
    INSERT @DescripcionesComerciales VALUES (154, N'NEUMATICOS - 276 UNIDAD (C/U) (Item 1 Factura 2020UGC0634)');
    INSERT @DescripcionesComerciales VALUES (155, N'NEUMATICOS - 276 UNIDAD (C/U) (Item 1/5 Factura 6254408038)');
    INSERT @DescripcionesComerciales VALUES (156, N'NEUMATICOS - 296 UNIDAD (C/U) (Item 1-3/6 Factura 6254448330)');
    INSERT @DescripcionesComerciales VALUES (157, N'NEUMATICOS - 324 UNID.ITEM 1/4-12-17/19.');
    INSERT @DescripcionesComerciales VALUES (158, N'NEUMATICOS - 360 UNIDAD (C/U) (Item 1/2 Factura 6254447124)');
    INSERT @DescripcionesComerciales VALUES (159, N'NEUMATICOS - 440 UNID.ITEM 1.');
    INSERT @DescripcionesComerciales VALUES (160, N'NEUMATICOS - 460 UNIDAD (C/U) (Item 1/4 Factura 6254372762)');
    INSERT @DescripcionesComerciales VALUES (161, N'NEUMATICOS - 488 UNID.ITEM 1/4.');
    INSERT @DescripcionesComerciales VALUES (162, N'NEUMATICOS - 540 UNIDAD (C/U) (Item 1/3 Factura 2019UGC0327/0405)');
    INSERT @DescripcionesComerciales VALUES (163, N'NEUMATICOS - 70 SETS,216 UNID.ITEM 1/3-11-17-24.');
    INSERT @DescripcionesComerciales VALUES (164, N'NEUMATICOS - 912 UNID.ITEM 1/6.FAC:18HFROL003-2-PCR.');
    INSERT @DescripcionesComerciales VALUES (165, N'NEUMATICOS (140 UNID)');
    INSERT @DescripcionesComerciales VALUES (166, N'NEUMATICOS (20 UNIDADES)');
    INSERT @DescripcionesComerciales VALUES (167, N'NEUMATICOS (25 UNIDADES)');
    INSERT @DescripcionesComerciales VALUES (168, N'NEUMATICOS (6 UNID)');
    INSERT @DescripcionesComerciales VALUES (169, N'NEUMATICOS (DE LOS CUALES 157 SON SETS DE UNIDADES DE NEUMATICOS,CAMARAS Y FLAPS). ITEMS 1');
    INSERT @DescripcionesComerciales VALUES (170, N'NEUMATICOS .-');
    INSERT @DescripcionesComerciales VALUES (171, N'NEUMATICOS / CAMIONES');
    INSERT @DescripcionesComerciales VALUES (172, N'NEUMATICOS 169 UNID IT.7/9-11/13-23/24');
    INSERT @DescripcionesComerciales VALUES (173, N'NEUMATICOS 20 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (174, N'NEUMATICOS 248 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (175, N'NEUMATICOS- 46 SETS, 483 UNID.ITEM 1/4-28/29.');
    INSERT @DescripcionesComerciales VALUES (176, N'NEUMATICOS CAMION - 10 SETS.ITEM 1.');
    INSERT @DescripcionesComerciales VALUES (177, N'NEUMATICOS CAMION - 121 UNID.ITEM 14/16-19/20.FAC,ZHX2062396BM.');
    INSERT @DescripcionesComerciales VALUES (178, N'NEUMATICOS CAMION - 1241UNID.ITEM 2/5-30/32-37.');
    INSERT @DescripcionesComerciales VALUES (179, N'NEUMATICOS CAMION - 126 UNID.ITEM 3/4.');
    INSERT @DescripcionesComerciales VALUES (180, N'NEUMATICOS CAMION - 14 SETS,162 UNID.ITEM 1/3-5/9-18.');
    INSERT @DescripcionesComerciales VALUES (181, N'NEUMATICOS CAMION - 145 SETS,249 UNID.ITEM 1/4-6-34-44/47-57-62-66-68.');
    INSERT @DescripcionesComerciales VALUES (182, N'NEUMATICOS CAMION - 175 UNID.ITEM 1/3-11/12-15.');
    INSERT @DescripcionesComerciales VALUES (183, N'NEUMATICOS CAMION - 176 UNID.ITEM 4.');
    INSERT @DescripcionesComerciales VALUES (184, N'NEUMATICOS CAMION - 18 UNID.ITEM 1.');
    INSERT @DescripcionesComerciales VALUES (185, N'NEUMATICOS CAMION - 20 UNID.ITEM 1.');
    INSERT @DescripcionesComerciales VALUES (186, N'NEUMATICOS CAMION - 200 SETS,470 UNID.ITEM 1/3-5/6-30/31-39/40-43/44-49-53/55.');
    INSERT @DescripcionesComerciales VALUES (187, N'NEUMATICOS CAMION - 21 UNID.ITEM 20/22.');
    INSERT @DescripcionesComerciales VALUES (188, N'NEUMATICOS CAMION - 210 UNID.ITEM 1/4.');
    INSERT @DescripcionesComerciales VALUES (189, N'NEUMATICOS CAMION - 210 UNID.ITEM 1-12-16.');
    INSERT @DescripcionesComerciales VALUES (190, N'NEUMATICOS CAMION - 215 UNID.ITEM 1.FAC:ZHX2062779BM.');
    INSERT @DescripcionesComerciales VALUES (191, N'NEUMATICOS CAMION - 216 SETS,48 UNID.ITEM 1/4-29/31-34/36.');
    INSERT @DescripcionesComerciales VALUES (192, N'NEUMATICOS CAMION - 218 UNID.ITEM 1-3.FAC:ZHX206277BM.');
    INSERT @DescripcionesComerciales VALUES (193, N'NEUMATICOS CAMION - 220 UNID.ITEM 10.');
    INSERT @DescripcionesComerciales VALUES (194, N'NEUMATICOS CAMION - 232 UNID.ITEM 1/4.');
    INSERT @DescripcionesComerciales VALUES (195, N'NEUMATICOS CAMION - 233 UNID.ITEM 1/5-31-34/35-38-41/42.');
    INSERT @DescripcionesComerciales VALUES (196, N'NEUMATICOS CAMION - 255 UNID.ITEM 1/3-26-33.');
    INSERT @DescripcionesComerciales VALUES (197, N'NEUMATICOS CAMION - 279 UNID.ITEM 1/3.');
    INSERT @DescripcionesComerciales VALUES (198, N'NEUMATICOS CAMION - 281 UNID.ITEM 13-15.');
    INSERT @DescripcionesComerciales VALUES (199, N'NEUMATICOS CAMION - 30 UNID.ITEM 28.');
    INSERT @DescripcionesComerciales VALUES (200, N'NEUMATICOS CAMION - 324 SETS,395 UNID.ITEM 1/7-9/10-41/42-53-60/63-73-76.');
    INSERT @DescripcionesComerciales VALUES (201, N'NEUMATICOS CAMION - 353 UNID.ITEM 1/5-8-39/42-45-51-54.');
    INSERT @DescripcionesComerciales VALUES (202, N'NEUMATICOS CAMION - 429 UNID.ITEM 1-25/28.');
    INSERT @DescripcionesComerciales VALUES (203, N'NEUMATICOS CAMION - 444 UNID.ITEM 1/3.');
    INSERT @DescripcionesComerciales VALUES (204, N'NEUMATICOS CAMION - 445 UNID.ITEM 1/3.');
    INSERT @DescripcionesComerciales VALUES (205, N'NEUMATICOS CAMION - 450 UNID.ITEM 1/3.');
    INSERT @DescripcionesComerciales VALUES (206, N'NEUMATICOS CAMION - 458 UNID.ITEM 1/3-29-32/33-37-40.');
    INSERT @DescripcionesComerciales VALUES (207, N'NEUMATICOS CAMION - 484 UNID.ITEM 2/6.');
    INSERT @DescripcionesComerciales VALUES (208, N'NEUMATICOS CAMION - 492 UNID.ITEM 31/33.');
    INSERT @DescripcionesComerciales VALUES (209, N'NEUMATICOS CAMION - 573 UNID.ITEM 1-8/9.');
    INSERT @DescripcionesComerciales VALUES (210, N'NEUMATICOS CAMION - 574 UNID.ITEM 2-15/20.');
    INSERT @DescripcionesComerciales VALUES (211, N'NEUMATICOS CAMION - 60 SETS,24 UNID.ITEM 1/2-43.');
    INSERT @DescripcionesComerciales VALUES (212, N'NEUMATICOS CAMION - 60 UNID.ITEM 1-36.');
    INSERT @DescripcionesComerciales VALUES (213, N'NEUMATICOS CAMION - 604 UNID.ITEM 1-7-9/15.');
    INSERT @DescripcionesComerciales VALUES (214, N'NEUMATICOS CAMION - 664 UNID.ITEM 1/5-35/36.');
    INSERT @DescripcionesComerciales VALUES (215, N'NEUMATICOS CAMION - 77 UNID.ITEM 1/2-29/30.');
    INSERT @DescripcionesComerciales VALUES (216, N'NEUMATICOS CAMION - 771 UNID.ITEM 1/2-36-38-41/42-44/46-54-58.');
    INSERT @DescripcionesComerciales VALUES (217, N'NEUMATICOS CAMION - 878 UNID.ITEM 1/7-10-58/59-70/72-75-84/85-88/89.');
    INSERT @DescripcionesComerciales VALUES (218, N'NEUMATICOS CAMION - 90 SETS,198 UNID.ITEM 1-39/41-51/52.');
    INSERT @DescripcionesComerciales VALUES (219, N'NEUMATICOS CAMION - 94 UNID.ITEM 2/3-17-20.');
    INSERT @DescripcionesComerciales VALUES (220, N'NEUMATICOS CAMION - 96 SETS,536 UNID.ITEM 1/5-29/30-36-38/39-55.');
    INSERT @DescripcionesComerciales VALUES (221, N'Neumaticos camion ( SET ) 10 und');
    INSERT @DescripcionesComerciales VALUES (222, N'Neumaticos camion ( set) , 15 und.');
    INSERT @DescripcionesComerciales VALUES (223, N'Neumaticos Camion (SET) 10 und');
    INSERT @DescripcionesComerciales VALUES (224, N'NEUMATICOS CAMION . 348 UNID.ITEM 1/5-50/51-58/59.');
    INSERT @DescripcionesComerciales VALUES (225, N'Neumaticos camion 10 und');
    INSERT @DescripcionesComerciales VALUES (226, N'NEUMATICOS CAMION -10 UND- IT.27');
    INSERT @DescripcionesComerciales VALUES (227, N'Neumaticos camion 30 und');
    INSERT @DescripcionesComerciales VALUES (228, N'Neumaticos camion 30 unds');
    INSERT @DescripcionesComerciales VALUES (229, N'NEUMATICOS CAMION -33 UNID.ITEM 1/2-10-20.');
    INSERT @DescripcionesComerciales VALUES (230, N'Neumaticos camion 3o unds it 1');
    INSERT @DescripcionesComerciales VALUES (231, N'NEUMATICOS CAMION- 440 UNID.ITEM 13/14.');
    INSERT @DescripcionesComerciales VALUES (232, N'Neumaticos camion 50 und');
    INSERT @DescripcionesComerciales VALUES (233, N'NEUMATICOS CAMION -52 UNID.ITEM 1/2-5-25/26.');
    INSERT @DescripcionesComerciales VALUES (234, N'NEUMATICOS CAMION.. 1 unidad it. 24 ver fact. 12512905');
    INSERT @DescripcionesComerciales VALUES (235, N'NEUMATICOS CAMION.. 10 UNIDADES IT. 36 VER FACT 783');
    INSERT @DescripcionesComerciales VALUES (236, N'NEUMATICOS CAMION.. 19 unidades it. 25 ver fact. 12512905');
    INSERT @DescripcionesComerciales VALUES (237, N'NEUMATICOS CAMION.. 2 UNIDADES IT, 30 VER FACT. 12505377');
    INSERT @DescripcionesComerciales VALUES (238, N'NEUMATICOS CAMION.. 3 UNIDADES IT, 29 VER FACT. 12505377');
    INSERT @DescripcionesComerciales VALUES (239, N'NEUMATICOS CAMION.. 4 UNIDADES IT, 32 VER FACT. 12505377');
    INSERT @DescripcionesComerciales VALUES (240, N'NEUMATICOS CAMION.. 6 UNIDADES IT, 31 VER FACT. 12505377');
    INSERT @DescripcionesComerciales VALUES (241, N'NEUMATICOS CAMION.. 8 UNIDADES IT, 33 VER FACT. 12505377');
    INSERT @DescripcionesComerciales VALUES (242, N'NEUMATICOS CAMION: 12 UNID.-ITEM.1.-FACT.0061-00000807');
    INSERT @DescripcionesComerciales VALUES (243, N'NEUMATICOS CAMION: 12 UNID.-ITEM.14, 7 UNID.-ITEM.18, 18 UNID.-ITEM.19 y 4 UNID.-ITEM.22.-');
    INSERT @DescripcionesComerciales VALUES (244, N'NEUMATICOS CAMION: 12 UNID.-ITEM.19.-FACT.0061-00000805');
    INSERT @DescripcionesComerciales VALUES (245, N'NEUMATICOS CAMION: 12 UNID.-ITEM.1y 20 UNID.-ITEM.2.-FACT.L000002781944LA');
    INSERT @DescripcionesComerciales VALUES (246, N'NEUMATICOS CAMION: 12 UNID.-ITEM.21y 16 UNID.-ITEM.23.-FACT.0061-00000805');
    INSERT @DescripcionesComerciales VALUES (247, N'NEUMATICOS CAMION: 12 UNID.-ITEM.9.-FACT.0061-00000709');
    INSERT @DescripcionesComerciales VALUES (248, N'NEUMATICOS CAMION: 14 UNID.-ITEM.10.-FACT.B006000001583');
    INSERT @DescripcionesComerciales VALUES (249, N'NEUMATICOS CAMION: 154 UNID.-ITEM.1-2.-');
    INSERT @DescripcionesComerciales VALUES (250, N'NEUMATICOS CAMION: 16 UNID.-ITEM.1.-FACT.0061-00000806');
    INSERT @DescripcionesComerciales VALUES (251, N'NEUMATICOS CAMION: 16 UNID.-ITEM.3.-FACT.B006000001584');
    INSERT @DescripcionesComerciales VALUES (252, N'NEUMATICOS CAMION: 16 UNID.-ITEM.53.-FACT.0061-00001116');
    INSERT @DescripcionesComerciales VALUES (253, N'NEUMATICOS CAMION: 16 UNID.-ITEM.6.-FACT.B006000001620');
    INSERT @DescripcionesComerciales VALUES (254, N'NEUMATICOS CAMION: 16 UNID.-ITEM.7.-FACT.B006000001821');
    INSERT @DescripcionesComerciales VALUES (255, N'NEUMATICOS CAMION: 16 UNID.-ITEM.7.-FACT.L000002741944LA');
    INSERT @DescripcionesComerciales VALUES (256, N'NEUMATICOS CAMION: 20 UNID.-ITEM.2, 14 UNID.-ITEM.7 y 8 UNID.-ITEM.9.-FACT.L000002741944LA');
    INSERT @DescripcionesComerciales VALUES (257, N'NEUMATICOS CAMION: 20 UNID.-ITEM.4, 10 UNID.-ITEM.6, 30 UNID.-ITEM.7, 14 UNID.-ITEM.8 y 12');
    INSERT @DescripcionesComerciales VALUES (258, N'NEUMATICOS CAMION: 31 UNID.-ITEM.4, 30 UNID.-ITEM.5, 10 UNID.-ITEM.6, y 16 UNID.-ITEM.8.-');
    INSERT @DescripcionesComerciales VALUES (259, N'NEUMATICOS CAMION: 4 UNID.-ITEM.14 y 20 UNID.-ITEM.20.-FACT.0061-00000805');
    INSERT @DescripcionesComerciales VALUES (260, N'NEUMATICOS CAMION: 4 UNID.-ITEM.14, 16 UNID.-ITEM.15, 12 UNID.-ITEM.16 y 12 UNID.-ITEM.17.');
    INSERT @DescripcionesComerciales VALUES (261, N'NEUMATICOS CAMION: 4 UNID.-ITEM.7.-FACT.B006000001821');
    INSERT @DescripcionesComerciales VALUES (262, N'NEUMATICOS CAMION: 40 UNID.-ITEM.6.-FACT.L000002741944LA');
    INSERT @DescripcionesComerciales VALUES (263, N'NEUMATICOS CAMION: 5 UNID.-ITEM.2.-FACT.B006000001616');
    INSERT @DescripcionesComerciales VALUES (264, N'NEUMATICOS CAMION: 50 UNID.-ITEM.32.-');
    INSERT @DescripcionesComerciales VALUES (265, N'NEUMATICOS CAMION: 6 UNID.-ITEM.33.-FACT.EET181058755');
    INSERT @DescripcionesComerciales VALUES (266, N'NEUMATICOS CAMION: 6 UNID.-ITEM.8.-FACT.B006000001821');
    INSERT @DescripcionesComerciales VALUES (267, N'NEUMATICOS CAMION: 8 UNID.-ITEM.2.-FACT.B006000001648');
    INSERT @DescripcionesComerciales VALUES (268, N'NEUMATICOS CAMION: 8 UNID.-ITEM.4.-FACT.B006000001620');
    INSERT @DescripcionesComerciales VALUES (269, N'NEUMATICOS CAMION: 9 UNID.-ITEM.10 y 14 UNID.-ITEM.13.-FACT.B006000001552');
    INSERT @DescripcionesComerciales VALUES (270, N'NEUMATICOS CAMIONETA - 128 SETS,372 UNID.ITEM 1/5-8/9-44-50-52/53-55-64-68/70-72/73.');
    INSERT @DescripcionesComerciales VALUES (271, N'NEUMATICOS DE CAMION');
    INSERT @DescripcionesComerciales VALUES (272, N'Neumaticos de Camion . IT 1');
    INSERT @DescripcionesComerciales VALUES (273, N'Neumaticos de Camion . IT 1/2');
    INSERT @DescripcionesComerciales VALUES (274, N'Neumaticos de Camion . IT 1/4');
    INSERT @DescripcionesComerciales VALUES (275, N'Neumaticos de Camion . IT 1-4/8');
    INSERT @DescripcionesComerciales VALUES (276, N'Neumaticos de Camion . Items 11 - 13');
    INSERT @DescripcionesComerciales VALUES (277, N'Neumaticos de Camion . Items 2/3');
    INSERT @DescripcionesComerciales VALUES (278, N'Neumaticos de Camion . Items 6/7');
    INSERT @DescripcionesComerciales VALUES (279, N'Neumaticos de Camion . Items 8/9');
    INSERT @DescripcionesComerciales VALUES (280, N'Neumaticos de Camion . Items 9/10-12');
    INSERT @DescripcionesComerciales VALUES (281, N'NEUMATICOS DE CAMION, CON CAMARA Y FLAP - 126 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (282, N'NEUMATICOS DE CAMION.. 10 UNIDADES IT. 13 VER FACT. 321');
    INSERT @DescripcionesComerciales VALUES (283, N'NEUMATICOS DE CAMION.. 10 UNIDADES IT. 38 VER FACT. 321');
    INSERT @DescripcionesComerciales VALUES (284, N'NEUMATICOS DE CAMION.. 16 UNDADES IT. 50/52 VER FACT. 708');
    INSERT @DescripcionesComerciales VALUES (285, N'NEUMATICOS DE CAMION.. 2 UNIDADES IT. 49 VER FACT. 708');
    INSERT @DescripcionesComerciales VALUES (286, N'NEUMATICOS DE CAMION.. 20 UNIDADES IT. 12 VER FACT- 321');
    INSERT @DescripcionesComerciales VALUES (287, N'NEUMATICOS DE CAMION.. 40 unidades it. 53 ver fact. 12512905');
    INSERT @DescripcionesComerciales VALUES (288, N'NEUMATICOS DE CAMION.. 54 UNIDADES IT. 10 VER FACT. 709');
    INSERT @DescripcionesComerciales VALUES (289, N'NEUMATICOS DE CAMIONES - 1430 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (290, N'NEUMATICOS DE CAMIONES - 20 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (291, N'NEUMATICOS DE CAUCHO - AT');
    INSERT @DescripcionesComerciales VALUES (292, N'NEUMATICOS DE CAUCHO - RG');
    INSERT @DescripcionesComerciales VALUES (293, N'NEUMATICOS DE CAUCHO, NUEVOS - AT');
    INSERT @DescripcionesComerciales VALUES (294, N'NEUMATICOS DE CAUCHO, NUEVOS - NUEVA AT');
    INSERT @DescripcionesComerciales VALUES (295, N'NEUMATICOS DE CAUCHO, NUEVOS - RG');
    INSERT @DescripcionesComerciales VALUES (296, N'NEUMATICOS DE LOS CUALES 152 SON SETS. ITEMS 1/2,10/12. - 211 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (297, N'NEUMATICOS DE LOS CUALES 41 SON SETS DE NEUMATICOS. ITEMS 1/2,13. - 149 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (298, N'NEUMATICOS FACT 300056102 IT 16/22,24,25');
    INSERT @DescripcionesComerciales VALUES (299, N'NEUMATICOS IT 1/2 - 93 UN -');
    INSERT @DescripcionesComerciales VALUES (300, N'Neumaticos it. 1');
    INSERT @DescripcionesComerciales VALUES (301, N'neumaticos it. 1/11');
    INSERT @DescripcionesComerciales VALUES (302, N'Neumaticos it. 1/3');
    INSERT @DescripcionesComerciales VALUES (303, N'NEUMATICOS IT.- 1/3,15,13 Y 7/9');
    INSERT @DescripcionesComerciales VALUES (304, N'Neumaticos it. 1/5');
    INSERT @DescripcionesComerciales VALUES (305, N'neumaticos it. 1/6');
    INSERT @DescripcionesComerciales VALUES (306, N'Neumaticos it. 1/7');
    INSERT @DescripcionesComerciales VALUES (307, N'NEUMATICOS IT.33,10,1,2,5,7 Y 3');
    INSERT @DescripcionesComerciales VALUES (308, N'NEUMATICOS It:1 al 10.-');
    INSERT @DescripcionesComerciales VALUES (309, N'NEUMATICOS It:1 al 11.-');
    INSERT @DescripcionesComerciales VALUES (310, N'NEUMATICOS It:1 al 4.-');
    INSERT @DescripcionesComerciales VALUES (311, N'NEUMATICOS It:1 al 6.-');
    INSERT @DescripcionesComerciales VALUES (312, N'NEUMATICOS It:1.-');
    INSERT @DescripcionesComerciales VALUES (313, N'NEUMATICOS It:1/Fac. 190329-12CN 255 UN. , It: 1/Fac. 190628-03CN 255 UN ,');
    INSERT @DescripcionesComerciales VALUES (314, N'NEUMATICOS NUEVOS PARA CAMIONES');
    INSERT @DescripcionesComerciales VALUES (315, N'NEUMATICOS NUEVOS.- SON 214 UNIDADES DEL ITEM 1.');
    INSERT @DescripcionesComerciales VALUES (316, N'NEUMATICOS NUEVOS.- SON 246 UNIDADES DEL ITEM 1.');
    INSERT @DescripcionesComerciales VALUES (317, N'NEUMATICOS P/ CAMION');
    INSERT @DescripcionesComerciales VALUES (318, N'NEUMATICOS P/ CAMIONES');
    INSERT @DescripcionesComerciales VALUES (319, N'NEUMATICOS P/CAMION');
    INSERT @DescripcionesComerciales VALUES (320, N'NEUMATICOS P/CAMION - 132 UNIDAD (C/U) (Item 1/4 Factura 2020364)');
    INSERT @DescripcionesComerciales VALUES (321, N'NEUMATICOS P/CAMION - 144 UNIDAD (C/U) (Item 14/15 Factura TLM010-URU-0625)');
    INSERT @DescripcionesComerciales VALUES (322, N'NEUMATICOS P/CAMION - 20 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (323, N'NEUMATICOS P/CAMION - 239 UNIDAD (C/U) (Item 1/3 Factura 2020838)');
    INSERT @DescripcionesComerciales VALUES (324, N'NEUMATICOS P/CAMION - 242 UNIDAD (C/U) (Item 1/3 Factura 2020858)');
    INSERT @DescripcionesComerciales VALUES (325, N'NEUMATICOS P/CAMION - 250 UNIDAD (C/U) (Item 1 Factura TLM010-URU-0613)');
    INSERT @DescripcionesComerciales VALUES (326, N'NEUMATICOS P/CAMION - 250 UNIDAD (C/U) (Item 1/2 Factura 2020029)');
    INSERT @DescripcionesComerciales VALUES (327, N'NEUMATICOS P/CAMION - 250 UNIDAD (C/U) (Item 1/2 Factura FU20181114)');
    INSERT @DescripcionesComerciales VALUES (328, N'NEUMATICOS P/CAMION - 250 UNIDAD (C/U) (Item 1/2 Factura TLM010-URU-0307)');
    INSERT @DescripcionesComerciales VALUES (329, N'NEUMATICOS P/CAMION - 250 UNIDAD (C/U) (Item 1/2 Factura TLM010-URU-0511)');
    INSERT @DescripcionesComerciales VALUES (330, N'NEUMATICOS P/CAMION - 250 UNIDAD (C/U) (Item 1/3 Factura 20191241)');
    INSERT @DescripcionesComerciales VALUES (331, N'NEUMATICOS P/CAMION - 250 UNIDAD (C/U) (Item 1/3 Factura 2019622)');
    INSERT @DescripcionesComerciales VALUES (332, N'NEUMATICOS P/CAMION - 250 UNIDAD (C/U) (Item 1/3 Factura 2019728)');
    INSERT @DescripcionesComerciales VALUES (333, N'NEUMATICOS P/CAMION - 250 UNIDAD (C/U) (Item 1/3 Factura 2020030)');
    INSERT @DescripcionesComerciales VALUES (334, N'NEUMATICOS P/CAMION - 250 UNIDAD (C/U) (Item 1/4 Factura 20191496)');
    INSERT @DescripcionesComerciales VALUES (335, N'NEUMATICOS P/CAMION - 256 UNIDAD (C/U) (Item 2,5/8 Factura LAAZ-FBLU201904)');
    INSERT @DescripcionesComerciales VALUES (336, N'NEUMATICOS P/CAMION - 262 UNIDAD (C/U) (Item 1/5 Factura LAAZ-FBLU201902)');
    INSERT @DescripcionesComerciales VALUES (337, N'NEUMATICOS P/CAMION - 262 UNIDAD (C/U) (Item 1/5 Factura LAAZ-FBLU2020-3)');
    INSERT @DescripcionesComerciales VALUES (338, N'NEUMATICOS P/CAMION - 266 UNIDAD (C/U) (Item 1/6 Factura LAAZ-FBLU201903)');
    INSERT @DescripcionesComerciales VALUES (339, N'NEUMATICOS P/CAMION - 267 UNIDAD (C/U) (Item 1/3 Factura FU20190110)');
    INSERT @DescripcionesComerciales VALUES (340, N'NEUMATICOS P/CAMION - 269 UNIDAD (C/U) (Item 1/8 Factura 2020362)');
    INSERT @DescripcionesComerciales VALUES (341, N'NEUMATICOS P/CAMION - 291 UNIDAD (C/U) (Item 1/5 Factura 2020661)');
    INSERT @DescripcionesComerciales VALUES (342, N'NEUMATICOS P/CAMION - 306 UNIDAD (C/U) (Item 1/7 Factura 20191242)');
    INSERT @DescripcionesComerciales VALUES (343, N'NEUMATICOS P/CAMION - 407 UNIDAD (C/U) (Item 15/18 Factura LAAZ-FBLU201906)');
    INSERT @DescripcionesComerciales VALUES (344, N'NEUMATICOS P/CAMION - 524 UNIDAD (C/U) (Item 1/3 Factura LAAZ-FBLU2020-1)');
    INSERT @DescripcionesComerciales VALUES (345, N'NEUMATICOS P/CAMION - 524 UNIDAD (C/U) (Item 1/4 Factura LAAZ-FBLU201908)');
    INSERT @DescripcionesComerciales VALUES (346, N'NEUMATICOS P/CAMION - 524 UNIDAD (C/U) (Item 1/4 Factura LAAZ-FBLU2020-4)');
    INSERT @DescripcionesComerciales VALUES (347, N'NEUMATICOS P/CAMION - 70 UNIDAD (C/U) (Item 1/2 Factura BLM010-URU-0404)');
    INSERT @DescripcionesComerciales VALUES (348, N'NEUMATICOS P/CAMION - 70 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (349, N'NEUMATICOS P/CAMION - 84 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (350, N'NEUMATICOS P/CAMION - 91 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (351, N'NEUMATICOS P/CAMION - SET CON CAMARA Y FLAP - 110 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (352, N'NEUMATICOS P/CAMION 148 UNID.');
    INSERT @DescripcionesComerciales VALUES (353, N'NEUMATICOS P/CAMION 174 UNID.');
    INSERT @DescripcionesComerciales VALUES (354, N'NEUMATICOS P/CAMION 192 UNID.');
    INSERT @DescripcionesComerciales VALUES (355, N'NEUMATICOS P/CAMION 226 UNID.');
    INSERT @DescripcionesComerciales VALUES (356, N'NEUMATICOS P/CAMION 233 UNID.');
    INSERT @DescripcionesComerciales VALUES (357, N'NEUMATICOS P/CAMION 238 UNID.');
    INSERT @DescripcionesComerciales VALUES (358, N'NEUMATICOS P/CAMION 240 UNID.');
    INSERT @DescripcionesComerciales VALUES (359, N'NEUMATICOS P/CAMION 243 UNID.');
    INSERT @DescripcionesComerciales VALUES (360, N'NEUMATICOS P/CAMION 249 UNID.');
    INSERT @DescripcionesComerciales VALUES (361, N'NEUMATICOS P/CAMION 250 UNID.');
    INSERT @DescripcionesComerciales VALUES (362, N'NEUMATICOS P/CAMION 254 UNID.');
    INSERT @DescripcionesComerciales VALUES (363, N'NEUMATICOS P/CAMION 259 UNID.');
    INSERT @DescripcionesComerciales VALUES (364, N'NEUMATICOS P/CAMION 260 UNID.');
    INSERT @DescripcionesComerciales VALUES (365, N'NEUMATICOS P/CAMION 262 UNID.');
    INSERT @DescripcionesComerciales VALUES (366, N'NEUMATICOS P/CAMION 266 UNID.');
    INSERT @DescripcionesComerciales VALUES (367, N'NEUMATICOS P/CAMION 269 UNID.');
    INSERT @DescripcionesComerciales VALUES (368, N'NEUMATICOS P/CAMION 281 UNID.');
    INSERT @DescripcionesComerciales VALUES (369, N'NEUMATICOS P/CAMION 291 UNID.');
    INSERT @DescripcionesComerciales VALUES (370, N'NEUMATICOS P/CAMION 3 UNID.');
    INSERT @DescripcionesComerciales VALUES (371, N'NEUMATICOS P/CAMION 302 UNID.');
    INSERT @DescripcionesComerciales VALUES (372, N'NEUMATICOS P/CAMION 303 UNID.');
    INSERT @DescripcionesComerciales VALUES (373, N'NEUMATICOS P/CAMION 310 UNID.');
    INSERT @DescripcionesComerciales VALUES (374, N'NEUMATICOS P/CAMION 311 UNID.');
    INSERT @DescripcionesComerciales VALUES (375, N'NEUMATICOS P/CAMION 312 UNID.');
    INSERT @DescripcionesComerciales VALUES (376, N'NEUMATICOS P/CAMION 317 UNID.');
    INSERT @DescripcionesComerciales VALUES (377, N'NEUMATICOS P/CAMION 320 UNID.');
    INSERT @DescripcionesComerciales VALUES (378, N'NEUMATICOS P/CAMION 342 UNID.');
    INSERT @DescripcionesComerciales VALUES (379, N'NEUMATICOS P/CAMION 345 UNID.');
    INSERT @DescripcionesComerciales VALUES (380, N'NEUMATICOS P/CAMION 349 UNID.');
    INSERT @DescripcionesComerciales VALUES (381, N'NEUMATICOS P/CAMION 393 UNID.');
    INSERT @DescripcionesComerciales VALUES (382, N'NEUMATICOS P/CAMION 395 UNID.');
    INSERT @DescripcionesComerciales VALUES (383, N'NEUMATICOS P/CAMION 422 UNID.');
    INSERT @DescripcionesComerciales VALUES (384, N'NEUMATICOS P/CAMION 424 UNID.');
    INSERT @DescripcionesComerciales VALUES (385, N'NEUMATICOS P/CAMION 433 UNID.');
    INSERT @DescripcionesComerciales VALUES (386, N'NEUMATICOS P/CAMION 500 UNID.');
    INSERT @DescripcionesComerciales VALUES (387, N'NEUMATICOS P/CAMION 530 UNID.');
    INSERT @DescripcionesComerciales VALUES (388, N'NEUMATICOS P/CAMION 85 UNID.');
    INSERT @DescripcionesComerciales VALUES (389, N'NEUMATICOS P/CAMIONES');
    INSERT @DescripcionesComerciales VALUES (390, N'NEUMATICOS P/CAMIONES - 235 UNIDAD (C/U) (Item 1,3/4 Factura 2018UGC1115) NEUMATICOS P/CA');
    INSERT @DescripcionesComerciales VALUES (391, N'NEUMATICOS P/CAMIONES - 240 UNIDAD (C/U) (Item 1,4 Factura 2018UGC1104) NEUMATICOS PARA CA');
    INSERT @DescripcionesComerciales VALUES (392, N'NEUMATICOS P/CAMIONES - 265 UNIDAD (C/U) (Item 1/3 Factura 2018UGC1015)');
    INSERT @DescripcionesComerciales VALUES (393, N'NEUMATICOS P/CAMIONES. 92 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (394, N'NEUMATICOS P/VEHICULOS AUTOMOTORES 12 UNIDADES IT.13.-');
    INSERT @DescripcionesComerciales VALUES (395, N'NEUMATICOS PARA CAMION');
    INSERT @DescripcionesComerciales VALUES (396, N'NEUMATICOS PARA CAMION - 20 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (397, N'NEUMATICOS PARA CAMION - 206 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (398, N'NEUMATICOS PARA CAMION - 247 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (399, N'NEUMATICOS PARA CAMION - 265 UNIDAD (C/U) (Item 1/2 Factura UY18T108)');
    INSERT @DescripcionesComerciales VALUES (400, N'NEUMATICOS PARA CAMION - 316 UNIDAD (C/U) (Item 1 Factura UY19T688)');
    INSERT @DescripcionesComerciales VALUES (401, N'NEUMATICOS PARA CAMION - 328 UNIDAD (C/U) (Item 1/6 Factura UY18T314)');
    INSERT @DescripcionesComerciales VALUES (402, N'NEUMATICOS PARA CAMION - 330 UNIDAD (C/U) (Item 1/5 Factura UY18T315)');
    INSERT @DescripcionesComerciales VALUES (403, N'NEUMATICOS PARA CAMION - 346 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (404, N'NEUMATICOS PARA CAMION - 352 UNIDAD (C/U) (Item 1/4 Factura UY19T391)');
    INSERT @DescripcionesComerciales VALUES (405, N'NEUMATICOS PARA CAMION - 356 UNIDAD (C/U) (Item 1/5 Factura UY19T689)');
    INSERT @DescripcionesComerciales VALUES (406, N'NEUMATICOS PARA CAMION - 357 UNIDAD (C/U) (Item 1/6 Factura UY20T154)');
    INSERT @DescripcionesComerciales VALUES (407, N'NEUMATICOS PARA CAMION - 359 UNIDAD (C/U) (Item 1/5 Factura UY19T390)');
    INSERT @DescripcionesComerciales VALUES (408, N'NEUMATICOS PARA CAMION - 361 UNIDAD (C/U) (Item 1/6 Factura UY20T155)');
    INSERT @DescripcionesComerciales VALUES (409, N'NEUMATICOS PARA CAMION - 42 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (410, N'NEUMATICOS PARA CAMION - 80 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (411, N'NEUMATICOS PARA CAMION ( SET) 74 unds ITEMS 2-4/5');
    INSERT @DescripcionesComerciales VALUES (412, N'NEUMATICOS PARA CAMION -10 UNIDADES-ITEM 34-');
    INSERT @DescripcionesComerciales VALUES (413, N'NEUMATICOS PARA CAMION -104 UNIDADES-ITEMS 2/3, 6-');
    INSERT @DescripcionesComerciales VALUES (414, N'NEUMATICOS PARA CAMION -120 UNIDADES-ITEM 12-');
    INSERT @DescripcionesComerciales VALUES (415, N'NEUMATICOS PARA CAMION -188 UNIDADES-ITEMS 4/7-');
    INSERT @DescripcionesComerciales VALUES (416, N'NEUMATICOS PARA CAMION -189 UNIDADES-ITEMS 1/2-');
    INSERT @DescripcionesComerciales VALUES (417, N'NEUMATICOS PARA CAMION -200 UNIDADES-ITEM 1-');
    INSERT @DescripcionesComerciales VALUES (418, N'NEUMATICOS PARA CAMION -206 UNIDADES-ITEMS 1/3-');
    INSERT @DescripcionesComerciales VALUES (419, N'NEUMATICOS PARA CAMION -22 UNIDADES-ITEMS 21/22-');
    INSERT @DescripcionesComerciales VALUES (420, N'NEUMATICOS PARA CAMION -220 UNIDADES-ITEMS 1/9-');
    INSERT @DescripcionesComerciales VALUES (421, N'NEUMATICOS PARA CAMION -220 UNIDADES-ITEMS 4/9-');
    INSERT @DescripcionesComerciales VALUES (422, N'NEUMATICOS PARA CAMION -226 UNIDADES-ITEMS 2/3, 6/8-');
    INSERT @DescripcionesComerciales VALUES (423, N'NEUMATICOS PARA CAMION -234 UNIDADES-ITEMS 1/10-');
    INSERT @DescripcionesComerciales VALUES (424, N'NEUMATICOS PARA CAMION -242 UNIDADES-ITEMS 2/3-');
    INSERT @DescripcionesComerciales VALUES (425, N'NEUMATICOS PARA CAMION -244 UNIDADES-ITEMS 2/6-');
    INSERT @DescripcionesComerciales VALUES (426, N'NEUMATICOS PARA CAMION -246 UNIDADES-');
    INSERT @DescripcionesComerciales VALUES (427, N'NEUMATICOS PARA CAMION -252 UNIDADES-ITEM 1-');
    INSERT @DescripcionesComerciales VALUES (428, N'NEUMATICOS PARA CAMION -254 UNIDADES-');
    INSERT @DescripcionesComerciales VALUES (429, N'NEUMATICOS PARA CAMION -260 UNIDADES-');
    INSERT @DescripcionesComerciales VALUES (430, N'NEUMATICOS PARA CAMION -262 UNIDADES-');
    INSERT @DescripcionesComerciales VALUES (431, N'NEUMATICOS PARA CAMION -262 UNIDADES-ITEM 1-');
    INSERT @DescripcionesComerciales VALUES (432, N'NEUMATICOS PARA CAMION -262 UNIDADES-ITEMS 1/2-');
    INSERT @DescripcionesComerciales VALUES (433, N'NEUMATICOS PARA CAMION -262 UNIDADES-ITEMS 1/3-');
    INSERT @DescripcionesComerciales VALUES (434, N'NEUMATICOS PARA CAMION -263 UNIDADES-');
    INSERT @DescripcionesComerciales VALUES (435, N'NEUMATICOS PARA CAMION -268 UNIDADES-');
    INSERT @DescripcionesComerciales VALUES (436, N'NEUMATICOS PARA CAMION -270 UNIDADES-');
    INSERT @DescripcionesComerciales VALUES (437, N'NEUMATICOS PARA CAMION -276 UNIDADES-');
    INSERT @DescripcionesComerciales VALUES (438, N'NEUMATICOS PARA CAMION -28 UNIDADES-ITEMS 28, 32/33-');
    INSERT @DescripcionesComerciales VALUES (439, N'NEUMATICOS PARA CAMION -288 UNIDADES-');
    INSERT @DescripcionesComerciales VALUES (440, N'NEUMATICOS PARA CAMION -30 UNIDADES-ITEM 16-');
    INSERT @DescripcionesComerciales VALUES (441, N'NEUMATICOS PARA CAMION -320 UNIDADES-ITEMS 1/6-');
    INSERT @DescripcionesComerciales VALUES (442, N'NEUMATICOS PARA CAMION -36 UNIDADES-ITEMS 9, 15-');
    INSERT @DescripcionesComerciales VALUES (443, N'NEUMATICOS PARA CAMION -524 UNIDADES-ITEMS 1/3-');
    INSERT @DescripcionesComerciales VALUES (444, N'NEUMATICOS PARA CAMION -524 UNIDADES-ITEMS 1/4-');
    INSERT @DescripcionesComerciales VALUES (445, N'NEUMATICOS PARA CAMION -526 UNIDADES-');
    INSERT @DescripcionesComerciales VALUES (446, N'NEUMATICOS PARA CAMION 56 unds ITEMS 1-3');
    INSERT @DescripcionesComerciales VALUES (447, N'NEUMATICOS PARA CAMION 57 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (448, N'NEUMATICOS PARA CAMION -6 UNIDADES-ITEM 26-');
    INSERT @DescripcionesComerciales VALUES (449, N'NEUMATICOS PARA CAMION -60 UNIDADES-ITEMS 13, 30/31-');
    INSERT @DescripcionesComerciales VALUES (450, N'NEUMATICOS PARA CAMION -94 UNIDADES-ITEM 12-');
    INSERT @DescripcionesComerciales VALUES (451, N'NEUMATICOS PARA CAMION ITEM 1');
    INSERT @DescripcionesComerciales VALUES (452, N'NEUMATICOS PARA CAMION SON 274 UNIDAES.-');
    INSERT @DescripcionesComerciales VALUES (453, N'NEUMATICOS PARA CAMION, 106 UNIDADES, IT.7');
    INSERT @DescripcionesComerciales VALUES (454, N'NEUMATICOS PARA CAMION, 246 UNIDADES (PKG), IT.1/2');
    INSERT @DescripcionesComerciales VALUES (455, N'NEUMATICOS PARA CAMION, 426 UNIDADES (PKG), IT.1/3-18/22');
    INSERT @DescripcionesComerciales VALUES (456, N'NEUMATICOS PARA CAMION, 497 UNIDADES (PKG), IT.1-3/4-10/12');
    INSERT @DescripcionesComerciales VALUES (457, N'NEUMATICOS PARA CAMION, 520 UNIDADES, IT.1/2');
    INSERT @DescripcionesComerciales VALUES (458, N'NEUMATICOS PARA CAMION, 624 UNIDADES (PKG), IT.1/2');
    INSERT @DescripcionesComerciales VALUES (459, N'NEUMATICOS PARA CAMION. 1.280 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (460, N'NEUMATICOS PARA CAMION. 152 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (461, N'Neumaticos para camion. 254 unidades items 1/13 fact. 000008249');
    INSERT @DescripcionesComerciales VALUES (462, N'NEUMATICOS PARA CAMION. 28 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (463, N'NEUMATICOS PARA CAMION. 504 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (464, N'NEUMATICOS PARA CAMION. 512 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (465, N'NEUMATICOS PARA CAMION. 62 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (466, N'NEUMATICOS PARA CAMION.. 16 UNIDADES IT. 6 VER FACT. ..671');
    INSERT @DescripcionesComerciales VALUES (467, N'NEUMATICOS PARA CAMION.. 20 UNIDADES IT. 8,9 VER FACT. ..671');
    INSERT @DescripcionesComerciales VALUES (468, N'NEUMATICOS PARA CAMIONES');
    INSERT @DescripcionesComerciales VALUES (469, N'NEUMATICOS PARA CAMIONES - 110 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (470, N'NEUMATICOS PARA CAMIONES - 1114 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (471, N'NEUMATICOS PARA CAMIONES - 12 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (472, N'NEUMATICOS PARA CAMIONES - 137 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (473, N'NEUMATICOS PARA CAMIONES - 140 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (474, N'NEUMATICOS PARA CAMIONES - 189 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (475, N'NEUMATICOS PARA CAMIONES - 290 UNIDAD (C/U) (Item 1/2 Factura 6254420413)');
    INSERT @DescripcionesComerciales VALUES (476, N'NEUMATICOS PARA CAMIONES - 34 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (477, N'NEUMATICOS PARA CAMIONES - 5 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (478, N'NEUMATICOS PARA CAMIONES - 50 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (479, N'NEUMATICOS PARA CAMIONES - 55 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (480, N'NEUMATICOS PARA CAMIONES - 62 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (481, N'NEUMATICOS PARA CAMIONES - 65 UNIDADES,');
    INSERT @DescripcionesComerciales VALUES (482, N'NEUMATICOS PARA CAMIONES - 8 UNIDADES,');
    INSERT @DescripcionesComerciales VALUES (483, N'NEUMATICOS PARA CAMIONES - 94 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (484, N'NEUMATICOS PARA CAMIONES - 970 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (485, N'NEUMATICOS PARA CAMIONES - IT:1');
    INSERT @DescripcionesComerciales VALUES (486, N'NEUMATICOS PARA CAMIONES ( SET CON CAMARA Y FLAP),- 220 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (487, N'NEUMATICOS PARA CAMIONES (SETS) - 1 SET (Item 6 Factura 2019UGC1015)');
    INSERT @DescripcionesComerciales VALUES (488, N'NEUMATICOS PARA CAMIONES (SETS) - 80 SETS (Item 1/3 Factura 2019UGC1015) NEUMATICOS');
    INSERT @DescripcionesComerciales VALUES (489, N'NEUMATICOS PARA CAMIONES 16 UNID.');
    INSERT @DescripcionesComerciales VALUES (490, N'NEUMATICOS PARA CAMIONES CON CAMARA Y FLAPS,- 156 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (491, N'NEUMATICOS PARA CAMIONES CON CAMARA Y FLAPS,- 30 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (492, N'NEUMATICOS PARA CAMIONES CON CAMARA Y FLAPS,- 42 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (493, N'NEUMATICOS PARA CAMIONES CON CAMARA Y FLAPS. 80 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (494, N'NEUMATICOS PARA CAMIONES CON TUBOS Y FLAPS');
    INSERT @DescripcionesComerciales VALUES (495, N'NEUMATICOS PARA CAMIONES LIVIANOS - 104 UNIDAD (C/U) (Item 12/15 Factura 0044-00007651)');
    INSERT @DescripcionesComerciales VALUES (496, N'NEUMATICOS PARA CAMIONES LIVIANOS - 110 UNIDAD (C/U) (Item 7/9 Factura 0044-00009235)');
    INSERT @DescripcionesComerciales VALUES (497, N'NEUMATICOS PARA CAMIONES LIVIANOS - 128 UNIDAD (C/U) (Item 12/15 Factura 0044-00008575)');
    INSERT @DescripcionesComerciales VALUES (498, N'NEUMATICOS PARA CAMIONES LIVIANOS - 129 UNIDAD (C/U) (Item 14/19 Factura 0044-00008101)');
    INSERT @DescripcionesComerciales VALUES (499, N'NEUMATICOS PARA CAMIONES LIVIANOS - 144 UNIDAD (C/U) (Item 6/10 Factura 0044-00007626)');
    INSERT @DescripcionesComerciales VALUES (500, N'NEUMATICOS PARA CAMIONES LIVIANOS - 155 UNIDAD (C/U) (Item 5/10 Factura 0044-00008693)');
    INSERT @DescripcionesComerciales VALUES (501, N'NEUMATICOS PARA CAMIONES LIVIANOS - 20 UNIDAD (C/U) (Item 1 Factura 0044-00008683)');
    INSERT @DescripcionesComerciales VALUES (502, N'NEUMATICOS PARA CAMIONES LIVIANOS - 20 UNIDAD (C/U) (Item 10 Factura 0044-00009013)');
    INSERT @DescripcionesComerciales VALUES (503, N'NEUMATICOS PARA CAMIONES LIVIANOS - 20 UNIDAD (C/U) (Item 11 Factura 0044-00009183)');
    INSERT @DescripcionesComerciales VALUES (504, N'NEUMATICOS PARA CAMIONES LIVIANOS - 20 UNIDAD (C/U) (Item 16 Factura 0044-00009027)');
    INSERT @DescripcionesComerciales VALUES (505, N'NEUMATICOS PARA CAMIONES LIVIANOS - 28 UNIDAD (C/U) (Item 12/15 Factura 0044-00008255)');
    INSERT @DescripcionesComerciales VALUES (506, N'NEUMATICOS PARA CAMIONES LIVIANOS - 28 UNIDAD (C/U) (Item 15/16 Factura 0044-00007726)');
    INSERT @DescripcionesComerciales VALUES (507, N'NEUMATICOS PARA CAMIONES LIVIANOS - 30 (Item 15 Factura 0044-00007420)');
    INSERT @DescripcionesComerciales VALUES (508, N'NEUMATICOS PARA CAMIONES LIVIANOS - 302 UNIDAD (C/U) (Item 5/14 Factura 0044-00008420)');
    INSERT @DescripcionesComerciales VALUES (509, N'NEUMATICOS PARA CAMIONES LIVIANOS - 37 (Item 13/14 Factura 0044-00007409.)');
    INSERT @DescripcionesComerciales VALUES (510, N'NEUMATICOS PARA CAMIONES LIVIANOS - 410 UNIDAD (C/U) (Item 1/5 Factura 0044-00007668)');
    INSERT @DescripcionesComerciales VALUES (511, N'NEUMATICOS PARA CAMIONES LIVIANOS - 46 UNIDAD (C/U) (Item 6/7 Factura 0044-00007846)');
    INSERT @DescripcionesComerciales VALUES (512, N'NEUMATICOS PARA CAMIONES LIVIANOS - 51 UNIDAD (C/U) (Item 7/10 Factura 0044-00009127)');
    INSERT @DescripcionesComerciales VALUES (513, N'NEUMATICOS PARA CAMIONES LIVIANOS - 59 UNIDAD (C/U) (Item 3/7 Factura 0044-00008051)');
    INSERT @DescripcionesComerciales VALUES (514, N'NEUMATICOS PARA CAMIONES LIVIANOS - 62 UNIDAD (C/U) (Item 9/10 Factura 004400009330)');
    INSERT @DescripcionesComerciales VALUES (515, N'NEUMATICOS PARA CAMIONES LIVIANOS - 64 UNIDAD (C/U) (Item 11/12 Factura 0044-00007524)');
    INSERT @DescripcionesComerciales VALUES (516, N'NEUMATICOS PARA CAMIONES LIVIANOS - 68 UNIDAD (C/U) (Item 7/10 Factura 0044-00009219)');
    INSERT @DescripcionesComerciales VALUES (517, N'NEUMATICOS PARA CAMIONES LIVIANOS - 70 UNIDAD (C/U) (Item 8/10 Factura 0044-00009195)');
    INSERT @DescripcionesComerciales VALUES (518, N'NEUMATICOS PARA CAMIONES LIVIANOS - 83 UNIDAD (C/U) (Item 2/3 Factura 0044-00007876)');
    INSERT @DescripcionesComerciales VALUES (519, N'NEUMATICOS PARA CAMIONES LIVIANOS - 91 UNIDAD (C/U) (Item 4/12 Factura 0044-00008940)');
    INSERT @DescripcionesComerciales VALUES (520, N'NEUMATICOS PARA CAMIONES LIVIANOS Y PESADOS');
    INSERT @DescripcionesComerciales VALUES (521, N'NEUMATICOS PARA CAMIONES,-');
    INSERT @DescripcionesComerciales VALUES (522, N'NEUMATICOS PARA CAMIONES, ( CON CAMARA Y FLAP ),- 85 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (523, N'NEUMATICOS PARA CAMIONES,- ( SET CON CAMARA Y FLAP),-');
    INSERT @DescripcionesComerciales VALUES (524, N'NEUMATICOS PARA CAMIONES,- 10 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (525, N'NEUMATICOS PARA CAMIONES,- 1006 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (526, N'NEUMATICOS PARA CAMIONES,- 102 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (527, N'NEUMATICOS PARA CAMIONES,- 1025 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (528, N'NEUMATICOS PARA CAMIONES,- 103 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (529, N'NEUMATICOS PARA CAMIONES,- 106 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (530, N'NEUMATICOS PARA CAMIONES,- 1070 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (531, N'NEUMATICOS PARA CAMIONES,- 110 UNIDADES,-(TIRAS, TUBOS Y FLAPS FACT.7541-IT 1-40 UNID-IT.2');
    INSERT @DescripcionesComerciales VALUES (532, N'NEUMATICOS PARA CAMIONES,- 112 SET CON CAMARA Y FLAP,-');
    INSERT @DescripcionesComerciales VALUES (533, N'NEUMATICOS PARA CAMIONES,- 112 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (534, N'NEUMATICOS PARA CAMIONES,- 116 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (535, N'NEUMATICOS PARA CAMIONES,- 120 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (536, N'NEUMATICOS PARA CAMIONES,- 1236 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (537, N'NEUMATICOS PARA CAMIONES,- 132 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (538, N'NEUMATICOS PARA CAMIONES,- 1360 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (539, N'NEUMATICOS PARA CAMIONES,- 143 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (540, N'NEUMATICOS PARA CAMIONES,- 144 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (541, N'NEUMATICOS PARA CAMIONES,- 146 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (542, N'NEUMATICOS PARA CAMIONES,- 150 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (543, N'NEUMATICOS PARA CAMIONES,- 156 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (544, N'NEUMATICOS PARA CAMIONES,- 1570 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (545, N'NEUMATICOS PARA CAMIONES,- 165 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (546, N'NEUMATICOS PARA CAMIONES,- 170 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (547, N'NEUMATICOS PARA CAMIONES,- 18 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (548, N'NEUMATICOS PARA CAMIONES,- 184 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (549, N'NEUMATICOS PARA CAMIONES,- 19 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (550, N'NEUMATICOS PARA CAMIONES,- 1900 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (551, N'NEUMATICOS PARA CAMIONES,- 2 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (552, N'NEUMATICOS PARA CAMIONES,- 20 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (553, N'NEUMATICOS PARA CAMIONES,- 210 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (554, N'NEUMATICOS PARA CAMIONES,- 211 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (555, N'NEUMATICOS PARA CAMIONES,- 220 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (556, N'NEUMATICOS PARA CAMIONES,- 24 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (557, N'NEUMATICOS PARA CAMIONES,- 240 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (558, N'NEUMATICOS PARA CAMIONES,- 248 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (559, N'NEUMATICOS PARA CAMIONES,- 252 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (560, N'NEUMATICOS PARA CAMIONES,- 256 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (561, N'NEUMATICOS PARA CAMIONES,- 28 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (562, N'NEUMATICOS PARA CAMIONES,- 3 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (563, N'NEUMATICOS PARA CAMIONES,- 31 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (564, N'NEUMATICOS PARA CAMIONES,- 32 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (565, N'NEUMATICOS PARA CAMIONES,- 321 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (566, N'NEUMATICOS PARA CAMIONES,- 368 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (567, N'NEUMATICOS PARA CAMIONES,- 37 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (568, N'NEUMATICOS PARA CAMIONES,- 40 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (569, N'NEUMATICOS PARA CAMIONES,- 42 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (570, N'NEUMATICOS PARA CAMIONES,- 421 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (571, N'NEUMATICOS PARA CAMIONES,- 44 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (572, N'NEUMATICOS PARA CAMIONES,- 460 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (573, N'NEUMATICOS PARA CAMIONES,- 48 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (574, N'NEUMATICOS PARA CAMIONES,- 52 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (575, N'NEUMATICOS PARA CAMIONES,- 54 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (576, N'NEUMATICOS PARA CAMIONES,- 56 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (577, N'NEUMATICOS PARA CAMIONES,- 58 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (578, N'NEUMATICOS PARA CAMIONES,- 6 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (579, N'NEUMATICOS PARA CAMIONES,- 60 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (580, N'NEUMATICOS PARA CAMIONES,- 638 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (581, N'NEUMATICOS PARA CAMIONES,- 64 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (582, N'NEUMATICOS PARA CAMIONES,- 65 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (583, N'NEUMATICOS PARA CAMIONES,- 70 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (584, N'NEUMATICOS PARA CAMIONES,- 72 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (585, N'NEUMATICOS PARA CAMIONES,- 729 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (586, N'NEUMATICOS PARA CAMIONES,- 750 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (587, N'NEUMATICOS PARA CAMIONES,- 756 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (588, N'NEUMATICOS PARA CAMIONES,- 78 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (589, N'NEUMATICOS PARA CAMIONES,- 8 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (590, N'NEUMATICOS PARA CAMIONES,- 80 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (591, N'NEUMATICOS PARA CAMIONES,- 82 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (592, N'NEUMATICOS PARA CAMIONES,- 83 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (593, N'NEUMATICOS PARA CAMIONES,- 87 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (594, N'NEUMATICOS PARA CAMIONES,- 88 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (595, N'NEUMATICOS PARA CAMIONES,- 898 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (596, N'NEUMATICOS PARA CAMIONES,- 90 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (597, N'NEUMATICOS PARA CAMIONES,- 91 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (598, N'NEUMATICOS PARA CAMIONES,- 92 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (599, N'NEUMATICOS PARA CAMIONES,- 920 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (600, N'NEUMATICOS PARA CAMIONES,- 93 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (601, N'NEUMATICOS PARA CAMIONES,- 97 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (602, N'NEUMATICOS PARA CAMIONES, CON CAMARA Y FLAP. 1.204 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (603, N'NEUMATICOS PARA CAMIONES. 108 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (604, N'NEUMATICOS PARA CAMIONES. 15 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (605, N'NEUMATICOS PARA CAMIONES. 156 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (606, N'NEUMATICOS PARA CAMIONES. 172 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (607, N'NEUMATICOS PARA CAMIONES. 178 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (608, N'NEUMATICOS PARA CAMIONES. 180 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (609, N'NEUMATICOS PARA CAMIONES. 188 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (610, N'NEUMATICOS PARA CAMIONES. 20 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (611, N'NEUMATICOS PARA CAMIONES. 232 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (612, N'NEUMATICOS PARA CAMIONES. 24 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (613, N'NEUMATICOS PARA CAMIONES. 273 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (614, N'NEUMATICOS PARA CAMIONES. 30 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (615, N'NEUMATICOS PARA CAMIONES. 318 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (616, N'NEUMATICOS PARA CAMIONES. 320 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (617, N'NEUMATICOS PARA CAMIONES. 45 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (618, N'NEUMATICOS PARA CAMIONES. 50 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (619, N'NEUMATICOS PARA CAMIONES. 56 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (620, N'NEUMATICOS PARA CAMIONES. 8 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (621, N'NEUMATICOS PARA CAMIONES. 87 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (622, N'NEUMATICOS PARA CAMIONES. 88 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (623, N'NEUMATICOS PARA CAMIONES-100 UNID');
    INSERT @DescripcionesComerciales VALUES (624, N'NEUMATICOS PARA CAMIONES-104 UNID.');
    INSERT @DescripcionesComerciales VALUES (625, N'NEUMATICOS PARA CAMIONES-108 UNID');
    INSERT @DescripcionesComerciales VALUES (626, N'NEUMATICOS PARA CAMIONES-115 UNID.');
    INSERT @DescripcionesComerciales VALUES (627, N'NEUMATICOS PARA CAMIONES-12 UNID.');
    INSERT @DescripcionesComerciales VALUES (628, N'NEUMATICOS PARA CAMIONES-130 UNID.');
    INSERT @DescripcionesComerciales VALUES (629, N'NEUMATICOS PARA CAMIONES-133 UNID.');
    INSERT @DescripcionesComerciales VALUES (630, N'NEUMATICOS PARA CAMIONES-1332 UNID.');
    INSERT @DescripcionesComerciales VALUES (631, N'NEUMATICOS PARA CAMIONES-18 UNID.');
    INSERT @DescripcionesComerciales VALUES (632, N'NEUMATICOS PARA CAMIONES-185 UNID.');
    INSERT @DescripcionesComerciales VALUES (633, N'NEUMATICOS PARA CAMIONES-20 UNID.');
    INSERT @DescripcionesComerciales VALUES (634, N'NEUMATICOS PARA CAMIONES-202 UNID');
    INSERT @DescripcionesComerciales VALUES (635, N'NEUMATICOS PARA CAMIONES-204 UNID.');
    INSERT @DescripcionesComerciales VALUES (636, N'NEUMATICOS PARA CAMIONES-22 UNID');
    INSERT @DescripcionesComerciales VALUES (637, N'NEUMATICOS PARA CAMIONES-24 UNID.');
    INSERT @DescripcionesComerciales VALUES (638, N'NEUMATICOS PARA CAMIONES-252 PIEZAS');
    INSERT @DescripcionesComerciales VALUES (639, N'NEUMATICOS PARA CAMIONES-261 UNID.');
    INSERT @DescripcionesComerciales VALUES (640, N'NEUMATICOS PARA CAMIONES-30 UNID.');
    INSERT @DescripcionesComerciales VALUES (641, N'NEUMATICOS PARA CAMIONES-32 UNID.');
    INSERT @DescripcionesComerciales VALUES (642, N'NEUMATICOS PARA CAMIONES-322 UNID.');
    INSERT @DescripcionesComerciales VALUES (643, N'NEUMATICOS PARA CAMIONES-340 UNID.');
    INSERT @DescripcionesComerciales VALUES (644, N'NEUMATICOS PARA CAMIONES-37 UNID.');
    INSERT @DescripcionesComerciales VALUES (645, N'NEUMATICOS PARA CAMIONES-44 UNID');
    INSERT @DescripcionesComerciales VALUES (646, N'NEUMATICOS PARA CAMIONES-44 UNID.');
    INSERT @DescripcionesComerciales VALUES (647, N'NEUMATICOS PARA CAMIONES-50 UNID');
    INSERT @DescripcionesComerciales VALUES (648, N'NEUMATICOS PARA CAMIONES-50 UNID.');
    INSERT @DescripcionesComerciales VALUES (649, N'NEUMATICOS PARA CAMIONES-60 UNID');
    INSERT @DescripcionesComerciales VALUES (650, N'NEUMATICOS PARA CAMIONES-60 UNID.');
    INSERT @DescripcionesComerciales VALUES (651, N'NEUMATICOS PARA CAMIONES-620 UNID');
    INSERT @DescripcionesComerciales VALUES (652, N'NEUMATICOS PARA CAMIONES-71 UNID');
    INSERT @DescripcionesComerciales VALUES (653, N'NEUMATICOS PARA CAMIONES-720 UNID.');
    INSERT @DescripcionesComerciales VALUES (654, N'NEUMATICOS PARA CAMIONES-73 UNID');
    INSERT @DescripcionesComerciales VALUES (655, N'NEUMATICOS PARA CAMIONES-8 UNID.');
    INSERT @DescripcionesComerciales VALUES (656, N'NEUMATICOS PARA CAMON ITEM 1 -25 unidades');
    INSERT @DescripcionesComerciales VALUES (657, N'NEUMATICOS PARA VEHICULOS AUTOMOTOES 12 UNIDADES IT36');
    INSERT @DescripcionesComerciales VALUES (658, N'NEUMATICOS PARA VEHICULOS AUTOMOTORES 130 UNIDADES IT. 12/16 . 21/24');
    INSERT @DescripcionesComerciales VALUES (659, N'NEUMATICOS PARA VEHICULOS AUTOMOTORES 132 UNIDADES IT. 4- 6/7 - 13/14 - 16 - 18/19');
    INSERT @DescripcionesComerciales VALUES (660, N'NEUMATICOS PARA VEHICULOS AUTOMOTORES 20 UNIDADES IT.9');
    INSERT @DescripcionesComerciales VALUES (661, N'NEUMATICOS PARA VEHICULOS AUTOMOTORES 24 UNIDADES IT. 14 - 16');
    INSERT @DescripcionesComerciales VALUES (662, N'NEUMATICOS PARA VEHICULOS AUTOMOTORES 32 UNIDADES IT.5 - 11');
    INSERT @DescripcionesComerciales VALUES (663, N'NEUMATICOS PARA VEHICULOS AUTOMOTORES 60 UNIDADES IT.10/11 - 16/17');
    INSERT @DescripcionesComerciales VALUES (664, N'NEUMATICOS PARA VEHICULOS AUTOMOTORES 72 UNIDADES IT. 2 - 20/23');
    INSERT @DescripcionesComerciales VALUES (665, N'NEUMATICOS,- 30 UNIDADES,-');
    INSERT @DescripcionesComerciales VALUES (666, N'NEUMATICOS.');
    INSERT @DescripcionesComerciales VALUES (667, N'NEUMATICOS. 270 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (668, N'NEUMATICOS. 284 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (669, N'NEUMATICOS. 30 UNIDADES. FAC. 000008');
    INSERT @DescripcionesComerciales VALUES (670, N'NEUMATICOS. 304 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (671, N'NEUMATICOS. 32 UNIDADES. ITEM 1/3.');
    INSERT @DescripcionesComerciales VALUES (672, N'NEUMATICOS. 6 UNIDADES. ITEM 1.');
    INSERT @DescripcionesComerciales VALUES (673, N'NEUMATICOS. IT.1 . - 262 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (674, N'NEUMATICOS. ITEM 1 . - 252 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (675, N'NEUMATICOS. ITEM 1. - 16 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (676, N'NEUMATICOS. ITEM 1. - 24 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (677, N'NEUMATICOS. ITEM 1. - 252 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (678, N'NEUMATICOS. ITEM 1. - 252 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (679, N'NEUMATICOS. ITEM 1. - 260 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (680, N'NEUMATICOS. ITEM 1. - 262 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (681, N'NEUMATICOS. ITEM 1. - 265 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (682, N'NEUMATICOS. ITEM 1. - 63 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (683, N'NEUMATICOS. ITEM 1/10. - 440 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (684, N'NEUMATICOS. ITEM 1/2,10,12/14. - 93 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (685, N'NEUMATICOS. ITEM 1/2. - 252 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (686, N'NEUMATICOS. ITEM 1/2. - 262 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (687, N'NEUMATICOS. ITEM 1/3,14,28,30. - 129 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (688, N'NEUMATICOS. ITEM 1/5. - 272 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (689, N'NEUMATICOS. ITEM 1/6. - 261 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (690, N'NEUMATICOS. ITEM 1/6. - 287 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (691, N'NEUMATICOS. ITEM 1/6. - 292 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (692, N'NEUMATICOS. ITEM 1/6. - 304 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (693, N'NEUMATICOS. ITEM 1/7. - 319 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (694, N'NEUMATICOS. ITEM 1/8. - 299 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (695, N'NEUMATICOS. ITEM 1/8. - 319 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (696, N'NEUMATICOS. ITEM 1/9. - 330 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (697, N'NEUMATICOS. ITEM 1/9. - 334 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (698, N'NEUMATICOS. ITEM 10. - 20 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (699, N'NEUMATICOS. ITEM 2/3. - 24 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (700, N'NEUMATICOS. ITEM 3. - 20 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (701, N'NEUMATICOS. ITEM 3. - 50 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (702, N'NEUMATICOS. ITEM 4/14,17. - 266 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (703, N'NEUMATICOS. ITEM 4/16 . - 299 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (704, N'NEUMATICOS. ITEM 7/8 . - 238 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (705, N'NEUMATICOS. ITEM 9/13. - 215 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (706, N'NEUMATICOS. ITEMS 1,14/15. - 160 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (707, N'NEUMATICOS. ITEMS 1,6,9/12,21/22. - 258 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (708, N'NEUMATICOS. ITEMS 1/16. - 320 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (709, N'NEUMATICOS. ITEMS 1/2. - 254 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (710, N'NEUMATICOS. ITEMS 1/2. - 270 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (711, N'NEUMATICOS. ITEMS 1/2. - 280 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (712, N'NEUMATICOS. ITEMS 1/3. - 236 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (713, N'NEUMATICOS. ITEMS 1/3. - 251 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (714, N'NEUMATICOS. ITEMS 1/3. - 267 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (715, N'NEUMATICOS. ITEMS 1/3. - 288 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (716, N'NEUMATICOS. ITEMS 1/4. - 248 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (717, N'NEUMATICOS. ITEMS 1/4. - 292 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (718, N'NEUMATICOS. ITEMS 1/5. - 258 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (719, N'NEUMATICOS. ITEMS 1/5. - 259 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (720, N'NEUMATICOS. ITEMS 1/5. - 266 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (721, N'NEUMATICOS. ITEMS 1/5. - 267 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (722, N'NEUMATICOS. ITEMS 1/5. - 269 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (723, N'NEUMATICOS. ITEMS 1/5. - 272 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (724, N'NEUMATICOS. ITEMS 1/5. - 276 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (725, N'NEUMATICOS. ITEMS 1/7. - 304 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (726, N'NEUMATICOS. ITEMS 1/7. - 326 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (727, N'NEUMATICOS. ITEMS 1/8. - 278 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (728, N'NEUMATICOS. ITEMS 1/8. - 291 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (729, N'NEUMATICOS. ITEMS 1/9. - 434 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (730, N'NEUMATICOS. ITEMS 10,12/16. - 247 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (731, N'NEUMATICOS. ITEMS 10/11,14/21. - 214 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (732, N'NEUMATICOS. ITEMS 11,14/22. - 229 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (733, N'NEUMATICOS. ITEMS 11.15/17,19/23. - 206 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (734, N'NEUMATICOS. ITEMS 11/12,26,28/29. - 93 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (735, N'NEUMATICOS. ITEMS 11/21. - 232 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (736, N'NEUMATICOS. ITEMS 12/20. - 209 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (737, N'NEUMATICOS. ITEMS 2,7/8,15/16. - 129 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (738, N'NEUMATICOS. ITEMS 2/12. - 271 UNIDADES (DE LOS CUALES 81 SON SET).');
    INSERT @DescripcionesComerciales VALUES (739, N'NEUMATICOS. ITEMS 2/3. - 90 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (740, N'NEUMATICOS. ITEMS 2/9. - 284 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (741, N'NEUMATICOS. ITEMS 3,11. - 91 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (742, N'NEUMATICOS. ITEMS 3/4. - 50 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (743, N'NEUMATICOS. ITEMS 4,10. - 54 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (744, N'NEUMATICOS. ITEMS 4,7/15. - 242 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (745, N'NEUMATICOS. ITEMS 4/15. - 1190 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (746, N'NEUMATICOS. ITEMS 5,10/11. - 48 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (747, N'NEUMATICOS. ITEMS 5/14. - 238 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (748, N'NEUMATICOS. ITEMS 5/15. - 251 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (749, N'NEUMATICOS. ITEMS 6,8/13,16,18. - 214 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (750, N'NEUMATICOS. ITEMS 6/10. - 206 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (751, N'NEUMATICOS. ITEMS 7,9/21. - 280 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (752, N'NEUMATICOS. ITEMS 8/9,12/22. - 207 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (753, N'NEUMATICOS. ITEMS 8/9. - 44 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (754, N'NEUMATICOS. ITEMS 9,11/20. - 218 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (755, N'NEUMATICOS. ITEMS 9/11,14/25. - 229 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (756, N'NEUMATICOS. ITEMS 9/13. - 253 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (757, N'NEUMATICOS. ITEMS 9/15. - 326 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (758, N'NEUMATICOS. ITESM 6/7,12/13. - 246 UNIDADES.');
    INSERT @DescripcionesComerciales VALUES (759, N'NEUMATICOS. SON 116 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (760, N'NEUMATICOS. SON 285 UNIDADES');
    INSERT @DescripcionesComerciales VALUES (761, N'NEUMATICOS...123 UNIDADES IT, 7/10 VER FACT');
    INSERT @DescripcionesComerciales VALUES (762, N'NEUMATICOS..100 UNIDADES IT, 1/2 FACT 7246');
    INSERT @DescripcionesComerciales VALUES (763, N'NEUMATICOS..108 UNIDADES IT, 1/2 VER FACT8103');
    INSERT @DescripcionesComerciales VALUES (764, N'NEUMATICOS..12 UNIDADES IT, 1 VER FACT');
    INSERT @DescripcionesComerciales VALUES (765, N'NEUMATICOS..120 UNIDADES IT, 1/5 VER FACT 6072');
    INSERT @DescripcionesComerciales VALUES (766, N'neumaticos..122 unidades it, 1/7 ver fact 8671');
    INSERT @DescripcionesComerciales VALUES (767, N'NEUMATICOS..161 UNIDADES IT, 1/3 VER FACT..6504');
    INSERT @DescripcionesComerciales VALUES (768, N'NEUMATICOS..168 UNIDADES IT, 4/8 VER FACT');
    INSERT @DescripcionesComerciales VALUES (769, N'NEUMATICOS..170 UNIDADES IT, 1/4 FACT 7938');
    INSERT @DescripcionesComerciales VALUES (770, N'neumaticos..194 unidades it, 1/3 fact 5901');
    INSERT @DescripcionesComerciales VALUES (771, N'NEUMATICOS..194 UNIDADES IT, 2/3 VER FACT ADJUNTA');
    INSERT @DescripcionesComerciales VALUES (772, N'neumaticos..198 unidades it, 2/10 ver fact 7197');
    INSERT @DescripcionesComerciales VALUES (773, N'NEUMATICOS..2 UNIDADES IT.1 FACT 333');
    INSERT @DescripcionesComerciales VALUES (774, N'NEUMATICOS..20 UNIDADES IT, 1 VER FACT');
    INSERT @DescripcionesComerciales VALUES (775, N'neumaticos..20 unidades it, 1 ver fact 7433');
    INSERT @DescripcionesComerciales VALUES (776, N'neumaticos..210 unidades it, 1/8 ver fact 9195');
    INSERT @DescripcionesComerciales VALUES (777, N'NEUMATICOS..217 UNIDADES IT, 1/12 VER FACT 07');
    INSERT @DescripcionesComerciales VALUES (778, N'NEUMATICOS..229 UNIDADES IT 1/7 VER FACT');
    INSERT @DescripcionesComerciales VALUES (779, N'NEUMATICOS..237 UNIDADES IT, 1/7 VER FACT 30');
    INSERT @DescripcionesComerciales VALUES (780, N'NEUMATICOS..245 UNIDADES IT, 1/2 VER FACT');
    INSERT @DescripcionesComerciales VALUES (781, N'NEUMATICOS..247 UNIDADES IT, 1/6 VER FACT');
    INSERT @DescripcionesComerciales VALUES (782, N'NEUMATICOS..249 UNIDADES IT, 1/9 VER FACT');
    INSERT @DescripcionesComerciales VALUES (783, N'NEUMATICOS..249 UNIDADES IT,1/5 VER FACT');
    INSERT @DescripcionesComerciales VALUES (784, N'NEUMATICOS..250 UNIDADES IT, 1/10 VER FACT');
    INSERT @DescripcionesComerciales VALUES (785, N'NEUMATICOS..250 UNIDADES IT, 1/11 VER FACT');
    INSERT @DescripcionesComerciales VALUES (786, N'NEUMATICOS..250 UNIDADES IT, 1/14 VER FACT');
    INSERT @DescripcionesComerciales VALUES (787, N'NEUMATICOS..250 UNIDADES IT, 1/3 VER FACT');
    INSERT @DescripcionesComerciales VALUES (788, N'NEUMATICOS..250 UNIDADES IT, 1/4 VER FACT');
    INSERT @DescripcionesComerciales VALUES (789, N'NEUMATICOS..250 UNIDADES IT, 1/5 VER FACT');
    INSERT @DescripcionesComerciales VALUES (790, N'neumaticos..250 unidades it, 1/6 ver fact 7362');
    INSERT @DescripcionesComerciales VALUES (791, N'NEUMATICOS..250 UNIDADES IT, 1/7 VER FACT');
    INSERT @DescripcionesComerciales VALUES (792, N'NEUMATICOS..250 UNIDADES IT, 1/8 VER FACT');
    INSERT @DescripcionesComerciales VALUES (793, N'NEUMATICOS..250 UNIDADES IT, 1/9 VER FACT');
    INSERT @DescripcionesComerciales VALUES (794, N'NEUMATICOS..250 UNIDADES IT, 3/12 VER FACT');
    INSERT @DescripcionesComerciales VALUES (795, N'NEUMATICOS..252 UNIDADES IT, 2/11 VER FACT');
    INSERT @DescripcionesComerciales VALUES (796, N'NEUMATICOS..257 UNIDADES IT, 1/13 VER FACT');
    INSERT @DescripcionesComerciales VALUES (797, N'NEUMATICOS..259 UNIDADES IT, 1/11 VER FACT');
    INSERT @DescripcionesComerciales VALUES (798, N'NEUMATICOS..262 UNIDADES IT, 1/4 VER FACT');
    INSERT @DescripcionesComerciales VALUES (799, N'NEUMATICOS..270 UNIDADES IT, 1/9 VER FACT');
    INSERT @DescripcionesComerciales VALUES (800, N'NEUMATICOS..282 UNIDADES IT, 1/5 VER FACT');
    INSERT @DescripcionesComerciales VALUES (801, N'NEUMATICOS..299 UNIDADES IT, 1/3 VER FACT');
    INSERT @DescripcionesComerciales VALUES (802, N'NEUMATICOS..3 UNIDADES IT, 1 VER FACT 08');
    INSERT @DescripcionesComerciales VALUES (803, N'NEUMATICOS..30 UNIDADES IT, 1 VER FACT');
    INSERT @DescripcionesComerciales VALUES (804, N'NEUMATICOS..30 UNIDADES IT, 1 VER FACT 6071');
    INSERT @DescripcionesComerciales VALUES (805, N'NEUMATICOS..30 UNIDADES IT, 1 VER FACT 7247');
    INSERT @DescripcionesComerciales VALUES (806, N'NEUMATICOS..30 UNIDADES IT, 1 VER FACT 85');
    INSERT @DescripcionesComerciales VALUES (807, N'NEUMATICOS..304 UNIDADES IT, 1 VER FACT');
    INSERT @DescripcionesComerciales VALUES (808, N'NEUMATICOS..309 UNIDADES IT, 1/10 FACT 5959');
    INSERT @DescripcionesComerciales VALUES (809, N'NEUMATICOS..312 UNIDADES IT, 1 VER FACT');
    INSERT @DescripcionesComerciales VALUES (810, N'neumaticos..312 unidades it, 1 ver fact 6853');
    INSERT @DescripcionesComerciales VALUES (811, N'neumaticos..32 unidades it, 1/2 ver fact');
    INSERT @DescripcionesComerciales VALUES (812, N'NEUMATICOS..33 UNIDADES IT, 1/3 VER FACT');
    INSERT @DescripcionesComerciales VALUES (813, N'neumaticos..42 unidades it,1/2 ver fact 8673');
    INSERT @DescripcionesComerciales VALUES (814, N'NEUMATICOS..50 UNIDADES IT, 1 VER FACT 7984');
    INSERT @DescripcionesComerciales VALUES (815, N'neumaticos..50 unidades it, 1 ver fact 8529');
    INSERT @DescripcionesComerciales VALUES (816, N'NEUMATICOS..50 UNIDADES IT, 4 VER FACT 9252');
    INSERT @DescripcionesComerciales VALUES (817, N'NEUMATICOS..52 UNIDADES IT, 1/2 VER FACT 8952');
    INSERT @DescripcionesComerciales VALUES (818, N'neumaticos..60 unidades it, 1 ver fact5900');
    INSERT @DescripcionesComerciales VALUES (819, N'neumaticos..65 unidades it, 1/8 fact 8528');
    INSERT @DescripcionesComerciales VALUES (820, N'NEUMATICOS..68 UNIDADES IT, 1/2 VER FACT 7449');
    INSERT @DescripcionesComerciales VALUES (821, N'NEUMATICOS..72 UNIDADES IT, 1/3 VER FACT');
    INSERT @DescripcionesComerciales VALUES (822, N'NEUMATICOS..8 UNIDADES IT,1 VER FACT 7100');
    INSERT @DescripcionesComerciales VALUES (823, N'NEUMATICOS..80 UNIDADES IT, 1/6 VER FACT 7099');
    INSERT @DescripcionesComerciales VALUES (824, N'NEUMATICOS..80 UNIDADEWS IT, 1/5 VER FACT 9255');
    INSERT @DescripcionesComerciales VALUES (825, N'NEUMATICOS..83 UNIDADES IT, 8/12 VER VFACT');
    INSERT @DescripcionesComerciales VALUES (826, N'NEUMATICOS: 11 UNID.-ITEM.7.-FACT.B006000001631');
    INSERT @DescripcionesComerciales VALUES (827, N'NEUMATICOS: 12 UNID.-ITEM.1 y 2 UNID.-ITEM.7.-FACT.B006000001821');
    INSERT @DescripcionesComerciales VALUES (828, N'NEUMATICOS: 20 UNID.-ITEM.7.-FACT.B006000001866');
    INSERT @DescripcionesComerciales VALUES (829, N'NEUMATICOS: 4 UNID.-ITEM.2.-FACT.B006000001866');
    INSERT @DescripcionesComerciales VALUES (830, N'NEUMATICOS: 8 UNID.-ITEM.1, 5 UNID.-ITEM.3 y 16 UNID.-ITEM.8.-FACT.B006000001821');
    INSERT @DescripcionesComerciales VALUES (831, N'NEUMATICOS: 8 UNID.-ITEM.1.-FACT.B006000001821');
    INSERT @DescripcionesComerciales VALUES (832, N'NEUMATICOS: 8 UNID.-ITEM.6 y 8 UNID.-ITEM.7.-FACT.B006000001866');
    INSERT @DescripcionesComerciales VALUES (833, N'NEUMATICOS: 8 UNID.-ITEM.6, 4 UNID.-ITEM.21, 8 UNID.-ITEM.22 y 4 UNID.-ITEM.34.-FACT.EET18');
    INSERT @DescripcionesComerciales VALUES (834, N'NEUMATICOS: 8 UNID.-ITEM.7 y 8 UNID.-ITEM.9.-FACT.B006000001821');
    INSERT @DescripcionesComerciales VALUES (835, N'NEUMATICOS: 8 UNID.-ITEM.8.-FACT.EET190361880');
    INSERT @DescripcionesComerciales VALUES (836, N'NEUMTACIO PARA CAMION - 248 UNID.');
    INSERT @DescripcionesComerciales VALUES (837, N'NEUMTICOS PARA VEHICULOS AUTOMOTORES 46 UNIDADES IT.17/18 -20/21');
    INSERT @DescripcionesComerciales VALUES (838, N'NEUTAITCOS PARA CAMION 247 UNID');
    INSERT @DescripcionesComerciales VALUES (839, N'NEUTAITCOS PARA CAMION 250 UNID IT 1/2');
    INSERT @DescripcionesComerciales VALUES (840, N'NUEMATICOS');
    INSERT @DescripcionesComerciales VALUES (841, N'nuematicos it. 1/7');
    INSERT @DescripcionesComerciales VALUES (842, N'ROADWING 295/80 R22.5 WS628');
    INSERT @DescripcionesComerciales VALUES (843, N'SET DE NEUMATICOS PARA CAMIONES (CON CAMARA Y PROTECTOR )');
    INSERT @DescripcionesComerciales VALUES (844, N'SET NEUMATICOS CAMION + CAMARA + FLAP - 173 SETS.');

    SET IDENTITY_INSERT [03.Entrega].[dbo].[DescripcionesComerciales] ON;

    MERGE INTO [03.Entrega].[dbo].[DescripcionesComerciales] AS [TARGET]
    USING @DescripcionesComerciales AS [SOURCE]
    ON [TARGET].[DescripcionComercialID] = [SOURCE].[DescripcionComercialID]
    WHEN MATCHED THEN
        UPDATE SET 
            [TARGET].[Nombre] = [SOURCE].[Nombre]
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([DescripcionComercialID], [Nombre])
        VALUES ([SOURCE].[DescripcionComercialID], [SOURCE].[Nombre]);

    SET IDENTITY_INSERT [03.Entrega].[dbo].[DescripcionesComerciales] OFF;
END;
GO

IF OBJECT_ID('[03.Entrega].[dbo].[Empresas]', 'U') IS NOT NULL
BEGIN
    DECLARE @Empresas TABLE (
        [EmpresaID] [INT]			NOT NULL
	    ,[Nombre] [NVARCHAR](MAX)	NULL
    );

    INSERT @Empresas VALUES (1, N'ABANUR SOCIEDAD ANONIMA');
    INSERT @Empresas VALUES (2, N'ABLENVEL S A');
    INSERT @Empresas VALUES (3, N'AMIRAL S A');
    INSERT @Empresas VALUES (4, N'ASIATEC LTDA');
    INSERT @Empresas VALUES (5, N'BELASAN SOCIEDAD ANONIMA');
    INSERT @Empresas VALUES (6, N'BENCO S A');
    INSERT @Empresas VALUES (7, N'BRASEN SOCIEDAD ANONIMA');
    INSERT @Empresas VALUES (8, N'COMPONENTES & ACCESORIOS S R L');
    INSERT @Empresas VALUES (9, N'CTC FOREST SOCIEDAD DE RESPONSABILIDAD LIMITADA');
    INSERT @Empresas VALUES (10, N'DANIEL IGLESIAS GARCIA LTDA');
    INSERT @Empresas VALUES (11, N'DIGNEX S A');
    INSERT @Empresas VALUES (12, N'DONIRAL SOCIEDAD ANONIMA');
    INSERT @Empresas VALUES (13, N'DRISLEW INTERNATIONAL S.A.');
    INSERT @Empresas VALUES (14, N'DUNA LTDA');
    INSERT @Empresas VALUES (15, N'DURM SOCIEDAD ANONIMA');
    INSERT @Empresas VALUES (16, N'EDUARDO DANIEL AGUILERA VAZQUEZ');
    INSERT @Empresas VALUES (17, N'EQUIS DE S.A.');
    INSERT @Empresas VALUES (18, N'EVERLYN S A');
    INSERT @Empresas VALUES (19, N'FABRICA URUGUAYA DE TRAILERS S A');
    INSERT @Empresas VALUES (20, N'FERASTAR S A');
    INSERT @Empresas VALUES (21, N'FERNANDEZ DEVITTA SANDRO ROBIN');
    INSERT @Empresas VALUES (22, N'FUBENIL S.A.');
    INSERT @Empresas VALUES (23, N'GADEREY S A');
    INSERT @Empresas VALUES (24, N'GAMA NEUMATICOS S.R.L.');
    INSERT @Empresas VALUES (25, N'GRUPO CBT S R L');
    INSERT @Empresas VALUES (26, N'GUBALEN SOCIEDAD ANONIMA');
    INSERT @Empresas VALUES (27, N'IDACAR S A');
    INSERT @Empresas VALUES (28, N'INTERAGROVIAL S A');
    INSERT @Empresas VALUES (29, N'KANSI S.R.L.');
    INSERT @Empresas VALUES (30, N'LIEPSI S A');
    INSERT @Empresas VALUES (31, N'LUCO LTDA.');
    INSERT @Empresas VALUES (32, N'M Y N S R L');
    INSERT @Empresas VALUES (33, N'MANFRA LTDA.');
    INSERT @Empresas VALUES (34, N'MARNU S A');
    INSERT @Empresas VALUES (35, N'MAYANS HEIT JUAN RAMON');
    INSERT @Empresas VALUES (36, N'MBICHY SA');
    INSERT @Empresas VALUES (37, N'MERBE LIMITADA');
    INSERT @Empresas VALUES (38, N'MONNEGUS SAS');
    INSERT @Empresas VALUES (39, N'NAVIJOR SOCIEDAD ANONIMA');
    INSERT @Empresas VALUES (40, N'NEUMATICOS DEL L LTDA');
    INSERT @Empresas VALUES (41, N'ORILLA DEL MAR S.A.');
    INSERT @Empresas VALUES (42, N'PANAM NEUMATICOS S A');
    INSERT @Empresas VALUES (43, N'PEREZ BENTANCOR JORGE SILVIO');
    INSERT @Empresas VALUES (44, N'PETIN S.A.');
    INSERT @Empresas VALUES (45, N'RA S A');
    INSERT @Empresas VALUES (46, N'RAMON C ALVAREZ S A');
    INSERT @Empresas VALUES (47, N'RAYDORAT S A');
    INSERT @Empresas VALUES (48, N'RC REPRESENTACIONES SRL');
    INSERT @Empresas VALUES (49, N'RODRIGUEZ ROSAS PABLO ANTONIO');
    INSERT @Empresas VALUES (50, N'RVIAL S.R.L.');
    INSERT @Empresas VALUES (51, N'ROLCON S.A.');
    INSERT @Empresas VALUES (52, N'RUEDAS EL GAUCHO S R L');
    INSERT @Empresas VALUES (53, N'SATORI NEUMATICOS DEL URUGUAY SAS');
    INSERT @Empresas VALUES (54, N'SICE GROUP SAS');
    INSERT @Empresas VALUES (55, N'SILACOR SOCIEDAD ANONIMA');
    INSERT @Empresas VALUES (56, N'SOMIL S A');
    INSERT @Empresas VALUES (57, N'SUPERTRAK SRL');
    INSERT @Empresas VALUES (58, N'TECNOTRUCK SAS');
    INSERT @Empresas VALUES (59, N'TEXEMUL S.A.');
    INSERT @Empresas VALUES (60, N'TODO INSUMOS SRL');
    INSERT @Empresas VALUES (61, N'TORNOMETAL SOCIEDAD ANONIMA');
    INSERT @Empresas VALUES (62, N'TRALE S.A.');
    INSERT @Empresas VALUES (63, N'TRANSPORTES CANAIMA LTDA');
    INSERT @Empresas VALUES (64, N'VENOKLER S A');
    INSERT @Empresas VALUES (65, N'WINERFLASH SAS');
    INSERT @Empresas VALUES (66, N'ZONANORTE S.R.L');

    SET IDENTITY_INSERT [03.Entrega].[dbo].[Empresas] ON;

    MERGE INTO [03.Entrega].[dbo].[Empresas] AS [TARGET]
    USING @Empresas AS [SOURCE]
    ON [TARGET].[EmpresaID] = [SOURCE].[EmpresaID]
    WHEN MATCHED THEN
        UPDATE SET 
            [TARGET].[Nombre] = [SOURCE].[Nombre]
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([EmpresaID], [Nombre])
        VALUES ([SOURCE].[EmpresaID], [SOURCE].[Nombre]);

    SET IDENTITY_INSERT [03.Entrega].[dbo].[Empresas] OFF;
END;
GO

IF OBJECT_ID('[03.Entrega].[dbo].[PaisesOrigen]', 'U') IS NOT NULL
BEGIN
    DECLARE @PaisesOrigen TABLE (
        [PaisOrigenID] [INT]		NOT NULL
        ,[Nombre] [NVARCHAR](MAX)	NULL
    );

    INSERT @PaisesOrigen VALUES (1, N'ALEMANIA');
    INSERT @PaisesOrigen VALUES (2, N'ARGENTINA');
    INSERT @PaisesOrigen VALUES (3, N'BRASIL');
    INSERT @PaisesOrigen VALUES (4, N'CANADA');
    INSERT @PaisesOrigen VALUES (5, N'CHINA, REPUBLICA POPULAR DE');
    INSERT @PaisesOrigen VALUES (6, N'COREA (SUR)');
    INSERT @PaisesOrigen VALUES (7, N'COSTA RICA');
    INSERT @PaisesOrigen VALUES (8, N'E.E.U.U.');
    INSERT @PaisesOrigen VALUES (9, N'ESLOVAQUIA');
    INSERT @PaisesOrigen VALUES (10, N'ESPAÑA');
    INSERT @PaisesOrigen VALUES (11, N'FRANCIA');
    INSERT @PaisesOrigen VALUES (12, N'INDIA');
    INSERT @PaisesOrigen VALUES (13, N'ITALIA');
    INSERT @PaisesOrigen VALUES (14, N'JAPON');
    INSERT @PaisesOrigen VALUES (15, N'MALASIA');
    INSERT @PaisesOrigen VALUES (16, N'MEXICO');
    INSERT @PaisesOrigen VALUES (17, N'PERU');
    INSERT @PaisesOrigen VALUES (18, N'POLONIA');
    INSERT @PaisesOrigen VALUES (19, N'REP. CHECA');
    INSERT @PaisesOrigen VALUES (20, N'TAILANDIA');
    INSERT @PaisesOrigen VALUES (21, N'TAIWAN (FORMOSA)');
    INSERT @PaisesOrigen VALUES (22, N'TURQUIA');

    SET IDENTITY_INSERT [03.Entrega].[dbo].[PaisesOrigen] ON;

    MERGE INTO [03.Entrega].[dbo].[PaisesOrigen] AS [TARGET]
    USING @PaisesOrigen AS [SOURCE]
    ON [TARGET].[PaisOrigenID] = [SOURCE].[PaisOrigenID]
    WHEN MATCHED THEN
        UPDATE SET 
            [TARGET].[Nombre] = [SOURCE].[Nombre]
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([PaisOrigenID], [Nombre])
        VALUES ([SOURCE].[PaisOrigenID], [SOURCE].[Nombre]);

    SET IDENTITY_INSERT [03.Entrega].[dbo].[PaisesOrigen] OFF;
END;
GO

IF OBJECT_ID('[03.Entrega].[dbo].[PaisesProcedencia]', 'U') IS NOT NULL
BEGIN
    DECLARE @PaisesProcedencia TABLE (
        [PaisProcedenciaID] [INT]	NOT NULL
        ,[Nombre] [NVARCHAR](MAX)	NULL
    );

    INSERT @PaisesProcedencia VALUES (1, N'ALEMANIA');
    INSERT @PaisesProcedencia VALUES (2, N'ARGENTINA');
    INSERT @PaisesProcedencia VALUES (3, N'BELGICA, LUXEMBU');
    INSERT @PaisesProcedencia VALUES (4, N'BRASIL');
    INSERT @PaisesProcedencia VALUES (5, N'CHILE');
    INSERT @PaisesProcedencia VALUES (6, N'CHINA, REPUBLICA POPULAR DE');
    INSERT @PaisesProcedencia VALUES (7, N'COREA (SUR)');
    INSERT @PaisesProcedencia VALUES (8, N'COSTA RICA');
    INSERT @PaisesProcedencia VALUES (9, N'E.E.U.U.');
    INSERT @PaisesProcedencia VALUES (10, N'ESLOVAQUIA');
    INSERT @PaisesProcedencia VALUES (11, N'ESPAÑA');
    INSERT @PaisesProcedencia VALUES (12, N'FRANCIA');
    INSERT @PaisesProcedencia VALUES (13, N'HOLANDA (PAISES BAJOS)');
    INSERT @PaisesProcedencia VALUES (14, N'INDIA');
    INSERT @PaisesProcedencia VALUES (15, N'JAPON');
    INSERT @PaisesProcedencia VALUES (16, N'LIBERIA');
    INSERT @PaisesProcedencia VALUES (17, N'MEXICO');
    INSERT @PaisesProcedencia VALUES (18, N'PANAMA');
    INSERT @PaisesProcedencia VALUES (19, N'PERU');
    INSERT @PaisesProcedencia VALUES (20, N'TAILANDIA');
    INSERT @PaisesProcedencia VALUES (21, N'TAIWAN (FORMOSA)');
    INSERT @PaisesProcedencia VALUES (22, N'TURQUIA');
    INSERT @PaisesProcedencia VALUES (23, N'URUGUAY');
    INSERT @PaisesProcedencia VALUES (24, N'Z.F.FLORIDA');
    INSERT @PaisesProcedencia VALUES (25, N'Z.F.LIBERTAD');
    INSERT @PaisesProcedencia VALUES (26, N'Z.F.MONTEVIDEO');

    SET IDENTITY_INSERT [03.Entrega].[dbo].[PaisesProcedencia] ON;

    MERGE INTO [03.Entrega].[dbo].[PaisesProcedencia] AS [TARGET]
    USING @PaisesProcedencia AS [SOURCE]
    ON [TARGET].[PaisProcedenciaID] = [SOURCE].[PaisProcedenciaID]
    WHEN MATCHED THEN
        UPDATE SET 
            [TARGET].[Nombre] = [SOURCE].[Nombre]
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([PaisProcedenciaID], [Nombre])
        VALUES ([SOURCE].[PaisProcedenciaID], [SOURCE].[Nombre]);

    SET IDENTITY_INSERT [03.Entrega].[dbo].[PaisesProcedencia] OFF;
END;
GO

IF OBJECT_ID('[03.Entrega].[dbo].[Regimenes]', 'U') IS NOT NULL
BEGIN
    DECLARE @Regimenes TABLE (
        [RegimenID] [INT]			NOT NULL
        ,[Nombre] [NVARCHAR](MAX)	NULL
    );

        INSERT @Regimenes VALUES (1, N'Imp.Definitiva desde Z.F. con usuario registrado en ZF');
        INSERT @Regimenes VALUES (2, N'Importacion Definitiva con Despacho desde Deposito');
        INSERT @Regimenes VALUES (3, N'Importacion Definitiva con Despacho Directo');
        INSERT @Regimenes VALUES (4, N'Merc. a incl en A.T. para elab. o transf. con desp. dep');
        INSERT @Regimenes VALUES (5, N'Merc. a incl en A.T. para elab. o transf. con desp. dir');
        INSERT @Regimenes VALUES (6, N'Nacionalizacion mercaderias en Admision T. para transf.');
        INSERT @Regimenes VALUES (7, N'Sin Registrar');

    SET IDENTITY_INSERT [03.Entrega].[dbo].[Regimenes] ON;

    MERGE INTO [03.Entrega].[dbo].[Regimenes] AS [TARGET]
    USING @Regimenes AS [SOURCE]
    ON [TARGET].[RegimenID] = [SOURCE].[RegimenID]
    WHEN MATCHED THEN
        UPDATE SET 
            [TARGET].[Nombre] = [SOURCE].[Nombre]
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([RegimenID], [Nombre])
        VALUES ([SOURCE].[RegimenID], [SOURCE].[Nombre]);

    SET IDENTITY_INSERT [03.Entrega].[dbo].[Regimenes] OFF;
END;
GO

IF OBJECT_ID('[03.Entrega].[dbo].[UnidadesFisicas]', 'U') IS NOT NULL
BEGIN
    DECLARE @UnidadesFisicas TABLE (
        [UnidadFisicaID] [INT]		NOT NULL
        ,[Nombre] [NVARCHAR](MAX)	NULL
    );

    INSERT @UnidadesFisicas VALUES (1, N'NUMERO');

    SET IDENTITY_INSERT [03.Entrega].[dbo].[UnidadesFisicas] ON;

    MERGE INTO [03.Entrega].[dbo].[UnidadesFisicas] AS [TARGET]
    USING @UnidadesFisicas AS [SOURCE]
    ON [TARGET].[UnidadFisicaID] = [SOURCE].[UnidadFisicaID]
    WHEN MATCHED THEN
        UPDATE SET 
            [TARGET].[Nombre] = [SOURCE].[Nombre]
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([UnidadFisicaID], [Nombre])
        VALUES ([SOURCE].[UnidadFisicaID], [SOURCE].[Nombre]);

    SET IDENTITY_INSERT [03.Entrega].[dbo].[UnidadesFisicas] OFF;
END;
GO

IF OBJECT_ID('[03.Entrega].[dbo].[Registros]', 'U') IS NOT NULL
BEGIN
    DECLARE @Registros TABLE (
        [RegistroID]				[INT] 				NOT NULL
        ,[EmpresaID]				[INT] 				NOT NULL
        ,[CiudadID]					[INT] 				NOT NULL
        ,[DepartamentoID]			[INT] 				NOT NULL
        ,[FechaNumeracion]			[DATE]				NOT NULL
        ,[Cif_Valor_Aduana] 		[DECIMAL](18, 10)	NOT NULL
        ,[CantidadUnidadComercial]	[BIGINT]			NOT NULL
        ,[PaisOrigenID]				[INT] 				NOT NULL
        ,[PaisProcedenciaID]		[INT] 				NOT NULL
        ,[NCM]						[NVARCHAR](50)		NOT NULL
        ,[DescripcionComercialID]	[INT] 				NOT NULL
        ,[DUA]						[BIGINT]			NOT NULL
        ,[PesoNeto]					[DECIMAL](18, 10)	NOT NULL
        ,[MedioTransporte]			[NVARCHAR](50)		NULL
        ,[TipoDespacho]				[INT] 				NOT NULL
        ,[RegimenID]				[INT] 				NOT NULL
        ,[UnidadFisicaID]			[INT] 				NOT NULL
        ,[TotalUnidadesFisicas]		[BIGINT]			NOT NULL
    );

    INSERT @Registros VALUES (1, 37, 8, 4, CAST(N'2019-01-02' AS Date), CAST(36620.2000000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 23, 124, CAST(14884.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 256)
    INSERT @Registros VALUES (2, 61, 7, 3, CAST(N'2019-01-02' AS Date), CAST(34745.5800000000 AS Decimal(18, 10)), 251, 5, 6, N'4011209000', 748, 236, CAST(11567.0400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 251)
    INSERT @Registros VALUES (3, 51, 7, 3, CAST(N'2019-01-03' AS Date), CAST(24061.3000000000 AS Decimal(18, 10)), 1158, 5, 6, N'4011209000', 102, 795, CAST(9700.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1158)
    INSERT @Registros VALUES (4, 66, 12, 8, CAST(N'2019-01-03' AS Date), CAST(11983.6300000000 AS Decimal(18, 10)), 92, 5, 6, N'4011209000', 393, 1273, CAST(4710.3400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 92)
    INSERT @Registros VALUES (5, 42, 7, 3, CAST(N'2019-01-04' AS Date), CAST(42856.8000000000 AS Decimal(18, 10)), 240, 8, 9, N'4011209000', 130, 1720, CAST(12515.0400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 240)
    INSERT @Registros VALUES (6, 51, 7, 3, CAST(N'2019-01-07' AS Date), CAST(25451.6100000000 AS Decimal(18, 10)), 1280, 5, 6, N'4011209000', 105, 2469, CAST(10280.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1280)
    INSERT @Registros VALUES (7, 51, 7, 3, CAST(N'2019-01-07' AS Date), CAST(23701.2400000000 AS Decimal(18, 10)), 912, 5, 6, N'4011209000', 164, 2469, CAST(9500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 912)
    INSERT @Registros VALUES (8, 51, 7, 3, CAST(N'2019-01-07' AS Date), CAST(27053.7000000000 AS Decimal(18, 10)), 220, 5, 6, N'4011209000', 117, 2470, CAST(12510.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (9, 51, 7, 3, CAST(N'2019-01-07' AS Date), CAST(19612.5400000000 AS Decimal(18, 10)), 220, 5, 6, N'4011209000', 116, 2471, CAST(7526.2600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (10, 45, 7, 3, CAST(N'2019-01-07' AS Date), CAST(10382.8000000000 AS Decimal(18, 10)), 70, 14, 15, N'4011209000', 348, 2562, CAST(2386.9400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 70)
    INSERT @Registros VALUES (11, 45, 7, 3, CAST(N'2019-01-07' AS Date), CAST(14855.0800000000 AS Decimal(18, 10)), 173, 14, 15, N'4011209000', 844, 2562, CAST(3415.1000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 173)
    INSERT @Registros VALUES (12, 45, 7, 3, CAST(N'2019-01-07' AS Date), CAST(59803.2100000000 AS Decimal(18, 10)), 720, 3, 4, N'4011209000', 653, 3047, CAST(12295.0800000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 720)
    INSERT @Registros VALUES (13, 45, 7, 3, CAST(N'2019-01-07' AS Date), CAST(16925.0800000000 AS Decimal(18, 10)), 62, 3, 4, N'4011209000', 480, 3050, CAST(4450.5000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 62)
    INSERT @Registros VALUES (14, 45, 7, 3, CAST(N'2019-01-07' AS Date), CAST(846.0400000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 471, 3050, CAST(89.6500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 12)
    INSERT @Registros VALUES (15, 47, 7, 3, CAST(N'2019-01-07' AS Date), CAST(17946.2000000000 AS Decimal(18, 10)), 230, 3, 4, N'4011209000', 468, 3199, CAST(3643.7500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 230)
    INSERT @Registros VALUES (16, 23, 7, 3, CAST(N'2019-01-08' AS Date), CAST(34942.5100000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 100, 3606, CAST(14782.3200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (17, 37, 8, 4, CAST(N'2019-01-09' AS Date), CAST(44736.3900000000 AS Decimal(18, 10)), 251, 5, 6, N'4011209000', 20, 4320, CAST(14777.5300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 251)
    INSERT @Registros VALUES (18, 44, 7, 3, CAST(N'2019-01-09' AS Date), CAST(79745.3300000000 AS Decimal(18, 10)), 530, 3, 4, N'4011209000', 387, 4328, CAST(17891.4300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 530)
    INSERT @Registros VALUES (19, 44, 7, 3, CAST(N'2019-01-09' AS Date), CAST(67077.9200000000 AS Decimal(18, 10)), 395, 3, 4, N'4011209000', 382, 4437, CAST(17092.0300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 395)
    INSERT @Registros VALUES (20, 12, 1, 2, CAST(N'2019-01-09' AS Date), CAST(7795.0400000000 AS Decimal(18, 10)), 60, 14, 15, N'4011209000', 449, 4543, CAST(1621.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 60)
    INSERT @Registros VALUES (21, 8, 7, 3, CAST(N'2019-01-10' AS Date), CAST(347.6500000000 AS Decimal(18, 10)), 2, 5, 6, N'4011209000', 45, 5376, CAST(122.3500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 2)
    INSERT @Registros VALUES (22, 8, 7, 3, CAST(N'2019-01-10' AS Date), CAST(23217.4900000000 AS Decimal(18, 10)), 168, 5, 6, N'4011209000', 42, 5377, CAST(8489.3100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 168)
    INSERT @Registros VALUES (23, 61, 7, 3, CAST(N'2019-01-10' AS Date), CAST(36094.3000000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 720, 5671, CAST(14730.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 266)
    INSERT @Registros VALUES (24, 64, 7, 3, CAST(N'2019-01-11' AS Date), CAST(37003.9000000000 AS Decimal(18, 10)), 290, 5, 6, N'4011209000', 311, 6335, CAST(14340.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 290)
    INSERT @Registros VALUES (25, 61, 7, 3, CAST(N'2019-01-11' AS Date), CAST(943.6400000000 AS Decimal(18, 10)), 20, 5, 6, N'4011209000', 700, 6346, CAST(319.8800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (26, 6, 7, 3, CAST(N'2019-01-11' AS Date), CAST(5621.9700000000 AS Decimal(18, 10)), 38, 5, 6, N'4011209000', 90, 6436, CAST(1978.7700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 38)
    INSERT @Registros VALUES (27, 30, 7, 3, CAST(N'2019-01-14' AS Date), CAST(1459.9100000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 774, 6783, CAST(271.0600000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 20)
    INSERT @Registros VALUES (28, 42, 7, 3, CAST(N'2019-01-14' AS Date), CAST(47506.8000000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 115, 7102, CAST(14274.3600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (29, 23, 7, 3, CAST(N'2019-01-14' AS Date), CAST(34753.5500000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 100, 7324, CAST(14878.8800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (30, 24, 12, 8, CAST(N'2019-01-14' AS Date), CAST(37285.0000000000 AS Decimal(18, 10)), 265, 5, 6, N'4011209000', 392, 7352, CAST(15020.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 265)
    INSERT @Registros VALUES (31, 61, 7, 3, CAST(N'2019-01-17' AS Date), CAST(35055.9100000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 674, 9295, CAST(14580.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (32, 45, 7, 3, CAST(N'2019-01-17' AS Date), CAST(8283.5800000000 AS Decimal(18, 10)), 58, 3, 4, N'4011209000', 577, 9483, CAST(722.0600000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 58)
    INSERT @Registros VALUES (33, 45, 7, 3, CAST(N'2019-01-17' AS Date), CAST(7159.2100000000 AS Decimal(18, 10)), 103, 3, 4, N'4011209000', 528, 9483, CAST(1835.1200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 103)
    INSERT @Registros VALUES (34, 45, 7, 3, CAST(N'2019-01-17' AS Date), CAST(791.1200000000 AS Decimal(18, 10)), 8, 3, 4, N'4011209000', 589, 9483, CAST(176.8700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 8)
    INSERT @Registros VALUES (35, 25, 7, 3, CAST(N'2019-01-17' AS Date), CAST(22580.6600000000 AS Decimal(18, 10)), 180, 5, 6, N'4011209000', 100, 9603, CAST(9000.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 180)
    INSERT @Registros VALUES (36, 61, 7, 3, CAST(N'2019-01-18' AS Date), CAST(8333.2700000000 AS Decimal(18, 10)), 63, 5, 6, N'4011209000', 682, 10260, CAST(3028.5600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 63)
    INSERT @Registros VALUES (37, 42, 7, 3, CAST(N'2019-01-18' AS Date), CAST(7217.2800000000 AS Decimal(18, 10)), 37, 2, 2, N'4011209000', 509, 10340, CAST(2035.3500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 37)
    INSERT @Registros VALUES (38, 8, 7, 3, CAST(N'2019-01-18' AS Date), CAST(26126.7900000000 AS Decimal(18, 10)), 218, 5, 6, N'4011209000', 43, 10378, CAST(10870.0200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 218)
    INSERT @Registros VALUES (39, 47, 7, 3, CAST(N'2019-01-18' AS Date), CAST(5704.6300000000 AS Decimal(18, 10)), 62, 22, 22, N'4011209000', 395, 10488, CAST(1649.2300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 62)
    INSERT @Registros VALUES (40, 44, 7, 3, CAST(N'2019-01-21' AS Date), CAST(55029.0100000000 AS Decimal(18, 10)), 426, 5, 6, N'4011209000', 455, 10900, CAST(22767.9800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 426)
    INSERT @Registros VALUES (41, 12, 1, 2, CAST(N'2019-01-21' AS Date), CAST(31850.8400000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 433, 10986, CAST(13834.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (42, 30, 7, 3, CAST(N'2019-01-21' AS Date), CAST(4337.6000000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 818, 11017, CAST(783.6000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 60)
    INSERT @Registros VALUES (43, 30, 7, 3, CAST(N'2019-01-21' AS Date), CAST(41625.1900000000 AS Decimal(18, 10)), 194, 3, 4, N'4011209000', 770, 11017, CAST(10390.8300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 194)
    INSERT @Registros VALUES (44, 45, 7, 3, CAST(N'2019-01-21' AS Date), CAST(5555.3900000000 AS Decimal(18, 10)), 65, 3, 4, N'4011209000', 582, 11182, CAST(1184.2900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 65)
    INSERT @Registros VALUES (45, 6, 7, 3, CAST(N'2019-01-21' AS Date), CAST(37575.5200000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 558, 11226, CAST(14604.2800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (46, 22, 7, 3, CAST(N'2019-01-21' AS Date), CAST(30864.0200000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 327, 11228, CAST(14200.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (47, 24, 12, 8, CAST(N'2019-01-21' AS Date), CAST(40240.0000000000 AS Decimal(18, 10)), 300, 5, 6, N'4011209000', 391, 11244, CAST(16080.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 300)
    INSERT @Registros VALUES (48, 61, 7, 3, CAST(N'2019-01-21' AS Date), CAST(34164.8400000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 678, 11574, CAST(14310.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (49, 15, 7, 3, CAST(N'2019-01-22' AS Date), CAST(563.8500000000 AS Decimal(18, 10)), 8, 20, 20, N'4011209000', 267, 12336, CAST(157.9700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 8)
    INSERT @Registros VALUES (50, 15, 7, 3, CAST(N'2019-01-22' AS Date), CAST(1143.4200000000 AS Decimal(18, 10)), 16, 20, 20, N'4011209000', 832, 12336, CAST(244.1500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 16)
    INSERT @Registros VALUES (51, 15, 7, 3, CAST(N'2019-01-22' AS Date), CAST(863.4000000000 AS Decimal(18, 10)), 16, 20, 20, N'4011209000', 834, 12336, CAST(182.0300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 16)
    INSERT @Registros VALUES (52, 45, 7, 3, CAST(N'2019-01-23' AS Date), CAST(2948.1000000000 AS Decimal(18, 10)), 10, 3, 4, N'4011209000', 524, 13038, CAST(601.2200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 10)
    INSERT @Registros VALUES (53, 45, 7, 3, CAST(N'2019-01-23' AS Date), CAST(21490.4500000000 AS Decimal(18, 10)), 321, 3, 4, N'4011209000', 565, 13038, CAST(4382.6300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 321)
    INSERT @Registros VALUES (54, 26, 7, 3, CAST(N'2019-01-23' AS Date), CAST(33746.8100000000 AS Decimal(18, 10)), 275, 5, 6, N'4011209000', 11, 13449, CAST(14511.7500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 275)
    INSERT @Registros VALUES (55, 61, 7, 3, CAST(N'2019-01-24' AS Date), CAST(34367.2900000000 AS Decimal(18, 10)), 259, 5, 6, N'4011209000', 719, 13789, CAST(14310.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 259)
    INSERT @Registros VALUES (56, 61, 7, 3, CAST(N'2019-01-25' AS Date), CAST(36749.4000000000 AS Decimal(18, 10)), 238, 5, 6, N'4011209000', 747, 14590, CAST(12939.9900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 238)
    INSERT @Registros VALUES (57, 30, 7, 3, CAST(N'2019-01-25' AS Date), CAST(76744.5100000000 AS Decimal(18, 10)), 309, 3, 4, N'4011209000', 808, 14845, CAST(17814.0400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 309)
    INSERT @Registros VALUES (58, 12, 1, 2, CAST(N'2019-01-25' AS Date), CAST(36482.9000000000 AS Decimal(18, 10)), 206, 5, 6, N'4011209000', 418, 14923, CAST(12700.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 206)
    INSERT @Registros VALUES (59, 61, 7, 3, CAST(N'2019-01-28' AS Date), CAST(16740.2500000000 AS Decimal(18, 10)), 211, 5, 6, N'4011209000', 296, 15307, CAST(6019.3400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 211)
    INSERT @Registros VALUES (60, 37, 8, 4, CAST(N'2019-01-29' AS Date), CAST(45354.8200000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 25, 16222, CAST(15056.4600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (61, 45, 7, 3, CAST(N'2019-01-29' AS Date), CAST(10740.3400000000 AS Decimal(18, 10)), 126, 14, 15, N'4011209000', 281, 16511, CAST(2188.8100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 126)
    INSERT @Registros VALUES (62, 45, 7, 3, CAST(N'2019-01-29' AS Date), CAST(1616.0000000000 AS Decimal(18, 10)), 20, 14, 15, N'4011209000', 322, 16511, CAST(329.3300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (63, 42, 7, 3, CAST(N'2019-01-29' AS Date), CAST(36515.4200000000 AS Decimal(18, 10)), 460, 8, 9, N'4011209000', 160, 16518, CAST(9284.0600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 460)
    INSERT @Registros VALUES (64, 45, 7, 3, CAST(N'2019-01-29' AS Date), CAST(6876.0600000000 AS Decimal(18, 10)), 97, 16, 17, N'4011209000', 601, 16534, CAST(1384.1900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 97)
    INSERT @Registros VALUES (65, 45, 7, 3, CAST(N'2019-01-29' AS Date), CAST(39419.9500000000 AS Decimal(18, 10)), 460, 3, 4, N'4011209000', 572, 16856, CAST(9112.7300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 460)
    INSERT @Registros VALUES (66, 45, 7, 3, CAST(N'2019-01-29' AS Date), CAST(5108.5800000000 AS Decimal(18, 10)), 19, 3, 4, N'4011209000', 549, 16856, CAST(537.3200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 19)
    INSERT @Registros VALUES (67, 61, 7, 3, CAST(N'2019-01-30' AS Date), CAST(34685.3400000000 AS Decimal(18, 10)), 258, 5, 6, N'4011209000', 718, 17298, CAST(14670.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 258)
    INSERT @Registros VALUES (68, 26, 7, 3, CAST(N'2019-01-30' AS Date), CAST(26346.9100000000 AS Decimal(18, 10)), 185, 5, 6, N'4011209000', 29, 17789, CAST(11342.5700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 185)
    INSERT @Registros VALUES (69, 26, 7, 3, CAST(N'2019-01-30' AS Date), CAST(7477.5800000000 AS Decimal(18, 10)), 55, 5, 6, N'4011209000', 31, 17789, CAST(3219.1600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 55)
    INSERT @Registros VALUES (70, 45, 7, 3, CAST(N'2019-01-30' AS Date), CAST(12192.9000000000 AS Decimal(18, 10)), 156, 3, 4, N'4011209000', 543, 17947, CAST(774.2900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 156)
    INSERT @Registros VALUES (71, 45, 7, 3, CAST(N'2019-01-30' AS Date), CAST(13737.0500000000 AS Decimal(18, 10)), 102, 3, 4, N'4011209000', 526, 17947, CAST(2367.9700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 102)
    INSERT @Registros VALUES (72, 45, 7, 3, CAST(N'2019-01-30' AS Date), CAST(13087.9300000000 AS Decimal(18, 10)), 165, 3, 4, N'4011209000', 545, 17947, CAST(2580.7200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 165)
    INSERT @Registros VALUES (73, 27, 7, 3, CAST(N'2019-01-31' AS Date), CAST(972.3800000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 394, 18080, CAST(158.5900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 12)
    INSERT @Registros VALUES (74, 42, 7, 3, CAST(N'2019-01-31' AS Date), CAST(3153.0000000000 AS Decimal(18, 10)), 30, 2, 2, N'4011209000', 507, 18234, CAST(898.8300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 30)
    INSERT @Registros VALUES (75, 10, 7, 3, CAST(N'2019-01-31' AS Date), CAST(14059.4600000000 AS Decimal(18, 10)), 136, 3, 4, N'4011209000', 303, 18562, CAST(2373.0700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 136)
    INSERT @Registros VALUES (76, 8, 7, 3, CAST(N'2019-02-01' AS Date), CAST(10529.9400000000 AS Decimal(18, 10)), 60, 5, 6, N'4011209000', 65, 19337, CAST(3774.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 60)
    INSERT @Registros VALUES (77, 23, 7, 3, CAST(N'2019-02-01' AS Date), CAST(56716.0200000000 AS Decimal(18, 10)), 248, 3, 4, N'4011209000', 100, 19475, CAST(13550.7000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (78, 23, 7, 3, CAST(N'2019-02-04' AS Date), CAST(35899.3800000000 AS Decimal(18, 10)), 228, 5, 6, N'4011209000', 100, 20343, CAST(15795.8400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 228)
    INSERT @Registros VALUES (79, 47, 7, 3, CAST(N'2019-02-04' AS Date), CAST(20322.4400000000 AS Decimal(18, 10)), 170, 3, 4, N'4011209000', 319, 20441, CAST(4493.4200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 170)
    INSERT @Registros VALUES (80, 47, 7, 3, CAST(N'2019-02-04' AS Date), CAST(14848.9700000000 AS Decimal(18, 10)), 176, 3, 4, N'4011209000', 317, 20441, CAST(2951.6200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 176)
    INSERT @Registros VALUES (81, 45, 7, 3, CAST(N'2019-02-04' AS Date), CAST(137612.5000000000 AS Decimal(18, 10)), 1025, 20, 20, N'4011209000', 527, 20476, CAST(56198.7400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1025)
    INSERT @Registros VALUES (82, 30, 7, 3, CAST(N'2019-02-06' AS Date), CAST(26439.3000000000 AS Decimal(18, 10)), 120, 3, 4, N'4011209000', 765, 21596, CAST(5290.6200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 120)
    INSERT @Registros VALUES (83, 30, 7, 3, CAST(N'2019-02-06' AS Date), CAST(2067.6100000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 804, 21596, CAST(391.8000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 30)
    INSERT @Registros VALUES (84, 44, 7, 3, CAST(N'2019-02-06' AS Date), CAST(67976.2000000000 AS Decimal(18, 10)), 433, 3, 4, N'4011209000', 385, 21893, CAST(15059.0500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 433)
    INSERT @Registros VALUES (85, 51, 7, 3, CAST(N'2019-02-06' AS Date), CAST(8398.0500000000 AS Decimal(18, 10)), 60, 5, 6, N'4011209000', 212, 22066, CAST(3254.3500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 60)
    INSERT @Registros VALUES (86, 30, 7, 3, CAST(N'2019-02-07' AS Date), CAST(67563.8400000000 AS Decimal(18, 10)), 245, 3, 4, N'4011209000', 780, 22971, CAST(14466.5100000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 245)
    INSERT @Registros VALUES (87, 29, 12, 8, CAST(N'2019-02-12' AS Date), CAST(32009.4200000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 839, 25515, CAST(15219.7700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (88, 61, 7, 3, CAST(N'2019-02-12' AS Date), CAST(32636.6200000000 AS Decimal(18, 10)), 326, 5, 6, N'4011209000', 757, 25654, CAST(12219.4900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 326)
    INSERT @Registros VALUES (89, 23, 7, 3, CAST(N'2019-02-13' AS Date), CAST(25077.0100000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 300, 26383, CAST(13860.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (90, 61, 7, 3, CAST(N'2019-02-13' AS Date), CAST(40989.9600000000 AS Decimal(18, 10)), 288, 5, 6, N'4011209000', 715, 26529, CAST(16900.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 288)
    INSERT @Registros VALUES (91, 66, 12, 8, CAST(N'2019-02-14' AS Date), CAST(35901.8900000000 AS Decimal(18, 10)), 284, 5, 6, N'4011209000', 668, 26817, CAST(14980.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 284)
    INSERT @Registros VALUES (92, 12, 1, 2, CAST(N'2019-02-14' AS Date), CAST(31441.8800000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 427, 27132, CAST(14800.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (93, 12, 1, 2, CAST(N'2019-02-15' AS Date), CAST(30846.9000000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 431, 27862, CAST(13624.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (94, 47, 7, 3, CAST(N'2019-02-18' AS Date), CAST(31596.1800000000 AS Decimal(18, 10)), 202, 3, 4, N'4011209000', 317, 28229, CAST(7277.4400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 202)
    INSERT @Registros VALUES (95, 45, 7, 3, CAST(N'2019-02-18' AS Date), CAST(10848.2400000000 AS Decimal(18, 10)), 44, 3, 4, N'4011209000', 646, 28879, CAST(6648.7000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 44)
    INSERT @Registros VALUES (96, 45, 7, 3, CAST(N'2019-02-18' AS Date), CAST(2423.0000000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 640, 28879, CAST(352.3100000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 30)
    INSERT @Registros VALUES (97, 45, 7, 3, CAST(N'2019-02-18' AS Date), CAST(29201.2900000000 AS Decimal(18, 10)), 130, 3, 4, N'4011209000', 628, 28880, CAST(8065.6000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 130)
    INSERT @Registros VALUES (98, 45, 7, 3, CAST(N'2019-02-18' AS Date), CAST(1783.1800000000 AS Decimal(18, 10)), 24, 3, 4, N'4011209000', 637, 28880, CAST(282.0100000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 24)
    INSERT @Registros VALUES (99, 45, 7, 3, CAST(N'2019-02-18' AS Date), CAST(13371.9900000000 AS Decimal(18, 10)), 185, 3, 4, N'4011209000', 632, 28880, CAST(3158.8900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 185)
    INSERT @Registros VALUES (100, 8, 7, 3, CAST(N'2019-02-19' AS Date), CAST(3725.7200000000 AS Decimal(18, 10)), 28, 5, 6, N'4011209000', 61, 29094, CAST(1268.9600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 28)
    INSERT @Registros VALUES (101, 42, 7, 3, CAST(N'2019-02-19' AS Date), CAST(14309.6000000000 AS Decimal(18, 10)), 64, 2, 2, N'4011209000', 515, 29342, CAST(4109.0500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 64)
    INSERT @Registros VALUES (102, 61, 7, 3, CAST(N'2019-02-19' AS Date), CAST(33268.8800000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 678, 29491, CAST(14482.4400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (103, 12, 1, 2, CAST(N'2019-02-22' AS Date), CAST(23169.3900000000 AS Decimal(18, 10)), 234, 5, 6, N'4011209000', 423, 31648, CAST(10606.5500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 234)
    INSERT @Registros VALUES (104, 44, 7, 3, CAST(N'2019-02-22' AS Date), CAST(81995.4500000000 AS Decimal(18, 10)), 349, 3, 4, N'4011209000', 380, 31951, CAST(19679.9000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 349)
    INSERT @Registros VALUES (105, 30, 7, 3, CAST(N'2019-02-22' AS Date), CAST(47301.3800000000 AS Decimal(18, 10)), 247, 3, 4, N'4011209000', 781, 32149, CAST(12331.6900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 247)
    INSERT @Registros VALUES (106, 15, 7, 3, CAST(N'2019-02-25' AS Date), CAST(2806.3700000000 AS Decimal(18, 10)), 16, 14, 15, N'4011209000', 251, 32485, CAST(538.8300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 16)
    INSERT @Registros VALUES (107, 15, 7, 3, CAST(N'2019-02-25' AS Date), CAST(878.0200000000 AS Decimal(18, 10)), 5, 14, 15, N'4011209000', 263, 32485, CAST(131.1700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 5)
    INSERT @Registros VALUES (108, 15, 7, 3, CAST(N'2019-02-25' AS Date), CAST(1078.6900000000 AS Decimal(18, 10)), 20, 20, 15, N'4011209000', 828, 32485, CAST(230.3300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (109, 61, 7, 3, CAST(N'2019-02-25' AS Date), CAST(38962.9200000000 AS Decimal(18, 10)), 271, 5, 6, N'4011209000', 738, 32620, CAST(14616.4700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 271)
    INSERT @Registros VALUES (110, 45, 7, 3, CAST(N'2019-02-26' AS Date), CAST(25303.1600000000 AS Decimal(18, 10)), 322, 3, 4, N'4011209000', 642, 33658, CAST(5000.0000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 322)
    INSERT @Registros VALUES (111, 45, 7, 3, CAST(N'2019-02-26' AS Date), CAST(1935.5100000000 AS Decimal(18, 10)), 8, 3, 4, N'4011209000', 655, 33658, CAST(674.4500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 8)
    INSERT @Registros VALUES (112, 45, 7, 3, CAST(N'2019-02-26' AS Date), CAST(1072.5300000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 633, 33658, CAST(147.8500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 20)
    INSERT @Registros VALUES (113, 45, 7, 3, CAST(N'2019-02-26' AS Date), CAST(184666.3800000000 AS Decimal(18, 10)), 1332, 20, 20, N'4011209000', 630, 33659, CAST(73985.2500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1332)
    INSERT @Registros VALUES (114, 30, 7, 3, CAST(N'2019-02-26' AS Date), CAST(60791.3100000000 AS Decimal(18, 10)), 262, 3, 4, N'4011209000', 798, 33973, CAST(15073.1100000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 262)
    INSERT @Registros VALUES (115, 51, 7, 3, CAST(N'2019-02-27' AS Date), CAST(33397.2600000000 AS Decimal(18, 10)), 286, 5, 6, N'4011209000', 163, 34510, CAST(13385.9900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 286)
    INSERT @Registros VALUES (116, 42, 7, 3, CAST(N'2019-03-01' AS Date), CAST(48005.8000000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 135, 36373, CAST(13700.9400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (117, 45, 7, 3, CAST(N'2019-03-07' AS Date), CAST(2168.5500000000 AS Decimal(18, 10)), 8, 3, 4, N'4011209000', 589, 38127, CAST(463.2000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 8)
    INSERT @Registros VALUES (118, 45, 7, 3, CAST(N'2019-03-07' AS Date), CAST(2240.2700000000 AS Decimal(18, 10)), 28, 3, 4, N'4011209000', 561, 38127, CAST(478.5300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 28)
    INSERT @Registros VALUES (119, 45, 7, 3, CAST(N'2019-03-07' AS Date), CAST(14970.9100000000 AS Decimal(18, 10)), 120, 3, 4, N'4011209000', 535, 38127, CAST(3197.8000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 120)
    INSERT @Registros VALUES (120, 45, 7, 3, CAST(N'2019-03-07' AS Date), CAST(26202.8800000000 AS Decimal(18, 10)), 368, 3, 4, N'4011209000', 566, 38127, CAST(5596.9500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 368)
    INSERT @Registros VALUES (121, 24, 12, 8, CAST(N'2019-03-08' AS Date), CAST(39385.0000000000 AS Decimal(18, 10)), 265, 5, 6, N'4011209000', 390, 38939, CAST(15560.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 265)
    INSERT @Registros VALUES (122, 31, 7, 3, CAST(N'2019-03-08' AS Date), CAST(891.4000000000 AS Decimal(18, 10)), 10, 5, 6, N'4011209000', 223, 39181, CAST(271.8400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 10)
    INSERT @Registros VALUES (123, 31, 7, 3, CAST(N'2019-03-08' AS Date), CAST(1707.4000000000 AS Decimal(18, 10)), 20, 5, 6, N'4011209000', 230, 39181, CAST(520.6900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (124, 31, 7, 3, CAST(N'2019-03-08' AS Date), CAST(2251.8600000000 AS Decimal(18, 10)), 30, 5, 6, N'4011209000', 228, 39183, CAST(702.9500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 30)
    INSERT @Registros VALUES (125, 61, 7, 3, CAST(N'2019-03-08' AS Date), CAST(34138.0100000000 AS Decimal(18, 10)), 267, 5, 6, N'4011209000', 714, 39428, CAST(14620.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 267)
    INSERT @Registros VALUES (126, 45, 7, 3, CAST(N'2019-03-12' AS Date), CAST(7352.8000000000 AS Decimal(18, 10)), 40, 14, 15, N'4011209000', 568, 41008, CAST(1401.7900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (127, 45, 7, 3, CAST(N'2019-03-12' AS Date), CAST(7278.0600000000 AS Decimal(18, 10)), 85, 14, 15, N'4011209000', 522, 41008, CAST(1387.6000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 85)
    INSERT @Registros VALUES (128, 61, 7, 3, CAST(N'2019-03-12' AS Date), CAST(34353.1400000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 678, 41213, CAST(14860.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (129, 47, 7, 3, CAST(N'2019-03-14' AS Date), CAST(40410.9400000000 AS Decimal(18, 10)), 322, 3, 4, N'4011209000', 395, 42865, CAST(9623.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 322)
    INSERT @Registros VALUES (130, 47, 7, 3, CAST(N'2019-03-14' AS Date), CAST(7628.0200000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 395, 42865, CAST(1809.8800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 30)
    INSERT @Registros VALUES (131, 47, 7, 3, CAST(N'2019-03-14' AS Date), CAST(17289.4300000000 AS Decimal(18, 10)), 230, 3, 4, N'4011209000', 395, 42865, CAST(3448.2800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 230)
    INSERT @Registros VALUES (132, 23, 7, 3, CAST(N'2019-03-15' AS Date), CAST(25728.9600000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 300, 43340, CAST(13860.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (133, 42, 7, 3, CAST(N'2019-03-15' AS Date), CAST(21278.9200000000 AS Decimal(18, 10)), 144, 2, 2, N'4011209000', 499, 43630, CAST(5854.8200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 144)
    INSERT @Registros VALUES (134, 51, 7, 3, CAST(N'2019-03-15' AS Date), CAST(58074.4200000000 AS Decimal(18, 10)), 529, 5, 6, N'4011209000', 175, 43939, CAST(28958.7500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 529)
    INSERT @Registros VALUES (135, 25, 7, 3, CAST(N'2019-03-16' AS Date), CAST(21010.0100000000 AS Decimal(18, 10)), 180, 5, 6, N'4011209000', 100, 44172, CAST(10330.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 180)
    INSERT @Registros VALUES (136, 6, 7, 3, CAST(N'2019-03-18' AS Date), CAST(32643.3000000000 AS Decimal(18, 10)), 240, 5, 6, N'4011209000', 87, 44676, CAST(12700.6000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 240)
    INSERT @Registros VALUES (137, 6, 7, 3, CAST(N'2019-03-19' AS Date), CAST(12868.7400000000 AS Decimal(18, 10)), 80, 5, 6, N'4011209000', 94, 45686, CAST(4570.3900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 80)
    INSERT @Registros VALUES (138, 22, 7, 3, CAST(N'2019-03-21' AS Date), CAST(32148.9300000000 AS Decimal(18, 10)), 267, 5, 6, N'4011209000', 339, 47899, CAST(13051.8500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 267)
    INSERT @Registros VALUES (139, 51, 7, 3, CAST(N'2019-03-22' AS Date), CAST(67966.1700000000 AS Decimal(18, 10)), 604, 5, 6, N'4011209000', 213, 48114, CAST(34092.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 604)
    INSERT @Registros VALUES (140, 12, 1, 2, CAST(N'2019-03-22' AS Date), CAST(31569.4400000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 433, 48386, CAST(13774.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (141, 30, 7, 3, CAST(N'2019-03-22' AS Date), CAST(57753.5800000000 AS Decimal(18, 10)), 282, 3, 4, N'4011209000', 800, 48568, CAST(14950.3900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 282)
    INSERT @Registros VALUES (142, 44, 7, 3, CAST(N'2019-03-25' AS Date), CAST(60813.2800000000 AS Decimal(18, 10)), 310, 3, 4, N'4011209000', 373, 49140, CAST(16294.2200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 310)
    INSERT @Registros VALUES (143, 61, 7, 3, CAST(N'2019-03-26' AS Date), CAST(758.9600000000 AS Decimal(18, 10)), 16, 5, 6, N'4011209000', 675, 49950, CAST(265.0900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 16)
    INSERT @Registros VALUES (144, 61, 7, 3, CAST(N'2019-03-26' AS Date), CAST(34741.9600000000 AS Decimal(18, 10)), 292, 5, 6, N'4011209000', 717, 50696, CAST(14780.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 292)
    INSERT @Registros VALUES (145, 42, 7, 3, CAST(N'2019-03-27' AS Date), CAST(21819.9200000000 AS Decimal(18, 10)), 104, 2, 2, N'4011209000', 495, 51067, CAST(6302.5600000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 104)
    INSERT @Registros VALUES (146, 12, 1, 2, CAST(N'2019-03-27' AS Date), CAST(4066.4400000000 AS Decimal(18, 10)), 28, 14, 15, N'4011209000', 438, 51268, CAST(945.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 28)
    INSERT @Registros VALUES (147, 23, 7, 3, CAST(N'2019-03-27' AS Date), CAST(32968.6100000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 100, 51723, CAST(14066.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (148, 23, 7, 3, CAST(N'2019-03-27' AS Date), CAST(34503.2000000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 100, 51725, CAST(14654.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (149, 45, 7, 3, CAST(N'2019-03-28' AS Date), CAST(11307.7300000000 AS Decimal(18, 10)), 44, 3, 4, N'4011209000', 571, 52480, CAST(2424.1900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 44)
    INSERT @Registros VALUES (150, 45, 7, 3, CAST(N'2019-03-28' AS Date), CAST(1973.4100000000 AS Decimal(18, 10)), 31, 3, 4, N'4011209000', 563, 52480, CAST(213.1900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 31)
    INSERT @Registros VALUES (151, 45, 7, 3, CAST(N'2019-03-28' AS Date), CAST(4651.8000000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 579, 52480, CAST(1084.6600000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 60)
    INSERT @Registros VALUES (152, 45, 7, 3, CAST(N'2019-03-28' AS Date), CAST(2461.4900000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 552, 52480, CAST(605.6100000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 20)
    INSERT @Registros VALUES (153, 23, 7, 3, CAST(N'2019-03-28' AS Date), CAST(55174.8500000000 AS Decimal(18, 10)), 240, 3, 4, N'4011209000', 306, 52689, CAST(13726.5500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 240)
    INSERT @Registros VALUES (154, 23, 7, 3, CAST(N'2019-03-28' AS Date), CAST(32050.8700000000 AS Decimal(18, 10)), 267, 5, 6, N'4011209000', 100, 52696, CAST(13492.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 267)
    INSERT @Registros VALUES (155, 45, 7, 3, CAST(N'2019-03-29' AS Date), CAST(199879.0000000000 AS Decimal(18, 10)), 1570, 20, 20, N'4011209000', 544, 53423, CAST(84112.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1570)
    INSERT @Registros VALUES (156, 44, 7, 3, CAST(N'2019-03-29' AS Date), CAST(89631.5500000000 AS Decimal(18, 10)), 422, 3, 4, N'4011209000', 383, 53801, CAST(20363.5400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 422)
    INSERT @Registros VALUES (157, 47, 7, 3, CAST(N'2019-04-01' AS Date), CAST(18925.1600000000 AS Decimal(18, 10)), 262, 3, 4, N'4011209000', 395, 54104, CAST(3905.7100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (158, 27, 7, 3, CAST(N'2019-04-01' AS Date), CAST(4024.7300000000 AS Decimal(18, 10)), 46, 3, 4, N'4011209000', 837, 54341, CAST(675.2100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 46)
    INSERT @Registros VALUES (159, 30, 7, 3, CAST(N'2019-04-01' AS Date), CAST(45535.0300000000 AS Decimal(18, 10)), 161, 3, 4, N'4011209000', 767, 54367, CAST(9930.7200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 161)
    INSERT @Registros VALUES (160, 42, 7, 3, CAST(N'2019-04-01' AS Date), CAST(71013.4000000000 AS Decimal(18, 10)), 410, 2, 2, N'4011209000', 510, 54394, CAST(19839.0500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 410)
    INSERT @Registros VALUES (161, 42, 7, 3, CAST(N'2019-04-02' AS Date), CAST(13978.0100000000 AS Decimal(18, 10)), 240, 16, 17, N'4011209000', 134, 55227, CAST(2387.2100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 240)
    INSERT @Registros VALUES (162, 8, 7, 3, CAST(N'2019-04-05' AS Date), CAST(38116.0300000000 AS Decimal(18, 10)), 228, 5, 6, N'4011209000', 40, 57398, CAST(14779.8600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 228)
    INSERT @Registros VALUES (163, 8, 7, 3, CAST(N'2019-04-05' AS Date), CAST(9354.7300000000 AS Decimal(18, 10)), 110, 5, 6, N'4011209000', 49, 57399, CAST(3989.9400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 110)
    INSERT @Registros VALUES (164, 42, 7, 3, CAST(N'2019-04-05' AS Date), CAST(46780.8000000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 118, 57509, CAST(13691.4800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (165, 30, 7, 3, CAST(N'2019-04-05' AS Date), CAST(2076.6400000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 803, 57703, CAST(391.8000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 30)
    INSERT @Registros VALUES (166, 2, 12, 8, CAST(N'2019-04-05' AS Date), CAST(22344.9600000000 AS Decimal(18, 10)), 132, 5, 25, N'4011209000', 72, 57824, CAST(8657.0700000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 132)
    INSERT @Registros VALUES (167, 2, 12, 8, CAST(N'2019-04-05' AS Date), CAST(4205.1000000000 AS Decimal(18, 10)), 30, 5, 25, N'4011209000', 842, 57824, CAST(1629.1700000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 30)
    INSERT @Registros VALUES (168, 2, 12, 8, CAST(N'2019-04-05' AS Date), CAST(4152.9000000000 AS Decimal(18, 10)), 30, 5, 25, N'4011209000', 71, 57824, CAST(1608.9500000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 30)
    INSERT @Registros VALUES (169, 2, 12, 8, CAST(N'2019-04-05' AS Date), CAST(3104.6000000000 AS Decimal(18, 10)), 20, 5, 25, N'4011209000', 70, 57824, CAST(1202.8100000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 20)
    INSERT @Registros VALUES (170, 2, 12, 8, CAST(N'2019-04-05' AS Date), CAST(3551.4500000000 AS Decimal(18, 10)), 30, 5, 6, N'4011209000', 395, 57867, CAST(1740.0000000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 30)
    INSERT @Registros VALUES (171, 30, 7, 3, CAST(N'2019-04-08' AS Date), CAST(63826.2500000000 AS Decimal(18, 10)), 270, 3, 4, N'4011209000', 799, 58646, CAST(14808.1000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 270)
    INSERT @Registros VALUES (172, 31, 7, 3, CAST(N'2019-04-09' AS Date), CAST(521.6600000000 AS Decimal(18, 10)), 6, 5, 6, N'4011209000', 451, 59097, CAST(155.0700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 6)
    INSERT @Registros VALUES (173, 45, 7, 3, CAST(N'2019-04-09' AS Date), CAST(26714.5000000000 AS Decimal(18, 10)), 300, 14, 15, N'4011209000', 523, 59502, CAST(5643.8200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 300)
    INSERT @Registros VALUES (174, 45, 7, 3, CAST(N'2019-04-09' AS Date), CAST(8451.6800000000 AS Decimal(18, 10)), 72, 14, 15, N'4011209000', 584, 59502, CAST(1785.5700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 72)
    INSERT @Registros VALUES (175, 51, 7, 3, CAST(N'2019-04-09' AS Date), CAST(13014.2500000000 AS Decimal(18, 10)), 94, 5, 6, N'4011209000', 219, 59996, CAST(5053.4200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 94)
    INSERT @Registros VALUES (176, 8, 7, 3, CAST(N'2019-04-10' AS Date), CAST(8931.6000000000 AS Decimal(18, 10)), 69, 5, 6, N'4011209000', 51, 60183, CAST(4036.7000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 69)
    INSERT @Registros VALUES (177, 8, 7, 3, CAST(N'2019-04-11' AS Date), CAST(40230.6000000000 AS Decimal(18, 10)), 310, 5, 6, N'4011209000', 35, 61287, CAST(15129.9600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 310)
    INSERT @Registros VALUES (178, 23, 7, 3, CAST(N'2019-04-17' AS Date), CAST(34402.9000000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 100, 64515, CAST(14654.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (179, 20, 7, 3, CAST(N'2019-04-23' AS Date), CAST(28699.4600000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 272, 65809, CAST(15580.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (180, 45, 7, 3, CAST(N'2019-04-24' AS Date), CAST(194778.5000000000 AS Decimal(18, 10)), 1430, 20, 20, N'4011209000', 289, 66215, CAST(78972.2900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1430)
    INSERT @Registros VALUES (181, 61, 7, 3, CAST(N'2019-04-24' AS Date), CAST(26392.5500000000 AS Decimal(18, 10)), 209, 5, 6, N'4011209000', 736, 66307, CAST(9489.5600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 209)
    INSERT @Registros VALUES (182, 61, 7, 3, CAST(N'2019-04-24' AS Date), CAST(3556.4200000000 AS Decimal(18, 10)), 48, 5, 6, N'4011209000', 746, 66398, CAST(1271.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 48)
    INSERT @Registros VALUES (183, 51, 7, 3, CAST(N'2019-04-24' AS Date), CAST(15604.2900000000 AS Decimal(18, 10)), 281, 5, 6, N'4011209000', 198, 66663, CAST(12026.2700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 281)
    INSERT @Registros VALUES (184, 51, 7, 3, CAST(N'2019-04-24' AS Date), CAST(57576.5600000000 AS Decimal(18, 10)), 574, 5, 6, N'4011209000', 210, 66664, CAST(29449.8100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 574)
    INSERT @Registros VALUES (185, 42, 7, 3, CAST(N'2019-04-24' AS Date), CAST(4915.0800000000 AS Decimal(18, 10)), 28, 2, 2, N'4011209000', 506, 67095, CAST(1383.6500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 28)
    INSERT @Registros VALUES (186, 44, 7, 3, CAST(N'2019-04-25' AS Date), CAST(72869.6800000000 AS Decimal(18, 10)), 520, 5, 6, N'4011209000', 457, 67409, CAST(30220.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 520)
    INSERT @Registros VALUES (187, 45, 7, 3, CAST(N'2019-04-25' AS Date), CAST(19711.1300000000 AS Decimal(18, 10)), 116, 3, 4, N'4011209000', 534, 68090, CAST(3524.3900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 116)
    INSERT @Registros VALUES (188, 45, 7, 3, CAST(N'2019-04-25' AS Date), CAST(6107.1700000000 AS Decimal(18, 10)), 92, 3, 4, N'4011209000', 598, 68090, CAST(1246.8500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 92)
    INSERT @Registros VALUES (189, 45, 7, 3, CAST(N'2019-04-25' AS Date), CAST(3810.4500000000 AS Decimal(18, 10)), 54, 3, 4, N'4011209000', 575, 68090, CAST(932.1500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 54)
    INSERT @Registros VALUES (190, 61, 7, 3, CAST(N'2019-04-25' AS Date), CAST(36513.5800000000 AS Decimal(18, 10)), 265, 5, 6, N'4011209000', 681, 68230, CAST(15150.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 265)
    INSERT @Registros VALUES (191, 15, 7, 3, CAST(N'2019-04-26' AS Date), CAST(4592.9600000000 AS Decimal(18, 10)), 23, 14, 15, N'4011209000', 269, 68415, CAST(924.4900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 23)
    INSERT @Registros VALUES (192, 15, 7, 3, CAST(N'2019-04-26' AS Date), CAST(2962.0300000000 AS Decimal(18, 10)), 14, 14, 15, N'4011209000', 248, 68415, CAST(654.7400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 14)
    INSERT @Registros VALUES (193, 26, 7, 3, CAST(N'2019-04-26' AS Date), CAST(34489.6700000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 9, 68911, CAST(14965.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (194, 31, 7, 3, CAST(N'2019-04-26' AS Date), CAST(1065.1200000000 AS Decimal(18, 10)), 15, 5, 6, N'4011209000', 222, 68992, CAST(326.7000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 15)
    INSERT @Registros VALUES (195, 42, 7, 3, CAST(N'2019-04-29' AS Date), CAST(42126.5000000000 AS Decimal(18, 10)), 240, 3, 4, N'4011209000', 132, 70148, CAST(11890.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 240)
    INSERT @Registros VALUES (196, 23, 7, 3, CAST(N'2019-04-29' AS Date), CAST(25779.0600000000 AS Decimal(18, 10)), 200, 5, 6, N'4011209000', 100, 70473, CAST(11156.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 200)
    INSERT @Registros VALUES (197, 44, 7, 3, CAST(N'2019-04-30' AS Date), CAST(61844.7100000000 AS Decimal(18, 10)), 320, 3, 4, N'4011209000', 377, 71028, CAST(17062.3600000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 320)
    INSERT @Registros VALUES (198, 44, 7, 3, CAST(N'2019-04-30' AS Date), CAST(58610.6200000000 AS Decimal(18, 10)), 393, 3, 4, N'4011209000', 381, 71133, CAST(12684.3600000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 393)
    INSERT @Registros VALUES (199, 30, 7, 3, CAST(N'2019-04-30' AS Date), CAST(66550.2300000000 AS Decimal(18, 10)), 252, 3, 4, N'4011209000', 795, 71138, CAST(14290.0300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 252)
    INSERT @Registros VALUES (200, 47, 7, 3, CAST(N'2019-04-30' AS Date), CAST(36348.1900000000 AS Decimal(18, 10)), 186, 3, 4, N'4011209000', 395, 71821, CAST(8477.0900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 186)
    INSERT @Registros VALUES (201, 47, 7, 3, CAST(N'2019-04-30' AS Date), CAST(22278.5300000000 AS Decimal(18, 10)), 296, 3, 4, N'4011209000', 395, 71821, CAST(4439.5600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 296)
    INSERT @Registros VALUES (202, 8, 7, 3, CAST(N'2019-05-03' AS Date), CAST(13689.9500000000 AS Decimal(18, 10)), 88, 5, 6, N'4011209000', 60, 72854, CAST(5027.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 88)
    INSERT @Registros VALUES (203, 23, 7, 3, CAST(N'2019-05-03' AS Date), CAST(55709.6000000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 306, 72951, CAST(13886.9200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (204, 12, 1, 2, CAST(N'2019-05-03' AS Date), CAST(31770.4200000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 432, 73327, CAST(13984.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (205, 30, 7, 3, CAST(N'2019-05-03' AS Date), CAST(62240.3600000000 AS Decimal(18, 10)), 259, 3, 4, N'4011209000', 797, 73456, CAST(13978.5900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 259)
    INSERT @Registros VALUES (206, 64, 7, 3, CAST(N'2019-05-06' AS Date), CAST(39212.8400000000 AS Decimal(18, 10)), 357, 5, 6, N'4011209000', 310, 74098, CAST(14980.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 357)
    INSERT @Registros VALUES (207, 61, 7, 3, CAST(N'2019-05-06' AS Date), CAST(33097.5200000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 677, 74416, CAST(14440.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (208, 61, 7, 3, CAST(N'2019-05-06' AS Date), CAST(29082.3600000000 AS Decimal(18, 10)), 229, 5, 6, N'4011209000', 755, 74417, CAST(10135.1000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 229)
    INSERT @Registros VALUES (209, 42, 7, 3, CAST(N'2019-05-06' AS Date), CAST(37393.2300000000 AS Decimal(18, 10)), 328, 5, 6, N'4011209000', 401, 74438, CAST(15589.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 328)
    INSERT @Registros VALUES (210, 42, 7, 3, CAST(N'2019-05-06' AS Date), CAST(42856.8000000000 AS Decimal(18, 10)), 240, 8, 9, N'4011209000', 131, 74450, CAST(12515.0400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 240)
    INSERT @Registros VALUES (211, 23, 7, 3, CAST(N'2019-05-07' AS Date), CAST(34033.3900000000 AS Decimal(18, 10)), 332, 5, 6, N'4011209000', 100, 75323, CAST(14539.1400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 332)
    INSERT @Registros VALUES (212, 20, 7, 3, CAST(N'2019-05-07' AS Date), CAST(30951.2600000000 AS Decimal(18, 10)), 350, 5, 6, N'4011209000', 274, 75507, CAST(16320.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 350)
    INSERT @Registros VALUES (213, 45, 7, 3, CAST(N'2019-05-07' AS Date), CAST(1717.7300000000 AS Decimal(18, 10)), 20, 16, 17, N'4011209000', 552, 75677, CAST(353.1600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (214, 45, 7, 3, CAST(N'2019-05-07' AS Date), CAST(5009.6000000000 AS Decimal(18, 10)), 52, 14, 15, N'4011209000', 574, 75678, CAST(929.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 52)
    INSERT @Registros VALUES (215, 45, 7, 3, CAST(N'2019-05-07' AS Date), CAST(9471.7800000000 AS Decimal(18, 10)), 112, 14, 15, N'4011209000', 532, 75678, CAST(1757.4200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 112)
    INSERT @Registros VALUES (216, 17, 12, 8, CAST(N'2019-05-08' AS Date), CAST(29273.0600000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 137, 76328, CAST(13900.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (217, 9, 9, 5, CAST(N'2019-05-09' AS Date), CAST(31500.0000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 100, 76922, CAST(13850.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (218, 2, 12, 8, CAST(N'2019-05-09' AS Date), CAST(42295.6000000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 468, 77077, CAST(17112.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (219, 61, 7, 3, CAST(N'2019-05-09' AS Date), CAST(3055.3100000000 AS Decimal(18, 10)), 50, 5, 6, N'4011209000', 701, 77095, CAST(1084.6400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (220, 61, 7, 3, CAST(N'2019-05-09' AS Date), CAST(30898.7600000000 AS Decimal(18, 10)), 218, 5, 6, N'4011209000', 754, 77096, CAST(11881.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 218)
    INSERT @Registros VALUES (221, 30, 7, 3, CAST(N'2019-05-09' AS Date), CAST(5172.6700000000 AS Decimal(18, 10)), 72, 3, 4, N'4011209000', 821, 77273, CAST(1012.9300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 72)
    INSERT @Registros VALUES (222, 22, 7, 3, CAST(N'2019-05-09' AS Date), CAST(29682.8500000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 328, 77286, CAST(14000.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (223, 51, 7, 3, CAST(N'2019-05-09' AS Date), CAST(58476.8400000000 AS Decimal(18, 10)), 670, 5, 6, N'4011209000', 186, 77496, CAST(22984.3600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 670)
    INSERT @Registros VALUES (224, 5, 12, 8, CAST(N'2019-05-10' AS Date), CAST(19552.2800000000 AS Decimal(18, 10)), 93, 12, 14, N'4011209000', 299, 77693, CAST(6755.5200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 93)
    INSERT @Registros VALUES (225, 12, 1, 2, CAST(N'2019-05-10' AS Date), CAST(37827.9000000000 AS Decimal(18, 10)), 189, 5, 6, N'4011209000', 416, 77834, CAST(12710.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 189)
    INSERT @Registros VALUES (226, 45, 7, 3, CAST(N'2019-05-10' AS Date), CAST(11819.5600000000 AS Decimal(18, 10)), 44, 3, 4, N'4011209000', 645, 78356, CAST(2789.1700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 44)
    INSERT @Registros VALUES (227, 45, 7, 3, CAST(N'2019-05-10' AS Date), CAST(7561.4600000000 AS Decimal(18, 10)), 104, 3, 4, N'4011209000', 624, 78356, CAST(1442.4600000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 104)
    INSERT @Registros VALUES (228, 45, 7, 3, CAST(N'2019-05-10' AS Date), CAST(2941.0400000000 AS Decimal(18, 10)), 32, 3, 4, N'4011209000', 641, 78356, CAST(1017.7800000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 32)
    INSERT @Registros VALUES (229, 3, 6, 9, CAST(N'2019-05-13' AS Date), CAST(33473.7000000000 AS Decimal(18, 10)), 214, 20, 20, N'4011209000', 315, 78966, CAST(13872.5500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 214)
    INSERT @Registros VALUES (230, 32, 12, 8, CAST(N'2019-05-14' AS Date), CAST(796.4400000000 AS Decimal(18, 10)), 6, 5, 26, N'4011209000', 168, 79541, CAST(363.0000000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 6)
    INSERT @Registros VALUES (231, 32, 12, 8, CAST(N'2019-05-14' AS Date), CAST(17390.8000000000 AS Decimal(18, 10)), 140, 5, 26, N'4011209000', 165, 79541, CAST(7937.0000000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 140)
    INSERT @Registros VALUES (232, 61, 7, 3, CAST(N'2019-05-14' AS Date), CAST(38761.7500000000 AS Decimal(18, 10)), 326, 5, 6, N'4011209000', 726, 79625, CAST(15718.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 326)
    INSERT @Registros VALUES (233, 30, 7, 3, CAST(N'2019-05-14' AS Date), CAST(78289.6000000000 AS Decimal(18, 10)), 299, 3, 4, N'4011209000', 801, 79943, CAST(18003.7700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 299)
    INSERT @Registros VALUES (234, 30, 7, 3, CAST(N'2019-05-14' AS Date), CAST(81219.4400000000 AS Decimal(18, 10)), 312, 3, 4, N'4011209000', 809, 79952, CAST(18813.9100000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 312)
    INSERT @Registros VALUES (235, 30, 7, 3, CAST(N'2019-05-14' AS Date), CAST(81219.4400000000 AS Decimal(18, 10)), 312, 3, 4, N'4011209000', 810, 79958, CAST(18813.9100000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 312)
    INSERT @Registros VALUES (236, 62, 12, 8, CAST(N'2019-05-15' AS Date), CAST(37776.9000000000 AS Decimal(18, 10)), 265, 5, 6, N'4011209000', 520, 80436, CAST(15292.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 265)
    INSERT @Registros VALUES (237, 37, 8, 4, CAST(N'2019-05-15' AS Date), CAST(45566.6300000000 AS Decimal(18, 10)), 240, 5, 6, N'4011209000', 17, 80550, CAST(14605.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 240)
    INSERT @Registros VALUES (238, 15, 7, 3, CAST(N'2019-05-15' AS Date), CAST(829.4500000000 AS Decimal(18, 10)), 11, 20, 20, N'4011209000', 826, 80609, CAST(116.1300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 11)
    INSERT @Registros VALUES (239, 15, 7, 3, CAST(N'2019-05-15' AS Date), CAST(251.1100000000 AS Decimal(18, 10)), 4, 20, 20, N'4011209000', 829, 80609, CAST(53.6200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 4)
    INSERT @Registros VALUES (240, 15, 7, 3, CAST(N'2019-05-15' AS Date), CAST(1681.4600000000 AS Decimal(18, 10)), 29, 20, 20, N'4011209000', 830, 80609, CAST(354.4900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 29)
    INSERT @Registros VALUES (241, 15, 7, 3, CAST(N'2019-05-15' AS Date), CAST(1631.6400000000 AS Decimal(18, 10)), 24, 20, 20, N'4011209000', 833, 80609, CAST(415.8400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 24)
    INSERT @Registros VALUES (242, 15, 7, 3, CAST(N'2019-05-15' AS Date), CAST(2897.5000000000 AS Decimal(18, 10)), 16, 14, 15, N'4011209000', 253, 80609, CAST(567.8200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 16)
    INSERT @Registros VALUES (243, 15, 7, 3, CAST(N'2019-05-15' AS Date), CAST(859.0200000000 AS Decimal(18, 10)), 16, 20, 20, N'4011209000', 254, 80609, CAST(181.1000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 16)
    INSERT @Registros VALUES (244, 8, 7, 3, CAST(N'2019-05-15' AS Date), CAST(36302.7200000000 AS Decimal(18, 10)), 228, 5, 6, N'4011209000', 40, 80634, CAST(14512.6400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 228)
    INSERT @Registros VALUES (245, 61, 7, 3, CAST(N'2019-05-16' AS Date), CAST(36513.5800000000 AS Decimal(18, 10)), 265, 5, 6, N'4011209000', 681, 81505, CAST(15245.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 265)
    INSERT @Registros VALUES (246, 24, 12, 8, CAST(N'2019-05-16' AS Date), CAST(34486.0000000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 146, 81606, CAST(14640.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (247, 42, 7, 3, CAST(N'2019-05-16' AS Date), CAST(4843.2000000000 AS Decimal(18, 10)), 46, 2, 2, N'4011209000', 511, 81634, CAST(1312.4000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 46)
    INSERT @Registros VALUES (248, 51, 7, 3, CAST(N'2019-05-17' AS Date), CAST(25937.9800000000 AS Decimal(18, 10)), 218, 5, 6, N'4011209000', 113, 82286, CAST(12860.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 218)
    INSERT @Registros VALUES (249, 42, 7, 3, CAST(N'2019-05-17' AS Date), CAST(40664.1800000000 AS Decimal(18, 10)), 330, 5, 6, N'4011209000', 402, 82637, CAST(16459.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 330)
    INSERT @Registros VALUES (250, 29, 12, 8, CAST(N'2019-05-20' AS Date), CAST(32605.9700000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 839, 83285, CAST(15359.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (251, 45, 7, 3, CAST(N'2019-05-20' AS Date), CAST(91990.8000000000 AS Decimal(18, 10)), 638, 20, 20, N'4011209000', 580, 83454, CAST(36678.3000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 638)
    INSERT @Registros VALUES (252, 45, 7, 3, CAST(N'2019-05-20' AS Date), CAST(50072.7900000000 AS Decimal(18, 10)), 240, 3, 4, N'4011209000', 557, 83699, CAST(12705.0600000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 240)
    INSERT @Registros VALUES (253, 45, 7, 3, CAST(N'2019-05-20' AS Date), CAST(5547.5300000000 AS Decimal(18, 10)), 83, 3, 4, N'4011209000', 592, 83699, CAST(518.4900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 83)
    INSERT @Registros VALUES (254, 9, 9, 5, CAST(N'2019-05-20' AS Date), CAST(65420.0000000000 AS Decimal(18, 10)), 500, 5, 6, N'4011209000', 100, 83836, CAST(29850.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 500)
    INSERT @Registros VALUES (255, 44, 7, 3, CAST(N'2019-05-21' AS Date), CAST(36224.1900000000 AS Decimal(18, 10)), 243, 3, 4, N'4011209000', 359, 84431, CAST(7509.3100000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 243)
    INSERT @Registros VALUES (256, 44, 7, 3, CAST(N'2019-05-21' AS Date), CAST(46173.6100000000 AS Decimal(18, 10)), 240, 3, 4, N'4011209000', 358, 84499, CAST(12561.3500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 240)
    INSERT @Registros VALUES (257, 23, 7, 3, CAST(N'2019-05-24' AS Date), CAST(57468.9000000000 AS Decimal(18, 10)), 222, 3, 4, N'4011209000', 304, 87148, CAST(14562.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 222)
    INSERT @Registros VALUES (258, 12, 1, 2, CAST(N'2019-05-27' AS Date), CAST(61163.5200000000 AS Decimal(18, 10)), 524, 5, 6, N'4011209000', 443, 87814, CAST(27248.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 524)
    INSERT @Registros VALUES (259, 47, 7, 3, CAST(N'2019-05-27' AS Date), CAST(8179.9400000000 AS Decimal(18, 10)), 102, 3, 4, N'4011209000', 317, 87905, CAST(1609.6800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 102)
    INSERT @Registros VALUES (260, 47, 7, 3, CAST(N'2019-05-27' AS Date), CAST(32752.0400000000 AS Decimal(18, 10)), 377, 3, 4, N'4011209000', 317, 87905, CAST(6737.1300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 377)
    INSERT @Registros VALUES (261, 42, 7, 3, CAST(N'2019-05-28' AS Date), CAST(9394.2800000000 AS Decimal(18, 10)), 83, 2, 2, N'4011209000', 518, 88438, CAST(2710.4300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 83)
    INSERT @Registros VALUES (262, 12, 1, 2, CAST(N'2019-05-28' AS Date), CAST(31900.9300000000 AS Decimal(18, 10)), 320, 5, 6, N'4011209000', 441, 88579, CAST(14980.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 320)
    INSERT @Registros VALUES (263, 37, 8, 4, CAST(N'2019-05-29' AS Date), CAST(45345.2000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 19, 89467, CAST(14693.3000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (264, 15, 7, 3, CAST(N'2019-05-29' AS Date), CAST(1387.2900000000 AS Decimal(18, 10)), 8, 14, 15, N'4011209000', 268, 89480, CAST(271.8700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 8)
    INSERT @Registros VALUES (265, 15, 7, 3, CAST(N'2019-05-29' AS Date), CAST(4708.3400000000 AS Decimal(18, 10)), 32, 14, 15, N'4011209000', 245, 89480, CAST(1316.9500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 32)
    INSERT @Registros VALUES (266, 15, 7, 3, CAST(N'2019-05-29' AS Date), CAST(10901.7800000000 AS Decimal(18, 10)), 86, 14, 15, N'4011209000', 257, 89480, CAST(3048.3100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 86)
    INSERT @Registros VALUES (267, 51, 7, 3, CAST(N'2019-05-29' AS Date), CAST(10118.8500000000 AS Decimal(18, 10)), 84, 5, 6, N'4011209000', 211, 89593, CAST(3850.6100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 84)
    INSERT @Registros VALUES (268, 45, 7, 3, CAST(N'2019-05-30' AS Date), CAST(10764.5800000000 AS Decimal(18, 10)), 91, 14, 15, N'4011209000', 350, 91085, CAST(2122.1400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 91)
    INSERT @Registros VALUES (269, 45, 7, 3, CAST(N'2019-05-30' AS Date), CAST(9837.4000000000 AS Decimal(18, 10)), 110, 14, 15, N'4011209000', 351, 91085, CAST(1939.3600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 110)
    INSERT @Registros VALUES (270, 9, 9, 5, CAST(N'2019-05-31' AS Date), CAST(30700.0000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 100, 91561, CAST(14000.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (271, 31, 7, 3, CAST(N'2019-05-31' AS Date), CAST(1929.0600000000 AS Decimal(18, 10)), 25, 5, 6, N'4011209000', 656, 92121, CAST(584.4600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 25)
    INSERT @Registros VALUES (272, 23, 7, 3, CAST(N'2019-05-31' AS Date), CAST(39957.5500000000 AS Decimal(18, 10)), 310, 5, 6, N'4011209000', 100, 92212, CAST(17294.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 310)
    INSERT @Registros VALUES (273, 42, 7, 3, CAST(N'2019-06-03' AS Date), CAST(46695.4800000000 AS Decimal(18, 10)), 204, 9, 1, N'4011209000', 112, 92804, CAST(12547.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 204)
    INSERT @Registros VALUES (274, 47, 7, 3, CAST(N'2019-06-03' AS Date), CAST(50320.0300000000 AS Decimal(18, 10)), 196, 3, 4, N'4011209000', 318, 92901, CAST(12519.6800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 196)
    INSERT @Registros VALUES (275, 61, 7, 3, CAST(N'2019-06-04' AS Date), CAST(36915.0200000000 AS Decimal(18, 10)), 319, 5, 6, N'4011209000', 695, 93734, CAST(15640.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 319)
    INSERT @Registros VALUES (276, 2, 12, 8, CAST(N'2019-06-04' AS Date), CAST(3551.4500000000 AS Decimal(18, 10)), 30, 5, 25, N'4011209000', 395, 94030, CAST(1740.0000000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 30)
    INSERT @Registros VALUES (277, 2, 12, 8, CAST(N'2019-06-04' AS Date), CAST(6222.8000000000 AS Decimal(18, 10)), 40, 5, 25, N'4011209000', 73, 94045, CAST(2698.5600000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 40)
    INSERT @Registros VALUES (278, 2, 12, 8, CAST(N'2019-06-04' AS Date), CAST(25230.6000000000 AS Decimal(18, 10)), 180, 5, 25, N'4011209000', 842, 94045, CAST(10941.4400000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 180)
    INSERT @Registros VALUES (279, 6, 7, 3, CAST(N'2019-06-06' AS Date), CAST(9523.2700000000 AS Decimal(18, 10)), 66, 5, 6, N'4011209000', 91, 95422, CAST(3444.5500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 66)
    INSERT @Registros VALUES (280, 8, 7, 3, CAST(N'2019-06-06' AS Date), CAST(875.0000000000 AS Decimal(18, 10)), 4, 5, 6, N'4011209000', 59, 95504, CAST(296.0600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 4)
    INSERT @Registros VALUES (281, 64, 7, 3, CAST(N'2019-06-06' AS Date), CAST(39313.9400000000 AS Decimal(18, 10)), 294, 5, 6, N'4011209000', 310, 95760, CAST(15045.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 294)
    INSERT @Registros VALUES (282, 12, 1, 2, CAST(N'2019-06-07' AS Date), CAST(31409.2900000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 427, 96004, CAST(14780.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (283, 23, 7, 3, CAST(N'2019-06-07' AS Date), CAST(31594.5000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 100, 96116, CAST(13860.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (284, 44, 7, 3, CAST(N'2019-06-07' AS Date), CAST(64730.7100000000 AS Decimal(18, 10)), 497, 5, 6, N'4011209000', 456, 96403, CAST(25950.4300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 497)
    INSERT @Registros VALUES (285, 42, 7, 3, CAST(N'2019-06-10' AS Date), CAST(15573.9000000000 AS Decimal(18, 10)), 220, 8, 9, N'4011209000', 126, 97046, CAST(3989.9600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (286, 61, 7, 3, CAST(N'2019-06-11' AS Date), CAST(34867.0900000000 AS Decimal(18, 10)), 292, 5, 6, N'4011209000', 691, 97814, CAST(15150.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 292)
    INSERT @Registros VALUES (287, 15, 7, 3, CAST(N'2019-06-12' AS Date), CAST(214.7500000000 AS Decimal(18, 10)), 4, 20, 20, N'4011209000', 261, 98674, CAST(45.2800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 4)
    INSERT @Registros VALUES (288, 61, 7, 3, CAST(N'2019-06-12' AS Date), CAST(16420.0000000000 AS Decimal(18, 10)), 258, 5, 6, N'4011209000', 707, 98761, CAST(5871.8600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 258)
    INSERT @Registros VALUES (289, 30, 7, 3, CAST(N'2019-06-12' AS Date), CAST(15650.0000000000 AS Decimal(18, 10)), 80, 3, 4, N'4011209000', 823, 99001, CAST(4050.2900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 80)
    INSERT @Registros VALUES (290, 30, 7, 3, CAST(N'2019-06-12' AS Date), CAST(600.3100000000 AS Decimal(18, 10)), 8, 3, 4, N'4011209000', 822, 99001, CAST(122.6200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 8)
    INSERT @Registros VALUES (291, 40, 10, 2, CAST(N'2019-06-13' AS Date), CAST(72631.5800000000 AS Decimal(18, 10)), 500, 5, 6, N'4011209000', 100, 99896, CAST(30780.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 500)
    INSERT @Registros VALUES (292, 32, 12, 8, CAST(N'2019-06-13' AS Date), CAST(2654.8000000000 AS Decimal(18, 10)), 20, 5, 6, N'4011209000', 166, 100398, CAST(950.0000000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 20)
    INSERT @Registros VALUES (293, 32, 12, 8, CAST(N'2019-06-13' AS Date), CAST(3105.5000000000 AS Decimal(18, 10)), 25, 5, 6, N'4011209000', 167, 100398, CAST(1125.0000000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 25)
    INSERT @Registros VALUES (294, 9, 9, 5, CAST(N'2019-06-14' AS Date), CAST(29900.0000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 100, 100681, CAST(13400.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (295, 8, 7, 3, CAST(N'2019-06-14' AS Date), CAST(3956.2900000000 AS Decimal(18, 10)), 23, 5, 6, N'4011209000', 58, 100704, CAST(1477.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 23)
    INSERT @Registros VALUES (296, 24, 12, 8, CAST(N'2019-06-14' AS Date), CAST(70960.0000000000 AS Decimal(18, 10)), 540, 5, 6, N'4011209000', 162, 100786, CAST(29840.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 540)
    INSERT @Registros VALUES (297, 45, 7, 3, CAST(N'2019-06-14' AS Date), CAST(24835.1800000000 AS Decimal(18, 10)), 133, 3, 4, N'4011209000', 629, 100926, CAST(6282.3700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 133)
    INSERT @Registros VALUES (298, 45, 7, 3, CAST(N'2019-06-14' AS Date), CAST(641.2000000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 627, 100926, CAST(155.3200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 12)
    INSERT @Registros VALUES (299, 45, 7, 3, CAST(N'2019-06-14' AS Date), CAST(4757.7600000000 AS Decimal(18, 10)), 18, 3, 4, N'4011209000', 631, 100927, CAST(1490.4600000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 18)
    INSERT @Registros VALUES (300, 45, 7, 3, CAST(N'2019-06-14' AS Date), CAST(4350.3000000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 648, 100927, CAST(931.4700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 50)
    INSERT @Registros VALUES (301, 45, 7, 3, CAST(N'2019-06-14' AS Date), CAST(15930.0500000000 AS Decimal(18, 10)), 204, 3, 4, N'4011209000', 635, 100927, CAST(1325.6000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 204)
    INSERT @Registros VALUES (302, 61, 7, 3, CAST(N'2019-06-17' AS Date), CAST(5511.7600000000 AS Decimal(18, 10)), 90, 5, 6, N'4011209000', 739, 101929, CAST(1931.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 90)
    INSERT @Registros VALUES (303, 45, 7, 3, CAST(N'2019-06-18' AS Date), CAST(123472.5000000000 AS Decimal(18, 10)), 920, 20, 20, N'4011209000', 599, 102733, CAST(50509.1800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 920)
    INSERT @Registros VALUES (304, 44, 7, 3, CAST(N'2019-06-18' AS Date), CAST(53874.8200000000 AS Decimal(18, 10)), 269, 3, 4, N'4011209000', 367, 102749, CAST(13332.2400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 269)
    INSERT @Registros VALUES (305, 61, 7, 3, CAST(N'2019-06-18' AS Date), CAST(32776.3200000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 716, 102989, CAST(13188.3500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (306, 27, 7, 3, CAST(N'2019-06-20' AS Date), CAST(5074.2800000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 663, 103369, CAST(827.1600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 60)
    INSERT @Registros VALUES (307, 3, 6, 9, CAST(N'2019-06-20' AS Date), CAST(38336.3000000000 AS Decimal(18, 10)), 246, 20, 20, N'4011209000', 316, 103716, CAST(15946.9500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 246)
    INSERT @Registros VALUES (308, 25, 7, 3, CAST(N'2019-06-20' AS Date), CAST(14714.0400000000 AS Decimal(18, 10)), 122, 5, 6, N'4011209000', 100, 104276, CAST(7442.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 122)
    INSERT @Registros VALUES (309, 64, 7, 3, CAST(N'2019-06-21' AS Date), CAST(38636.1400000000 AS Decimal(18, 10)), 328, 5, 6, N'4011209000', 100, 104337, CAST(15220.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 328)
    INSERT @Registros VALUES (310, 45, 7, 3, CAST(N'2019-06-21' AS Date), CAST(5614.9000000000 AS Decimal(18, 10)), 84, 16, 17, N'4011209000', 349, 104502, CAST(1123.2300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 84)
    INSERT @Registros VALUES (311, 2, 12, 8, CAST(N'2019-06-21' AS Date), CAST(29595.4700000000 AS Decimal(18, 10)), 250, 5, 25, N'4011209000', 395, 104849, CAST(14500.0000000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 250)
    INSERT @Registros VALUES (312, 2, 12, 8, CAST(N'2019-06-21' AS Date), CAST(38892.5000000000 AS Decimal(18, 10)), 250, 5, 25, N'4011209000', 74, 104864, CAST(15278.5700000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 250)
    INSERT @Registros VALUES (313, 2, 12, 8, CAST(N'2019-06-21' AS Date), CAST(16888.4600000000 AS Decimal(18, 10)), 122, 5, 25, N'4011209000', 71, 104864, CAST(6634.4800000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 122)
    INSERT @Registros VALUES (314, 2, 12, 8, CAST(N'2019-06-21' AS Date), CAST(8382.4200000000 AS Decimal(18, 10)), 54, 5, 25, N'4011209000', 70, 104864, CAST(3292.9600000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 54)
    INSERT @Registros VALUES (315, 66, 12, 8, CAST(N'2019-06-21' AS Date), CAST(2111.2000000000 AS Decimal(18, 10)), 20, 5, 6, N'4011201000', 173, 105125, CAST(1226.2100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (316, 66, 12, 8, CAST(N'2019-06-21' AS Date), CAST(23525.2600000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 174, 105125, CAST(13663.7900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (317, 37, 8, 4, CAST(N'2019-06-24' AS Date), CAST(45576.9400000000 AS Decimal(18, 10)), 246, 5, 6, N'4011209000', 18, 105417, CAST(14705.3200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 246)
    INSERT @Registros VALUES (318, 42, 7, 3, CAST(N'2019-06-24' AS Date), CAST(9358.4900000000 AS Decimal(18, 10)), 59, 2, 2, N'4011209000', 513, 105657, CAST(2691.2700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 59)
    INSERT @Registros VALUES (319, 30, 7, 3, CAST(N'2019-06-24' AS Date), CAST(46493.5800000000 AS Decimal(18, 10)), 198, 3, 4, N'4011209000', 772, 106017, CAST(11271.0000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 198)
    INSERT @Registros VALUES (320, 61, 7, 3, CAST(N'2019-06-24' AS Date), CAST(27043.9700000000 AS Decimal(18, 10)), 207, 5, 6, N'4011209000', 752, 106242, CAST(9979.8400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 207)
    INSERT @Registros VALUES (321, 6, 7, 3, CAST(N'2019-06-25' AS Date), CAST(36608.1200000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 88, 106558, CAST(14480.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (322, 15, 7, 3, CAST(N'2019-06-26' AS Date), CAST(501.4900000000 AS Decimal(18, 10)), 8, 20, 20, N'4011209000', 835, 106908, CAST(137.4300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 8)
    INSERT @Registros VALUES (323, 45, 7, 3, CAST(N'2019-06-26' AS Date), CAST(67161.7500000000 AS Decimal(18, 10)), 247, 3, 4, N'4011209000', 398, 107270, CAST(14182.1600000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 247)
    INSERT @Registros VALUES (324, 45, 7, 3, CAST(N'2019-06-26' AS Date), CAST(1348.9600000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 396, 107270, CAST(404.4300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 20)
    INSERT @Registros VALUES (325, 23, 7, 3, CAST(N'2019-06-26' AS Date), CAST(31554.3800000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 300, 107673, CAST(13860.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (326, 23, 7, 3, CAST(N'2019-06-27' AS Date), CAST(58792.9100000000 AS Decimal(18, 10)), 224, 3, 4, N'4011209000', 306, 108912, CAST(14793.4500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 224)
    INSERT @Registros VALUES (327, 47, 7, 3, CAST(N'2019-07-01' AS Date), CAST(44429.4100000000 AS Decimal(18, 10)), 198, 3, 4, N'4011209000', 319, 110397, CAST(10609.5100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 198)
    INSERT @Registros VALUES (328, 47, 7, 3, CAST(N'2019-07-01' AS Date), CAST(8684.1700000000 AS Decimal(18, 10)), 110, 3, 4, N'4011209000', 317, 110397, CAST(1766.1900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 110)
    INSERT @Registros VALUES (329, 61, 7, 3, CAST(N'2019-07-02' AS Date), CAST(30873.0900000000 AS Decimal(18, 10)), 214, 5, 6, N'4011209000', 749, 111041, CAST(11898.4700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 214)
    INSERT @Registros VALUES (330, 30, 7, 3, CAST(N'2019-07-02' AS Date), CAST(30142.0000000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 762, 111352, CAST(6263.7000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 100)
    INSERT @Registros VALUES (331, 30, 7, 3, CAST(N'2019-07-02' AS Date), CAST(2053.7800000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 805, 111352, CAST(391.8000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 30)
    INSERT @Registros VALUES (332, 20, 7, 3, CAST(N'2019-07-02' AS Date), CAST(55829.2500000000 AS Decimal(18, 10)), 500, 5, 6, N'4011209000', 273, 111402, CAST(29000.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 500)
    INSERT @Registros VALUES (333, 4, 7, 3, CAST(N'2019-07-03' AS Date), CAST(10659.8300000000 AS Decimal(18, 10)), 130, 5, 24, N'4011209000', 14, 112467, CAST(4144.3300000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 130)
    INSERT @Registros VALUES (334, 42, 7, 3, CAST(N'2019-07-04' AS Date), CAST(51198.5200000000 AS Decimal(18, 10)), 276, 3, 4, N'4011209000', 155, 112651, CAST(14583.5200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 276)
    INSERT @Registros VALUES (335, 51, 7, 3, CAST(N'2019-07-04' AS Date), CAST(36495.9600000000 AS Decimal(18, 10)), 324, 5, 6, N'4011209000', 157, 113009, CAST(15335.0200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 324)
    INSERT @Registros VALUES (336, 61, 7, 3, CAST(N'2019-07-05' AS Date), CAST(33224.1200000000 AS Decimal(18, 10)), 267, 5, 6, N'4011209000', 721, 113545, CAST(14640.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 267)
    INSERT @Registros VALUES (337, 42, 7, 3, CAST(N'2019-07-05' AS Date), CAST(20282.7300000000 AS Decimal(18, 10)), 129, 2, 2, N'4011209000', 498, 113754, CAST(5663.3200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 129)
    INSERT @Registros VALUES (338, 47, 7, 3, CAST(N'2019-07-09' AS Date), CAST(35764.3900000000 AS Decimal(18, 10)), 256, 3, 4, N'4011209000', 319, 115758, CAST(8362.6100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 256)
    INSERT @Registros VALUES (339, 61, 7, 3, CAST(N'2019-07-09' AS Date), CAST(35450.5100000000 AS Decimal(18, 10)), 319, 5, 6, N'4011209000', 693, 115783, CAST(16160.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 319)
    INSERT @Registros VALUES (340, 30, 7, 3, CAST(N'2019-07-10' AS Date), CAST(63580.4900000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 790, 116389, CAST(14191.1200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 250)
    INSERT @Registros VALUES (341, 12, 1, 2, CAST(N'2019-07-10' AS Date), CAST(61761.7800000000 AS Decimal(18, 10)), 524, 5, 6, N'4011209000', 444, 116410, CAST(27808.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 524)
    INSERT @Registros VALUES (342, 45, 7, 3, CAST(N'2019-07-10' AS Date), CAST(2443.4300000000 AS Decimal(18, 10)), 37, 3, 4, N'4011209000', 567, 116727, CAST(525.4000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 37)
    INSERT @Registros VALUES (343, 45, 7, 3, CAST(N'2019-07-10' AS Date), CAST(19682.8000000000 AS Decimal(18, 10)), 132, 3, 4, N'4011209000', 537, 116727, CAST(4232.2900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 132)
    INSERT @Registros VALUES (344, 45, 7, 3, CAST(N'2019-07-10' AS Date), CAST(22082.8100000000 AS Decimal(18, 10)), 87, 3, 4, N'4011209000', 593, 116729, CAST(4588.3400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 87)
    INSERT @Registros VALUES (345, 45, 7, 3, CAST(N'2019-07-10' AS Date), CAST(3691.5000000000 AS Decimal(18, 10)), 48, 3, 4, N'4011209000', 573, 116729, CAST(767.0200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 48)
    INSERT @Registros VALUES (346, 45, 7, 3, CAST(N'2019-07-10' AS Date), CAST(317.7600000000 AS Decimal(18, 10)), 6, 3, 4, N'4011209000', 578, 116729, CAST(66.0300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 6)
    INSERT @Registros VALUES (347, 45, 7, 3, CAST(N'2019-07-11' AS Date), CAST(9167.9700000000 AS Decimal(18, 10)), 88, 14, 15, N'4011209000', 594, 117339, CAST(2036.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 88)
    INSERT @Registros VALUES (348, 45, 7, 3, CAST(N'2019-07-11' AS Date), CAST(19351.6000000000 AS Decimal(18, 10)), 220, 14, 15, N'4011209000', 486, 117339, CAST(4298.0500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (349, 6, 7, 3, CAST(N'2019-07-12' AS Date), CAST(4167.5900000000 AS Decimal(18, 10)), 32, 5, 6, N'4011209000', 89, 118050, CAST(1501.6900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 32)
    INSERT @Registros VALUES (350, 42, 7, 3, CAST(N'2019-07-15' AS Date), CAST(48260.9000000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 124, 118854, CAST(13924.9400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (351, 22, 7, 3, CAST(N'2019-07-16' AS Date), CAST(28444.5200000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 329, 120323, CAST(13750.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (352, 24, 12, 8, CAST(N'2019-07-17' AS Date), CAST(37086.0000000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 150, 120712, CAST(15400.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (353, 51, 7, 3, CAST(N'2019-07-19' AS Date), CAST(54570.6400000000 AS Decimal(18, 10)), 500, 5, 6, N'4011209000', 270, 121622, CAST(22271.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 500)
    INSERT @Registros VALUES (354, 44, 7, 3, CAST(N'2019-07-19' AS Date), CAST(57376.4900000000 AS Decimal(18, 10)), 311, 3, 4, N'4011209000', 374, 121812, CAST(15458.4900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 311)
    INSERT @Registros VALUES (355, 22, 7, 3, CAST(N'2019-07-19' AS Date), CAST(31447.5200000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 336, 121872, CAST(14128.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (356, 30, 7, 3, CAST(N'2019-07-19' AS Date), CAST(1453.7900000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 775, 121935, CAST(253.0200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 20)
    INSERT @Registros VALUES (357, 8, 7, 3, CAST(N'2019-07-19' AS Date), CAST(14083.3400000000 AS Decimal(18, 10)), 88, 5, 6, N'4011209000', 55, 122023, CAST(5085.2800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 88)
    INSERT @Registros VALUES (358, 15, 7, 3, CAST(N'2019-07-22' AS Date), CAST(872.6300000000 AS Decimal(18, 10)), 14, 20, 20, N'4011209000', 827, 122401, CAST(183.9700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 14)
    INSERT @Registros VALUES (359, 6, 7, 3, CAST(N'2019-07-22' AS Date), CAST(35482.4400000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 88, 122842, CAST(14266.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (360, 8, 7, 3, CAST(N'2019-07-23' AS Date), CAST(28190.9200000000 AS Decimal(18, 10)), 184, 5, 6, N'4011209000', 54, 123651, CAST(11463.6500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 184)
    INSERT @Registros VALUES (361, 47, 7, 3, CAST(N'2019-07-23' AS Date), CAST(46471.2600000000 AS Decimal(18, 10)), 390, 3, 4, N'4011209000', 389, 123830, CAST(10522.1800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 390)
    INSERT @Registros VALUES (362, 45, 7, 3, CAST(N'2019-07-23' AS Date), CAST(140693.0000000000 AS Decimal(18, 10)), 1070, 20, 20, N'4011209000', 530, 123860, CAST(58444.1000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1070)
    INSERT @Registros VALUES (363, 14, 4, 2, CAST(N'2019-07-23' AS Date), CAST(24206.7200000000 AS Decimal(18, 10)), 174, 5, 6, N'4011209000', 395, 123935, CAST(9614.7900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 174)
    INSERT @Registros VALUES (364, 47, 7, 3, CAST(N'2019-07-24' AS Date), CAST(4912.6300000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 468, 124608, CAST(1089.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 60)
    INSERT @Registros VALUES (365, 12, 1, 2, CAST(N'2019-07-24' AS Date), CAST(29576.3600000000 AS Decimal(18, 10)), 244, 5, 6, N'4011209000', 425, 124676, CAST(14320.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 244)
    INSERT @Registros VALUES (366, 23, 7, 3, CAST(N'2019-07-24' AS Date), CAST(36290.5500000000 AS Decimal(18, 10)), 228, 5, 6, N'4011209000', 100, 125188, CAST(15795.8400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 228)
    INSERT @Registros VALUES (367, 37, 8, 4, CAST(N'2019-07-25' AS Date), CAST(36050.9200000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 23, 125400, CAST(15039.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 256)
    INSERT @Registros VALUES (368, 30, 7, 3, CAST(N'2019-07-25' AS Date), CAST(4740.7600000000 AS Decimal(18, 10)), 68, 3, 4, N'4011209000', 820, 125815, CAST(892.1400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 68)
    INSERT @Registros VALUES (369, 61, 7, 3, CAST(N'2019-07-26' AS Date), CAST(31238.1100000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 677, 126667, CAST(14500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (370, 10, 7, 3, CAST(N'2019-07-26' AS Date), CAST(19320.3600000000 AS Decimal(18, 10)), 169, 3, 4, N'4011209000', 172, 126883, CAST(3310.9600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 169)
    INSERT @Registros VALUES (371, 23, 7, 3, CAST(N'2019-07-29' AS Date), CAST(35323.6500000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 100, 127280, CAST(15170.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (372, 26, 7, 3, CAST(N'2019-07-29' AS Date), CAST(31949.1800000000 AS Decimal(18, 10)), 240, 5, 6, N'4011209000', 6, 128012, CAST(13997.4500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 240)
    INSERT @Registros VALUES (373, 45, 7, 3, CAST(N'2019-07-30' AS Date), CAST(17470.4600000000 AS Decimal(18, 10)), 72, 3, 4, N'4011209000', 584, 129115, CAST(3991.1400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 72)
    INSERT @Registros VALUES (374, 45, 7, 3, CAST(N'2019-07-30' AS Date), CAST(6953.0900000000 AS Decimal(18, 10)), 90, 3, 4, N'4011209000', 596, 129115, CAST(1803.3000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 90)
    INSERT @Registros VALUES (375, 45, 7, 3, CAST(N'2019-07-30' AS Date), CAST(8955.3900000000 AS Decimal(18, 10)), 135, 3, 4, N'4011209000', 98, 129115, CAST(2036.8500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 135)
    INSERT @Registros VALUES (376, 51, 7, 3, CAST(N'2019-07-30' AS Date), CAST(54711.8300000000 AS Decimal(18, 10)), 632, 5, 6, N'4011209000', 220, 129196, CAST(22025.2100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 632)
    INSERT @Registros VALUES (377, 44, 7, 3, CAST(N'2019-07-31' AS Date), CAST(51274.0900000000 AS Decimal(18, 10)), 281, 3, 4, N'4011209000', 368, 129610, CAST(13540.9400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 281)
    INSERT @Registros VALUES (378, 47, 7, 3, CAST(N'2019-08-01' AS Date), CAST(19711.7900000000 AS Decimal(18, 10)), 264, 3, 4, N'4011209000', 389, 130595, CAST(4012.1800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (379, 42, 7, 3, CAST(N'2019-08-01' AS Date), CAST(10951.4000000000 AS Decimal(18, 10)), 150, 16, 4, N'4011209000', 108, 130826, CAST(1780.3700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 150)
    INSERT @Registros VALUES (380, 8, 7, 3, CAST(N'2019-08-02' AS Date), CAST(865.5400000000 AS Decimal(18, 10)), 4, 5, 6, N'4011209000', 50, 131203, CAST(296.0600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 4)
    INSERT @Registros VALUES (381, 61, 7, 3, CAST(N'2019-08-05' AS Date), CAST(31417.5700000000 AS Decimal(18, 10)), 269, 5, 6, N'4011209000', 722, 132137, CAST(14700.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 269)
    INSERT @Registros VALUES (382, 45, 7, 3, CAST(N'2019-08-05' AS Date), CAST(3869.3800000000 AS Decimal(18, 10)), 60, 16, 17, N'4011209000', 650, 132270, CAST(772.7100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 60)
    INSERT @Registros VALUES (383, 44, 7, 3, CAST(N'2019-08-06' AS Date), CAST(78985.2600000000 AS Decimal(18, 10)), 624, 5, 6, N'4011209000', 458, 133037, CAST(34984.9600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 624)
    INSERT @Registros VALUES (384, 12, 1, 2, CAST(N'2019-08-06' AS Date), CAST(30822.9600000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 432, 133045, CAST(13624.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (385, 46, 7, 3, CAST(N'2019-08-07' AS Date), CAST(17890.0000000000 AS Decimal(18, 10)), 116, 5, 6, N'4011209000', 759, 134091, CAST(6353.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 116)
    INSERT @Registros VALUES (386, 51, 7, 3, CAST(N'2019-08-07' AS Date), CAST(2558.0600000000 AS Decimal(18, 10)), 20, 5, 6, N'4011209000', 185, 134605, CAST(983.3200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (387, 61, 7, 3, CAST(N'2019-08-08' AS Date), CAST(30967.8800000000 AS Decimal(18, 10)), 232, 5, 6, N'4011209000', 735, 135006, CAST(11682.5400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 232)
    INSERT @Registros VALUES (388, 31, 7, 3, CAST(N'2019-08-08' AS Date), CAST(786.3000000000 AS Decimal(18, 10)), 10, 5, 6, N'4011209000', 225, 135057, CAST(248.6200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 10)
    INSERT @Registros VALUES (389, 30, 7, 3, CAST(N'2019-08-08' AS Date), CAST(59429.2300000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 788, 135301, CAST(13743.1500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 250)
    INSERT @Registros VALUES (390, 4, 7, 3, CAST(N'2019-08-08' AS Date), CAST(13818.0900000000 AS Decimal(18, 10)), 108, 5, 6, N'4011209000', 16, 135617, CAST(5351.4900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 108)
    INSERT @Registros VALUES (391, 12, 1, 2, CAST(N'2019-08-09' AS Date), CAST(21634.0000000000 AS Decimal(18, 10)), 104, 14, 15, N'4011209000', 413, 135915, CAST(6374.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 104)
    INSERT @Registros VALUES (392, 45, 7, 3, CAST(N'2019-08-09' AS Date), CAST(2884.9500000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 478, 136045, CAST(616.3200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 50)
    INSERT @Registros VALUES (393, 45, 7, 3, CAST(N'2019-08-09' AS Date), CAST(32551.6000000000 AS Decimal(18, 10)), 203, 3, 4, N'4011209000', 76, 136045, CAST(6954.1000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 203)
    INSERT @Registros VALUES (394, 45, 7, 3, CAST(N'2019-08-09' AS Date), CAST(3683.3500000000 AS Decimal(18, 10)), 55, 3, 4, N'4011209000', 479, 136045, CAST(786.8900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 55)
    INSERT @Registros VALUES (395, 42, 7, 3, CAST(N'2019-08-12' AS Date), CAST(5870.0000000000 AS Decimal(18, 10)), 28, 2, 2, N'4011209000', 505, 136942, CAST(1662.6400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 28)
    INSERT @Registros VALUES (396, 15, 7, 3, CAST(N'2019-08-13' AS Date), CAST(510.1600000000 AS Decimal(18, 10)), 8, 20, 20, N'4011209000', 831, 137511, CAST(107.5600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 8)
    INSERT @Registros VALUES (397, 8, 7, 3, CAST(N'2019-08-13' AS Date), CAST(12836.8200000000 AS Decimal(18, 10)), 103, 5, 6, N'4011209000', 52, 137595, CAST(4444.6100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 103)
    INSERT @Registros VALUES (398, 7, 12, 8, CAST(N'2019-08-14' AS Date), CAST(7208.7600000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 295, 138529, CAST(1241.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 100)
    INSERT @Registros VALUES (399, 7, 12, 8, CAST(N'2019-08-14' AS Date), CAST(60553.6400000000 AS Decimal(18, 10)), 840, 3, 4, N'4011209000', 293, 138529, CAST(10424.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 840)
    INSERT @Registros VALUES (400, 61, 7, 3, CAST(N'2019-08-14' AS Date), CAST(25580.6600000000 AS Decimal(18, 10)), 206, 5, 6, N'4011209000', 733, 139016, CAST(9361.0700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 206)
    INSERT @Registros VALUES (401, 45, 7, 3, CAST(N'2019-08-14' AS Date), CAST(8736.5000000000 AS Decimal(18, 10)), 110, 14, 15, N'4011209000', 469, 139249, CAST(2072.6500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 110)
    INSERT @Registros VALUES (402, 45, 7, 3, CAST(N'2019-08-14' AS Date), CAST(13018.9000000000 AS Decimal(18, 10)), 140, 14, 15, N'4011209000', 473, 139249, CAST(3088.6100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 140)
    INSERT @Registros VALUES (403, 30, 7, 3, CAST(N'2019-08-15' AS Date), CAST(48039.6200000000 AS Decimal(18, 10)), 249, 3, 4, N'4011209000', 783, 139766, CAST(12326.0900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 249)
    INSERT @Registros VALUES (404, 31, 7, 3, CAST(N'2019-08-16' AS Date), CAST(3816.8300000000 AS Decimal(18, 10)), 51, 14, 15, N'4011209000', 447, 140208, CAST(829.8700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 51)
    INSERT @Registros VALUES (405, 61, 7, 3, CAST(N'2019-08-16' AS Date), CAST(32150.5400000000 AS Decimal(18, 10)), 278, 5, 6, N'4011209000', 727, 140372, CAST(14620.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 278)
    INSERT @Registros VALUES (406, 30, 7, 3, CAST(N'2019-08-19' AS Date), CAST(1604.0100000000 AS Decimal(18, 10)), 2, 4, 9, N'4011209000', 773, 141254, CAST(208.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 2)
    INSERT @Registros VALUES (407, 30, 7, 3, CAST(N'2019-08-19' AS Date), CAST(2250.2100000000 AS Decimal(18, 10)), 32, 3, 4, N'4011209000', 811, 141259, CAST(744.1200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 32)
    INSERT @Registros VALUES (408, 61, 7, 3, CAST(N'2019-08-20' AS Date), CAST(31747.1500000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 678, 142236, CAST(14880.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (409, 45, 7, 3, CAST(N'2019-08-20' AS Date), CAST(52444.4500000000 AS Decimal(18, 10)), 189, 3, 4, N'4011209000', 474, 142272, CAST(8266.9000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 189)
    INSERT @Registros VALUES (410, 45, 7, 3, CAST(N'2019-08-20' AS Date), CAST(14180.9600000000 AS Decimal(18, 10)), 206, 3, 4, N'4011209000', 397, 142272, CAST(6575.2600000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 206)
    INSERT @Registros VALUES (411, 8, 7, 3, CAST(N'2019-08-20' AS Date), CAST(1752.5800000000 AS Decimal(18, 10)), 8, 5, 6, N'4011209000', 53, 142293, CAST(592.1200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 8)
    INSERT @Registros VALUES (412, 45, 7, 3, CAST(N'2019-08-20' AS Date), CAST(27960.1200000000 AS Decimal(18, 10)), 340, 7, 8, N'4011209000', 643, 142315, CAST(4500.9700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 340)
    INSERT @Registros VALUES (413, 44, 7, 3, CAST(N'2019-08-20' AS Date), CAST(56157.2700000000 AS Decimal(18, 10)), 259, 3, 4, N'4011209000', 363, 142358, CAST(13630.1800000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 259)
    INSERT @Registros VALUES (414, 15, 7, 3, CAST(N'2019-08-21' AS Date), CAST(322.1300000000 AS Decimal(18, 10)), 6, 20, 20, N'4011209000', 266, 143104, CAST(67.9100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 6)
    INSERT @Registros VALUES (415, 15, 7, 3, CAST(N'2019-08-21' AS Date), CAST(321.2100000000 AS Decimal(18, 10)), 6, 20, 20, N'4011209000', 265, 143104, CAST(81.8700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 6)
    INSERT @Registros VALUES (416, 15, 7, 3, CAST(N'2019-08-21' AS Date), CAST(1800.1000000000 AS Decimal(18, 10)), 16, 14, 15, N'4011209000', 255, 143104, CAST(503.3400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 16)
    INSERT @Registros VALUES (417, 15, 7, 3, CAST(N'2019-08-21' AS Date), CAST(790.8900000000 AS Decimal(18, 10)), 12, 20, 20, N'4011209000', 247, 143104, CAST(130.9200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 12)
    INSERT @Registros VALUES (418, 15, 7, 3, CAST(N'2019-08-21' AS Date), CAST(7107.8000000000 AS Decimal(18, 10)), 40, 14, 15, N'4011209000', 262, 143104, CAST(1987.4600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (419, 12, 1, 2, CAST(N'2019-08-21' AS Date), CAST(30036.2600000000 AS Decimal(18, 10)), 242, 5, 6, N'4011209000', 424, 143469, CAST(14040.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 242)
    INSERT @Registros VALUES (420, 26, 7, 3, CAST(N'2019-08-21' AS Date), CAST(36839.8500000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 9, 143680, CAST(15352.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (421, 51, 7, 3, CAST(N'2019-08-22' AS Date), CAST(82750.6700000000 AS Decimal(18, 10)), 719, 5, 6, N'4011209000', 200, 143817, CAST(33977.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 719)
    INSERT @Registros VALUES (422, 42, 7, 3, CAST(N'2019-08-22' AS Date), CAST(40154.0000000000 AS Decimal(18, 10)), 265, 5, 6, N'4011209000', 399, 143916, CAST(15599.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 265)
    INSERT @Registros VALUES (423, 24, 12, 8, CAST(N'2019-08-22' AS Date), CAST(36830.0000000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 149, 144073, CAST(15360.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (424, 30, 7, 3, CAST(N'2019-08-22' AS Date), CAST(4709.6500000000 AS Decimal(18, 10)), 20, 11, 12, N'4011209000', 286, 144105, CAST(831.5600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (425, 30, 7, 3, CAST(N'2019-08-22' AS Date), CAST(3207.0400000000 AS Decimal(18, 10)), 10, 10, 11, N'4011209000', 282, 144105, CAST(721.1300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 10)
    INSERT @Registros VALUES (426, 30, 7, 3, CAST(N'2019-08-22' AS Date), CAST(3209.0400000000 AS Decimal(18, 10)), 10, 10, 11, N'4011209000', 283, 144105, CAST(721.1300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 10)
    INSERT @Registros VALUES (427, 23, 7, 3, CAST(N'2019-08-23' AS Date), CAST(57157.8900000000 AS Decimal(18, 10)), 228, 3, 4, N'4011209000', 306, 144825, CAST(14542.3900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 228)
    INSERT @Registros VALUES (428, 22, 7, 3, CAST(N'2019-08-23' AS Date), CAST(30593.9100000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 331, 145245, CAST(14828.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (429, 47, 7, 3, CAST(N'2019-08-23' AS Date), CAST(9902.5100000000 AS Decimal(18, 10)), 110, 3, 4, N'4011209000', 171, 145405, CAST(1876.2600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 110)
    INSERT @Registros VALUES (430, 30, 7, 3, CAST(N'2019-08-26' AS Date), CAST(67949.6700000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 789, 145821, CAST(15060.1000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 250)
    INSERT @Registros VALUES (431, 47, 7, 3, CAST(N'2019-08-26' AS Date), CAST(19574.0100000000 AS Decimal(18, 10)), 200, 3, 4, N'4011209000', 389, 146371, CAST(4134.1100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 200)
    INSERT @Registros VALUES (432, 42, 7, 3, CAST(N'2019-08-26' AS Date), CAST(46323.0000000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 121, 146438, CAST(13605.4800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (433, 45, 7, 3, CAST(N'2019-08-26' AS Date), CAST(149924.4000000000 AS Decimal(18, 10)), 1114, 20, 20, N'4011209000', 470, 146452, CAST(61347.7000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1114)
    INSERT @Registros VALUES (434, 64, 7, 3, CAST(N'2019-08-26' AS Date), CAST(37163.2100000000 AS Decimal(18, 10)), 284, 5, 6, N'4011209000', 100, 146509, CAST(15100.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 284)
    INSERT @Registros VALUES (435, 44, 7, 3, CAST(N'2019-08-27' AS Date), CAST(33728.9600000000 AS Decimal(18, 10)), 291, 5, 6, N'4011209000', 369, 147002, CAST(12358.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 291)
    INSERT @Registros VALUES (436, 12, 1, 2, CAST(N'2019-08-27' AS Date), CAST(30958.4200000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 431, 147096, CAST(13624.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (437, 44, 7, 3, CAST(N'2019-08-27' AS Date), CAST(61659.3400000000 AS Decimal(18, 10)), 312, 3, 4, N'4011209000', 375, 147162, CAST(16067.2400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 312)
    INSERT @Registros VALUES (438, 45, 7, 3, CAST(N'2019-08-27' AS Date), CAST(30585.8000000000 AS Decimal(18, 10)), 137, 3, 4, N'4011209000', 472, 147391, CAST(6746.2100000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 137)
    INSERT @Registros VALUES (439, 45, 7, 3, CAST(N'2019-08-27' AS Date), CAST(1337.3500000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 290, 147391, CAST(299.4300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 20)
    INSERT @Registros VALUES (440, 8, 7, 3, CAST(N'2019-08-28' AS Date), CAST(17332.7800000000 AS Decimal(18, 10)), 100, 5, 6, N'4011209000', 67, 147726, CAST(6878.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 100)
    INSERT @Registros VALUES (441, 61, 7, 3, CAST(N'2019-08-29' AS Date), CAST(33803.1200000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 678, 148825, CAST(14780.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (442, 45, 7, 3, CAST(N'2019-08-30' AS Date), CAST(36580.9200000000 AS Decimal(18, 10)), 143, 3, 4, N'4011209000', 539, 150417, CAST(7922.4600000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 143)
    INSERT @Registros VALUES (443, 45, 7, 3, CAST(N'2019-08-30' AS Date), CAST(7733.5500000000 AS Decimal(18, 10)), 90, 3, 4, N'4011209000', 596, 150417, CAST(1832.3500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 90)
    INSERT @Registros VALUES (444, 51, 7, 3, CAST(N'2019-10-03' AS Date), CAST(88004.4000000000 AS Decimal(18, 10)), 664, 5, 6, N'4011209000', 214, 171737, CAST(35868.4400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 664)
    INSERT @Registros VALUES (445, 47, 7, 3, CAST(N'2019-10-03' AS Date), CAST(736.0900000000 AS Decimal(18, 10)), 10, 3, 4, N'4011209000', 317, 171979, CAST(144.0700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 10)
    INSERT @Registros VALUES (446, 47, 7, 3, CAST(N'2019-10-03' AS Date), CAST(6755.7100000000 AS Decimal(18, 10)), 74, 3, 4, N'4011209000', 317, 171979, CAST(1322.2900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 74)
    INSERT @Registros VALUES (447, 47, 7, 3, CAST(N'2019-10-03' AS Date), CAST(45212.2100000000 AS Decimal(18, 10)), 335, 3, 4, N'4011209000', 317, 171979, CAST(10426.9800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 335)
    INSERT @Registros VALUES (448, 22, 7, 3, CAST(N'2019-10-03' AS Date), CAST(30043.0000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 332, 172473, CAST(14368.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (449, 2, 12, 8, CAST(N'2019-10-04' AS Date), CAST(41423.3600000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 485, 173166, CAST(17112.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (450, 50, 12, 8, CAST(N'2019-10-07' AS Date), CAST(35540.0000000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 140, 173470, CAST(15140.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (451, 45, 7, 3, CAST(N'2019-10-07' AS Date), CAST(21838.0400000000 AS Decimal(18, 10)), 106, 3, 4, N'4011209000', 529, 174141, CAST(4632.6500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 106)
    INSERT @Registros VALUES (452, 45, 7, 3, CAST(N'2019-10-07' AS Date), CAST(2073.1100000000 AS Decimal(18, 10)), 24, 3, 4, N'4011209000', 556, 174141, CAST(411.5600000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 24)
    INSERT @Registros VALUES (453, 45, 7, 3, CAST(N'2019-10-07' AS Date), CAST(4552.0700000000 AS Decimal(18, 10)), 56, 3, 4, N'4011209000', 576, 174141, CAST(686.7500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 56)
    INSERT @Registros VALUES (454, 47, 7, 3, CAST(N'2019-10-07' AS Date), CAST(21302.5300000000 AS Decimal(18, 10)), 105, 3, 4, N'4011209000', 317, 174324, CAST(5009.8700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 105)
    INSERT @Registros VALUES (455, 47, 7, 3, CAST(N'2019-10-07' AS Date), CAST(744.5000000000 AS Decimal(18, 10)), 8, 3, 4, N'4011209000', 468, 174361, CAST(158.2300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 8)
    INSERT @Registros VALUES (456, 45, 7, 3, CAST(N'2019-10-08' AS Date), CAST(131451.5000000000 AS Decimal(18, 10)), 970, 20, 20, N'4011209000', 484, 174853, CAST(53597.3000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 970)
    INSERT @Registros VALUES (457, 40, 10, 2, CAST(N'2019-10-09' AS Date), CAST(9964.4600000000 AS Decimal(18, 10)), 80, 5, 6, N'4011209000', 100, 175594, CAST(4864.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 80)
    INSERT @Registros VALUES (458, 51, 7, 3, CAST(N'2019-10-09' AS Date), CAST(24897.1000000000 AS Decimal(18, 10)), 220, 5, 6, N'4011209000', 117, 175873, CAST(12760.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (459, 30, 7, 3, CAST(N'2019-10-11' AS Date), CAST(79254.8100000000 AS Decimal(18, 10)), 304, 3, 4, N'4011209000', 807, 177601, CAST(18357.6400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 304)
    INSERT @Registros VALUES (460, 30, 7, 3, CAST(N'2019-10-11' AS Date), CAST(79254.8100000000 AS Decimal(18, 10)), 304, 3, 4, N'4011209000', 807, 177605, CAST(18357.6400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 304)
    INSERT @Registros VALUES (461, 30, 7, 3, CAST(N'2019-10-11' AS Date), CAST(79254.8100000000 AS Decimal(18, 10)), 304, 3, 4, N'4011209000', 807, 177607, CAST(18357.6400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 304)
    INSERT @Registros VALUES (462, 12, 1, 2, CAST(N'2019-10-15' AS Date), CAST(18449.3800000000 AS Decimal(18, 10)), 94, 14, 15, N'4011209000', 450, 179373, CAST(4972.0300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 94)
    INSERT @Registros VALUES (463, 42, 7, 3, CAST(N'2019-10-16' AS Date), CAST(20091.3000000000 AS Decimal(18, 10)), 128, 2, 2, N'4011209000', 497, 180512, CAST(5659.8400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 128)
    INSERT @Registros VALUES (464, 66, 12, 8, CAST(N'2019-10-16' AS Date), CAST(26375.4700000000 AS Decimal(18, 10)), 304, 5, 6, N'4011209000', 670, 180534, CAST(14862.3000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 304)
    INSERT @Registros VALUES (465, 8, 7, 3, CAST(N'2019-10-17' AS Date), CAST(3851.0700000000 AS Decimal(18, 10)), 32, 5, 6, N'4011209000', 62, 181260, CAST(1243.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 32)
    INSERT @Registros VALUES (466, 15, 7, 3, CAST(N'2019-10-18' AS Date), CAST(6699.4600000000 AS Decimal(18, 10)), 41, 14, 15, N'4011209000', 243, 182402, CAST(1782.2300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 41)
    INSERT @Registros VALUES (467, 44, 7, 3, CAST(N'2019-10-18' AS Date), CAST(50219.9500000000 AS Decimal(18, 10)), 317, 3, 4, N'4011209000', 376, 182551, CAST(11753.1400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 317)
    INSERT @Registros VALUES (468, 30, 7, 3, CAST(N'2019-10-21' AS Date), CAST(29798.7300000000 AS Decimal(18, 10)), 108, 3, 4, N'4011209000', 763, 183193, CAST(5569.8700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 108)
    INSERT @Registros VALUES (469, 61, 7, 3, CAST(N'2019-10-22' AS Date), CAST(29942.3400000000 AS Decimal(18, 10)), 253, 5, 6, N'4011209000', 169, 184116, CAST(10579.8100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 253)
    INSERT @Registros VALUES (470, 23, 7, 3, CAST(N'2019-10-22' AS Date), CAST(67818.8500000000 AS Decimal(18, 10)), 504, 5, 6, N'4011209000', 100, 184692, CAST(30340.8000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 504)
    INSERT @Registros VALUES (471, 51, 7, 3, CAST(N'2019-10-23' AS Date), CAST(50302.6800000000 AS Decimal(18, 10)), 440, 5, 6, N'4011209000', 231, 184919, CAST(23467.1500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 440)
    INSERT @Registros VALUES (472, 45, 7, 3, CAST(N'2019-10-23' AS Date), CAST(5219.6800000000 AS Decimal(18, 10)), 32, 14, 15, N'4011209000', 564, 185466, CAST(987.3600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 32)
    INSERT @Registros VALUES (473, 45, 7, 3, CAST(N'2019-10-23' AS Date), CAST(3989.5000000000 AS Decimal(18, 10)), 42, 14, 15, N'4011209000', 492, 185466, CAST(754.6500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 42)
    INSERT @Registros VALUES (474, 45, 7, 3, CAST(N'2019-10-23' AS Date), CAST(2333.1000000000 AS Decimal(18, 10)), 30, 14, 15, N'4011209000', 491, 185466, CAST(441.3300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 30)
    INSERT @Registros VALUES (475, 8, 7, 3, CAST(N'2019-10-24' AS Date), CAST(11692.6500000000 AS Decimal(18, 10)), 102, 5, 6, N'4011209000', 32, 186516, CAST(4250.5600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 102)
    INSERT @Registros VALUES (476, 20, 7, 3, CAST(N'2019-10-24' AS Date), CAST(31215.6100000000 AS Decimal(18, 10)), 300, 5, 6, N'4011209000', 275, 186607, CAST(14866.2900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 300)
    INSERT @Registros VALUES (477, 25, 7, 3, CAST(N'2019-10-24' AS Date), CAST(5437.3300000000 AS Decimal(18, 10)), 46, 5, 6, N'4011209000', 100, 186828, CAST(2599.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 46)
    INSERT @Registros VALUES (478, 51, 7, 3, CAST(N'2019-10-25' AS Date), CAST(24514.3100000000 AS Decimal(18, 10)), 220, 5, 6, N'4011209000', 193, 187308, CAST(11464.4200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (479, 24, 12, 8, CAST(N'2019-10-25' AS Date), CAST(36370.0000000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 147, 187391, CAST(15580.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (480, 31, 7, 3, CAST(N'2019-10-25' AS Date), CAST(4903.9000000000 AS Decimal(18, 10)), 56, 5, 6, N'4011209000', 446, 187449, CAST(1564.6900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 56)
    INSERT @Registros VALUES (481, 31, 7, 3, CAST(N'2019-10-25' AS Date), CAST(4829.4200000000 AS Decimal(18, 10)), 74, 5, 6, N'4011209000', 411, 187449, CAST(1540.9200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 74)
    INSERT @Registros VALUES (482, 45, 7, 3, CAST(N'2019-10-25' AS Date), CAST(11143.2600000000 AS Decimal(18, 10)), 70, 3, 4, N'4011209000', 583, 187763, CAST(2401.0500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 70)
    INSERT @Registros VALUES (483, 45, 7, 3, CAST(N'2019-10-25' AS Date), CAST(2957.7500000000 AS Decimal(18, 10)), 32, 3, 4, N'4011209000', 564, 187763, CAST(549.2700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 32)
    INSERT @Registros VALUES (484, 23, 7, 3, CAST(N'2019-10-25' AS Date), CAST(49149.9700000000 AS Decimal(18, 10)), 228, 3, 4, N'4011209000', 302, 187780, CAST(12986.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 228)
    INSERT @Registros VALUES (485, 10, 7, 3, CAST(N'2019-10-28' AS Date), CAST(8534.3200000000 AS Decimal(18, 10)), 88, 3, 4, N'4011209000', 307, 187991, CAST(1484.5800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 88)
    INSERT @Registros VALUES (486, 30, 7, 3, CAST(N'2019-10-28' AS Date), CAST(55493.2500000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 786, 188212, CAST(13560.6700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 250)
    INSERT @Registros VALUES (487, 30, 7, 3, CAST(N'2019-10-28' AS Date), CAST(72420.9900000000 AS Decimal(18, 10)), 254, 3, 4, N'4011209000', 461, 188215, CAST(15636.4400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 254)
    INSERT @Registros VALUES (488, 62, 12, 8, CAST(N'2019-10-30' AS Date), CAST(38832.8500000000 AS Decimal(18, 10)), 265, 5, 6, N'4011209000', 520, 189929, CAST(15601.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 265)
    INSERT @Registros VALUES (489, 51, 7, 3, CAST(N'2019-10-30' AS Date), CAST(32667.7800000000 AS Decimal(18, 10)), 348, 5, 6, N'4011209000', 224, 189997, CAST(12686.0100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 348)
    INSERT @Registros VALUES (490, 9, 9, 5, CAST(N'2019-10-30' AS Date), CAST(32786.0000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 100, 190127, CAST(14977.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (491, 7, 12, 8, CAST(N'2019-10-30' AS Date), CAST(9010.9500000000 AS Decimal(18, 10)), 125, 3, 4, N'4011209000', 292, 190322, CAST(1551.2500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 125)
    INSERT @Registros VALUES (492, 7, 12, 8, CAST(N'2019-10-30' AS Date), CAST(58751.4500000000 AS Decimal(18, 10)), 815, 3, 4, N'4011209000', 291, 190322, CAST(10114.1500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 815)
    INSERT @Registros VALUES (493, 45, 7, 3, CAST(N'2019-10-30' AS Date), CAST(301823.3500000000 AS Decimal(18, 10)), 2423, 20, 20, N'4011209000', 99, 190327, CAST(128226.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 2423)
    INSERT @Registros VALUES (494, 42, 7, 3, CAST(N'2019-10-30' AS Date), CAST(40706.3300000000 AS Decimal(18, 10)), 359, 5, 6, N'4011209000', 407, 190804, CAST(16289.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 359)
    INSERT @Registros VALUES (495, 42, 7, 3, CAST(N'2019-10-31' AS Date), CAST(2109.4000000000 AS Decimal(18, 10)), 20, 2, 2, N'4011209000', 501, 191156, CAST(635.3700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 20)
    INSERT @Registros VALUES (496, 22, 7, 3, CAST(N'2019-10-31' AS Date), CAST(17153.7900000000 AS Decimal(18, 10)), 144, 5, 6, N'4011209000', 321, 191736, CAST(7208.4600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 144)
    INSERT @Registros VALUES (497, 27, 7, 3, CAST(N'2019-11-01' AS Date), CAST(11171.9800000000 AS Decimal(18, 10)), 132, 3, 4, N'4011209000', 659, 192539, CAST(2005.5100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 132)
    INSERT @Registros VALUES (498, 61, 7, 3, CAST(N'2019-11-04' AS Date), CAST(34115.9600000000 AS Decimal(18, 10)), 278, 5, 6, N'4011209000', 727, 193157, CAST(15740.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 278)
    INSERT @Registros VALUES (499, 44, 7, 3, CAST(N'2019-11-04' AS Date), CAST(49522.4000000000 AS Decimal(18, 10)), 254, 3, 4, N'4011209000', 362, 193485, CAST(12728.4600000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 254)
    INSERT @Registros VALUES (500, 8, 7, 3, CAST(N'2019-11-05' AS Date), CAST(39405.6500000000 AS Decimal(18, 10)), 228, 5, 6, N'4011209000', 33, 193963, CAST(15649.9200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 228)
    INSERT @Registros VALUES (501, 47, 7, 3, CAST(N'2019-11-05' AS Date), CAST(9351.4200000000 AS Decimal(18, 10)), 115, 3, 4, N'4011209000', 395, 194104, CAST(1850.4500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 115)
    INSERT @Registros VALUES (502, 45, 7, 3, CAST(N'2019-11-05' AS Date), CAST(14841.2300000000 AS Decimal(18, 10)), 211, 16, 17, N'4011209000', 554, 194139, CAST(2810.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 211)
    INSERT @Registros VALUES (503, 61, 7, 3, CAST(N'2019-11-05' AS Date), CAST(1584.1800000000 AS Decimal(18, 10)), 24, 5, 6, N'4011209000', 699, 194145, CAST(575.3400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 24)
    INSERT @Registros VALUES (504, 15, 7, 3, CAST(N'2019-11-06' AS Date), CAST(1739.7400000000 AS Decimal(18, 10)), 16, 14, 15, N'4011209000', 250, 194830, CAST(463.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 16)
    INSERT @Registros VALUES (505, 15, 7, 3, CAST(N'2019-11-06' AS Date), CAST(1479.6600000000 AS Decimal(18, 10)), 12, 14, 15, N'4011209000', 242, 194830, CAST(393.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 12)
    INSERT @Registros VALUES (506, 15, 7, 3, CAST(N'2019-11-06' AS Date), CAST(6047.1000000000 AS Decimal(18, 10)), 28, 14, 15, N'4011209000', 246, 194830, CAST(1608.6900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 28)
    INSERT @Registros VALUES (507, 12, 1, 2, CAST(N'2019-11-07' AS Date), CAST(2688.3600000000 AS Decimal(18, 10)), 22, 14, 15, N'4011209000', 419, 195860, CAST(570.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 22)
    INSERT @Registros VALUES (508, 61, 7, 3, CAST(N'2019-11-07' AS Date), CAST(32529.3100000000 AS Decimal(18, 10)), 272, 5, 6, N'4011209000', 723, 195875, CAST(14760.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 272)
    INSERT @Registros VALUES (509, 42, 7, 3, CAST(N'2019-11-08' AS Date), CAST(25319.1200000000 AS Decimal(18, 10)), 155, 2, 2, N'4011209000', 500, 196944, CAST(7186.5500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 155)
    INSERT @Registros VALUES (510, 4, 7, 3, CAST(N'2019-11-08' AS Date), CAST(6128.7500000000 AS Decimal(18, 10)), 89, 5, 24, N'4011209000', 15, 196999, CAST(2382.7400000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 89)
    INSERT @Registros VALUES (511, 47, 7, 3, CAST(N'2019-11-08' AS Date), CAST(27562.6000000000 AS Decimal(18, 10)), 252, 3, 4, N'4011209000', 395, 197112, CAST(5705.5100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (512, 28, 7, 3, CAST(N'2019-11-11' AS Date), CAST(8523.0900000000 AS Decimal(18, 10)), 25, 3, 4, N'4011209000', 170, 197636, CAST(1582.8200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 25)
    INSERT @Registros VALUES (513, 7, 12, 8, CAST(N'2019-11-11' AS Date), CAST(7208.7600000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 295, 197765, CAST(1241.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 100)
    INSERT @Registros VALUES (514, 7, 12, 8, CAST(N'2019-11-11' AS Date), CAST(60553.6400000000 AS Decimal(18, 10)), 840, 3, 4, N'4011209000', 293, 197765, CAST(10424.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 840)
    INSERT @Registros VALUES (515, 42, 7, 3, CAST(N'2019-11-11' AS Date), CAST(12226.4800000000 AS Decimal(18, 10)), 182, 16, 17, N'4011209000', 110, 197946, CAST(2074.9100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 182)
    INSERT @Registros VALUES (516, 51, 7, 3, CAST(N'2019-11-12' AS Date), CAST(25382.4400000000 AS Decimal(18, 10)), 232, 5, 6, N'4011209000', 194, 198556, CAST(13280.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 232)
    INSERT @Registros VALUES (517, 14, 4, 2, CAST(N'2019-11-13' AS Date), CAST(5120.9500000000 AS Decimal(18, 10)), 32, 5, 6, N'4011209000', 468, 199734, CAST(1890.0700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 32)
    INSERT @Registros VALUES (518, 42, 7, 3, CAST(N'2019-11-13' AS Date), CAST(46707.6000000000 AS Decimal(18, 10)), 230, 3, 4, N'4011209000', 128, 199852, CAST(13399.9700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 230)
    INSERT @Registros VALUES (519, 61, 7, 3, CAST(N'2019-11-13' AS Date), CAST(31360.0700000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 678, 200198, CAST(14500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (520, 51, 7, 3, CAST(N'2019-11-13' AS Date), CAST(14760.3700000000 AS Decimal(18, 10)), 210, 5, 6, N'4011209000', 189, 200427, CAST(5672.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 210)
    INSERT @Registros VALUES (521, 40, 10, 2, CAST(N'2019-11-14' AS Date), CAST(73051.5000000000 AS Decimal(18, 10)), 504, 5, 6, N'4011209000', 100, 200679, CAST(30980.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 504)
    INSERT @Registros VALUES (522, 61, 7, 3, CAST(N'2019-11-18' AS Date), CAST(32400.4300000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 678, 202950, CAST(14800.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (523, 30, 7, 3, CAST(N'2019-11-19' AS Date), CAST(4716.5100000000 AS Decimal(18, 10)), 16, 10, 13, N'4011209000', 466, 203644, CAST(637.6000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 16)
    INSERT @Registros VALUES (524, 30, 7, 3, CAST(N'2019-11-19' AS Date), CAST(4716.3000000000 AS Decimal(18, 10)), 20, 1, 13, N'4011209000', 467, 203644, CAST(831.5600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (525, 22, 7, 3, CAST(N'2019-11-21' AS Date), CAST(31621.0800000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 338, 205680, CAST(14123.7000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 266)
    INSERT @Registros VALUES (526, 22, 7, 3, CAST(N'2019-11-21' AS Date), CAST(30001.6500000000 AS Decimal(18, 10)), 276, 5, 6, N'4011209000', 335, 205680, CAST(13400.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 276)
    INSERT @Registros VALUES (527, 22, 7, 3, CAST(N'2019-11-21' AS Date), CAST(29955.9600000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 325, 205681, CAST(13870.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (528, 12, 1, 2, CAST(N'2019-11-22' AS Date), CAST(22112.1400000000 AS Decimal(18, 10)), 226, 5, 6, N'4011209000', 422, 206313, CAST(11082.4500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 226)
    INSERT @Registros VALUES (529, 12, 1, 2, CAST(N'2019-11-25' AS Date), CAST(30694.0900000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 433, 207832, CAST(14006.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (530, 45, 7, 3, CAST(N'2019-11-26' AS Date), CAST(38127.5000000000 AS Decimal(18, 10)), 210, 20, 20, N'4011209000', 553, 208491, CAST(13807.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 210)
    INSERT @Registros VALUES (531, 42, 7, 3, CAST(N'2019-11-27' AS Date), CAST(40298.1600000000 AS Decimal(18, 10)), 352, 5, 6, N'4011209000', 404, 209826, CAST(16128.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 352)
    INSERT @Registros VALUES (532, 23, 7, 3, CAST(N'2019-11-28' AS Date), CAST(30802.0100000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 100, 210153, CAST(14012.2500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (533, 23, 7, 3, CAST(N'2019-11-28' AS Date), CAST(30802.0100000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 100, 210153, CAST(14012.2500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (534, 8, 7, 3, CAST(N'2019-11-28' AS Date), CAST(36143.7100000000 AS Decimal(18, 10)), 231, 5, 6, N'4011209000', 34, 210174, CAST(14441.7700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 231)
    INSERT @Registros VALUES (535, 23, 7, 3, CAST(N'2019-11-28' AS Date), CAST(51437.4100000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 100, 210244, CAST(13313.8000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (536, 23, 7, 3, CAST(N'2019-11-28' AS Date), CAST(2042.3500000000 AS Decimal(18, 10)), 8, 3, 4, N'4011209000', 840, 210244, CAST(494.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 8)
    INSERT @Registros VALUES (537, 45, 7, 3, CAST(N'2019-11-28' AS Date), CAST(19757.1600000000 AS Decimal(18, 10)), 78, 3, 4, N'4011209000', 588, 210890, CAST(3530.3300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 78)
    INSERT @Registros VALUES (538, 45, 7, 3, CAST(N'2019-11-28' AS Date), CAST(2574.5700000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 521, 210890, CAST(729.6700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 30)
    INSERT @Registros VALUES (539, 18, 7, 3, CAST(N'2019-11-29' AS Date), CAST(12984.5000000000 AS Decimal(18, 10)), 100, 5, 6, N'4011209000', 100, 211633, CAST(5216.8700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 100)
    INSERT @Registros VALUES (540, 8, 7, 3, CAST(N'2019-11-29' AS Date), CAST(1824.9200000000 AS Decimal(18, 10)), 18, 5, 6, N'4011209000', 63, 212103, CAST(575.0400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 18)
    INSERT @Registros VALUES (541, 47, 7, 3, CAST(N'2019-12-02' AS Date), CAST(14696.5900000000 AS Decimal(18, 10)), 180, 3, 4, N'4011209000', 318, 212735, CAST(2900.2600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 180)
    INSERT @Registros VALUES (542, 47, 7, 3, CAST(N'2019-12-02' AS Date), CAST(9378.9200000000 AS Decimal(18, 10)), 130, 3, 4, N'4011209000', 389, 212735, CAST(1972.4300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 130)
    INSERT @Registros VALUES (543, 42, 7, 3, CAST(N'2019-12-04' AS Date), CAST(47925.3000000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 136, 214587, CAST(13907.4400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (544, 64, 7, 3, CAST(N'2019-12-04' AS Date), CAST(37048.8000000000 AS Decimal(18, 10)), 382, 5, 6, N'4011209000', 309, 214774, CAST(14600.8000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 382)
    INSERT @Registros VALUES (545, 45, 7, 3, CAST(N'2019-12-04' AS Date), CAST(19666.6300000000 AS Decimal(18, 10)), 187, 14, 15, N'4011209000', 85, 214971, CAST(4294.8900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 187)
    INSERT @Registros VALUES (546, 2, 12, 8, CAST(N'2019-12-05' AS Date), CAST(39502.3900000000 AS Decimal(18, 10)), 253, 5, 6, N'4011209000', 468, 215197, CAST(16510.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 253)
    INSERT @Registros VALUES (547, 51, 7, 3, CAST(N'2019-12-05' AS Date), CAST(32239.7500000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 196, 215204, CAST(12603.1000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (548, 18, 7, 3, CAST(N'2019-12-05' AS Date), CAST(33647.9500000000 AS Decimal(18, 10)), 282, 5, 6, N'4011209000', 100, 215405, CAST(14799.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 282)
    INSERT @Registros VALUES (549, 26, 7, 3, CAST(N'2019-12-05' AS Date), CAST(35009.2200000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 9, 215433, CAST(14986.2500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (550, 30, 7, 3, CAST(N'2019-12-09' AS Date), CAST(16392.0000000000 AS Decimal(18, 10)), 65, 3, 4, N'4011209000', 819, 217771, CAST(3659.5200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 65)
    INSERT @Registros VALUES (551, 30, 7, 3, CAST(N'2019-12-09' AS Date), CAST(3443.0900000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 815, 217771, CAST(653.0000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 50)
    INSERT @Registros VALUES (552, 45, 7, 3, CAST(N'2019-12-10' AS Date), CAST(39996.2900000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 555, 218328, CAST(8605.8800000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 220)
    INSERT @Registros VALUES (553, 45, 7, 3, CAST(N'2019-12-10' AS Date), CAST(145.5700000000 AS Decimal(18, 10)), 2, 3, 4, N'4011209000', 551, 218328, CAST(31.3200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 2)
    INSERT @Registros VALUES (554, 47, 7, 3, CAST(N'2019-12-11' AS Date), CAST(24956.8800000000 AS Decimal(18, 10)), 309, 3, 4, N'4011209000', 271, 219465, CAST(5237.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 309)
    INSERT @Registros VALUES (555, 28, 7, 3, CAST(N'2019-12-12' AS Date), CAST(10299.0900000000 AS Decimal(18, 10)), 36, 3, 4, N'4011209000', 170, 220872, CAST(1698.7400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 36)
    INSERT @Registros VALUES (556, 37, 8, 4, CAST(N'2019-12-16' AS Date), CAST(35999.0400000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 26, 222531, CAST(14763.9000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (557, 15, 7, 3, CAST(N'2019-12-16' AS Date), CAST(2754.3300000000 AS Decimal(18, 10)), 16, 14, 15, N'4011209000', 252, 222669, CAST(429.9000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 16)
    INSERT @Registros VALUES (558, 8, 7, 3, CAST(N'2019-12-17' AS Date), CAST(14335.5400000000 AS Decimal(18, 10)), 92, 5, 6, N'4011209000', 47, 223700, CAST(213.9900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 92)
    INSERT @Registros VALUES (559, 30, 7, 3, CAST(N'2019-12-17' AS Date), CAST(60962.7200000000 AS Decimal(18, 10)), 249, 3, 4, N'4011209000', 782, 223925, CAST(13335.6100000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 249)
    INSERT @Registros VALUES (560, 37, 8, 4, CAST(N'2019-12-18' AS Date), CAST(45956.0500000000 AS Decimal(18, 10)), 279, 5, 6, N'4011209000', 27, 224533, CAST(14560.0200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 279)
    INSERT @Registros VALUES (561, 61, 7, 3, CAST(N'2019-12-18' AS Date), CAST(6231.4000000000 AS Decimal(18, 10)), 93, 5, 6, N'4011209000', 684, 224752, CAST(2321.8800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 93)
    INSERT @Registros VALUES (562, 25, 7, 3, CAST(N'2019-12-18' AS Date), CAST(4954.6900000000 AS Decimal(18, 10)), 44, 5, 6, N'4011209000', 100, 224836, CAST(2464.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 44)
    INSERT @Registros VALUES (563, 27, 7, 3, CAST(N'2019-12-19' AS Date), CAST(2944.8000000000 AS Decimal(18, 10)), 32, 3, 4, N'4011209000', 662, 226173, CAST(489.6500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 32)
    INSERT @Registros VALUES (564, 51, 7, 3, CAST(N'2019-12-19' AS Date), CAST(22702.8400000000 AS Decimal(18, 10)), 175, 5, 6, N'4011209000', 182, 226427, CAST(9521.3700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 175)
    INSERT @Registros VALUES (565, 42, 7, 3, CAST(N'2019-12-20' AS Date), CAST(15357.6000000000 AS Decimal(18, 10)), 120, 19, 1, N'4011209000', 104, 226910, CAST(3399.2800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 120)
    INSERT @Registros VALUES (566, 51, 7, 3, CAST(N'2019-12-20' AS Date), CAST(46821.4900000000 AS Decimal(18, 10)), 492, 5, 6, N'4011209000', 208, 227037, CAST(21990.4300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 492)
    INSERT @Registros VALUES (567, 44, 7, 3, CAST(N'2019-12-20' AS Date), CAST(44029.0200000000 AS Decimal(18, 10)), 226, 3, 4, N'4011209000', 355, 227310, CAST(10955.2400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 226)
    INSERT @Registros VALUES (568, 30, 7, 3, CAST(N'2019-12-26' AS Date), CAST(22491.6700000000 AS Decimal(18, 10)), 122, 3, 4, N'4011209000', 766, 229801, CAST(6105.2000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 122)
    INSERT @Registros VALUES (569, 30, 7, 3, CAST(N'2019-12-26' AS Date), CAST(2960.2100000000 AS Decimal(18, 10)), 42, 3, 4, N'4011209000', 813, 229801, CAST(554.6100000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 42)
    INSERT @Registros VALUES (570, 30, 7, 3, CAST(N'2019-12-26' AS Date), CAST(61169.8600000000 AS Decimal(18, 10)), 229, 3, 4, N'4011209000', 778, 229805, CAST(13301.3000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 229)
    INSERT @Registros VALUES (571, 42, 7, 3, CAST(N'2019-12-26' AS Date), CAST(47279.2000000000 AS Decimal(18, 10)), 260, 3, 4, N'4011209000', 144, 230128, CAST(13122.0200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (572, 51, 7, 3, CAST(N'2019-12-26' AS Date), CAST(22544.1400000000 AS Decimal(18, 10)), 218, 5, 6, N'4011209000', 113, 230155, CAST(12580.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 218)
    INSERT @Registros VALUES (573, 51, 7, 3, CAST(N'2019-12-26' AS Date), CAST(78749.9500000000 AS Decimal(18, 10)), 878, 5, 6, N'4011209000', 217, 230156, CAST(31943.2600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 878)
    INSERT @Registros VALUES (574, 4, 7, 3, CAST(N'2019-12-26' AS Date), CAST(26114.7900000000 AS Decimal(18, 10)), 303, 5, 6, N'4011209000', 13, 230167, CAST(10152.9200000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 303)
    INSERT @Registros VALUES (575, 9, 9, 5, CAST(N'2019-12-27' AS Date), CAST(11648.9000000000 AS Decimal(18, 10)), 50, 5, 6, N'4011209000', 100, 230534, CAST(7124.8000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (576, 22, 7, 3, CAST(N'2019-12-27' AS Date), CAST(29005.0000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 330, 230789, CAST(14365.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (577, 31, 7, 3, CAST(N'2019-12-27' AS Date), CAST(3708.5200000000 AS Decimal(18, 10)), 50, 5, 6, N'4011209000', 232, 231031, CAST(1112.9600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (578, 31, 7, 3, CAST(N'2019-12-27' AS Date), CAST(2254.3000000000 AS Decimal(18, 10)), 30, 5, 6, N'4011209000', 227, 231032, CAST(607.3100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 30)
    INSERT @Registros VALUES (579, 23, 7, 3, CAST(N'2019-12-30' AS Date), CAST(30925.0500000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 75, 231435, CAST(14087.4800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (580, 23, 7, 3, CAST(N'2019-12-30' AS Date), CAST(30925.0500000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 840, 231435, CAST(14087.4800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (581, 2, 12, 8, CAST(N'2019-12-30' AS Date), CAST(40733.1700000000 AS Decimal(18, 10)), 249, 5, 6, N'4011209000', 468, 231682, CAST(16933.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 249)
    INSERT @Registros VALUES (582, 66, 12, 8, CAST(N'2019-12-30' AS Date), CAST(27546.3800000000 AS Decimal(18, 10)), 296, 5, 6, N'4011209000', 666, 231721, CAST(15600.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 296)
    INSERT @Registros VALUES (583, 23, 7, 3, CAST(N'2019-12-30' AS Date), CAST(47220.9900000000 AS Decimal(18, 10)), 254, 3, 4, N'4011209000', 305, 231802, CAST(10968.8000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 254)
    INSERT @Registros VALUES (584, 45, 7, 3, CAST(N'2019-12-30' AS Date), CAST(31158.5000000000 AS Decimal(18, 10)), 170, 20, 20, N'4011209000', 546, 232039, CAST(11233.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 170)
    INSERT @Registros VALUES (585, 51, 7, 3, CAST(N'2020-01-02' AS Date), CAST(48309.1300000000 AS Decimal(18, 10)), 445, 5, 6, N'4011209000', 204, 450, CAST(26160.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 445)
    INSERT @Registros VALUES (586, 45, 7, 3, CAST(N'2020-01-03' AS Date), CAST(29619.9400000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 638, 1323, CAST(14900.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (587, 61, 7, 3, CAST(N'2020-01-07' AS Date), CAST(31445.5300000000 AS Decimal(18, 10)), 299, 5, 6, N'4011209000', 703, 2430, CAST(11582.8700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 299)
    INSERT @Registros VALUES (588, 20, 7, 3, CAST(N'2020-01-08' AS Date), CAST(39134.2000000000 AS Decimal(18, 10)), 430, 5, 6, N'4011209000', 280, 2522, CAST(16316.1700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 430)
    INSERT @Registros VALUES (589, 51, 7, 3, CAST(N'2020-01-08' AS Date), CAST(48867.4600000000 AS Decimal(18, 10)), 450, 5, 6, N'4011209000', 205, 2576, CAST(26540.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 450)
    INSERT @Registros VALUES (590, 42, 7, 3, CAST(N'2020-01-08' AS Date), CAST(18880.6000000000 AS Decimal(18, 10)), 274, 16, 17, N'4011209000', 153, 2738, CAST(3390.5500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 274)
    INSERT @Registros VALUES (591, 8, 7, 3, CAST(N'2020-01-08' AS Date), CAST(4976.6900000000 AS Decimal(18, 10)), 34, 5, 6, N'4011209000', 48, 2754, CAST(1925.6400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 34)
    INSERT @Registros VALUES (592, 47, 7, 3, CAST(N'2020-01-08' AS Date), CAST(24186.8400000000 AS Decimal(18, 10)), 156, 3, 4, N'4011209000', 317, 2950, CAST(5027.9100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 156)
    INSERT @Registros VALUES (593, 47, 7, 3, CAST(N'2020-01-08' AS Date), CAST(12624.3700000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 319, 2950, CAST(2516.8400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 100)
    INSERT @Registros VALUES (594, 61, 7, 3, CAST(N'2020-01-09' AS Date), CAST(32717.7800000000 AS Decimal(18, 10)), 238, 5, 6, N'4011209000', 704, 3911, CAST(13120.7600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 238)
    INSERT @Registros VALUES (595, 35, 12, 8, CAST(N'2020-01-09' AS Date), CAST(6503.8800000000 AS Decimal(18, 10)), 102, 5, 6, N'4011209000', 2, 3915, CAST(5823.5300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 102)
    INSERT @Registros VALUES (596, 12, 1, 2, CAST(N'2020-01-10' AS Date), CAST(821.1600000000 AS Decimal(18, 10)), 6, 14, 15, N'4011209000', 448, 4491, CAST(162.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 6)
    INSERT @Registros VALUES (597, 45, 7, 3, CAST(N'2020-01-10' AS Date), CAST(10342.4000000000 AS Decimal(18, 10)), 78, 14, 15, N'4011209000', 588, 4587, CAST(2057.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 78)
    INSERT @Registros VALUES (598, 45, 7, 3, CAST(N'2020-01-10' AS Date), CAST(13919.8200000000 AS Decimal(18, 10)), 156, 14, 15, N'4011209000', 490, 4587, CAST(2768.8400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 156)
    INSERT @Registros VALUES (599, 28, 7, 3, CAST(N'2020-01-10' AS Date), CAST(28623.7900000000 AS Decimal(18, 10)), 104, 3, 4, N'4011209000', 170, 4641, CAST(5679.2800000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 104)
    INSERT @Registros VALUES (600, 45, 7, 3, CAST(N'2020-01-10' AS Date), CAST(28806.3800000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 559, 4872, CAST(14460.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (601, 30, 7, 3, CAST(N'2020-01-10' AS Date), CAST(67707.1100000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 791, 4886, CAST(14921.3600000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 250)
    INSERT @Registros VALUES (602, 12, 1, 2, CAST(N'2020-01-13' AS Date), CAST(22450.4700000000 AS Decimal(18, 10)), 220, 5, 6, N'4011209000', 421, 5405, CAST(11526.0800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (603, 45, 7, 3, CAST(N'2020-01-13' AS Date), CAST(12772.5300000000 AS Decimal(18, 10)), 82, 3, 4, N'4011209000', 96, 5553, CAST(2504.5200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 82)
    INSERT @Registros VALUES (604, 45, 7, 3, CAST(N'2020-01-13' AS Date), CAST(1860.6100000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 86, 5553, CAST(364.8400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 20)
    INSERT @Registros VALUES (605, 45, 7, 3, CAST(N'2020-01-13' AS Date), CAST(2535.8600000000 AS Decimal(18, 10)), 32, 3, 4, N'4011209000', 89, 5553, CAST(497.2500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 32)
    INSERT @Registros VALUES (606, 51, 7, 3, CAST(N'2020-01-14' AS Date), CAST(11984.3600000000 AS Decimal(18, 10)), 77, 5, 6, N'4011209000', 215, 6095, CAST(4628.5800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 77)
    INSERT @Registros VALUES (607, 8, 7, 3, CAST(N'2020-01-14' AS Date), CAST(39480.7000000000 AS Decimal(18, 10)), 228, 5, 6, N'4011209000', 46, 6293, CAST(15649.9200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 228)
    INSERT @Registros VALUES (608, 27, 7, 3, CAST(N'2020-01-14' AS Date), CAST(11064.5200000000 AS Decimal(18, 10)), 130, 3, 4, N'4011209000', 658, 6564, CAST(1833.3200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 130)
    INSERT @Registros VALUES (609, 24, 12, 8, CAST(N'2020-01-15' AS Date), CAST(36688.3100000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 488, 7547, CAST(15257.9000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (610, 24, 12, 8, CAST(N'2020-01-15' AS Date), CAST(170.8400000000 AS Decimal(18, 10)), 1, 5, 6, N'4011209000', 81, 7547, CAST(71.0500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1)
    INSERT @Registros VALUES (611, 24, 12, 8, CAST(N'2020-01-15' AS Date), CAST(170.8400000000 AS Decimal(18, 10)), 1, 5, 6, N'4011209000', 487, 7547, CAST(71.0500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1)
    INSERT @Registros VALUES (612, 28, 7, 3, CAST(N'2020-01-15' AS Date), CAST(3107.5300000000 AS Decimal(18, 10)), 8, 3, 4, N'4011209000', 170, 7746, CAST(572.2700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 8)
    INSERT @Registros VALUES (613, 22, 7, 3, CAST(N'2020-01-15' AS Date), CAST(31187.5000000000 AS Decimal(18, 10)), 306, 5, 6, N'4011209000', 342, 7806, CAST(15732.0800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 306)
    INSERT @Registros VALUES (614, 20, 7, 3, CAST(N'2020-01-16' AS Date), CAST(33028.4700000000 AS Decimal(18, 10)), 296, 5, 6, N'4011209000', 272, 7978, CAST(14039.2800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 296)
    INSERT @Registros VALUES (615, 51, 7, 3, CAST(N'2020-01-16' AS Date), CAST(47375.5100000000 AS Decimal(18, 10)), 458, 5, 6, N'4011209000', 206, 8094, CAST(19035.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 458)
    INSERT @Registros VALUES (616, 64, 7, 3, CAST(N'2020-01-16' AS Date), CAST(33312.7300000000 AS Decimal(18, 10)), 286, 5, 6, N'4011209000', 311, 8312, CAST(14560.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 286)
    INSERT @Registros VALUES (617, 44, 7, 3, CAST(N'2020-01-16' AS Date), CAST(32044.5000000000 AS Decimal(18, 10)), 303, 5, 6, N'4011209000', 372, 8319, CAST(11591.0600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 303)
    INSERT @Registros VALUES (618, 30, 7, 3, CAST(N'2020-01-17' AS Date), CAST(36133.2800000000 AS Decimal(18, 10)), 194, 3, 4, N'4011209000', 771, 9015, CAST(9740.1400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 194)
    INSERT @Registros VALUES (619, 61, 7, 3, CAST(N'2020-01-17' AS Date), CAST(38051.8900000000 AS Decimal(18, 10)), 434, 5, 6, N'4011209000', 729, 9035, CAST(17790.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 434)
    INSERT @Registros VALUES (620, 45, 7, 3, CAST(N'2020-01-17' AS Date), CAST(40833.2200000000 AS Decimal(18, 10)), 152, 3, 4, N'4011209000', 460, 9251, CAST(7755.6000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 152)
    INSERT @Registros VALUES (621, 45, 7, 3, CAST(N'2020-01-17' AS Date), CAST(2334.6400000000 AS Decimal(18, 10)), 28, 3, 4, N'4011209000', 462, 9251, CAST(677.0300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 28)
    INSERT @Registros VALUES (622, 12, 1, 2, CAST(N'2020-01-20' AS Date), CAST(34068.0000000000 AS Decimal(18, 10)), 200, 5, 6, N'4011209000', 417, 10010, CAST(12510.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 200)
    INSERT @Registros VALUES (623, 23, 7, 3, CAST(N'2020-01-21' AS Date), CAST(31318.6700000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 100, 10976, CAST(14158.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (624, 2, 12, 8, CAST(N'2020-01-21' AS Date), CAST(9470.5400000000 AS Decimal(18, 10)), 80, 5, 25, N'4011209000', 395, 11113, CAST(4640.0000000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 80)
    INSERT @Registros VALUES (625, 2, 12, 8, CAST(N'2020-01-21' AS Date), CAST(26913.6100000000 AS Decimal(18, 10)), 173, 5, 25, N'4011209000', 468, 11129, CAST(9766.5500000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 173)
    INSERT @Registros VALUES (626, 61, 7, 3, CAST(N'2020-01-22' AS Date), CAST(31549.3000000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 709, 11718, CAST(14400.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 254)
    INSERT @Registros VALUES (627, 26, 7, 3, CAST(N'2020-01-22' AS Date), CAST(31401.0000000000 AS Decimal(18, 10)), 279, 5, 6, N'4011209000', 30, 11823, CAST(13812.1700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 279)
    INSERT @Registros VALUES (628, 42, 7, 3, CAST(N'2020-01-22' AS Date), CAST(51224.4000000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 138, 11888, CAST(14476.6700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (629, 22, 7, 3, CAST(N'2020-01-22' AS Date), CAST(27409.0000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 334, 12119, CAST(15043.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (630, 22, 7, 3, CAST(N'2020-01-23' AS Date), CAST(46834.0200000000 AS Decimal(18, 10)), 407, 5, 6, N'4011209000', 343, 12925, CAST(21244.4100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 407)
    INSERT @Registros VALUES (631, 42, 7, 3, CAST(N'2020-01-24' AS Date), CAST(46336.7800000000 AS Decimal(18, 10)), 218, 3, 4, N'4011209000', 114, 13195, CAST(12445.7600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 218)
    INSERT @Registros VALUES (632, 51, 7, 3, CAST(N'2020-01-24' AS Date), CAST(46491.5300000000 AS Decimal(18, 10)), 444, 5, 6, N'4011209000', 203, 13320, CAST(25640.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 444)
    INSERT @Registros VALUES (633, 61, 7, 3, CAST(N'2020-01-24' AS Date), CAST(8949.8200000000 AS Decimal(18, 10)), 149, 5, 6, N'4011209000', 297, 13395, CAST(3414.9000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 149)
    INSERT @Registros VALUES (634, 42, 7, 3, CAST(N'2020-01-27' AS Date), CAST(13666.7700000000 AS Decimal(18, 10)), 91, 2, 2, N'4011209000', 519, 14088, CAST(3896.5800000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 91)
    INSERT @Registros VALUES (635, 23, 7, 3, CAST(N'2020-01-27' AS Date), CAST(28184.4400000000 AS Decimal(18, 10)), 320, 3, 4, N'4011209000', 305, 14306, CAST(5156.3000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 320)
    INSERT @Registros VALUES (636, 66, 12, 8, CAST(N'2020-01-27' AS Date), CAST(23477.5500000000 AS Decimal(18, 10)), 270, 5, 6, N'4011209000', 667, 14800, CAST(14715.9000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 270)
    INSERT @Registros VALUES (637, 45, 7, 3, CAST(N'2020-01-28' AS Date), CAST(102854.3600000000 AS Decimal(18, 10)), 729, 20, 20, N'4011209000', 585, 15457, CAST(40058.3000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 729)
    INSERT @Registros VALUES (638, 30, 7, 3, CAST(N'2020-01-28' AS Date), CAST(9208.7900000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 669, 15479, CAST(1811.6100000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 30)
    INSERT @Registros VALUES (639, 30, 7, 3, CAST(N'2020-01-28' AS Date), CAST(459.7700000000 AS Decimal(18, 10)), 6, 3, 4, N'4011209000', 672, 15479, CAST(89.3700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 6)
    INSERT @Registros VALUES (640, 51, 7, 3, CAST(N'2020-01-30' AS Date), CAST(3440.5100000000 AS Decimal(18, 10)), 33, 5, 6, N'4011209000', 229, 16719, CAST(1307.6400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 33)
    INSERT @Registros VALUES (641, 24, 12, 8, CAST(N'2020-01-30' AS Date), CAST(33370.0000000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 139, 17061, CAST(14260.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (642, 44, 7, 3, CAST(N'2020-01-30' AS Date), CAST(38396.1300000000 AS Decimal(18, 10)), 262, 3, 4, N'4011209000', 365, 17252, CAST(8026.7500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 262)
    INSERT @Registros VALUES (643, 42, 7, 3, CAST(N'2020-01-31' AS Date), CAST(4113.4000000000 AS Decimal(18, 10)), 20, 2, 2, N'4011209000', 502, 17853, CAST(1202.2200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 20)
    INSERT @Registros VALUES (644, 34, 2, 1, CAST(N'2020-02-03' AS Date), CAST(23239.0400000000 AS Decimal(18, 10)), 200, 5, 6, N'4011209000', 468, 18745, CAST(11201.7200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 200)
    INSERT @Registros VALUES (645, 34, 2, 1, CAST(N'2020-02-03' AS Date), CAST(8211.8300000000 AS Decimal(18, 10)), 46, 5, 6, N'4011209000', 843, 18745, CAST(3958.2800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 46)
    INSERT @Registros VALUES (646, 45, 7, 3, CAST(N'2020-02-04' AS Date), CAST(18154.7500000000 AS Decimal(18, 10)), 188, 14, 15, N'4011209000', 609, 19668, CAST(4153.1400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 188)
    INSERT @Registros VALUES (647, 45, 7, 3, CAST(N'2020-02-04' AS Date), CAST(6221.6000000000 AS Decimal(18, 10)), 80, 14, 15, N'4011209000', 493, 19668, CAST(1423.2700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 80)
    INSERT @Registros VALUES (648, 8, 7, 3, CAST(N'2020-02-04' AS Date), CAST(39478.7000000000 AS Decimal(18, 10)), 228, 5, 6, N'4011209000', 46, 19960, CAST(15649.9200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 228)
    INSERT @Registros VALUES (649, 12, 1, 2, CAST(N'2020-02-05' AS Date), CAST(7161.0000000000 AS Decimal(18, 10)), 30, 14, 15, N'4011209000', 440, 20373, CAST(2084.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 30)
    INSERT @Registros VALUES (650, 30, 7, 3, CAST(N'2020-02-05' AS Date), CAST(1707.9700000000 AS Decimal(18, 10)), 3, 13, 13, N'4011209000', 238, 20655, CAST(216.6500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 3)
    INSERT @Registros VALUES (651, 30, 7, 3, CAST(N'2020-02-05' AS Date), CAST(641.5100000000 AS Decimal(18, 10)), 2, 10, 13, N'4011209000', 237, 20655, CAST(144.2300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 2)
    INSERT @Registros VALUES (652, 30, 7, 3, CAST(N'2020-02-05' AS Date), CAST(1924.5400000000 AS Decimal(18, 10)), 6, 10, 13, N'4011209000', 240, 20655, CAST(432.6800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 6)
    INSERT @Registros VALUES (653, 30, 7, 3, CAST(N'2020-02-05' AS Date), CAST(1283.0200000000 AS Decimal(18, 10)), 4, 10, 13, N'4011209000', 239, 20655, CAST(288.4500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 4)
    INSERT @Registros VALUES (654, 30, 7, 3, CAST(N'2020-02-05' AS Date), CAST(2566.0500000000 AS Decimal(18, 10)), 8, 10, 13, N'4011209000', 241, 20655, CAST(576.9000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 8)
    INSERT @Registros VALUES (655, 47, 7, 3, CAST(N'2020-02-06' AS Date), CAST(11847.9000000000 AS Decimal(18, 10)), 156, 3, 4, N'4011209000', 319, 21082, CAST(2531.1600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 156)
    INSERT @Registros VALUES (656, 47, 7, 3, CAST(N'2020-02-06' AS Date), CAST(2946.2600000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 317, 21082, CAST(636.5200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (657, 47, 7, 3, CAST(N'2020-02-06' AS Date), CAST(18721.7600000000 AS Decimal(18, 10)), 106, 3, 4, N'4011209000', 317, 21082, CAST(4412.7500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 106)
    INSERT @Registros VALUES (658, 23, 7, 3, CAST(N'2020-02-07' AS Date), CAST(28766.0400000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 300, 21577, CAST(14080.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (659, 23, 7, 3, CAST(N'2020-02-07' AS Date), CAST(28766.0400000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 300, 21579, CAST(14100.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (660, 15, 7, 3, CAST(N'2020-02-11' AS Date), CAST(2245.4800000000 AS Decimal(18, 10)), 12, 14, 15, N'4011209000', 244, 23126, CAST(597.3600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 12)
    INSERT @Registros VALUES (661, 47, 7, 3, CAST(N'2020-02-11' AS Date), CAST(1333.5700000000 AS Decimal(18, 10)), 14, 3, 4, N'4011209000', 468, 23499, CAST(292.9400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 14)
    INSERT @Registros VALUES (662, 51, 7, 3, CAST(N'2020-02-11' AS Date), CAST(1160.0700000000 AS Decimal(18, 10)), 10, 6, 7, N'4011209000', 226, 23532, CAST(265.8100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 10)
    INSERT @Registros VALUES (663, 45, 7, 3, CAST(N'2020-02-13' AS Date), CAST(2284.5800000000 AS Decimal(18, 10)), 8, 3, 4, N'4011209000', 482, 24831, CAST(433.7900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 8)
    INSERT @Registros VALUES (664, 45, 7, 3, CAST(N'2020-02-13' AS Date), CAST(284.5200000000 AS Decimal(18, 10)), 5, 3, 4, N'4011209000', 477, 24831, CAST(54.0200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 5)
    INSERT @Registros VALUES (665, 42, 7, 3, CAST(N'2020-02-13' AS Date), CAST(4188.4000000000 AS Decimal(18, 10)), 20, 2, 2, N'4011209000', 504, 24922, CAST(1182.6200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 20)
    INSERT @Registros VALUES (666, 61, 7, 3, CAST(N'2020-02-13' AS Date), CAST(3319.8900000000 AS Decimal(18, 10)), 54, 5, 6, N'4011209000', 743, 24953, CAST(1255.1900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 54)
    INSERT @Registros VALUES (667, 46, 7, 3, CAST(N'2020-02-13' AS Date), CAST(42241.0000000000 AS Decimal(18, 10)), 285, 5, 6, N'4011209000', 760, 25153, CAST(15500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 285)
    INSERT @Registros VALUES (668, 8, 7, 3, CAST(N'2020-02-14' AS Date), CAST(17744.5500000000 AS Decimal(18, 10)), 180, 5, 6, N'4011209000', 39, 25603, CAST(8875.8000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 180)
    INSERT @Registros VALUES (669, 23, 7, 3, CAST(N'2020-02-14' AS Date), CAST(28766.1900000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 300, 25756, CAST(14100.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (670, 42, 7, 3, CAST(N'2020-02-14' AS Date), CAST(46200.0000000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 119, 25799, CAST(13404.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (671, 61, 7, 3, CAST(N'2020-02-14' AS Date), CAST(31182.0700000000 AS Decimal(18, 10)), 236, 5, 6, N'4011209000', 712, 25877, CAST(14400.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 236)
    INSERT @Registros VALUES (672, 29, 12, 8, CAST(N'2020-02-14' AS Date), CAST(28160.0000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 78, 25971, CAST(15420.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (673, 30, 7, 3, CAST(N'2020-02-14' AS Date), CAST(3620.8300000000 AS Decimal(18, 10)), 52, 3, 4, N'4011209000', 817, 26204, CAST(674.2100000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 52)
    INSERT @Registros VALUES (674, 30, 7, 3, CAST(N'2020-02-14' AS Date), CAST(71440.2000000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 787, 26221, CAST(15393.0500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 250)
    INSERT @Registros VALUES (675, 61, 7, 3, CAST(N'2020-02-18' AS Date), CAST(31784.8400000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 80, 27355, CAST(14560.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (676, 37, 8, 4, CAST(N'2020-02-19' AS Date), CAST(46368.2400000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 24, 28222, CAST(14661.0200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (677, 12, 1, 2, CAST(N'2020-02-19' AS Date), CAST(24676.7300000000 AS Decimal(18, 10)), 220, 5, 6, N'4011209000', 420, 28359, CAST(12800.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (678, 44, 7, 3, CAST(N'2020-02-19' AS Date), CAST(76684.9500000000 AS Decimal(18, 10)), 424, 3, 4, N'4011209000', 384, 28586, CAST(16771.3400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 424)
    INSERT @Registros VALUES (679, 62, 12, 8, CAST(N'2020-02-21' AS Date), CAST(38082.4500000000 AS Decimal(18, 10)), 265, 5, 6, N'4011209000', 520, 29919, CAST(15245.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 265)
    INSERT @Registros VALUES (680, 61, 7, 3, CAST(N'2020-02-21' AS Date), CAST(36601.0700000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 751, 30182, CAST(13661.7000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (681, 45, 7, 3, CAST(N'2020-02-26' AS Date), CAST(3191.6600000000 AS Decimal(18, 10)), 50, 16, 17, N'4011209000', 618, 30842, CAST(622.9200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (682, 45, 7, 3, CAST(N'2020-02-26' AS Date), CAST(11858.5600000000 AS Decimal(18, 10)), 180, 16, 17, N'4011209000', 608, 30842, CAST(2314.4600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 180)
    INSERT @Registros VALUES (683, 8, 7, 3, CAST(N'2020-02-26' AS Date), CAST(29302.8600000000 AS Decimal(18, 10)), 257, 5, 6, N'4011209000', 36, 31120, CAST(13731.8600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 257)
    INSERT @Registros VALUES (684, 45, 7, 3, CAST(N'2020-02-26' AS Date), CAST(165191.5600000000 AS Decimal(18, 10)), 1204, 20, 20, N'4011209000', 602, 31356, CAST(64800.5200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1204)
    INSERT @Registros VALUES (685, 24, 12, 8, CAST(N'2020-02-27' AS Date), CAST(33850.0000000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 151, 31955, CAST(14480.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 266)
    INSERT @Registros VALUES (686, 8, 7, 3, CAST(N'2020-02-27' AS Date), CAST(38689.2100000000 AS Decimal(18, 10)), 273, 5, 6, N'4011209000', 41, 32137, CAST(14934.7100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 273)
    INSERT @Registros VALUES (687, 2, 12, 8, CAST(N'2020-02-27' AS Date), CAST(62399.0400000000 AS Decimal(18, 10)), 552, 5, 6, N'4011209000', 468, 32225, CAST(29860.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 552)
    INSERT @Registros VALUES (688, 51, 7, 3, CAST(N'2020-02-27' AS Date), CAST(84093.4800000000 AS Decimal(18, 10)), 771, 5, 6, N'4011209000', 216, 32362, CAST(36102.2300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 771)
    INSERT @Registros VALUES (689, 50, 12, 8, CAST(N'2020-02-27' AS Date), CAST(33774.0000000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 142, 32562, CAST(15080.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (690, 23, 7, 3, CAST(N'2020-02-28' AS Date), CAST(31318.6700000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 300, 32849, CAST(14158.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (691, 20, 7, 3, CAST(N'2020-02-28' AS Date), CAST(32099.4800000000 AS Decimal(18, 10)), 276, 5, 6, N'4011209000', 276, 33297, CAST(13324.0300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 276)
    INSERT @Registros VALUES (692, 27, 7, 3, CAST(N'2020-02-28' AS Date), CAST(5506.4800000000 AS Decimal(18, 10)), 72, 3, 4, N'4011209000', 664, 33404, CAST(1072.4500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 72)
    INSERT @Registros VALUES (693, 61, 7, 3, CAST(N'2020-02-28' AS Date), CAST(36638.7400000000 AS Decimal(18, 10)), 320, 5, 6, N'4011209000', 708, 33537, CAST(13413.2700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 320)
    INSERT @Registros VALUES (694, 61, 7, 3, CAST(N'2020-03-02' AS Date), CAST(36493.6800000000 AS Decimal(18, 10)), 270, 5, 6, N'4011209000', 710, 33906, CAST(14987.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 270)
    INSERT @Registros VALUES (695, 10, 7, 3, CAST(N'2020-03-02' AS Date), CAST(13212.6400000000 AS Decimal(18, 10)), 119, 3, 4, N'4011209000', 77, 34130, CAST(2270.2500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 119)
    INSERT @Registros VALUES (696, 47, 7, 3, CAST(N'2020-03-02' AS Date), CAST(1692.2400000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 317, 34217, CAST(413.4400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (697, 61, 7, 3, CAST(N'2020-03-03' AS Date), CAST(28579.7800000000 AS Decimal(18, 10)), 246, 5, 6, N'4011209000', 758, 35443, CAST(11239.0100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 246)
    INSERT @Registros VALUES (698, 47, 7, 3, CAST(N'2020-03-04' AS Date), CAST(20357.9100000000 AS Decimal(18, 10)), 251, 3, 4, N'4011209000', 395, 35721, CAST(3831.6300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 251)
    INSERT @Registros VALUES (699, 47, 7, 3, CAST(N'2020-03-04' AS Date), CAST(13665.9000000000 AS Decimal(18, 10)), 52, 3, 4, N'4011209000', 395, 35721, CAST(2976.9500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 52)
    INSERT @Registros VALUES (700, 47, 7, 3, CAST(N'2020-03-04' AS Date), CAST(27176.6500000000 AS Decimal(18, 10)), 152, 3, 4, N'4011209000', 395, 35721, CAST(6188.9500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 152)
    INSERT @Registros VALUES (701, 47, 7, 3, CAST(N'2020-03-04' AS Date), CAST(10990.2500000000 AS Decimal(18, 10)), 131, 3, 4, N'4011209000', 395, 35721, CAST(2413.4400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 131)
    INSERT @Registros VALUES (702, 61, 7, 3, CAST(N'2020-03-05' AS Date), CAST(32867.3500000000 AS Decimal(18, 10)), 304, 5, 6, N'4011209000', 692, 36877, CAST(15230.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 304)
    INSERT @Registros VALUES (703, 40, 10, 2, CAST(N'2020-03-06' AS Date), CAST(69500.5400000000 AS Decimal(18, 10)), 504, 5, 6, N'4011209000', 100, 37774, CAST(29940.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 504)
    INSERT @Registros VALUES (704, 40, 10, 2, CAST(N'2020-03-06' AS Date), CAST(36394.8600000000 AS Decimal(18, 10)), 284, 5, 6, N'4011209000', 100, 37783, CAST(15840.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 284)
    INSERT @Registros VALUES (705, 45, 7, 3, CAST(N'2020-03-06' AS Date), CAST(39415.1000000000 AS Decimal(18, 10)), 150, 3, 4, N'4011209000', 542, 37949, CAST(8397.5900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 150)
    INSERT @Registros VALUES (706, 45, 7, 3, CAST(N'2020-03-06' AS Date), CAST(823.0900000000 AS Decimal(18, 10)), 10, 3, 4, N'4011209000', 524, 37949, CAST(175.3700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 10)
    INSERT @Registros VALUES (707, 45, 7, 3, CAST(N'2020-03-06' AS Date), CAST(17037.7600000000 AS Decimal(18, 10)), 64, 3, 4, N'4011209000', 581, 37965, CAST(1176.3200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 64)
    INSERT @Registros VALUES (708, 45, 7, 3, CAST(N'2020-03-06' AS Date), CAST(6877.6600000000 AS Decimal(18, 10)), 82, 3, 4, N'4011209000', 591, 37965, CAST(1507.1600000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 82)
    INSERT @Registros VALUES (709, 45, 7, 3, CAST(N'2020-03-06' AS Date), CAST(3331.0100000000 AS Decimal(18, 10)), 42, 3, 4, N'4011209000', 569, 37965, CAST(771.9600000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 42)
    INSERT @Registros VALUES (710, 45, 7, 3, CAST(N'2020-03-09' AS Date), CAST(86941.6600000000 AS Decimal(18, 10)), 756, 5, 6, N'4011209000', 587, 38532, CAST(43839.9900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 756)
    INSERT @Registros VALUES (711, 30, 7, 3, CAST(N'2020-03-09' AS Date), CAST(45424.8600000000 AS Decimal(18, 10)), 210, 3, 4, N'4011209000', 776, 38655, CAST(10737.6500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 210)
    INSERT @Registros VALUES (712, 45, 7, 3, CAST(N'2020-03-09' AS Date), CAST(12252.3100000000 AS Decimal(18, 10)), 110, 14, 15, N'4011209000', 531, 38717, CAST(2611.7400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 110)
    INSERT @Registros VALUES (713, 2, 12, 8, CAST(N'2020-03-09' AS Date), CAST(39948.6700000000 AS Decimal(18, 10)), 240, 5, 6, N'4011209000', 468, 38787, CAST(16781.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 240)
    INSERT @Registros VALUES (714, 6, 7, 3, CAST(N'2020-03-09' AS Date), CAST(10115.2300000000 AS Decimal(18, 10)), 76, 5, 6, N'4011209000', 93, 38803, CAST(3919.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 76)
    INSERT @Registros VALUES (715, 6, 7, 3, CAST(N'2020-03-09' AS Date), CAST(33231.7800000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 88, 38803, CAST(13983.7900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (716, 23, 7, 3, CAST(N'2020-03-09' AS Date), CAST(28766.1900000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 300, 38846, CAST(14100.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (717, 47, 7, 3, CAST(N'2020-03-10' AS Date), CAST(2878.2000000000 AS Decimal(18, 10)), 36, 3, 4, N'4011209000', 395, 39356, CAST(635.3500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 36)
    INSERT @Registros VALUES (718, 8, 7, 3, CAST(N'2020-03-10' AS Date), CAST(8933.4400000000 AS Decimal(18, 10)), 56, 5, 6, N'4011209000', 56, 39472, CAST(3502.0300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 56)
    INSERT @Registros VALUES (719, 44, 7, 3, CAST(N'2020-03-11' AS Date), CAST(32139.0000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 361, 40377, CAST(13583.8800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (720, 24, 12, 8, CAST(N'2020-03-11' AS Date), CAST(35230.0000000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 148, 40639, CAST(14940.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (721, 22, 7, 3, CAST(N'2020-03-11' AS Date), CAST(27750.0000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 326, 40671, CAST(14500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (722, 42, 7, 3, CAST(N'2020-03-12' AS Date), CAST(11174.7800000000 AS Decimal(18, 10)), 51, 2, 2, N'4011209000', 512, 41246, CAST(3250.9300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 51)
    INSERT @Registros VALUES (723, 44, 7, 3, CAST(N'2020-03-12' AS Date), CAST(33201.1700000000 AS Decimal(18, 10)), 238, 5, 6, N'4011209000', 357, 41293, CAST(12004.6200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 238)
    INSERT @Registros VALUES (724, 7, 12, 8, CAST(N'2020-03-13' AS Date), CAST(7218.9800000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 295, 42089, CAST(1241.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 100)
    INSERT @Registros VALUES (725, 7, 12, 8, CAST(N'2020-03-13' AS Date), CAST(2959.7800000000 AS Decimal(18, 10)), 41, 3, 4, N'4011209000', 293, 42089, CAST(508.8100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 41)
    INSERT @Registros VALUES (726, 7, 12, 8, CAST(N'2020-03-13' AS Date), CAST(57679.6400000000 AS Decimal(18, 10)), 799, 3, 4, N'4011209000', 294, 42089, CAST(9915.5900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 799)
    INSERT @Registros VALUES (727, 9, 9, 5, CAST(N'2020-03-13' AS Date), CAST(37010.0000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 100, 42163, CAST(14769.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (728, 23, 7, 3, CAST(N'2020-03-13' AS Date), CAST(48344.8500000000 AS Decimal(18, 10)), 350, 3, 4, N'4011209000', 100, 42306, CAST(11016.8700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 350)
    INSERT @Registros VALUES (729, 44, 7, 3, CAST(N'2020-03-16' AS Date), CAST(53158.0900000000 AS Decimal(18, 10)), 249, 3, 4, N'4011209000', 360, 43137, CAST(11625.8100000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 249)
    INSERT @Registros VALUES (730, 6, 7, 3, CAST(N'2020-03-16' AS Date), CAST(14453.7700000000 AS Decimal(18, 10)), 158, 5, 6, N'4011209000', 84, 43218, CAST(5600.4400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 158)
    INSERT @Registros VALUES (731, 23, 7, 3, CAST(N'2020-03-16' AS Date), CAST(33482.7000000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 100, 43589, CAST(14731.3500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (732, 61, 7, 3, CAST(N'2020-03-17' AS Date), CAST(29144.1300000000 AS Decimal(18, 10)), 242, 5, 6, N'4011209000', 744, 44432, CAST(10831.6800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 242)
    INSERT @Registros VALUES (733, 8, 7, 3, CAST(N'2020-03-19' AS Date), CAST(16818.0500000000 AS Decimal(18, 10)), 171, 5, 6, N'4011209000', 38, 45669, CAST(8268.5200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 171)
    INSERT @Registros VALUES (734, 61, 7, 3, CAST(N'2020-03-19' AS Date), CAST(32483.9600000000 AS Decimal(18, 10)), 276, 5, 6, N'4011209000', 724, 45851, CAST(15280.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 276)
    INSERT @Registros VALUES (735, 61, 7, 3, CAST(N'2020-03-19' AS Date), CAST(32064.0100000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 679, 45852, CAST(14920.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (736, 20, 7, 3, CAST(N'2020-03-23' AS Date), CAST(50890.7500000000 AS Decimal(18, 10)), 555, 5, 6, N'4011209000', 277, 46740, CAST(13940.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 555)
    INSERT @Registros VALUES (737, 47, 7, 3, CAST(N'2020-03-23' AS Date), CAST(3077.5400000000 AS Decimal(18, 10)), 40, 3, 4, N'4011209000', 395, 46762, CAST(701.9900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (738, 44, 7, 3, CAST(N'2020-03-23' AS Date), CAST(37410.5600000000 AS Decimal(18, 10)), 174, 3, 4, N'4011209000', 353, 46882, CAST(7845.0700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 174)
    INSERT @Registros VALUES (739, 28, 7, 3, CAST(N'2020-03-23' AS Date), CAST(11580.2800000000 AS Decimal(18, 10)), 41, 3, 4, N'4011209000', 170, 47226, CAST(2071.2300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 41)
    INSERT @Registros VALUES (740, 42, 7, 3, CAST(N'2020-03-26' AS Date), CAST(38547.9200000000 AS Decimal(18, 10)), 316, 5, 6, N'4011209000', 400, 48644, CAST(15610.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 316)
    INSERT @Registros VALUES (741, 22, 7, 3, CAST(N'2020-03-26' AS Date), CAST(51731.9600000000 AS Decimal(18, 10)), 524, 5, 6, N'4011209000', 345, 48752, CAST(28132.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 524)
    INSERT @Registros VALUES (742, 61, 7, 3, CAST(N'2020-03-26' AS Date), CAST(20186.5300000000 AS Decimal(18, 10)), 1190, 5, 6, N'4011209000', 745, 48789, CAST(7668.4600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1190)
    INSERT @Registros VALUES (743, 30, 7, 3, CAST(N'2020-03-26' AS Date), CAST(3214.5300000000 AS Decimal(18, 10)), 10, 10, 13, N'4011209000', 235, 48969, CAST(721.1300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 10)
    INSERT @Registros VALUES (744, 30, 7, 3, CAST(N'2020-03-27' AS Date), CAST(15343.9600000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 816, 49151, CAST(3143.2500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 50)
    INSERT @Registros VALUES (745, 30, 7, 3, CAST(N'2020-03-27' AS Date), CAST(6001.3200000000 AS Decimal(18, 10)), 80, 3, 4, N'4011209000', 824, 49151, CAST(1070.9000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 80)
    INSERT @Registros VALUES (746, 45, 7, 3, CAST(N'2020-03-27' AS Date), CAST(10209.2900000000 AS Decimal(18, 10)), 144, 3, 4, N'4011209000', 540, 49543, CAST(2065.0400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 144)
    INSERT @Registros VALUES (747, 45, 7, 3, CAST(N'2020-03-27' AS Date), CAST(17264.4000000000 AS Decimal(18, 10)), 93, 3, 4, N'4011209000', 600, 49543, CAST(3492.0800000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 93)
    INSERT @Registros VALUES (748, 42, 7, 3, CAST(N'2020-03-30' AS Date), CAST(51182.6000000000 AS Decimal(18, 10)), 240, 3, 4, N'4011209000', 133, 50139, CAST(14058.7600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 240)
    INSERT @Registros VALUES (749, 30, 7, 3, CAST(N'2020-03-30' AS Date), CAST(65381.7900000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 794, 50178, CAST(14598.6800000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 250)
    INSERT @Registros VALUES (750, 61, 7, 3, CAST(N'2020-03-31' AS Date), CAST(3222.7700000000 AS Decimal(18, 10)), 50, 5, 6, N'4011209000', 742, 50407, CAST(1191.9500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (751, 28, 7, 3, CAST(N'2020-03-31' AS Date), CAST(19696.7600000000 AS Decimal(18, 10)), 76, 3, 4, N'4011209000', 170, 50435, CAST(3754.8500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 76)
    INSERT @Registros VALUES (752, 51, 7, 3, CAST(N'2020-04-03' AS Date), CAST(4934.3000000000 AS Decimal(18, 10)), 30, 6, 7, N'4011209000', 199, 52186, CAST(1293.4400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 30)
    INSERT @Registros VALUES (753, 45, 7, 3, CAST(N'2020-04-03' AS Date), CAST(17920.9400000000 AS Decimal(18, 10)), 87, 3, 4, N'4011209000', 621, 52426, CAST(3655.7200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 87)
    INSERT @Registros VALUES (754, 45, 7, 3, CAST(N'2020-04-03' AS Date), CAST(11428.5400000000 AS Decimal(18, 10)), 45, 3, 4, N'4011209000', 617, 52426, CAST(2331.2100000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 45)
    INSERT @Registros VALUES (755, 45, 7, 3, CAST(N'2020-04-03' AS Date), CAST(12800.0600000000 AS Decimal(18, 10)), 172, 3, 4, N'4011209000', 606, 52426, CAST(2611.0200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 172)
    INSERT @Registros VALUES (756, 47, 7, 3, CAST(N'2020-04-06' AS Date), CAST(2481.7900000000 AS Decimal(18, 10)), 27, 3, 4, N'4011209000', 468, 52908, CAST(558.7800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 27)
    INSERT @Registros VALUES (757, 12, 1, 2, CAST(N'2020-04-07' AS Date), CAST(7861.2000000000 AS Decimal(18, 10)), 36, 14, 15, N'4011209000', 442, 53099, CAST(2237.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 36)
    INSERT @Registros VALUES (758, 12, 1, 2, CAST(N'2020-04-07' AS Date), CAST(1506.5000000000 AS Decimal(18, 10)), 10, 14, 15, N'4011209000', 412, 53100, CAST(290.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 10)
    INSERT @Registros VALUES (759, 45, 7, 3, CAST(N'2020-04-07' AS Date), CAST(17869.9900000000 AS Decimal(18, 10)), 273, 16, 17, N'4011209000', 613, 53131, CAST(3540.5400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 273)
    INSERT @Registros VALUES (760, 45, 7, 3, CAST(N'2020-04-07' AS Date), CAST(173059.4600000000 AS Decimal(18, 10)), 1191, 20, 20, N'4011209000', 83, 53194, CAST(66729.0400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1191)
    INSERT @Registros VALUES (761, 45, 7, 3, CAST(N'2020-04-07' AS Date), CAST(7647.7200000000 AS Decimal(18, 10)), 81, 14, 15, N'4011209000', 95, 53394, CAST(1424.2300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 81)
    INSERT @Registros VALUES (762, 61, 7, 3, CAST(N'2020-04-13' AS Date), CAST(16576.2000000000 AS Decimal(18, 10)), 160, 5, 6, N'4011209000', 706, 54079, CAST(6208.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 160)
    INSERT @Registros VALUES (763, 47, 7, 3, CAST(N'2020-04-13' AS Date), CAST(23638.3200000000 AS Decimal(18, 10)), 144, 3, 4, N'4011209000', 395, 54192, CAST(4835.3500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 144)
    INSERT @Registros VALUES (764, 47, 7, 3, CAST(N'2020-04-13' AS Date), CAST(17422.8300000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 395, 54192, CAST(3415.5600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 100)
    INSERT @Registros VALUES (765, 47, 7, 3, CAST(N'2020-04-13' AS Date), CAST(14181.5100000000 AS Decimal(18, 10)), 49, 3, 4, N'4011209000', 395, 54192, CAST(3030.8600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 49)
    INSERT @Registros VALUES (766, 44, 7, 3, CAST(N'2020-04-15' AS Date), CAST(58095.4200000000 AS Decimal(18, 10)), 302, 3, 4, N'4011209000', 371, 55614, CAST(13257.4900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 302)
    INSERT @Registros VALUES (767, 45, 7, 3, CAST(N'2020-04-15' AS Date), CAST(79897.7500000000 AS Decimal(18, 10)), 320, 3, 4, N'4011209000', 616, 55771, CAST(19186.4000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 320)
    INSERT @Registros VALUES (768, 45, 7, 3, CAST(N'2020-04-15' AS Date), CAST(22444.7600000000 AS Decimal(18, 10)), 108, 3, 4, N'4011209000', 603, 55772, CAST(4658.4300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 108)
    INSERT @Registros VALUES (769, 45, 7, 3, CAST(N'2020-04-15' AS Date), CAST(1342.9300000000 AS Decimal(18, 10)), 24, 3, 4, N'4011209000', 612, 55772, CAST(278.7300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 24)
    INSERT @Registros VALUES (770, 45, 7, 3, CAST(N'2020-04-15' AS Date), CAST(12081.0500000000 AS Decimal(18, 10)), 156, 3, 4, N'4011209000', 605, 55772, CAST(2507.4300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 156)
    INSERT @Registros VALUES (771, 47, 7, 3, CAST(N'2020-04-16' AS Date), CAST(27764.1600000000 AS Decimal(18, 10)), 333, 3, 4, N'4011209000', 395, 56205, CAST(5475.8700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 333)
    INSERT @Registros VALUES (772, 45, 7, 3, CAST(N'2020-04-16' AS Date), CAST(14325.7500000000 AS Decimal(18, 10)), 178, 3, 4, N'4011209000', 607, 56401, CAST(2774.1300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 178)
    INSERT @Registros VALUES (773, 24, 12, 8, CAST(N'2020-04-16' AS Date), CAST(34630.0000000000 AS Decimal(18, 10)), 258, 5, 6, N'4011209000', 143, 56579, CAST(14780.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 258)
    INSERT @Registros VALUES (774, 26, 7, 3, CAST(N'2020-04-17' AS Date), CAST(30561.5100000000 AS Decimal(18, 10)), 249, 5, 6, N'4011209000', 8, 56928, CAST(13335.4900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 249)
    INSERT @Registros VALUES (775, 51, 7, 3, CAST(N'2020-04-17' AS Date), CAST(19497.7700000000 AS Decimal(18, 10)), 124, 5, 6, N'4011209000', 178, 56951, CAST(7830.4800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 124)
    INSERT @Registros VALUES (776, 42, 7, 3, CAST(N'2020-04-17' AS Date), CAST(34276.0800000000 AS Decimal(18, 10)), 360, 16, 17, N'4011209000', 158, 57120, CAST(7638.6600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 360)
    INSERT @Registros VALUES (777, 61, 7, 3, CAST(N'2020-04-20' AS Date), CAST(31836.6000000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 702, 57830, CAST(12193.5200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 266)
    INSERT @Registros VALUES (778, 6, 7, 3, CAST(N'2020-04-21' AS Date), CAST(34553.0600000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 836, 58639, CAST(14632.9800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (779, 28, 7, 3, CAST(N'2020-04-22' AS Date), CAST(40907.0700000000 AS Decimal(18, 10)), 106, 3, 4, N'4011209000', 170, 59045, CAST(7603.5200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 106)
    INSERT @Registros VALUES (780, 61, 7, 3, CAST(N'2020-04-22' AS Date), CAST(5688.3300000000 AS Decimal(18, 10)), 129, 5, 6, N'4011209000', 687, 59093, CAST(2036.1500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 129)
    INSERT @Registros VALUES (781, 23, 7, 3, CAST(N'2020-04-22' AS Date), CAST(27864.2500000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 100, 59167, CAST(14960.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (782, 23, 7, 3, CAST(N'2020-04-22' AS Date), CAST(27864.2500000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 100, 59167, CAST(15020.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (783, 2, 12, 8, CAST(N'2020-04-23' AS Date), CAST(15389.6500000000 AS Decimal(18, 10)), 130, 5, 25, N'4011209000', 395, 60000, CAST(7540.0000000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 130)
    INSERT @Registros VALUES (784, 2, 12, 8, CAST(N'2020-04-23' AS Date), CAST(15557.0000000000 AS Decimal(18, 10)), 100, 5, 25, N'4011209000', 314, 60001, CAST(6200.0000000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 100)
    INSERT @Registros VALUES (785, 42, 7, 3, CAST(N'2020-04-23' AS Date), CAST(22476.0300000000 AS Decimal(18, 10)), 296, 16, 17, N'4011209000', 156, 60053, CAST(4013.2900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 296)
    INSERT @Registros VALUES (786, 18, 7, 3, CAST(N'2020-04-24' AS Date), CAST(15773.5200000000 AS Decimal(18, 10)), 122, 5, 6, N'4011209000', 100, 60792, CAST(6490.2800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 122)
    INSERT @Registros VALUES (787, 6, 7, 3, CAST(N'2020-04-24' AS Date), CAST(12400.4200000000 AS Decimal(18, 10)), 88, 5, 6, N'4011209000', 97, 60967, CAST(5000.5900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 88)
    INSERT @Registros VALUES (788, 61, 7, 3, CAST(N'2020-04-27' AS Date), CAST(32249.1300000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 711, 61379, CAST(15120.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (789, 51, 7, 3, CAST(N'2020-04-30' AS Date), CAST(24703.8200000000 AS Decimal(18, 10)), 279, 5, 6, N'4011209000', 197, 63343, CAST(12600.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 279)
    INSERT @Registros VALUES (790, 45, 7, 3, CAST(N'2020-04-30' AS Date), CAST(56209.0400000000 AS Decimal(18, 10)), 504, 5, 6, N'4011209000', 463, 63742, CAST(29180.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 504)
    INSERT @Registros VALUES (791, 2, 12, 8, CAST(N'2020-04-30' AS Date), CAST(59265.3600000000 AS Decimal(18, 10)), 504, 5, 6, N'4011209000', 468, 63755, CAST(28160.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 504)
    INSERT @Registros VALUES (792, 23, 7, 3, CAST(N'2020-05-04' AS Date), CAST(21206.6200000000 AS Decimal(18, 10)), 104, 3, 4, N'4011209000', 302, 64614, CAST(5481.6000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 104)
    INSERT @Registros VALUES (793, 22, 7, 3, CAST(N'2020-05-04' AS Date), CAST(27651.0000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 333, 64679, CAST(14700.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (794, 47, 7, 3, CAST(N'2020-05-06' AS Date), CAST(37944.2200000000 AS Decimal(18, 10)), 270, 3, 4, N'4011209000', 395, 65538, CAST(8682.9800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 270)
    INSERT @Registros VALUES (795, 9, 9, 5, CAST(N'2020-05-07' AS Date), CAST(71465.0000000000 AS Decimal(18, 10)), 500, 5, 6, N'4011209000', 100, 66178, CAST(30348.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 500)
    INSERT @Registros VALUES (796, 51, 7, 3, CAST(N'2020-05-07' AS Date), CAST(45740.8500000000 AS Decimal(18, 10)), 373, 5, 6, N'4011209000', 201, 66191, CAST(19663.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 373)
    INSERT @Registros VALUES (797, 61, 7, 3, CAST(N'2020-05-07' AS Date), CAST(31458.5000000000 AS Decimal(18, 10)), 287, 5, 6, N'4011209000', 690, 66263, CAST(14860.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 287)
    INSERT @Registros VALUES (798, 15, 7, 3, CAST(N'2020-05-08' AS Date), CAST(4237.8200000000 AS Decimal(18, 10)), 24, 14, 15, N'4011209000', 259, 66982, CAST(1127.3700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 24)
    INSERT @Registros VALUES (799, 23, 7, 3, CAST(N'2020-05-11' AS Date), CAST(27724.9300000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 300, 67598, CAST(13360.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 254)
    INSERT @Registros VALUES (800, 23, 7, 3, CAST(N'2020-05-11' AS Date), CAST(27724.9300000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 300, 67598, CAST(13360.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 254)
    INSERT @Registros VALUES (801, 51, 7, 3, CAST(N'2020-05-11' AS Date), CAST(13635.5600000000 AS Decimal(18, 10)), 140, 5, 6, N'4011209000', 107, 67604, CAST(6317.4200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 140)
    INSERT @Registros VALUES (802, 61, 7, 3, CAST(N'2020-05-11' AS Date), CAST(8382.1900000000 AS Decimal(18, 10)), 129, 5, 6, N'4011209000', 737, 67932, CAST(3053.1700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 129)
    INSERT @Registros VALUES (803, 23, 7, 3, CAST(N'2020-05-12' AS Date), CAST(33432.6300000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 100, 68380, CAST(14808.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (804, 61, 7, 3, CAST(N'2020-05-12' AS Date), CAST(38085.5300000000 AS Decimal(18, 10)), 284, 5, 6, N'4011209000', 740, 68684, CAST(15107.4600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 284)
    INSERT @Registros VALUES (805, 12, 1, 2, CAST(N'2020-05-13' AS Date), CAST(28234.4400000000 AS Decimal(18, 10)), 270, 5, 6, N'4011209000', 436, 69423, CAST(14940.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 270)
    INSERT @Registros VALUES (806, 51, 7, 3, CAST(N'2020-05-13' AS Date), CAST(2336.4400000000 AS Decimal(18, 10)), 20, 6, 7, N'4011209000', 111, 69736, CAST(545.9900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (807, 45, 7, 3, CAST(N'2020-05-14' AS Date), CAST(167114.6000000000 AS Decimal(18, 10)), 1280, 20, 20, N'4011209000', 459, 70259, CAST(67448.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1280)
    INSERT @Registros VALUES (808, 37, 8, 4, CAST(N'2020-05-14' AS Date), CAST(45768.8800000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 28, 70346, CAST(14522.6400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (809, 45, 7, 3, CAST(N'2020-05-14' AS Date), CAST(2333.1000000000 AS Decimal(18, 10)), 30, 14, 15, N'4011209000', 614, 70358, CAST(451.7300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 30)
    INSERT @Registros VALUES (810, 45, 7, 3, CAST(N'2020-05-14' AS Date), CAST(9090.0000000000 AS Decimal(18, 10)), 50, 14, 15, N'4011209000', 618, 70358, CAST(1759.9900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (811, 30, 7, 3, CAST(N'2020-05-14' AS Date), CAST(29680.4900000000 AS Decimal(18, 10)), 123, 3, 4, N'4011209000', 761, 70370, CAST(6937.2700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 123)
    INSERT @Registros VALUES (812, 30, 7, 3, CAST(N'2020-05-14' AS Date), CAST(52948.8900000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 784, 70373, CAST(13190.7000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 250)
    INSERT @Registros VALUES (813, 6, 7, 3, CAST(N'2020-05-14' AS Date), CAST(31939.9400000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 88, 70488, CAST(13771.4400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (814, 29, 12, 8, CAST(N'2020-05-14' AS Date), CAST(28222.0000000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 79, 70507, CAST(15540.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 256)
    INSERT @Registros VALUES (815, 23, 7, 3, CAST(N'2020-05-14' AS Date), CAST(27644.6900000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 100, 70597, CAST(13360.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 254)
    INSERT @Registros VALUES (816, 66, 12, 8, CAST(N'2020-05-14' AS Date), CAST(8586.6400000000 AS Decimal(18, 10)), 92, 5, 6, N'4011209000', 100, 70620, CAST(4713.2800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 92)
    INSERT @Registros VALUES (817, 22, 7, 3, CAST(N'2020-05-15' AS Date), CAST(51569.8400000000 AS Decimal(18, 10)), 524, 5, 6, N'4011209000', 344, 70760, CAST(28222.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 524)
    INSERT @Registros VALUES (818, 22, 7, 3, CAST(N'2020-05-15' AS Date), CAST(27684.0000000000 AS Decimal(18, 10)), 269, 5, 6, N'4011209000', 340, 70798, CAST(14626.6400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 269)
    INSERT @Registros VALUES (819, 45, 7, 3, CAST(N'2020-05-20' AS Date), CAST(171700.0000000000 AS Decimal(18, 10)), 1360, 20, 20, N'4011209000', 538, 72793, CAST(69700.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1360)
    INSERT @Registros VALUES (820, 45, 7, 3, CAST(N'2020-05-20' AS Date), CAST(183416.0000000000 AS Decimal(18, 10)), 1236, 20, 20, N'4011209000', 536, 72850, CAST(70167.3000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1236)
    INSERT @Registros VALUES (821, 61, 7, 3, CAST(N'2020-05-20' AS Date), CAST(34938.4500000000 AS Decimal(18, 10)), 261, 5, 6, N'4011209000', 689, 72962, CAST(18120.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 261)
    INSERT @Registros VALUES (822, 12, 1, 2, CAST(N'2020-05-20' AS Date), CAST(28107.5800000000 AS Decimal(18, 10)), 268, 5, 6, N'4011209000', 435, 73117, CAST(14490.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 268)
    INSERT @Registros VALUES (823, 51, 7, 3, CAST(N'2020-05-20' AS Date), CAST(20367.9100000000 AS Decimal(18, 10)), 233, 5, 6, N'4011209000', 195, 73152, CAST(8471.4200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 233)
    INSERT @Registros VALUES (824, 12, 1, 2, CAST(N'2020-05-20' AS Date), CAST(57817.4400000000 AS Decimal(18, 10)), 526, 5, 6, N'4011209000', 445, 73153, CAST(28232.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 526)
    INSERT @Registros VALUES (825, 26, 7, 3, CAST(N'2020-05-21' AS Date), CAST(32809.0700000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 9, 73680, CAST(14845.7500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (826, 45, 7, 3, CAST(N'2020-05-21' AS Date), CAST(28862.6800000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 559, 73778, CAST(14520.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (827, 6, 7, 3, CAST(N'2020-05-22' AS Date), CAST(9253.2900000000 AS Decimal(18, 10)), 68, 5, 6, N'4011209000', 92, 74595, CAST(3731.4800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 68)
    INSERT @Registros VALUES (828, 64, 7, 3, CAST(N'2020-05-25' AS Date), CAST(33003.1600000000 AS Decimal(18, 10)), 294, 5, 6, N'4011209000', 308, 75506, CAST(14679.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 294)
    INSERT @Registros VALUES (829, 45, 7, 3, CAST(N'2020-05-26' AS Date), CAST(63251.2500000000 AS Decimal(18, 10)), 421, 20, 20, N'4011209000', 570, 75838, CAST(23943.4800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 421)
    INSERT @Registros VALUES (830, 61, 7, 3, CAST(N'2020-05-26' AS Date), CAST(32685.3300000000 AS Decimal(18, 10)), 272, 5, 6, N'4011209000', 688, 76018, CAST(15040.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 272)
    INSERT @Registros VALUES (831, 25, 7, 3, CAST(N'2020-05-26' AS Date), CAST(15470.3100000000 AS Decimal(18, 10)), 160, 5, 6, N'4011209000', 100, 76506, CAST(6538.5600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 160)
    INSERT @Registros VALUES (832, 42, 7, 3, CAST(N'2020-05-27' AS Date), CAST(2109.4000000000 AS Decimal(18, 10)), 20, 2, 2, N'4011209000', 503, 76831, CAST(610.8400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 20)
    INSERT @Registros VALUES (833, 44, 7, 3, CAST(N'2020-05-27' AS Date), CAST(58781.1500000000 AS Decimal(18, 10)), 260, 3, 4, N'4011209000', 364, 77020, CAST(13690.6100000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 260)
    INSERT @Registros VALUES (834, 44, 7, 3, CAST(N'2020-05-27' AS Date), CAST(344.4200000000 AS Decimal(18, 10)), 3, 3, 4, N'4011209000', 370, 77020, CAST(63.3700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 3)
    INSERT @Registros VALUES (835, 6, 7, 3, CAST(N'2020-05-27' AS Date), CAST(33403.1400000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 88, 77220, CAST(14589.8400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (836, 45, 7, 3, CAST(N'2020-05-28' AS Date), CAST(5684.6800000000 AS Decimal(18, 10)), 22, 3, 4, N'4011209000', 636, 78107, CAST(1119.4600000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 22)
    INSERT @Registros VALUES (837, 45, 7, 3, CAST(N'2020-05-28' AS Date), CAST(18227.2200000000 AS Decimal(18, 10)), 202, 3, 4, N'4011209000', 634, 78107, CAST(3589.4100000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 202)
    INSERT @Registros VALUES (838, 45, 7, 3, CAST(N'2020-05-28' AS Date), CAST(18621.7400000000 AS Decimal(18, 10)), 71, 3, 4, N'4011209000', 652, 78108, CAST(3710.4800000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 71)
    INSERT @Registros VALUES (839, 45, 7, 3, CAST(N'2020-05-28' AS Date), CAST(3039.6500000000 AS Decimal(18, 10)), 37, 3, 4, N'4011209000', 644, 78108, CAST(599.9500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 37)
    INSERT @Registros VALUES (840, 22, 7, 3, CAST(N'2020-05-29' AS Date), CAST(42296.3900000000 AS Decimal(18, 10)), 388, 5, 6, N'4011209000', 320, 78679, CAST(21458.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 388)
    INSERT @Registros VALUES (841, 30, 7, 3, CAST(N'2020-05-29' AS Date), CAST(2452.5100000000 AS Decimal(18, 10)), 32, 3, 4, N'4011209000', 671, 78749, CAST(439.9400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 32)
    INSERT @Registros VALUES (842, 30, 7, 3, CAST(N'2020-06-01' AS Date), CAST(50037.3900000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 791, 79450, CAST(12886.6300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 250)
    INSERT @Registros VALUES (843, 61, 7, 3, CAST(N'2020-06-01' AS Date), CAST(31418.5500000000 AS Decimal(18, 10)), 253, 5, 6, N'4011209000', 756, 79665, CAST(12437.8200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 253)
    INSERT @Registros VALUES (844, 42, 7, 3, CAST(N'2020-06-01' AS Date), CAST(39979.2700000000 AS Decimal(18, 10)), 356, 5, 6, N'4011209000', 405, 79844, CAST(16038.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 356)
    INSERT @Registros VALUES (845, 45, 7, 3, CAST(N'2020-06-03' AS Date), CAST(3383.2500000000 AS Decimal(18, 10)), 44, 16, 17, N'4011209000', 571, 80953, CAST(639.8500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 44)
    INSERT @Registros VALUES (846, 44, 7, 3, CAST(N'2020-06-03' AS Date), CAST(13522.5600000000 AS Decimal(18, 10)), 106, 5, 6, N'4011209000', 453, 81062, CAST(5454.2200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 106)
    INSERT @Registros VALUES (847, 37, 8, 4, CAST(N'2020-06-04' AS Date), CAST(36036.3600000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 23, 81757, CAST(15332.1600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 256)
    INSERT @Registros VALUES (848, 45, 7, 3, CAST(N'2020-06-04' AS Date), CAST(113085.2000000000 AS Decimal(18, 10)), 1024, 5, 6, N'4011209000', 82, 81892, CAST(59740.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1024)
    INSERT @Registros VALUES (849, 51, 7, 3, CAST(N'2020-06-05' AS Date), CAST(2175.2000000000 AS Decimal(18, 10)), 21, 5, 6, N'4011209000', 187, 82338, CAST(854.4700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 21)
    INSERT @Registros VALUES (850, 23, 7, 3, CAST(N'2020-06-05' AS Date), CAST(55053.7500000000 AS Decimal(18, 10)), 229, 3, 4, N'4011209000', 304, 82465, CAST(14116.9000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 229)
    INSERT @Registros VALUES (851, 45, 7, 3, CAST(N'2020-06-05' AS Date), CAST(9158.2600000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 647, 82807, CAST(2062.7900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 50)
    INSERT @Registros VALUES (852, 45, 7, 3, CAST(N'2020-06-05' AS Date), CAST(28545.8100000000 AS Decimal(18, 10)), 108, 3, 4, N'4011209000', 625, 82807, CAST(6429.5900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 108)
    INSERT @Registros VALUES (853, 45, 7, 3, CAST(N'2020-06-05' AS Date), CAST(9044.7400000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 623, 82807, CAST(2037.2200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 100)
    INSERT @Registros VALUES (854, 30, 7, 3, CAST(N'2020-06-08' AS Date), CAST(212.2800000000 AS Decimal(18, 10)), 1, 1, 13, N'4011209000', 234, 83382, CAST(41.5800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1)
    INSERT @Registros VALUES (855, 30, 7, 3, CAST(N'2020-06-08' AS Date), CAST(4033.2700000000 AS Decimal(18, 10)), 19, 1, 13, N'4011209000', 236, 83382, CAST(789.9600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 19)
    INSERT @Registros VALUES (856, 30, 7, 3, CAST(N'2020-06-08' AS Date), CAST(11789.8000000000 AS Decimal(18, 10)), 40, 10, 13, N'4011209000', 287, 83382, CAST(1594.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (857, 61, 7, 3, CAST(N'2020-06-09' AS Date), CAST(33040.8500000000 AS Decimal(18, 10)), 291, 5, 6, N'4011209000', 728, 84165, CAST(15340.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 291)
    INSERT @Registros VALUES (858, 61, 7, 3, CAST(N'2020-06-10' AS Date), CAST(2124.1200000000 AS Decimal(18, 10)), 20, 5, 6, N'4011209000', 698, 84732, CAST(794.7500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (859, 44, 7, 3, CAST(N'2020-06-10' AS Date), CAST(39735.2800000000 AS Decimal(18, 10)), 192, 3, 4, N'4011209000', 354, 84849, CAST(8545.4200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 192)
    INSERT @Registros VALUES (860, 30, 7, 3, CAST(N'2020-06-11' AS Date), CAST(65572.1200000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 793, 85650, CAST(14724.1400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 250)
    INSERT @Registros VALUES (861, 44, 7, 3, CAST(N'2020-06-11' AS Date), CAST(38763.7300000000 AS Decimal(18, 10)), 303, 5, 6, N'4011209000', 372, 85651, CAST(14321.0200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 303)
    INSERT @Registros VALUES (862, 42, 7, 3, CAST(N'2020-06-11' AS Date), CAST(50440.2000000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 122, 85858, CAST(13820.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (863, 20, 7, 3, CAST(N'2020-06-12' AS Date), CAST(35374.3700000000 AS Decimal(18, 10)), 410, 5, 6, N'4011209000', 278, 86254, CAST(16573.6700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 410)
    INSERT @Registros VALUES (864, 45, 7, 3, CAST(N'2020-06-15' AS Date), CAST(56270.9100000000 AS Decimal(18, 10)), 261, 3, 4, N'4011209000', 639, 87178, CAST(12835.6200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 261)
    INSERT @Registros VALUES (865, 45, 7, 3, CAST(N'2020-06-15' AS Date), CAST(3914.9400000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 648, 87178, CAST(893.0100000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 50)
    INSERT @Registros VALUES (866, 9, 9, 5, CAST(N'2020-06-18' AS Date), CAST(34501.6000000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 100, 89106, CAST(15039.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (867, 44, 7, 3, CAST(N'2020-06-18' AS Date), CAST(62155.9300000000 AS Decimal(18, 10)), 500, 5, 6, N'4011209000', 386, 89673, CAST(27153.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 500)
    INSERT @Registros VALUES (868, 23, 7, 3, CAST(N'2020-06-22' AS Date), CAST(28110.9800000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 100, 90290, CAST(13828.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (869, 42, 7, 3, CAST(N'2020-06-22' AS Date), CAST(14613.3000000000 AS Decimal(18, 10)), 70, 2, 2, N'4011209000', 517, 90492, CAST(4205.0300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 70)
    INSERT @Registros VALUES (870, 22, 7, 3, CAST(N'2020-06-22' AS Date), CAST(6346.0800000000 AS Decimal(18, 10)), 70, 5, 6, N'4011209000', 347, 90789, CAST(3299.4800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 70)
    INSERT @Registros VALUES (871, 23, 7, 3, CAST(N'2020-06-22' AS Date), CAST(58816.8100000000 AS Decimal(18, 10)), 230, 3, 4, N'4011209000', 304, 90954, CAST(14923.3400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 230)
    INSERT @Registros VALUES (872, 45, 7, 3, CAST(N'2020-06-23' AS Date), CAST(4581.3600000000 AS Decimal(18, 10)), 30, 14, 15, N'4011209000', 665, 91020, CAST(937.7300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 30)
    INSERT @Registros VALUES (873, 45, 7, 3, CAST(N'2020-06-23' AS Date), CAST(25482.3000000000 AS Decimal(18, 10)), 300, 14, 15, N'4011209000', 494, 91020, CAST(5215.8100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 300)
    INSERT @Registros VALUES (874, 47, 7, 3, CAST(N'2020-06-23' AS Date), CAST(56796.9500000000 AS Decimal(18, 10)), 304, 3, 4, N'4011209000', 100, 91208, CAST(14296.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 304)
    INSERT @Registros VALUES (875, 45, 7, 3, CAST(N'2020-06-23' AS Date), CAST(60457.1700000000 AS Decimal(18, 10)), 232, 3, 4, N'4011209000', 611, 91647, CAST(13901.0900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 232)
    INSERT @Registros VALUES (876, 45, 7, 3, CAST(N'2020-06-23' AS Date), CAST(1373.3900000000 AS Decimal(18, 10)), 15, 3, 4, N'4011209000', 604, 91647, CAST(315.7800000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 15)
    INSERT @Registros VALUES (877, 15, 7, 3, CAST(N'2020-06-24' AS Date), CAST(5242.5300000000 AS Decimal(18, 10)), 44, 14, 15, N'4011209000', 260, 91984, CAST(1394.6500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 44)
    INSERT @Registros VALUES (878, 51, 7, 3, CAST(N'2020-06-25' AS Date), CAST(23601.5500000000 AS Decimal(18, 10)), 176, 5, 6, N'4011209000', 183, 92963, CAST(11022.3400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 176)
    INSERT @Registros VALUES (879, 51, 7, 3, CAST(N'2020-06-25' AS Date), CAST(16325.4400000000 AS Decimal(18, 10)), 126, 5, 6, N'4011209000', 179, 92965, CAST(8651.3100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 126)
    INSERT @Registros VALUES (880, 45, 7, 3, CAST(N'2020-06-25' AS Date), CAST(92591.5800000000 AS Decimal(18, 10)), 1006, 5, 6, N'4011209000', 525, 93275, CAST(44563.9200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1006)
    INSERT @Registros VALUES (881, 8, 7, 3, CAST(N'2020-06-25' AS Date), CAST(22547.6500000000 AS Decimal(18, 10)), 136, 5, 6, N'4011209000', 69, 93325, CAST(8657.9600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 136)
    INSERT @Registros VALUES (882, 22, 7, 3, CAST(N'2020-06-25' AS Date), CAST(25724.7800000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 337, 93362, CAST(14228.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (883, 64, 7, 3, CAST(N'2020-06-25' AS Date), CAST(30605.0600000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 310, 93466, CAST(12708.9300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (884, 30, 7, 3, CAST(N'2020-06-25' AS Date), CAST(908.2200000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 764, 93516, CAST(183.9300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 12)
    INSERT @Registros VALUES (885, 8, 7, 3, CAST(N'2020-06-26' AS Date), CAST(6653.7700000000 AS Decimal(18, 10)), 80, 5, 6, N'4011209000', 66, 93911, CAST(2165.3900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 80)
    INSERT @Registros VALUES (886, 51, 7, 3, CAST(N'2020-06-26' AS Date), CAST(2057.4700000000 AS Decimal(18, 10)), 10, 5, 6, N'4011209000', 176, 93957, CAST(829.3300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 10)
    INSERT @Registros VALUES (887, 61, 7, 3, CAST(N'2020-06-26' AS Date), CAST(26994.2400000000 AS Decimal(18, 10)), 215, 5, 6, N'4011209000', 705, 94300, CAST(10480.0100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 215)
    INSERT @Registros VALUES (888, 45, 7, 3, CAST(N'2020-06-29' AS Date), CAST(10952.8200000000 AS Decimal(18, 10)), 170, 16, 17, N'4011209000', 546, 95165, CAST(2135.9600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 170)
    INSERT @Registros VALUES (889, 45, 7, 3, CAST(N'2020-06-29' AS Date), CAST(28040.3700000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 560, 95488, CAST(13303.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 256)
    INSERT @Registros VALUES (890, 2, 12, 8, CAST(N'2020-06-30' AS Date), CAST(30000.6000000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 468, 95926, CAST(15420.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (891, 20, 7, 3, CAST(N'2020-06-30' AS Date), CAST(36255.2900000000 AS Decimal(18, 10)), 670, 5, 6, N'4011209000', 279, 96115, CAST(16958.9400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 670)
    INSERT @Registros VALUES (892, 45, 7, 3, CAST(N'2020-06-30' AS Date), CAST(28566.0200000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 560, 96262, CAST(15020.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 256)
    INSERT @Registros VALUES (893, 12, 1, 2, CAST(N'2020-06-30' AS Date), CAST(28328.9600000000 AS Decimal(18, 10)), 263, 5, 6, N'4011209000', 434, 96506, CAST(14224.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 263)
    INSERT @Registros VALUES (894, 12, 1, 2, CAST(N'2020-06-30' AS Date), CAST(24136.1700000000 AS Decimal(18, 10)), 246, 5, 6, N'4011209000', 426, 96516, CAST(12994.5900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 246)
    INSERT @Registros VALUES (895, 37, 8, 4, CAST(N'2020-07-01' AS Date), CAST(46026.2500000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 19, 96968, CAST(14852.9000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (896, 45, 7, 3, CAST(N'2020-07-02' AS Date), CAST(106837.8000000000 AS Decimal(18, 10)), 750, 20, 20, N'4011209000', 586, 97756, CAST(41603.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 750)
    INSERT @Registros VALUES (897, 61, 7, 3, CAST(N'2020-07-02' AS Date), CAST(30657.6600000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 677, 97949, CAST(14600.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (898, 42, 7, 3, CAST(N'2020-07-03' AS Date), CAST(52132.8000000000 AS Decimal(18, 10)), 230, 3, 4, N'4011209000', 129, 98566, CAST(14127.7800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 230)
    INSERT @Registros VALUES (899, 51, 7, 3, CAST(N'2020-07-06' AS Date), CAST(44952.8400000000 AS Decimal(18, 10)), 484, 5, 6, N'4011209000', 207, 99339, CAST(25491.3300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 484)
    INSERT @Registros VALUES (900, 66, 12, 8, CAST(N'2020-07-06' AS Date), CAST(22716.0700000000 AS Decimal(18, 10)), 320, 5, 6, N'4011209000', 100, 99895, CAST(14479.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 320)
    INSERT @Registros VALUES (901, 47, 7, 3, CAST(N'2020-07-07' AS Date), CAST(29814.7900000000 AS Decimal(18, 10)), 450, 3, 4, N'4011209000', 468, 100212, CAST(6440.2700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 450)
    INSERT @Registros VALUES (902, 47, 7, 3, CAST(N'2020-07-07' AS Date), CAST(15556.4600000000 AS Decimal(18, 10)), 56, 3, 4, N'4011209000', 468, 100212, CAST(3976.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 56)
    INSERT @Registros VALUES (903, 47, 7, 3, CAST(N'2020-07-07' AS Date), CAST(4080.7800000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 395, 100642, CAST(896.3700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (904, 30, 7, 3, CAST(N'2020-07-08' AS Date), CAST(47650.8900000000 AS Decimal(18, 10)), 168, 3, 4, N'4011209000', 768, 101393, CAST(10127.8200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 168)
    INSERT @Registros VALUES (905, 26, 7, 3, CAST(N'2020-07-10' AS Date), CAST(31253.8600000000 AS Decimal(18, 10)), 245, 5, 6, N'4011209000', 7, 102576, CAST(14660.3900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 245)
    INSERT @Registros VALUES (906, 51, 7, 3, CAST(N'2020-07-10' AS Date), CAST(1778.0600000000 AS Decimal(18, 10)), 18, 5, 6, N'4011209000', 184, 102692, CAST(833.6700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 18)
    INSERT @Registros VALUES (907, 6, 7, 3, CAST(N'2020-07-10' AS Date), CAST(20727.2000000000 AS Decimal(18, 10)), 158, 5, 6, N'4011209000', 84, 103083, CAST(8598.2800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 158)
    INSERT @Registros VALUES (908, 23, 7, 3, CAST(N'2020-07-15' AS Date), CAST(31853.7600000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 841, 104999, CAST(15031.9000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (909, 45, 7, 3, CAST(N'2020-07-15' AS Date), CAST(12652.4700000000 AS Decimal(18, 10)), 146, 14, 15, N'4011209000', 541, 105260, CAST(2733.6100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 146)
    INSERT @Registros VALUES (910, 64, 7, 3, CAST(N'2020-07-16' AS Date), CAST(30978.8200000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 312, 105873, CAST(14380.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (911, 44, 7, 3, CAST(N'2020-07-16' AS Date), CAST(65164.9000000000 AS Decimal(18, 10)), 345, 3, 4, N'4011209000', 379, 106338, CAST(14620.5000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 345)
    INSERT @Registros VALUES (912, 47, 7, 3, CAST(N'2020-07-17' AS Date), CAST(49854.2700000000 AS Decimal(18, 10)), 265, 3, 4, N'4011209000', 389, 107277, CAST(11700.6500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 265)
    INSERT @Registros VALUES (913, 25, 7, 3, CAST(N'2020-07-20' AS Date), CAST(14622.7900000000 AS Decimal(18, 10)), 138, 5, 6, N'4011209000', 100, 107754, CAST(7728.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 138)
    INSERT @Registros VALUES (914, 61, 7, 3, CAST(N'2020-07-21' AS Date), CAST(30695.0700000000 AS Decimal(18, 10)), 299, 5, 6, N'4011209000', 694, 108719, CAST(15400.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 299)
    INSERT @Registros VALUES (915, 28, 7, 3, CAST(N'2020-07-23' AS Date), CAST(22388.5700000000 AS Decimal(18, 10)), 90, 3, 4, N'4011209000', 170, 110310, CAST(4254.1500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 90)
    INSERT @Registros VALUES (916, 22, 7, 3, CAST(N'2020-07-23' AS Date), CAST(50459.7200000000 AS Decimal(18, 10)), 524, 5, 6, N'4011209000', 346, 110724, CAST(28309.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 524)
    INSERT @Registros VALUES (917, 23, 7, 3, CAST(N'2020-07-23' AS Date), CAST(28407.0900000000 AS Decimal(18, 10)), 267, 5, 6, N'4011209000', 300, 110730, CAST(13541.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 267)
    INSERT @Registros VALUES (918, 23, 7, 3, CAST(N'2020-07-23' AS Date), CAST(27946.7100000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 300, 110732, CAST(13828.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (919, 51, 7, 3, CAST(N'2020-07-24' AS Date), CAST(20435.7700000000 AS Decimal(18, 10)), 176, 5, 6, N'4011209000', 180, 111024, CAST(9017.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 176)
    INSERT @Registros VALUES (920, 51, 7, 3, CAST(N'2020-07-24' AS Date), CAST(33620.3100000000 AS Decimal(18, 10)), 288, 5, 6, N'4011209000', 218, 111025, CAST(14394.1200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 288)
    INSERT @Registros VALUES (921, 42, 7, 3, CAST(N'2020-07-24' AS Date), CAST(49761.0000000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 123, 111222, CAST(13957.1700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (922, 42, 7, 3, CAST(N'2020-07-27' AS Date), CAST(14079.5800000000 AS Decimal(18, 10)), 166, 15, 17, N'4011209000', 109, 112194, CAST(3485.1200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 166)
    INSERT @Registros VALUES (923, 42, 7, 3, CAST(N'2020-07-27' AS Date), CAST(15403.7000000000 AS Decimal(18, 10)), 130, 3, 17, N'4011209000', 106, 112194, CAST(3812.8800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 130)
    INSERT @Registros VALUES (924, 23, 7, 3, CAST(N'2020-07-27' AS Date), CAST(60702.1700000000 AS Decimal(18, 10)), 247, 3, 4, N'4011209000', 304, 112637, CAST(15092.1400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 247)
    INSERT @Registros VALUES (925, 15, 7, 3, CAST(N'2020-07-29' AS Date), CAST(31839.2300000000 AS Decimal(18, 10)), 154, 3, 4, N'4011209000', 249, 113951, CAST(9789.5400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 154)
    INSERT @Registros VALUES (926, 42, 7, 3, CAST(N'2020-07-29' AS Date), CAST(14024.0800000000 AS Decimal(18, 10)), 68, 2, 2, N'4011209000', 516, 114015, CAST(3993.9500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 68)
    INSERT @Registros VALUES (927, 30, 7, 3, CAST(N'2020-07-29' AS Date), CAST(54086.6200000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 785, 114355, CAST(13486.4700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 250)
    INSERT @Registros VALUES (928, 36, 12, 8, CAST(N'2020-07-29' AS Date), CAST(58056.4400000000 AS Decimal(18, 10)), 548, 5, 6, N'4011209000', 468, 114480, CAST(29980.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 548)
    INSERT @Registros VALUES (929, 37, 8, 4, CAST(N'2020-07-30' AS Date), CAST(33249.2400000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 26, 114632, CAST(14742.6400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (930, 45, 7, 3, CAST(N'2020-07-30' AS Date), CAST(133421.0000000000 AS Decimal(18, 10)), 898, 20, 20, N'4011209000', 595, 114657, CAST(51110.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 898)
    INSERT @Registros VALUES (931, 45, 7, 3, CAST(N'2020-07-30' AS Date), CAST(93455.5100000000 AS Decimal(18, 10)), 346, 3, 4, N'4011209000', 403, 115030, CAST(22321.6700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 346)
    INSERT @Registros VALUES (932, 12, 1, 2, CAST(N'2020-08-03' AS Date), CAST(24238.2900000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 429, 116922, CAST(13330.3200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (933, 42, 7, 3, CAST(N'2020-08-03' AS Date), CAST(36290.2500000000 AS Decimal(18, 10)), 357, 5, 6, N'4011209000', 406, 117127, CAST(15680.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 357)
    INSERT @Registros VALUES (934, 61, 7, 3, CAST(N'2020-08-03' AS Date), CAST(30035.4400000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 686, 117325, CAST(14672.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (935, 23, 7, 3, CAST(N'2020-08-03' AS Date), CAST(32047.9800000000 AS Decimal(18, 10)), 228, 5, 6, N'4011209000', 100, 117370, CAST(15772.4400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 228)
    INSERT @Registros VALUES (936, 2, 12, 8, CAST(N'2020-08-04' AS Date), CAST(33339.7100000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 468, 117496, CAST(15734.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (937, 10, 7, 3, CAST(N'2020-08-04' AS Date), CAST(11618.6200000000 AS Decimal(18, 10)), 118, 3, 4, N'4011209000', 298, 117608, CAST(2056.0900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 118)
    INSERT @Registros VALUES (938, 47, 7, 3, CAST(N'2020-08-04' AS Date), CAST(23547.3600000000 AS Decimal(18, 10)), 280, 3, 4, N'4011209000', 395, 117734, CAST(5160.7900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (939, 47, 7, 3, CAST(N'2020-08-04' AS Date), CAST(30319.3200000000 AS Decimal(18, 10)), 240, 3, 4, N'4011209000', 395, 117734, CAST(6356.7200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 240)
    INSERT @Registros VALUES (940, 61, 7, 3, CAST(N'2020-08-05' AS Date), CAST(25650.7500000000 AS Decimal(18, 10)), 247, 5, 6, N'4011209000', 730, 118654, CAST(10217.8700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 247)
    INSERT @Registros VALUES (941, 51, 7, 3, CAST(N'2020-08-05' AS Date), CAST(47038.4700000000 AS Decimal(18, 10)), 488, 5, 6, N'4011209000', 161, 118970, CAST(27270.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 488)
    INSERT @Registros VALUES (942, 23, 7, 3, CAST(N'2020-08-05' AS Date), CAST(27331.8700000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 100, 118991, CAST(13362.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 254)
    INSERT @Registros VALUES (943, 8, 7, 3, CAST(N'2020-08-06' AS Date), CAST(5265.1800000000 AS Decimal(18, 10)), 36, 5, 6, N'4011209000', 57, 119543, CAST(2251.3000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 36)
    INSERT @Registros VALUES (944, 51, 7, 3, CAST(N'2020-08-06' AS Date), CAST(40498.7500000000 AS Decimal(18, 10)), 394, 5, 6, N'4011209000', 181, 119835, CAST(17435.2900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 394)
    INSERT @Registros VALUES (945, 61, 7, 3, CAST(N'2020-08-06' AS Date), CAST(28105.8600000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 673, 119880, CAST(13886.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (946, 9, 9, 5, CAST(N'2020-08-07' AS Date), CAST(34175.0000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 100, 120049, CAST(14718.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (947, 2, 12, 8, CAST(N'2020-08-10' AS Date), CAST(66679.4200000000 AS Decimal(18, 10)), 496, 5, 6, N'4011209000', 468, 120915, CAST(31468.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 496)
    INSERT @Registros VALUES (948, 47, 7, 3, CAST(N'2020-08-11' AS Date), CAST(3424.3700000000 AS Decimal(18, 10)), 47, 3, 4, N'4011209000', 468, 121964, CAST(955.4800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 47)
    INSERT @Registros VALUES (949, 30, 7, 3, CAST(N'2020-08-11' AS Date), CAST(66487.4700000000 AS Decimal(18, 10)), 257, 3, 4, N'4011209000', 796, 122270, CAST(14360.2900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 257)
    INSERT @Registros VALUES (950, 44, 7, 3, CAST(N'2020-08-12' AS Date), CAST(32062.0400000000 AS Decimal(18, 10)), 246, 5, 6, N'4011209000', 454, 122940, CAST(14020.4300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 246)
    INSERT @Registros VALUES (951, 42, 7, 3, CAST(N'2020-08-12' AS Date), CAST(22935.5000000000 AS Decimal(18, 10)), 110, 2, 2, N'4011209000', 496, 123345, CAST(6502.3200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 110)
    INSERT @Registros VALUES (952, 37, 8, 4, CAST(N'2020-08-13' AS Date), CAST(46730.1400000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 22, 123668, CAST(15064.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 254)
    INSERT @Registros VALUES (953, 26, 7, 3, CAST(N'2020-08-13' AS Date), CAST(61107.3500000000 AS Decimal(18, 10)), 500, 5, 6, N'4011209000', 12, 123843, CAST(30183.2500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 500)
    INSERT @Registros VALUES (954, 45, 7, 3, CAST(N'2020-08-13' AS Date), CAST(11275.6400000000 AS Decimal(18, 10)), 112, 14, 15, N'4011209000', 533, 124089, CAST(2613.9700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 112)
    INSERT @Registros VALUES (955, 44, 7, 3, CAST(N'2020-08-17' AS Date), CAST(47592.1200000000 AS Decimal(18, 10)), 233, 3, 4, N'4011209000', 356, 125877, CAST(10370.2500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 233)
    INSERT @Registros VALUES (956, 45, 7, 3, CAST(N'2020-08-18' AS Date), CAST(17507.4100000000 AS Decimal(18, 10)), 64, 3, 4, N'4011209000', 581, 126604, CAST(3659.3600000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 64)
    INSERT @Registros VALUES (957, 45, 7, 3, CAST(N'2020-08-18' AS Date), CAST(13823.5700000000 AS Decimal(18, 10)), 184, 3, 4, N'4011209000', 548, 126604, CAST(2889.3600000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 184)
    INSERT @Registros VALUES (958, 42, 7, 3, CAST(N'2020-08-18' AS Date), CAST(36649.9700000000 AS Decimal(18, 10)), 361, 5, 6, N'4011209000', 408, 126753, CAST(15929.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 361)
    INSERT @Registros VALUES (959, 27, 7, 3, CAST(N'2020-08-19' AS Date), CAST(1212.1300000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 657, 127380, CAST(228.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 12)
    INSERT @Registros VALUES (960, 40, 10, 2, CAST(N'2020-08-19' AS Date), CAST(68184.2400000000 AS Decimal(18, 10)), 504, 5, 6, N'4011209000', 100, 127733, CAST(31080.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 504)
    INSERT @Registros VALUES (961, 51, 7, 3, CAST(N'2020-08-20' AS Date), CAST(43473.2500000000 AS Decimal(18, 10)), 440, 5, 6, N'4011209000', 159, 128321, CAST(25690.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 440)
    INSERT @Registros VALUES (962, 12, 1, 2, CAST(N'2020-08-24' AS Date), CAST(25725.6700000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 428, 129682, CAST(14680.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 254)
    INSERT @Registros VALUES (963, 26, 7, 3, CAST(N'2020-08-24' AS Date), CAST(29667.4000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 9, 129816, CAST(14635.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (964, 24, 12, 8, CAST(N'2020-08-24' AS Date), CAST(31580.0000000000 AS Decimal(18, 10)), 270, 5, 6, N'4011209000', 152, 129817, CAST(14920.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 270)
    INSERT @Registros VALUES (965, 29, 12, 8, CAST(N'2020-08-24' AS Date), CAST(27660.0000000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 79, 130084, CAST(15600.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (966, 45, 7, 3, CAST(N'2020-08-26' AS Date), CAST(277396.5000000000 AS Decimal(18, 10)), 1900, 20, 20, N'4011209000', 550, 130553, CAST(106572.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1900)
    INSERT @Registros VALUES (967, 46, 7, 3, CAST(N'2020-08-26' AS Date), CAST(37098.6900000000 AS Decimal(18, 10)), 274, 5, 6, N'4011209000', 452, 130950, CAST(15562.1500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 274)
    INSERT @Registros VALUES (968, 30, 7, 3, CAST(N'2020-08-26' AS Date), CAST(2140.6300000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 806, 131062, CAST(391.8000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 30)
    INSERT @Registros VALUES (969, 35, 12, 8, CAST(N'2020-08-28' AS Date), CAST(17191.7200000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 3, 133006, CAST(13037.8500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (970, 61, 7, 3, CAST(N'2020-08-31' AS Date), CAST(29245.6400000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 686, 133639, CAST(14426.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (971, 23, 7, 3, CAST(N'2020-10-01' AS Date), CAST(26637.3500000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 100, 154627, CAST(13362.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 254)
    INSERT @Registros VALUES (972, 23, 7, 3, CAST(N'2020-10-01' AS Date), CAST(28133.4300000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 100, 154628, CAST(13828.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (973, 23, 7, 3, CAST(N'2020-10-01' AS Date), CAST(30812.8000000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 100, 154628, CAST(14360.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (974, 7, 12, 8, CAST(N'2020-10-01' AS Date), CAST(4486.6000000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 295, 154921, CAST(744.6000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 60)
    INSERT @Registros VALUES (975, 7, 12, 8, CAST(N'2020-10-01' AS Date), CAST(22433.0000000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 293, 154921, CAST(3723.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 300)
    INSERT @Registros VALUES (976, 51, 7, 3, CAST(N'2020-10-01' AS Date), CAST(52828.9600000000 AS Decimal(18, 10)), 429, 5, 6, N'4011209000', 202, 154940, CAST(23777.7700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 429)
    INSERT @Registros VALUES (977, 51, 7, 3, CAST(N'2020-10-01' AS Date), CAST(61592.0300000000 AS Decimal(18, 10)), 520, 5, 6, N'4011209000', 233, 154943, CAST(27295.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 520)
    INSERT @Registros VALUES (978, 61, 7, 3, CAST(N'2020-10-01' AS Date), CAST(34375.2500000000 AS Decimal(18, 10)), 440, 5, 6, N'4011209000', 683, 154952, CAST(17000.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 440)
    INSERT @Registros VALUES (979, 6, 7, 3, CAST(N'2020-10-01' AS Date), CAST(29418.3200000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 88, 155021, CAST(14589.8400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (980, 27, 7, 3, CAST(N'2020-10-02' AS Date), CAST(1674.0200000000 AS Decimal(18, 10)), 20, 17, 19, N'4011209000', 660, 155497, CAST(331.1100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (981, 22, 7, 3, CAST(N'2020-10-02' AS Date), CAST(16599.6300000000 AS Decimal(18, 10)), 118, 21, 6, N'4011209000', 103, 155662, CAST(6302.6900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 118)
    INSERT @Registros VALUES (982, 61, 7, 3, CAST(N'2020-10-02' AS Date), CAST(28200.7000000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 685, 155848, CAST(14780.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (983, 61, 7, 3, CAST(N'2020-10-06' AS Date), CAST(19065.5300000000 AS Decimal(18, 10)), 214, 5, 6, N'4011209000', 731, 157367, CAST(7029.1400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 214)
    INSERT @Registros VALUES (984, 30, 7, 3, CAST(N'2020-10-06' AS Date), CAST(57899.6000000000 AS Decimal(18, 10)), 237, 3, 4, N'4011209000', 779, 157405, CAST(13611.8500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 237)
    INSERT @Registros VALUES (985, 23, 7, 3, CAST(N'2020-10-06' AS Date), CAST(54011.5800000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 302, 157737, CAST(14794.1400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (986, 51, 7, 3, CAST(N'2020-10-07' AS Date), CAST(23924.3300000000 AS Decimal(18, 10)), 215, 5, 6, N'4011209000', 190, 158252, CAST(12027.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 215)
    INSERT @Registros VALUES (987, 51, 7, 3, CAST(N'2020-10-07' AS Date), CAST(23642.7900000000 AS Decimal(18, 10)), 218, 5, 6, N'4011209000', 192, 158252, CAST(11773.6800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 218)
    INSERT @Registros VALUES (988, 51, 7, 3, CAST(N'2020-10-07' AS Date), CAST(10146.3200000000 AS Decimal(18, 10)), 121, 5, 6, N'4011209000', 177, 158252, CAST(4426.4700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 121)
    INSERT @Registros VALUES (989, 51, 7, 3, CAST(N'2020-10-07' AS Date), CAST(23246.6000000000 AS Decimal(18, 10)), 210, 5, 6, N'4011209000', 188, 158572, CAST(13900.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 210)
    INSERT @Registros VALUES (990, 23, 7, 3, CAST(N'2020-10-07' AS Date), CAST(26994.9700000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 100, 158594, CAST(13362.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 254)
    INSERT @Registros VALUES (991, 23, 7, 3, CAST(N'2020-10-07' AS Date), CAST(26994.9800000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 100, 158594, CAST(13362.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 254)
    INSERT @Registros VALUES (992, 23, 7, 3, CAST(N'2020-10-07' AS Date), CAST(56220.2700000000 AS Decimal(18, 10)), 245, 3, 4, N'4011209000', 301, 158595, CAST(14816.5900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 245)
    INSERT @Registros VALUES (993, 47, 7, 3, CAST(N'2020-10-07' AS Date), CAST(869.6100000000 AS Decimal(18, 10)), 8, 3, 4, N'4011209000', 468, 158934, CAST(138.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 8)
    INSERT @Registros VALUES (994, 47, 7, 3, CAST(N'2020-10-07' AS Date), CAST(14012.7000000000 AS Decimal(18, 10)), 153, 3, 4, N'4011209000', 395, 158934, CAST(3092.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 153)
    INSERT @Registros VALUES (995, 47, 7, 3, CAST(N'2020-10-07' AS Date), CAST(11194.4200000000 AS Decimal(18, 10)), 134, 3, 4, N'4011209000', 395, 158934, CAST(2352.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 134)
    INSERT @Registros VALUES (996, 12, 1, 2, CAST(N'2020-10-08' AS Date), CAST(23234.9900000000 AS Decimal(18, 10)), 288, 5, 6, N'4011209000', 439, 159332, CAST(11718.4300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 288)
    INSERT @Registros VALUES (997, 42, 7, 3, CAST(N'2020-10-08' AS Date), CAST(48606.7000000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 125, 159570, CAST(13513.2600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (998, 23, 7, 3, CAST(N'2020-10-08' AS Date), CAST(28839.6600000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 101, 159645, CAST(13828.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (999, 26, 7, 3, CAST(N'2020-10-08' AS Date), CAST(30282.9700000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 10, 159940, CAST(14707.3000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 254)
    INSERT @Registros VALUES (1000, 37, 8, 4, CAST(N'2020-10-09' AS Date), CAST(34110.4400000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 21, 160159, CAST(15524.8800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (1001, 30, 7, 3, CAST(N'2020-10-13' AS Date), CAST(46269.1200000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 788, 161414, CAST(12622.4100000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 250)
    INSERT @Registros VALUES (1002, 30, 7, 3, CAST(N'2020-10-13' AS Date), CAST(58689.2000000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 792, 161418, CAST(14904.1900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 250)
    INSERT @Registros VALUES (1003, 6, 7, 3, CAST(N'2020-10-13' AS Date), CAST(2177.0700000000 AS Decimal(18, 10)), 32, 5, 6, N'4011209000', 89, 161804, CAST(877.9300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 32)
    INSERT @Registros VALUES (1004, 47, 7, 3, CAST(N'2020-10-14' AS Date), CAST(7855.3400000000 AS Decimal(18, 10)), 116, 3, 4, N'4011209000', 395, 162402, CAST(1950.2200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 116)
    INSERT @Registros VALUES (1005, 45, 7, 3, CAST(N'2020-10-14' AS Date), CAST(23096.4100000000 AS Decimal(18, 10)), 91, 3, 4, N'4011209000', 597, 162491, CAST(4738.2500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 91)
    INSERT @Registros VALUES (1006, 45, 7, 3, CAST(N'2020-10-14' AS Date), CAST(243.3500000000 AS Decimal(18, 10)), 3, 3, 4, N'4011209000', 562, 162491, CAST(49.9300000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 3)
    INSERT @Registros VALUES (1007, 2, 12, 8, CAST(N'2020-10-16' AS Date), CAST(35068.9800000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 468, 164091, CAST(17120.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (1008, 61, 7, 3, CAST(N'2020-10-16' AS Date), CAST(5984.1700000000 AS Decimal(18, 10)), 93, 5, 6, N'4011209000', 734, 164549, CAST(2265.9200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 93)
    INSERT @Registros VALUES (1009, 50, 12, 8, CAST(N'2020-10-19' AS Date), CAST(34724.0000000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 141, 164982, CAST(15600.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (1010, 30, 7, 3, CAST(N'2020-10-19' AS Date), CAST(61803.8000000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 792, 165197, CAST(15244.1700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 250)
    INSERT @Registros VALUES (1011, 61, 7, 3, CAST(N'2020-10-19' AS Date), CAST(29471.3400000000 AS Decimal(18, 10)), 334, 5, 6, N'4011209000', 697, 165260, CAST(14374.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 334)
    INSERT @Registros VALUES (1012, 15, 7, 3, CAST(N'2020-10-19' AS Date), CAST(12404.1900000000 AS Decimal(18, 10)), 50, 14, 15, N'4011209000', 264, 165690, CAST(2179.8400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (1013, 30, 7, 3, CAST(N'2020-10-20' AS Date), CAST(425.3400000000 AS Decimal(18, 10)), 2, 1, 13, N'4011209000', 285, 166089, CAST(83.1500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 2)
    INSERT @Registros VALUES (1014, 30, 7, 3, CAST(N'2020-10-20' AS Date), CAST(5534.9700000000 AS Decimal(18, 10)), 16, 10, 13, N'4011209000', 284, 166089, CAST(1121.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 16)
    INSERT @Registros VALUES (1015, 30, 7, 3, CAST(N'2020-10-20' AS Date), CAST(11262.2900000000 AS Decimal(18, 10)), 54, 20, 13, N'4011209000', 288, 166089, CAST(3324.8300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 54)
    INSERT @Registros VALUES (1016, 61, 7, 3, CAST(N'2020-10-20' AS Date), CAST(19048.2200000000 AS Decimal(18, 10)), 229, 5, 6, N'4011209000', 732, 166173, CAST(6996.8900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 229)
    INSERT @Registros VALUES (1017, 45, 7, 3, CAST(N'2020-10-20' AS Date), CAST(86153.0000000000 AS Decimal(18, 10)), 620, 20, 20, N'4011209000', 651, 166417, CAST(33636.8000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 620)
    INSERT @Registros VALUES (1018, 44, 7, 3, CAST(N'2020-10-22' AS Date), CAST(29977.5300000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 366, 168081, CAST(11340.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 266)
    INSERT @Registros VALUES (1019, 12, 1, 2, CAST(N'2020-10-22' AS Date), CAST(26044.3300000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 430, 168192, CAST(14006.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (1020, 12, 1, 2, CAST(N'2020-10-22' AS Date), CAST(26590.1100000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 429, 168193, CAST(14900.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (1021, 30, 7, 3, CAST(N'2020-10-22' AS Date), CAST(63630.7100000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 789, 168311, CAST(15838.2500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 250)
    INSERT @Registros VALUES (1022, 42, 7, 3, CAST(N'2020-10-22' AS Date), CAST(6578.7000000000 AS Decimal(18, 10)), 62, 2, 2, N'4011209000', 514, 168378, CAST(1837.3500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 62)
    INSERT @Registros VALUES (1023, 64, 7, 3, CAST(N'2020-10-22' AS Date), CAST(20174.0100000000 AS Decimal(18, 10)), 173, 5, 6, N'4011209000', 312, 168444, CAST(8188.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 173)
    INSERT @Registros VALUES (1024, 27, 7, 3, CAST(N'2020-10-23' AS Date), CAST(5435.3400000000 AS Decimal(18, 10)), 62, 3, 4, N'4011209000', 5, 20163385, CAST(935.4200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 62)
    INSERT @Registros VALUES (1025, 51, 7, 3, CAST(N'2020-10-23' AS Date), CAST(68971.2500000000 AS Decimal(18, 10)), 597, 5, 6, N'4011209000', 5, 20376331, CAST(32686.4500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 597)
    INSERT @Registros VALUES (1026, 4, 7, 3, CAST(N'2020-10-26' AS Date), CAST(21729.9300000000 AS Decimal(18, 10)), 182, 5, 6, N'4011209000', 5, 20242711, CAST(9421.2800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 182)
    INSERT @Registros VALUES (1027, 20, 7, 3, CAST(N'2020-10-28' AS Date), CAST(24601.4300000000 AS Decimal(18, 10)), 380, 5, 6, N'4011209000', 5, 20420465, CAST(12729.9500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 380)
    INSERT @Registros VALUES (1028, 20, 7, 3, CAST(N'2020-10-28' AS Date), CAST(34222.6700000000 AS Decimal(18, 10)), 340, 5, 6, N'4011209000', 5, 20516695, CAST(17413.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 340)
    INSERT @Registros VALUES (1029, 45, 7, 3, CAST(N'2020-10-29' AS Date), CAST(5441.9900000000 AS Decimal(18, 10)), 23, 3, 4, N'4011209000', 5, 20063451, CAST(1038.7300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 23)
    INSERT @Registros VALUES (1030, 45, 7, 3, CAST(N'2020-10-29' AS Date), CAST(2613.4900000000 AS Decimal(18, 10)), 28, 3, 4, N'4011209000', 5, 20063451, CAST(498.8400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 28)
    INSERT @Registros VALUES (1031, 42, 7, 3, CAST(N'2020-10-29' AS Date), CAST(19683.8000000000 AS Decimal(18, 10)), 90, 2, 2, N'4011209000', 5, 20296990, CAST(5641.7400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 90)
    INSERT @Registros VALUES (1032, 42, 7, 3, CAST(N'2020-10-29' AS Date), CAST(7633.7600000000 AS Decimal(18, 10)), 82, 16, 17, N'4011209000', 5, 20488615, CAST(1490.8500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 82)
    INSERT @Registros VALUES (1033, 24, 12, 8, CAST(N'2020-10-29' AS Date), CAST(32153.0000000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 20527325, CAST(14900.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 264)
    INSERT @Registros VALUES (1034, 61, 7, 3, CAST(N'2020-10-29' AS Date), CAST(29580.3500000000 AS Decimal(18, 10)), 335, 5, 6, N'4011209000', 5, 20925876, CAST(14335.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 335)
    INSERT @Registros VALUES (1035, 61, 7, 3, CAST(N'2020-10-30' AS Date), CAST(9206.6300000000 AS Decimal(18, 10)), 153, 5, 6, N'4011209000', 5, 20008536, CAST(3536.4400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 153)
    INSERT @Registros VALUES (1036, 41, 7, 3, CAST(N'2020-11-03' AS Date), CAST(7275.1100000000 AS Decimal(18, 10)), 38, 5, 18, N'4011209000', 5, 20160694, CAST(1769.0300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 38)
    INSERT @Registros VALUES (1037, 47, 7, 3, CAST(N'2020-11-04' AS Date), CAST(32843.6900000000 AS Decimal(18, 10)), 340, 3, 4, N'4011209000', 5, 20481697, CAST(7313.0400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 340)
    INSERT @Registros VALUES (1038, 51, 7, 3, CAST(N'2020-11-04' AS Date), CAST(10677.0700000000 AS Decimal(18, 10)), 90, 5, 6, N'4011209000', 5, 20551137, CAST(4367.9300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 90)
    INSERT @Registros VALUES (1039, 45, 7, 3, CAST(N'2020-11-05' AS Date), CAST(3568.9900000000 AS Decimal(18, 10)), 32, 14, 15, N'4011209000', 5, 20094953, CAST(705.1200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 32)
    INSERT @Registros VALUES (1040, 45, 7, 3, CAST(N'2020-11-05' AS Date), CAST(4737.4800000000 AS Decimal(18, 10)), 60, 14, 15, N'4011209000', 5, 20094953, CAST(935.9800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 60)
    INSERT @Registros VALUES (1041, 30, 7, 3, CAST(N'2020-11-05' AS Date), CAST(5215.6900000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 5, 20095710, CAST(823.4400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 30)
    INSERT @Registros VALUES (1042, 30, 7, 3, CAST(N'2020-11-05' AS Date), CAST(4008.3900000000 AS Decimal(18, 10)), 48, 3, 4, N'4011209000', 5, 20095710, CAST(654.4700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 48)
    INSERT @Registros VALUES (1043, 44, 7, 3, CAST(N'2020-11-05' AS Date), CAST(32756.6600000000 AS Decimal(18, 10)), 230, 5, 6, N'4011209000', 5, 20176022, CAST(13095.9000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 230)
    INSERT @Registros VALUES (1044, 2, 12, 8, CAST(N'2020-11-05' AS Date), CAST(34218.0000000000 AS Decimal(18, 10)), 230, 5, 6, N'4011209000', 5, 20455269, CAST(16336.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 230)
    INSERT @Registros VALUES (1045, 20, 7, 3, CAST(N'2020-11-05' AS Date), CAST(30146.8500000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 20549203, CAST(14672.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1046, 23, 7, 3, CAST(N'2020-11-05' AS Date), CAST(31710.5900000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 20773637, CAST(13871.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1047, 23, 7, 3, CAST(N'2020-11-05' AS Date), CAST(34730.6700000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 20773637, CAST(14395.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1048, 18, 7, 3, CAST(N'2020-11-05' AS Date), CAST(24682.2400000000 AS Decimal(18, 10)), 200, 5, 6, N'4011209000', 5, 20867903, CAST(10490.5200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 200)
    INSERT @Registros VALUES (1049, 12, 1, 2, CAST(N'2020-11-06' AS Date), CAST(811.5000000000 AS Decimal(18, 10)), 4, 14, 15, N'4011209000', 5, 20388241, CAST(209.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 4)
    INSERT @Registros VALUES (1050, 22, 7, 3, CAST(N'2020-11-06' AS Date), CAST(7897.1600000000 AS Decimal(18, 10)), 84, 5, 6, N'4011209000', 5, 20397071, CAST(4316.7600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 84)
    INSERT @Registros VALUES (1051, 22, 7, 3, CAST(N'2020-11-06' AS Date), CAST(24146.9100000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 20397071, CAST(13197.6000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1052, 22, 7, 3, CAST(N'2020-11-06' AS Date), CAST(23982.0200000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 20810105, CAST(14036.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1053, 23, 7, 3, CAST(N'2020-11-09' AS Date), CAST(31765.7400000000 AS Decimal(18, 10)), 212, 3, 4, N'4011209000', 5, 20478578, CAST(7599.3600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 212)
    INSERT @Registros VALUES (1054, 23, 7, 3, CAST(N'2020-11-09' AS Date), CAST(49461.8700000000 AS Decimal(18, 10)), 229, 3, 4, N'4011209000', 5, 20478578, CAST(13739.3200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 229)
    INSERT @Registros VALUES (1055, 61, 7, 3, CAST(N'2020-11-10' AS Date), CAST(31697.0000000000 AS Decimal(18, 10)), 300, 5, 6, N'4011209000', 5, 20746501, CAST(14370.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 300)
    INSERT @Registros VALUES (1056, 61, 7, 3, CAST(N'2020-11-11' AS Date), CAST(33030.1400000000 AS Decimal(18, 10)), 322, 5, 6, N'4011209000', 5, 20344451, CAST(15700.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 322)
    INSERT @Registros VALUES (1057, 24, 12, 8, CAST(N'2020-11-12' AS Date), CAST(32013.0000000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 20250925, CAST(14680.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 264)
    INSERT @Registros VALUES (1058, 47, 7, 3, CAST(N'2020-11-12' AS Date), CAST(5024.2400000000 AS Decimal(18, 10)), 70, 3, 4, N'4011209000', 5, 20625620, CAST(1218.6500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 70)
    INSERT @Registros VALUES (1059, 48, 12, 8, CAST(N'2020-11-12' AS Date), CAST(6538.8000000000 AS Decimal(18, 10)), 60, 5, 6, N'4011209000', 5, 20718710, CAST(3138.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 60)
    INSERT @Registros VALUES (1060, 48, 12, 8, CAST(N'2020-11-12' AS Date), CAST(7003.8500000000 AS Decimal(18, 10)), 60, 5, 6, N'4011209000', 5, 20718710, CAST(3361.6000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 60)
    INSERT @Registros VALUES (1061, 22, 7, 3, CAST(N'2020-11-13' AS Date), CAST(2392.5200000000 AS Decimal(18, 10)), 26, 5, 6, N'4011209000', 5, 20263627, CAST(1150.4100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 26)
    INSERT @Registros VALUES (1062, 51, 7, 3, CAST(N'2020-11-13' AS Date), CAST(25008.6000000000 AS Decimal(18, 10)), 194, 5, 6, N'4011209000', 5, 20371546, CAST(12906.3700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 194)
    INSERT @Registros VALUES (1063, 51, 7, 3, CAST(N'2020-11-16' AS Date), CAST(6324.3800000000 AS Decimal(18, 10)), 60, 5, 6, N'4011209000', 5, 20274644, CAST(2702.5200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 60)
    INSERT @Registros VALUES (1064, 51, 7, 3, CAST(N'2020-11-16' AS Date), CAST(16258.1800000000 AS Decimal(18, 10)), 107, 5, 6, N'4011209000', 5, 20274644, CAST(6986.1700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 107)
    INSERT @Registros VALUES (1065, 51, 7, 3, CAST(N'2020-11-16' AS Date), CAST(12469.4400000000 AS Decimal(18, 10)), 114, 5, 6, N'4011209000', 5, 20274644, CAST(5274.1300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 114)
    INSERT @Registros VALUES (1066, 44, 7, 3, CAST(N'2020-11-16' AS Date), CAST(33960.4600000000 AS Decimal(18, 10)), 297, 5, 6, N'4011209000', 5, 20351035, CAST(11345.5900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 297)
    INSERT @Registros VALUES (1067, 61, 7, 3, CAST(N'2020-11-16' AS Date), CAST(31245.2600000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 5, 20361345, CAST(14980.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 252)
    INSERT @Registros VALUES (1068, 51, 7, 3, CAST(N'2020-11-16' AS Date), CAST(2467.8700000000 AS Decimal(18, 10)), 20, 6, 7, N'4011209000', 5, 20653032, CAST(780.2400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 20)
    INSERT @Registros VALUES (1069, 45, 7, 3, CAST(N'2020-11-16' AS Date), CAST(12084.3500000000 AS Decimal(18, 10)), 46, 3, 4, N'4011209000', 5, 20861107, CAST(2371.5800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 46)
    INSERT @Registros VALUES (1070, 45, 7, 3, CAST(N'2020-11-16' AS Date), CAST(10664.1700000000 AS Decimal(18, 10)), 158, 3, 4, N'4011209000', 5, 20861107, CAST(2092.8700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 158)
    INSERT @Registros VALUES (1071, 42, 7, 3, CAST(N'2020-11-17' AS Date), CAST(34068.0400000000 AS Decimal(18, 10)), 186, 2, 2, N'4011209000', 5, 20506142, CAST(9763.3500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 186)
    INSERT @Registros VALUES (1072, 45, 7, 3, CAST(N'2020-11-18' AS Date), CAST(60362.8000000000 AS Decimal(18, 10)), 380, 20, 20, N'4011209000', 5, 20087647, CAST(23123.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 380)
    INSERT @Registros VALUES (1073, 24, 12, 8, CAST(N'2020-11-18' AS Date), CAST(35475.0000000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 20194791, CAST(15320.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 264)
    INSERT @Registros VALUES (1074, 47, 7, 3, CAST(N'2020-11-18' AS Date), CAST(448.1400000000 AS Decimal(18, 10)), 5, 3, 4, N'4011209000', 5, 20455417, CAST(85.9600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 5)
    INSERT @Registros VALUES (1075, 47, 7, 3, CAST(N'2020-11-18' AS Date), CAST(1344.6700000000 AS Decimal(18, 10)), 24, 3, 4, N'4011209000', 5, 20455417, CAST(262.6400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 24)
    INSERT @Registros VALUES (1076, 47, 7, 3, CAST(N'2020-11-18' AS Date), CAST(757.7300000000 AS Decimal(18, 10)), 10, 3, 4, N'4011209000', 5, 20455417, CAST(156.0500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 10)
    INSERT @Registros VALUES (1077, 47, 7, 3, CAST(N'2020-11-18' AS Date), CAST(18986.9200000000 AS Decimal(18, 10)), 257, 3, 4, N'4011209000', 5, 20455417, CAST(4173.2300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 257)
    INSERT @Registros VALUES (1078, 42, 7, 3, CAST(N'2020-11-18' AS Date), CAST(36691.3000000000 AS Decimal(18, 10)), 302, 5, 6, N'4011209000', 5, 20500144, CAST(15175.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 302)
    INSERT @Registros VALUES (1079, 20, 7, 3, CAST(N'2020-11-18' AS Date), CAST(61040.7100000000 AS Decimal(18, 10)), 610, 5, 6, N'4011209000', 5, 20580537, CAST(30360.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 610)
    INSERT @Registros VALUES (1080, 20, 7, 3, CAST(N'2020-11-18' AS Date), CAST(28187.4700000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 20713046, CAST(13886.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1081, 45, 7, 3, CAST(N'2020-11-18' AS Date), CAST(6281.9300000000 AS Decimal(18, 10)), 67, 14, 15, N'4011209000', 5, 20961858, CAST(1235.8500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 67)
    INSERT @Registros VALUES (1082, 8, 7, 3, CAST(N'2020-11-19' AS Date), CAST(11353.8000000000 AS Decimal(18, 10)), 72, 5, 6, N'4011209000', 5, 20005377, CAST(4640.5500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 72)
    INSERT @Registros VALUES (1083, 2, 12, 8, CAST(N'2020-11-19' AS Date), CAST(59087.3600000000 AS Decimal(18, 10)), 532, 5, 6, N'4011209000', 5, 20069883, CAST(30500.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 532)
    INSERT @Registros VALUES (1084, 45, 7, 3, CAST(N'2020-11-19' AS Date), CAST(58017.4400000000 AS Decimal(18, 10)), 536, 5, 6, N'4011209000', 5, 20075639, CAST(28283.1300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 536)
    INSERT @Registros VALUES (1085, 2, 12, 8, CAST(N'2020-11-19' AS Date), CAST(35640.5200000000 AS Decimal(18, 10)), 282, 5, 6, N'4011209000', 5, 20193280, CAST(16255.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 282)
    INSERT @Registros VALUES (1086, 26, 7, 3, CAST(N'2020-11-19' AS Date), CAST(33561.4900000000 AS Decimal(18, 10)), 258, 5, 6, N'4011209000', 5, 20376319, CAST(14912.4600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 258)
    INSERT @Registros VALUES (1087, 7, 12, 8, CAST(N'2020-11-19' AS Date), CAST(7197.8000000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 20419854, CAST(1241.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1088, 7, 12, 8, CAST(N'2020-11-19' AS Date), CAST(40523.6600000000 AS Decimal(18, 10)), 563, 3, 4, N'4011209000', 5, 20419854, CAST(6986.8300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 563)
    INSERT @Registros VALUES (1089, 7, 12, 8, CAST(N'2020-11-19' AS Date), CAST(19937.9300000000 AS Decimal(18, 10)), 277, 3, 4, N'4011209000', 5, 20419854, CAST(3437.5700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 277)
    INSERT @Registros VALUES (1090, 61, 7, 3, CAST(N'2020-11-20' AS Date), CAST(30942.2600000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 5, 20209068, CAST(14760.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 252)
    INSERT @Registros VALUES (1091, 61, 7, 3, CAST(N'2020-11-23' AS Date), CAST(11299.5300000000 AS Decimal(18, 10)), 181, 5, 6, N'4011209000', 5, 20355792, CAST(3900.5400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 181)
    INSERT @Registros VALUES (1092, 10, 7, 3, CAST(N'2020-11-23' AS Date), CAST(6302.7700000000 AS Decimal(18, 10)), 52, 3, 4, N'4011209000', 5, 20446944, CAST(1053.2300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 52)
    INSERT @Registros VALUES (1093, 40, 10, 2, CAST(N'2020-11-24' AS Date), CAST(73638.3800000000 AS Decimal(18, 10)), 502, 5, 6, N'4011209000', 5, 20021046, CAST(30920.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 502)
    INSERT @Registros VALUES (1094, 42, 7, 3, CAST(N'2020-11-24' AS Date), CAST(39709.9700000000 AS Decimal(18, 10)), 340, 8, 6, N'4011209000', 5, 20029316, CAST(15998.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 340)
    INSERT @Registros VALUES (1095, 44, 7, 3, CAST(N'2020-11-24' AS Date), CAST(56307.9700000000 AS Decimal(18, 10)), 264, 3, 4, N'4011209000', 5, 20055096, CAST(13942.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 264)
    INSERT @Registros VALUES (1096, 45, 7, 3, CAST(N'2020-11-24' AS Date), CAST(51315.5200000000 AS Decimal(18, 10)), 288, 20, 20, N'4011209000', 5, 20336539, CAST(18219.6400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 288)
    INSERT @Registros VALUES (1097, 44, 7, 3, CAST(N'2020-11-25' AS Date), CAST(33409.0800000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 20397908, CAST(14095.1800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1098, 22, 7, 3, CAST(N'2020-11-26' AS Date), CAST(52596.7100000000 AS Decimal(18, 10)), 524, 5, 6, N'4011209000', 5, 20021477, CAST(26105.5500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 524)
    INSERT @Registros VALUES (1099, 23, 7, 3, CAST(N'2020-11-26' AS Date), CAST(42279.4300000000 AS Decimal(18, 10)), 528, 5, 6, N'4011209000', 5, 20167186, CAST(15325.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 528)
    INSERT @Registros VALUES (1100, 44, 7, 3, CAST(N'2020-11-26' AS Date), CAST(34398.2400000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 20427319, CAST(13599.9700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1101, 23, 7, 3, CAST(N'2020-11-26' AS Date), CAST(31322.2400000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 5, 20466830, CAST(13361.9700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 254)
    INSERT @Registros VALUES (1102, 23, 7, 3, CAST(N'2020-11-26' AS Date), CAST(31322.2400000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 5, 20466830, CAST(13361.9700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 254)
    INSERT @Registros VALUES (1103, 51, 7, 3, CAST(N'2020-11-26' AS Date), CAST(28672.1800000000 AS Decimal(18, 10)), 202, 5, 6, N'4011209000', 5, 20606768, CAST(13099.1200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 202)
    INSERT @Registros VALUES (1104, 57, 12, 8, CAST(N'2020-11-26' AS Date), CAST(27185.4700000000 AS Decimal(18, 10)), 482, 5, 6, N'4011209000', 5, 20986922, CAST(14343.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 482)
    INSERT @Registros VALUES (1105, 42, 7, 3, CAST(N'2020-11-27' AS Date), CAST(48737.1200000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 5, 20338998, CAST(13545.2700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 220)
    INSERT @Registros VALUES (1106, 44, 7, 3, CAST(N'2020-11-27' AS Date), CAST(39241.8300000000 AS Decimal(18, 10)), 277, 3, 4, N'4011209000', 5, 20500249, CAST(7736.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 277)
    INSERT @Registros VALUES (1107, 61, 7, 3, CAST(N'2020-11-27' AS Date), CAST(32587.9200000000 AS Decimal(18, 10)), 278, 5, 6, N'4011209000', 5, 20732608, CAST(14056.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 278)
    INSERT @Registros VALUES (1108, 4, 7, 3, CAST(N'2020-11-30' AS Date), CAST(14476.4900000000 AS Decimal(18, 10)), 112, 5, 6, N'4011209000', 5, 20052218, CAST(5706.9800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 112)
    INSERT @Registros VALUES (1109, 47, 7, 3, CAST(N'2020-11-30' AS Date), CAST(31715.3000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 20098412, CAST(14720.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1110, 45, 7, 3, CAST(N'2020-11-30' AS Date), CAST(59787.6000000000 AS Decimal(18, 10)), 514, 5, 6, N'4011209000', 5, 20157860, CAST(28552.9000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 514)
    INSERT @Registros VALUES (1111, 45, 7, 3, CAST(N'2020-11-30' AS Date), CAST(69170.0000000000 AS Decimal(18, 10)), 544, 20, 20, N'4011209000', 5, 20370993, CAST(27880.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 544)
    INSERT @Registros VALUES (1112, 23, 7, 3, CAST(N'2020-11-30' AS Date), CAST(32189.9500000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 20834182, CAST(15160.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 266)
    INSERT @Registros VALUES (1113, 51, 7, 3, CAST(N'2020-12-01' AS Date), CAST(1885.0900000000 AS Decimal(18, 10)), 16, 5, 6, N'4011209000', 5, 20473017, CAST(747.0800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 16)
    INSERT @Registros VALUES (1114, 51, 7, 3, CAST(N'2020-12-01' AS Date), CAST(3214.0900000000 AS Decimal(18, 10)), 36, 5, 6, N'4011209000', 5, 20473017, CAST(1265.8000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 36)
    INSERT @Registros VALUES (1115, 42, 7, 3, CAST(N'2020-12-01' AS Date), CAST(16495.8600000000 AS Decimal(18, 10)), 156, 16, 17, N'4011209000', 5, 20493736, CAST(3393.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 156)
    INSERT @Registros VALUES (1116, 41, 7, 3, CAST(N'2020-12-01' AS Date), CAST(7592.3700000000 AS Decimal(18, 10)), 40, 5, 18, N'4011209000', 5, 20826887, CAST(2051.3000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 40)
    INSERT @Registros VALUES (1117, 45, 7, 3, CAST(N'2020-12-02' AS Date), CAST(3795.3600000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 5, 20726328, CAST(743.8000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 30)
    INSERT @Registros VALUES (1118, 45, 7, 3, CAST(N'2020-12-02' AS Date), CAST(9973.4000000000 AS Decimal(18, 10)), 134, 3, 4, N'4011209000', 5, 20726328, CAST(1954.5500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 134)
    INSERT @Registros VALUES (1119, 45, 7, 3, CAST(N'2020-12-02' AS Date), CAST(4303.2600000000 AS Decimal(18, 10)), 46, 3, 4, N'4011209000', 5, 20726328, CAST(843.3400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 46)
    INSERT @Registros VALUES (1120, 47, 7, 3, CAST(N'2020-12-07' AS Date), CAST(13057.9600000000 AS Decimal(18, 10)), 183, 3, 4, N'4011209000', 5, 20162782, CAST(3074.4300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 183)
    INSERT @Registros VALUES (1121, 40, 10, 2, CAST(N'2020-12-07' AS Date), CAST(31124.9200000000 AS Decimal(18, 10)), 944, 5, 6, N'4011209000', 5, 20311416, CAST(12874.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 944)
    INSERT @Registros VALUES (1122, 40, 10, 2, CAST(N'2020-12-07' AS Date), CAST(31362.2600000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 20311416, CAST(13886.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1123, 23, 7, 3, CAST(N'2020-12-07' AS Date), CAST(47284.3100000000 AS Decimal(18, 10)), 225, 3, 4, N'4011209000', 5, 20354403, CAST(12826.9400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 225)
    INSERT @Registros VALUES (1124, 47, 7, 3, CAST(N'2020-12-07' AS Date), CAST(3483.2100000000 AS Decimal(18, 10)), 40, 3, 4, N'4011209000', 5, 20416897, CAST(762.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 40)
    INSERT @Registros VALUES (1125, 47, 7, 3, CAST(N'2020-12-07' AS Date), CAST(18221.4600000000 AS Decimal(18, 10)), 241, 3, 4, N'4011209000', 5, 20416897, CAST(4002.9600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 241)
    INSERT @Registros VALUES (1126, 42, 7, 3, CAST(N'2020-12-08' AS Date), CAST(49209.1200000000 AS Decimal(18, 10)), 240, 3, 4, N'4011209000', 5, 20459547, CAST(13412.9100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 240)
    INSERT @Registros VALUES (1127, 61, 7, 3, CAST(N'2020-12-08' AS Date), CAST(7072.8900000000 AS Decimal(18, 10)), 93, 5, 6, N'4011209000', 5, 20744653, CAST(2402.3900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 93)
    INSERT @Registros VALUES (1128, 45, 7, 3, CAST(N'2020-12-08' AS Date), CAST(4991.1800000000 AS Decimal(18, 10)), 77, 16, 17, N'4011209000', 5, 20953586, CAST(956.4400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 77)
    INSERT @Registros VALUES (1129, 22, 7, 3, CAST(N'2020-12-09' AS Date), CAST(52892.2300000000 AS Decimal(18, 10)), 504, 5, 6, N'4011209000', 5, 20119201, CAST(27111.0100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 504)
    INSERT @Registros VALUES (1130, 24, 12, 8, CAST(N'2020-12-09' AS Date), CAST(33275.0000000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 20219216, CAST(14460.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 264)
    INSERT @Registros VALUES (1131, 8, 7, 3, CAST(N'2020-12-09' AS Date), CAST(12115.9100000000 AS Decimal(18, 10)), 67, 5, 6, N'4011209000', 5, 20529563, CAST(4085.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 67)
    INSERT @Registros VALUES (1132, 51, 7, 3, CAST(N'2020-12-09' AS Date), CAST(46219.9700000000 AS Decimal(18, 10)), 412, 5, 6, N'4011209000', 5, 20906437, CAST(22901.6100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 412)
    INSERT @Registros VALUES (1133, 51, 7, 3, CAST(N'2020-12-10' AS Date), CAST(17813.8600000000 AS Decimal(18, 10)), 159, 5, 6, N'4011209000', 5, 20140631, CAST(8476.4700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 159)
    INSERT @Registros VALUES (1134, 45, 7, 3, CAST(N'2020-12-10' AS Date), CAST(10434.4900000000 AS Decimal(18, 10)), 76, 20, 20, N'4011209000', 5, 20414102, CAST(4177.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 76)
    INSERT @Registros VALUES (1135, 47, 7, 3, CAST(N'2020-12-10' AS Date), CAST(19753.0300000000 AS Decimal(18, 10)), 117, 3, 4, N'4011209000', 5, 20976596, CAST(4487.3500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 117)
    INSERT @Registros VALUES (1136, 51, 7, 3, CAST(N'2020-12-11' AS Date), CAST(45009.9100000000 AS Decimal(18, 10)), 364, 5, 6, N'4011209000', 5, 20095691, CAST(19399.9800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 364)
    INSERT @Registros VALUES (1137, 6, 7, 3, CAST(N'2020-12-11' AS Date), CAST(30452.0000000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 5, 20976143, CAST(13771.4400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 248)
    INSERT @Registros VALUES (1138, 30, 7, 3, CAST(N'2020-12-14' AS Date), CAST(5422.8100000000 AS Decimal(18, 10)), 26, 20, 13, N'4011209000', 5, 20423000, CAST(1600.8400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 26)
    INSERT @Registros VALUES (1139, 30, 7, 3, CAST(N'2020-12-14' AS Date), CAST(321.7200000000 AS Decimal(18, 10)), 1, 10, 13, N'4011209000', 5, 20423000, CAST(72.1100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 1)
    INSERT @Registros VALUES (1140, 30, 7, 3, CAST(N'2020-12-14' AS Date), CAST(965.1700000000 AS Decimal(18, 10)), 3, 10, 13, N'4011209000', 5, 20423000, CAST(216.3400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 3)
    INSERT @Registros VALUES (1141, 30, 7, 3, CAST(N'2020-12-14' AS Date), CAST(3828.2300000000 AS Decimal(18, 10)), 18, 1, 13, N'4011209000', 5, 20423000, CAST(748.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 18)
    INSERT @Registros VALUES (1142, 47, 7, 3, CAST(N'2020-12-14' AS Date), CAST(5416.5000000000 AS Decimal(18, 10)), 70, 3, 4, N'4011209000', 5, 20740913, CAST(1299.2800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 70)
    INSERT @Registros VALUES (1143, 45, 7, 3, CAST(N'2020-12-14' AS Date), CAST(20128.3000000000 AS Decimal(18, 10)), 101, 3, 4, N'4011209000', 5, 20995211, CAST(4077.5300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 101)
    INSERT @Registros VALUES (1144, 45, 7, 3, CAST(N'2020-12-14' AS Date), CAST(11224.2500000000 AS Decimal(18, 10)), 124, 3, 4, N'4011209000', 5, 20995211, CAST(2277.0500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 124)
    INSERT @Registros VALUES (1145, 45, 7, 3, CAST(N'2020-12-14' AS Date), CAST(14040.7900000000 AS Decimal(18, 10)), 181, 3, 4, N'4011209000', 5, 20995211, CAST(2848.4500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 181)
    INSERT @Registros VALUES (1146, 42, 7, 3, CAST(N'2020-12-15' AS Date), CAST(27850.4800000000 AS Decimal(18, 10)), 134, 2, 2, N'4011209000', 5, 20930419, CAST(7614.7700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 134)
    INSERT @Registros VALUES (1147, 42, 7, 3, CAST(N'2020-12-15' AS Date), CAST(22025.0700000000 AS Decimal(18, 10)), 240, 16, 17, N'4011209000', 5, 20996454, CAST(4706.1000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 240)
    INSERT @Registros VALUES (1148, 30, 7, 3, CAST(N'2020-12-16' AS Date), CAST(3361.8400000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 20624507, CAST(653.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 50)
    INSERT @Registros VALUES (1149, 24, 12, 8, CAST(N'2020-12-17' AS Date), CAST(34417.0000000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 20575821, CAST(14920.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 264)
    INSERT @Registros VALUES (1150, 47, 7, 3, CAST(N'2020-12-17' AS Date), CAST(31191.7000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 20782252, CAST(14720.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1151, 45, 7, 3, CAST(N'2020-12-21' AS Date), CAST(17667.3200000000 AS Decimal(18, 10)), 64, 3, 4, N'4011209000', 5, 20542085, CAST(3515.3600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 64)
    INSERT @Registros VALUES (1152, 42, 7, 3, CAST(N'2020-12-23' AS Date), CAST(11885.8200000000 AS Decimal(18, 10)), 82, 2, 2, N'4011209000', 5, 20605149, CAST(3310.8900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 82)
    INSERT @Registros VALUES (1153, 14, 4, 2, CAST(N'2020-12-23' AS Date), CAST(26590.4600000000 AS Decimal(18, 10)), 305, 5, 6, N'4011209000', 5, 20914927, CAST(14520.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 305)
    INSERT @Registros VALUES (1154, 23, 7, 3, CAST(N'2020-12-24' AS Date), CAST(31582.4400000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 20610244, CAST(13817.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1155, 61, 7, 3, CAST(N'2020-12-28' AS Date), CAST(30414.5000000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 20074193, CAST(10993.6800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 280)
    INSERT @Registros VALUES (1156, 2, 12, 8, CAST(N'2020-12-28' AS Date), CAST(11710.9600000000 AS Decimal(18, 10)), 79, 5, 25, N'4011209000', 5, 20142752, CAST(3954.7800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 79)
    INSERT @Registros VALUES (1157, 57, 12, 8, CAST(N'2020-12-28' AS Date), CAST(27083.8000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 20308395, CAST(14500.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1158, 2, 12, 8, CAST(N'2020-12-28' AS Date), CAST(93942.2400000000 AS Decimal(18, 10)), 812, 5, 6, N'4011209000', 5, 20309813, CAST(45120.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 812)
    INSERT @Registros VALUES (1159, 64, 7, 3, CAST(N'2020-12-28' AS Date), CAST(32398.8100000000 AS Decimal(18, 10)), 247, 5, 6, N'4011209000', 5, 20681640, CAST(12192.8700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 247)
    INSERT @Registros VALUES (1160, 30, 7, 3, CAST(N'2020-12-28' AS Date), CAST(53535.9900000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 5, 20881859, CAST(13917.3500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1161, 9, 9, 5, CAST(N'2020-12-28' AS Date), CAST(76995.8300000000 AS Decimal(18, 10)), 530, 5, 6, N'4011209000', 5, 20937803, CAST(30829.9900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 530)
    INSERT @Registros VALUES (1162, 45, 7, 3, CAST(N'2020-12-28' AS Date), CAST(7636.2700000000 AS Decimal(18, 10)), 37, 3, 4, N'4011209000', 5, 20990719, CAST(1511.4500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 37)
    INSERT @Registros VALUES (1163, 45, 7, 3, CAST(N'2020-12-28' AS Date), CAST(9346.8300000000 AS Decimal(18, 10)), 108, 3, 4, N'4011209000', 5, 20990719, CAST(1850.0200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 108)
    INSERT @Registros VALUES (1164, 30, 7, 3, CAST(N'2020-12-28' AS Date), CAST(22234.0900000000 AS Decimal(18, 10)), 90, 3, 4, N'4011209000', 5, 20995308, CAST(4645.6900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 90)
    INSERT @Registros VALUES (1165, 30, 7, 3, CAST(N'2020-12-28' AS Date), CAST(363.8400000000 AS Decimal(18, 10)), 5, 3, 4, N'4011209000', 5, 20995308, CAST(76.6400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 5)
    INSERT @Registros VALUES (1166, 45, 7, 3, CAST(N'2020-12-29' AS Date), CAST(108212.0000000000 AS Decimal(18, 10)), 780, 20, 20, N'4011209000', 5, 20757423, CAST(42288.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 780)
    INSERT @Registros VALUES (1167, 8, 7, 3, CAST(N'2021-01-04' AS Date), CAST(21358.5600000000 AS Decimal(18, 10)), 178, 5, 6, N'4011209000', 5, 197793, CAST(7615.9000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 178)
    INSERT @Registros VALUES (1168, 51, 7, 3, CAST(N'2021-01-04' AS Date), CAST(29121.2400000000 AS Decimal(18, 10)), 222, 5, 6, N'4011209000', 5, 758145, CAST(12614.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 222)
    INSERT @Registros VALUES (1169, 61, 7, 3, CAST(N'2021-01-05' AS Date), CAST(33165.6400000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 966701, CAST(14368.1800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1170, 51, 7, 3, CAST(N'2021-01-07' AS Date), CAST(45128.0000000000 AS Decimal(18, 10)), 432, 5, 6, N'4011209000', 5, 617266, CAST(21855.8100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 432)
    INSERT @Registros VALUES (1171, 8, 7, 3, CAST(N'2021-01-07' AS Date), CAST(40771.0200000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 918386, CAST(15079.7500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1172, 51, 7, 3, CAST(N'2021-01-08' AS Date), CAST(10849.7300000000 AS Decimal(18, 10)), 93, 5, 6, N'4011209000', 5, 144712, CAST(4297.6700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 93)
    INSERT @Registros VALUES (1173, 51, 7, 3, CAST(N'2021-01-08' AS Date), CAST(14626.2500000000 AS Decimal(18, 10)), 122, 5, 6, N'4011209000', 5, 144712, CAST(6435.5800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 122)
    INSERT @Registros VALUES (1174, 51, 7, 3, CAST(N'2021-01-08' AS Date), CAST(9882.6600000000 AS Decimal(18, 10)), 100, 5, 6, N'4011209000', 5, 144712, CAST(4262.5100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1175, 51, 7, 3, CAST(N'2021-01-08' AS Date), CAST(25418.1700000000 AS Decimal(18, 10)), 215, 5, 6, N'4011209000', 5, 144712, CAST(12446.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 215)
    INSERT @Registros VALUES (1176, 51, 7, 3, CAST(N'2021-01-08' AS Date), CAST(17318.8000000000 AS Decimal(18, 10)), 148, 5, 6, N'4011209000', 5, 221315, CAST(7938.2700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 148)
    INSERT @Registros VALUES (1177, 51, 7, 3, CAST(N'2021-01-08' AS Date), CAST(16358.2000000000 AS Decimal(18, 10)), 130, 5, 6, N'4011209000', 5, 221315, CAST(6858.9000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 130)
    INSERT @Registros VALUES (1178, 51, 7, 3, CAST(N'2021-01-08' AS Date), CAST(18321.2800000000 AS Decimal(18, 10)), 100, 5, 6, N'4011209000', 5, 221315, CAST(7734.6600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1179, 51, 7, 3, CAST(N'2021-01-08' AS Date), CAST(7790.1900000000 AS Decimal(18, 10)), 54, 5, 6, N'4011209000', 5, 221315, CAST(3325.9800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 54)
    INSERT @Registros VALUES (1180, 25, 7, 3, CAST(N'2021-01-08' AS Date), CAST(477.3600000000 AS Decimal(18, 10)), 8, 5, 6, N'4011209000', 5, 293597, CAST(336.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 8)
    INSERT @Registros VALUES (1181, 25, 7, 3, CAST(N'2021-01-08' AS Date), CAST(31021.8800000000 AS Decimal(18, 10)), 290, 5, 6, N'4011209000', 5, 293597, CAST(14664.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 290)
    INSERT @Registros VALUES (1182, 37, 8, 4, CAST(N'2021-01-08' AS Date), CAST(50513.3500000000 AS Decimal(18, 10)), 247, 5, 6, N'4011209000', 5, 598563, CAST(15140.0800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 247)
    INSERT @Registros VALUES (1183, 2, 12, 8, CAST(N'2021-01-08' AS Date), CAST(38791.8900000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 930094, CAST(16716.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 280)
    INSERT @Registros VALUES (1184, 47, 7, 3, CAST(N'2021-01-11' AS Date), CAST(30215.3700000000 AS Decimal(18, 10)), 193, 3, 4, N'4011209000', 5, 33552, CAST(7262.2800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 193)
    INSERT @Registros VALUES (1185, 47, 7, 3, CAST(N'2021-01-11' AS Date), CAST(3875.8200000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 33552, CAST(896.9400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 50)
    INSERT @Registros VALUES (1186, 45, 7, 3, CAST(N'2021-01-11' AS Date), CAST(16822.7400000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 5, 432811, CAST(3508.7400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 60)
    INSERT @Registros VALUES (1187, 45, 7, 3, CAST(N'2021-01-11' AS Date), CAST(8155.1600000000 AS Decimal(18, 10)), 122, 3, 4, N'4011209000', 5, 432811, CAST(1700.9300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 122)
    INSERT @Registros VALUES (1188, 45, 7, 3, CAST(N'2021-01-11' AS Date), CAST(3568.1700000000 AS Decimal(18, 10)), 53, 3, 4, N'4011209000', 5, 432811, CAST(744.2200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 53)
    INSERT @Registros VALUES (1189, 14, 4, 2, CAST(N'2021-01-11' AS Date), CAST(26816.6000000000 AS Decimal(18, 10)), 267, 5, 6, N'4011209000', 5, 560370, CAST(14400.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 267)
    INSERT @Registros VALUES (1190, 7, 12, 8, CAST(N'2021-01-11' AS Date), CAST(67659.4000000000 AS Decimal(18, 10)), 940, 3, 4, N'4011209000', 5, 724599, CAST(11665.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 940)
    INSERT @Registros VALUES (1191, 15, 7, 3, CAST(N'2021-01-11' AS Date), CAST(17353.8000000000 AS Decimal(18, 10)), 84, 3, 4, N'4011209000', 5, 851720, CAST(4790.8700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 84)
    INSERT @Registros VALUES (1192, 24, 12, 8, CAST(N'2021-01-12' AS Date), CAST(33899.0600000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 73514, CAST(14776.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 264)
    INSERT @Registros VALUES (1193, 27, 7, 3, CAST(N'2021-01-12' AS Date), CAST(3072.7800000000 AS Decimal(18, 10)), 34, 3, 4, N'4011209000', 5, 522849, CAST(580.7600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 34)
    INSERT @Registros VALUES (1194, 44, 7, 3, CAST(N'2021-01-12' AS Date), CAST(41120.0400000000 AS Decimal(18, 10)), 418, 5, 6, N'4011209000', 5, 757457, CAST(14014.5800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 418)
    INSERT @Registros VALUES (1195, 23, 7, 3, CAST(N'2021-01-12' AS Date), CAST(34140.0900000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 947647, CAST(14343.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1196, 45, 7, 3, CAST(N'2021-01-12' AS Date), CAST(10826.8100000000 AS Decimal(18, 10)), 120, 14, 15, N'4011209000', 5, 995695, CAST(2127.0900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 120)
    INSERT @Registros VALUES (1197, 47, 7, 3, CAST(N'2021-01-13' AS Date), CAST(10414.1000000000 AS Decimal(18, 10)), 140, 3, 4, N'4011209000', 5, 544602, CAST(2150.5800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 140)
    INSERT @Registros VALUES (1198, 47, 7, 3, CAST(N'2021-01-13' AS Date), CAST(1498.6100000000 AS Decimal(18, 10)), 21, 3, 4, N'4011209000', 5, 544602, CAST(292.9200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 21)
    INSERT @Registros VALUES (1199, 47, 7, 3, CAST(N'2021-01-13' AS Date), CAST(15644.9700000000 AS Decimal(18, 10)), 230, 3, 4, N'4011209000', 5, 544602, CAST(3794.4700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 230)
    INSERT @Registros VALUES (1200, 23, 7, 3, CAST(N'2021-01-14' AS Date), CAST(30675.9600000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 5, 161456, CAST(12098.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 252)
    INSERT @Registros VALUES (1201, 23, 7, 3, CAST(N'2021-01-14' AS Date), CAST(47380.3200000000 AS Decimal(18, 10)), 227, 3, 4, N'4011209000', 5, 306613, CAST(13101.7600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 227)
    INSERT @Registros VALUES (1202, 30, 7, 3, CAST(N'2021-01-14' AS Date), CAST(50258.7000000000 AS Decimal(18, 10)), 200, 3, 4, N'4011209000', 5, 714017, CAST(12161.6900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 200)
    INSERT @Registros VALUES (1203, 23, 7, 3, CAST(N'2021-01-14' AS Date), CAST(40638.1500000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 5, 868965, CAST(15392.3200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 254)
    INSERT @Registros VALUES (1204, 45, 7, 3, CAST(N'2021-01-15' AS Date), CAST(65805.1900000000 AS Decimal(18, 10)), 603, 5, 6, N'4011209000', 5, 27478, CAST(30640.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 603)
    INSERT @Registros VALUES (1205, 47, 7, 3, CAST(N'2021-01-18' AS Date), CAST(4008.0000000000 AS Decimal(18, 10)), 53, 3, 4, N'4011209000', 5, 458876, CAST(942.7400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 53)
    INSERT @Registros VALUES (1206, 64, 7, 3, CAST(N'2021-01-18' AS Date), CAST(29385.8000000000 AS Decimal(18, 10)), 220, 5, 6, N'4011209000', 5, 512732, CAST(10692.6500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 220)
    INSERT @Registros VALUES (1207, 47, 7, 3, CAST(N'2021-01-19' AS Date), CAST(64781.2100000000 AS Decimal(18, 10)), 500, 5, 6, N'4011209000', 5, 249426, CAST(30000.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 500)
    INSERT @Registros VALUES (1208, 61, 7, 3, CAST(N'2021-01-19' AS Date), CAST(32888.1100000000 AS Decimal(18, 10)), 257, 5, 6, N'4011209000', 5, 360354, CAST(14870.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 257)
    INSERT @Registros VALUES (1209, 30, 7, 3, CAST(N'2021-01-19' AS Date), CAST(45341.9200000000 AS Decimal(18, 10)), 238, 3, 4, N'4011209000', 5, 483845, CAST(12570.9300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 238)
    INSERT @Registros VALUES (1210, 20, 7, 3, CAST(N'2021-01-19' AS Date), CAST(30638.7700000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 556224, CAST(13781.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1211, 12, 1, 2, CAST(N'2021-01-19' AS Date), CAST(24623.7500000000 AS Decimal(18, 10)), 216, 5, 6, N'4011209000', 5, 614253, CAST(12543.6000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 216)
    INSERT @Registros VALUES (1212, 57, 12, 8, CAST(N'2021-01-19' AS Date), CAST(28090.5400000000 AS Decimal(18, 10)), 314, 5, 6, N'4011209000', 5, 892688, CAST(15427.3000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 314)
    INSERT @Registros VALUES (1213, 45, 7, 3, CAST(N'2021-01-20' AS Date), CAST(5838.9600000000 AS Decimal(18, 10)), 86, 16, 17, N'4011209000', 5, 380876, CAST(1080.6200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 86)
    INSERT @Registros VALUES (1214, 44, 7, 3, CAST(N'2021-01-21' AS Date), CAST(56954.5600000000 AS Decimal(18, 10)), 311, 3, 4, N'4011209000', 5, 468720, CAST(11410.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 311)
    INSERT @Registros VALUES (1215, 61, 7, 3, CAST(N'2021-01-22' AS Date), CAST(33110.1100000000 AS Decimal(18, 10)), 270, 5, 6, N'4011209000', 5, 89354, CAST(14800.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 270)
    INSERT @Registros VALUES (1216, 20, 7, 3, CAST(N'2021-01-22' AS Date), CAST(29106.1000000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 421701, CAST(13135.3500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 260)
    INSERT @Registros VALUES (1217, 42, 7, 3, CAST(N'2021-01-22' AS Date), CAST(63405.8000000000 AS Decimal(18, 10)), 285, 2, 2, N'4011209000', 5, 685545, CAST(17254.0300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 285)
    INSERT @Registros VALUES (1218, 26, 7, 3, CAST(N'2021-01-25' AS Date), CAST(33752.0400000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 96382, CAST(14500.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1219, 51, 7, 3, CAST(N'2021-01-25' AS Date), CAST(43949.3400000000 AS Decimal(18, 10)), 372, 5, 6, N'4011209000', 5, 157697, CAST(22103.0400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 372)
    INSERT @Registros VALUES (1220, 8, 7, 3, CAST(N'2021-01-25' AS Date), CAST(39630.6600000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 608993, CAST(14721.1000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1221, 44, 7, 3, CAST(N'2021-01-26' AS Date), CAST(70507.4500000000 AS Decimal(18, 10)), 521, 5, 6, N'4011209000', 5, 120938, CAST(27721.5400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 521)
    INSERT @Registros VALUES (1222, 45, 7, 3, CAST(N'2021-01-26' AS Date), CAST(19291.3000000000 AS Decimal(18, 10)), 103, 3, 4, N'4011209000', 5, 804278, CAST(3962.7200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 103)
    INSERT @Registros VALUES (1223, 45, 7, 3, CAST(N'2021-01-26' AS Date), CAST(2594.2400000000 AS Decimal(18, 10)), 28, 3, 4, N'4011209000', 5, 804278, CAST(532.8900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 28)
    INSERT @Registros VALUES (1224, 45, 7, 3, CAST(N'2021-01-26' AS Date), CAST(18255.7700000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 5, 804278, CAST(3750.0100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 220)
    INSERT @Registros VALUES (1225, 12, 1, 2, CAST(N'2021-01-27' AS Date), CAST(24993.5100000000 AS Decimal(18, 10)), 222, 5, 6, N'4011209000', 5, 161409, CAST(12268.1300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 222)
    INSERT @Registros VALUES (1226, 42, 7, 3, CAST(N'2021-01-27' AS Date), CAST(49735.0200000000 AS Decimal(18, 10)), 260, 3, 4, N'4011209000', 5, 444935, CAST(13653.2800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 260)
    INSERT @Registros VALUES (1227, 42, 7, 3, CAST(N'2021-01-27' AS Date), CAST(50696.1200000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 5, 523284, CAST(13818.4300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 220)
    INSERT @Registros VALUES (1228, 61, 7, 3, CAST(N'2021-01-28' AS Date), CAST(39951.2900000000 AS Decimal(18, 10)), 265, 5, 6, N'4011209000', 5, 842428, CAST(15158.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 265)
    INSERT @Registros VALUES (1229, 23, 7, 3, CAST(N'2021-02-02' AS Date), CAST(32118.9500000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 198104, CAST(13817.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1230, 24, 12, 8, CAST(N'2021-02-02' AS Date), CAST(36680.0000000000 AS Decimal(18, 10)), 265, 5, 6, N'4011209000', 5, 765669, CAST(14740.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 265)
    INSERT @Registros VALUES (1231, 7, 12, 8, CAST(N'2021-02-03' AS Date), CAST(7197.8000000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 12143, CAST(1241.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1232, 7, 12, 8, CAST(N'2021-02-03' AS Date), CAST(60461.5900000000 AS Decimal(18, 10)), 840, 3, 4, N'4011209000', 5, 12143, CAST(10424.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 840)
    INSERT @Registros VALUES (1233, 6, 7, 3, CAST(N'2021-02-04' AS Date), CAST(50549.7800000000 AS Decimal(18, 10)), 400, 5, 6, N'4011209000', 5, 150541, CAST(22771.1000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 400)
    INSERT @Registros VALUES (1234, 26, 7, 3, CAST(N'2021-02-04' AS Date), CAST(36351.3000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 160182, CAST(15044.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1235, 42, 7, 3, CAST(N'2021-02-04' AS Date), CAST(50526.1200000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 5, 335311, CAST(13924.8000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 220)
    INSERT @Registros VALUES (1236, 26, 7, 3, CAST(N'2021-02-04' AS Date), CAST(35141.1500000000 AS Decimal(18, 10)), 299, 5, 6, N'4011209000', 5, 803817, CAST(14706.9500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 299)
    INSERT @Registros VALUES (1237, 30, 7, 3, CAST(N'2021-02-04' AS Date), CAST(45953.4000000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 5, 814517, CAST(12691.3900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1238, 12, 1, 2, CAST(N'2021-02-04' AS Date), CAST(25969.0200000000 AS Decimal(18, 10)), 215, 5, 6, N'4011209000', 5, 991717, CAST(11736.3600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 215)
    INSERT @Registros VALUES (1239, 22, 7, 3, CAST(N'2021-02-05' AS Date), CAST(56632.0100000000 AS Decimal(18, 10)), 504, 5, 6, N'4011209000', 5, 122255, CAST(26304.3600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 504)
    INSERT @Registros VALUES (1240, 51, 7, 3, CAST(N'2021-02-05' AS Date), CAST(559.6200000000 AS Decimal(18, 10)), 4, 5, 6, N'4011209000', 5, 411382, CAST(193.1000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 4)
    INSERT @Registros VALUES (1241, 51, 7, 3, CAST(N'2021-02-05' AS Date), CAST(16994.5200000000 AS Decimal(18, 10)), 142, 5, 6, N'4011209000', 5, 411382, CAST(6185.3400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 142)
    INSERT @Registros VALUES (1242, 61, 7, 3, CAST(N'2021-02-08' AS Date), CAST(32520.7800000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 95695, CAST(14101.6000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1243, 23, 7, 3, CAST(N'2021-02-09' AS Date), CAST(16161.2300000000 AS Decimal(18, 10)), 74, 3, 4, N'4011209000', 5, 36366, CAST(4481.0900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 74)
    INSERT @Registros VALUES (1244, 27, 7, 3, CAST(N'2021-02-09' AS Date), CAST(6369.1500000000 AS Decimal(18, 10)), 78, 3, 4, N'4011209000', 5, 52007, CAST(1277.0600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 78)
    INSERT @Registros VALUES (1245, 10, 7, 3, CAST(N'2021-02-09' AS Date), CAST(10849.3600000000 AS Decimal(18, 10)), 138, 3, 4, N'4011209000', 5, 243587, CAST(2203.8700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 138)
    INSERT @Registros VALUES (1246, 23, 7, 3, CAST(N'2021-02-09' AS Date), CAST(51496.7600000000 AS Decimal(18, 10)), 221, 3, 4, N'4011209000', 5, 467364, CAST(14091.0800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 221)
    INSERT @Registros VALUES (1247, 47, 7, 3, CAST(N'2021-02-10' AS Date), CAST(27378.6800000000 AS Decimal(18, 10)), 98, 3, 4, N'4011209000', 5, 366963, CAST(6523.4400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 98)
    INSERT @Registros VALUES (1248, 47, 7, 3, CAST(N'2021-02-10' AS Date), CAST(14040.9700000000 AS Decimal(18, 10)), 142, 3, 4, N'4011209000', 5, 753761, CAST(3403.8200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 142)
    INSERT @Registros VALUES (1249, 47, 7, 3, CAST(N'2021-02-11' AS Date), CAST(9463.0000000000 AS Decimal(18, 10)), 112, 3, 4, N'4011209000', 5, 327209, CAST(2334.2400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 112)
    INSERT @Registros VALUES (1250, 30, 7, 3, CAST(N'2021-02-11' AS Date), CAST(45998.5200000000 AS Decimal(18, 10)), 220, 20, 3, N'4011209000', 5, 746936, CAST(13545.6200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 220)
    INSERT @Registros VALUES (1251, 61, 7, 3, CAST(N'2021-02-11' AS Date), CAST(34366.3300000000 AS Decimal(18, 10)), 253, 5, 6, N'4011209000', 5, 957451, CAST(14880.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 253)
    INSERT @Registros VALUES (1252, 24, 12, 8, CAST(N'2021-02-12' AS Date), CAST(35235.0000000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 591891, CAST(14246.3600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 264)
    INSERT @Registros VALUES (1253, 24, 12, 8, CAST(N'2021-02-12' AS Date), CAST(35695.0000000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 5, 591891, CAST(14433.6500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 256)
    INSERT @Registros VALUES (1254, 44, 7, 3, CAST(N'2021-02-17' AS Date), CAST(111601.4700000000 AS Decimal(18, 10)), 767, 5, 6, N'4011209000', 5, 6503, CAST(42306.7400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 767)
    INSERT @Registros VALUES (1255, 41, 7, 3, CAST(N'2021-02-17' AS Date), CAST(8620.0300000000 AS Decimal(18, 10)), 46, 5, 18, N'4011209000', 5, 76545, CAST(2108.9000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 46)
    INSERT @Registros VALUES (1256, 61, 7, 3, CAST(N'2021-02-17' AS Date), CAST(38229.6200000000 AS Decimal(18, 10)), 342, 5, 6, N'4011209000', 5, 140791, CAST(17650.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 342)
    INSERT @Registros VALUES (1257, 47, 7, 3, CAST(N'2021-02-17' AS Date), CAST(3464.3400000000 AS Decimal(18, 10)), 42, 3, 4, N'4011209000', 5, 318180, CAST(864.0200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 42)
    INSERT @Registros VALUES (1258, 12, 1, 2, CAST(N'2021-02-17' AS Date), CAST(28330.4600000000 AS Decimal(18, 10)), 232, 5, 6, N'4011209000', 5, 347777, CAST(13194.4300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 232)
    INSERT @Registros VALUES (1259, 35, 12, 8, CAST(N'2021-02-17' AS Date), CAST(15726.0900000000 AS Decimal(18, 10)), 190, 5, 6, N'4011209000', 5, 383523, CAST(9729.9900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 190)
    INSERT @Registros VALUES (1260, 12, 1, 2, CAST(N'2021-02-17' AS Date), CAST(28221.7500000000 AS Decimal(18, 10)), 231, 5, 6, N'4011209000', 5, 398863, CAST(13173.0100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 231)
    INSERT @Registros VALUES (1261, 23, 7, 3, CAST(N'2021-02-17' AS Date), CAST(35074.6100000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 448614, CAST(15320.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 266)
    INSERT @Registros VALUES (1262, 64, 7, 3, CAST(N'2021-02-17' AS Date), CAST(37423.6200000000 AS Decimal(18, 10)), 261, 5, 6, N'4011209000', 5, 526227, CAST(14942.7500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 261)
    INSERT @Registros VALUES (1263, 51, 7, 3, CAST(N'2021-02-17' AS Date), CAST(101128.2700000000 AS Decimal(18, 10)), 788, 5, 6, N'4011209000', 5, 599411, CAST(48251.8200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 788)
    INSERT @Registros VALUES (1264, 45, 7, 3, CAST(N'2021-02-17' AS Date), CAST(6205.1700000000 AS Decimal(18, 10)), 92, 16, 17, N'4011209000', 5, 653277, CAST(1192.5400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 92)
    INSERT @Registros VALUES (1265, 23, 7, 3, CAST(N'2021-02-17' AS Date), CAST(69082.0300000000 AS Decimal(18, 10)), 532, 5, 6, N'4011209000', 5, 740728, CAST(28600.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 532)
    INSERT @Registros VALUES (1266, 20, 7, 3, CAST(N'2021-02-17' AS Date), CAST(31738.7700000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 911105, CAST(13781.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1267, 61, 7, 3, CAST(N'2021-02-18' AS Date), CAST(15278.3700000000 AS Decimal(18, 10)), 224, 5, 6, N'4011209000', 5, 71036, CAST(4982.4400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 224)
    INSERT @Registros VALUES (1268, 15, 7, 3, CAST(N'2021-02-22' AS Date), CAST(11408.6000000000 AS Decimal(18, 10)), 38, 14, 15, N'4011209000', 5, 118563, CAST(1758.9800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 38)
    INSERT @Registros VALUES (1269, 30, 7, 3, CAST(N'2021-02-22' AS Date), CAST(9206.7400000000 AS Decimal(18, 10)), 35, 3, 4, N'4011209000', 5, 379804, CAST(2036.2200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 35)
    INSERT @Registros VALUES (1270, 30, 7, 3, CAST(N'2021-02-22' AS Date), CAST(3465.8900000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 606732, CAST(671.3500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 50)
    INSERT @Registros VALUES (1271, 30, 7, 3, CAST(N'2021-02-22' AS Date), CAST(59379.0800000000 AS Decimal(18, 10)), 243, 3, 4, N'4011209000', 5, 852237, CAST(14433.6300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 243)
    INSERT @Registros VALUES (1272, 44, 7, 3, CAST(N'2021-02-22' AS Date), CAST(49800.5800000000 AS Decimal(18, 10)), 218, 3, 4, N'4011209000', 5, 997703, CAST(10476.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 218)
    INSERT @Registros VALUES (1273, 61, 7, 3, CAST(N'2021-02-23' AS Date), CAST(32938.2300000000 AS Decimal(18, 10)), 258, 5, 6, N'4011209000', 5, 176825, CAST(14780.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 258)
    INSERT @Registros VALUES (1274, 45, 7, 3, CAST(N'2021-02-23' AS Date), CAST(101484.3500000000 AS Decimal(18, 10)), 762, 5, 6, N'4011209000', 5, 393298, CAST(45360.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 762)
    INSERT @Registros VALUES (1275, 37, 8, 4, CAST(N'2021-02-24' AS Date), CAST(48712.6400000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 5, 311970, CAST(14660.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 254)
    INSERT @Registros VALUES (1276, 45, 7, 3, CAST(N'2021-02-24' AS Date), CAST(18639.8500000000 AS Decimal(18, 10)), 138, 3, 4, N'4011209000', 5, 451415, CAST(3862.7300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 138)
    INSERT @Registros VALUES (1277, 45, 7, 3, CAST(N'2021-02-24' AS Date), CAST(11163.2900000000 AS Decimal(18, 10)), 147, 3, 4, N'4011209000', 5, 451415, CAST(2313.3600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 147)
    INSERT @Registros VALUES (1278, 45, 7, 3, CAST(N'2021-02-25' AS Date), CAST(1869.5800000000 AS Decimal(18, 10)), 20, 14, 15, N'4011209000', 5, 84062, CAST(351.0900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 20)
    INSERT @Registros VALUES (1279, 45, 7, 3, CAST(N'2021-02-25' AS Date), CAST(79161.7100000000 AS Decimal(18, 10)), 550, 20, 20, N'4011209000', 5, 306213, CAST(30683.9000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 550)
    INSERT @Registros VALUES (1280, 51, 7, 3, CAST(N'2021-02-25' AS Date), CAST(14984.1400000000 AS Decimal(18, 10)), 106, 5, 6, N'4011209000', 5, 356505, CAST(4926.7800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 106)
    INSERT @Registros VALUES (1281, 12, 1, 2, CAST(N'2021-02-25' AS Date), CAST(31598.5200000000 AS Decimal(18, 10)), 240, 5, 6, N'4011209000', 5, 931340, CAST(13423.7300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 240)
    INSERT @Registros VALUES (1282, 51, 7, 3, CAST(N'2021-02-26' AS Date), CAST(8684.5700000000 AS Decimal(18, 10)), 71, 5, 6, N'4011209000', 5, 204079, CAST(3420.9100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 71)
    INSERT @Registros VALUES (1283, 7, 12, 8, CAST(N'2021-02-26' AS Date), CAST(60524.1400000000 AS Decimal(18, 10)), 840, 3, 4, N'4011209000', 5, 446730, CAST(10424.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 840)
    INSERT @Registros VALUES (1284, 7, 12, 8, CAST(N'2021-02-26' AS Date), CAST(7205.2500000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 446730, CAST(1241.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1285, 6, 7, 3, CAST(N'2021-02-26' AS Date), CAST(12041.7200000000 AS Decimal(18, 10)), 100, 5, 6, N'4011209000', 5, 552258, CAST(5883.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1286, 51, 7, 3, CAST(N'2021-02-26' AS Date), CAST(29743.9500000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 5, 917267, CAST(13468.0500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 254)
    INSERT @Registros VALUES (1287, 51, 7, 3, CAST(N'2021-02-26' AS Date), CAST(32065.5900000000 AS Decimal(18, 10)), 222, 5, 6, N'4011209000', 5, 917267, CAST(14428.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 222)
    INSERT @Registros VALUES (1288, 12, 1, 2, CAST(N'2021-03-02' AS Date), CAST(20920.9100000000 AS Decimal(18, 10)), 192, 5, 6, N'4011209000', 5, 139122, CAST(8408.6900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 192)
    INSERT @Registros VALUES (1289, 47, 7, 3, CAST(N'2021-03-03' AS Date), CAST(10047.7500000000 AS Decimal(18, 10)), 131, 3, 4, N'4011209000', 5, 98044, CAST(2213.2900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 131)
    INSERT @Registros VALUES (1290, 12, 1, 2, CAST(N'2021-03-03' AS Date), CAST(34321.2100000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 418939, CAST(13987.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1291, 10, 7, 3, CAST(N'2021-03-03' AS Date), CAST(2984.6400000000 AS Decimal(18, 10)), 32, 3, 4, N'4011209000', 5, 839105, CAST(518.1000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 32)
    INSERT @Registros VALUES (1292, 23, 7, 3, CAST(N'2021-03-03' AS Date), CAST(53295.7400000000 AS Decimal(18, 10)), 228, 3, 4, N'4011209000', 5, 868396, CAST(13364.8000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 228)
    INSERT @Registros VALUES (1293, 37, 8, 4, CAST(N'2021-03-05' AS Date), CAST(39563.8200000000 AS Decimal(18, 10)), 258, 5, 6, N'4011209000', 5, 926231, CAST(14403.7200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 258)
    INSERT @Registros VALUES (1294, 45, 7, 3, CAST(N'2021-03-08' AS Date), CAST(20862.4300000000 AS Decimal(18, 10)), 97, 3, 4, N'4011209000', 5, 163240, CAST(4200.5900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 97)
    INSERT @Registros VALUES (1295, 45, 7, 3, CAST(N'2021-03-08' AS Date), CAST(7392.7900000000 AS Decimal(18, 10)), 97, 3, 4, N'4011209000', 5, 163240, CAST(1488.5200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 97)
    INSERT @Registros VALUES (1296, 45, 7, 3, CAST(N'2021-03-08' AS Date), CAST(5445.0600000000 AS Decimal(18, 10)), 56, 3, 4, N'4011209000', 5, 163240, CAST(1096.3400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 56)
    INSERT @Registros VALUES (1297, 51, 7, 3, CAST(N'2021-03-08' AS Date), CAST(20234.9400000000 AS Decimal(18, 10)), 141, 5, 6, N'4011209000', 5, 408524, CAST(7679.8900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 141)
    INSERT @Registros VALUES (1298, 26, 7, 3, CAST(N'2021-03-08' AS Date), CAST(40444.6600000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 491266, CAST(15101.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 266)
    INSERT @Registros VALUES (1299, 30, 7, 3, CAST(N'2021-03-08' AS Date), CAST(62856.3400000000 AS Decimal(18, 10)), 245, 3, 4, N'4011209000', 5, 672681, CAST(16024.7500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 245)
    INSERT @Registros VALUES (1300, 47, 7, 3, CAST(N'2021-03-09' AS Date), CAST(781.2100000000 AS Decimal(18, 10)), 11, 3, 4, N'4011209000', 5, 176760, CAST(166.5400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 11)
    INSERT @Registros VALUES (1301, 47, 7, 3, CAST(N'2021-03-09' AS Date), CAST(13087.7500000000 AS Decimal(18, 10)), 105, 3, 4, N'4011209000', 5, 176760, CAST(3144.8000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 105)
    INSERT @Registros VALUES (1302, 20, 7, 3, CAST(N'2021-03-09' AS Date), CAST(33538.7700000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 404051, CAST(13781.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1303, 28, 7, 3, CAST(N'2021-03-09' AS Date), CAST(1316.3300000000 AS Decimal(18, 10)), 6, 3, 4, N'4011209000', 5, 694341, CAST(240.0600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 6)
    INSERT @Registros VALUES (1304, 40, 10, 2, CAST(N'2021-03-10' AS Date), CAST(42084.9800000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 5, 166297, CAST(15230.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 252)
    INSERT @Registros VALUES (1305, 8, 7, 3, CAST(N'2021-03-10' AS Date), CAST(5095.2600000000 AS Decimal(18, 10)), 37, 5, 6, N'4011209000', 5, 242473, CAST(1400.1600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 37)
    INSERT @Registros VALUES (1306, 51, 7, 3, CAST(N'2021-03-10' AS Date), CAST(23623.4100000000 AS Decimal(18, 10)), 198, 5, 6, N'4011209000', 5, 420611, CAST(7986.9000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 198)
    INSERT @Registros VALUES (1307, 37, 8, 4, CAST(N'2021-03-10' AS Date), CAST(40161.5200000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 5, 527002, CAST(14841.5600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 256)
    INSERT @Registros VALUES (1308, 51, 7, 3, CAST(N'2021-03-10' AS Date), CAST(7250.0300000000 AS Decimal(18, 10)), 44, 5, 6, N'4011209000', 5, 537214, CAST(2191.2500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 44)
    INSERT @Registros VALUES (1309, 42, 7, 3, CAST(N'2021-03-10' AS Date), CAST(49686.8600000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 5, 825893, CAST(13732.3300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 220)
    INSERT @Registros VALUES (1310, 61, 7, 3, CAST(N'2021-03-11' AS Date), CAST(33283.6500000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 5, 647944, CAST(13393.2400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 256)
    INSERT @Registros VALUES (1311, 61, 7, 3, CAST(N'2021-03-11' AS Date), CAST(38189.9000000000 AS Decimal(18, 10)), 276, 5, 6, N'4011209000', 5, 724016, CAST(14311.6800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 276)
    INSERT @Registros VALUES (1312, 30, 7, 3, CAST(N'2021-03-11' AS Date), CAST(65386.9300000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 5, 957470, CAST(15749.0600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1313, 61, 7, 3, CAST(N'2021-03-12' AS Date), CAST(38820.5700000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 68301, CAST(17260.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1314, 7, 12, 8, CAST(N'2021-03-15' AS Date), CAST(7205.2500000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 144097, CAST(1241.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1315, 7, 12, 8, CAST(N'2021-03-15' AS Date), CAST(60524.1400000000 AS Decimal(18, 10)), 840, 3, 4, N'4011209000', 5, 144097, CAST(10424.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 840)
    INSERT @Registros VALUES (1316, 44, 7, 3, CAST(N'2021-03-15' AS Date), CAST(67349.5500000000 AS Decimal(18, 10)), 320, 3, 4, N'4011209000', 5, 477769, CAST(17009.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 320)
    INSERT @Registros VALUES (1317, 61, 7, 3, CAST(N'2021-03-15' AS Date), CAST(23185.7100000000 AS Decimal(18, 10)), 181, 5, 6, N'4011209000', 5, 557574, CAST(7046.3800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 181)
    INSERT @Registros VALUES (1318, 61, 7, 3, CAST(N'2021-03-15' AS Date), CAST(21525.0500000000 AS Decimal(18, 10)), 184, 5, 6, N'4011209000', 5, 716179, CAST(6280.5900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 184)
    INSERT @Registros VALUES (1319, 40, 10, 2, CAST(N'2021-03-16' AS Date), CAST(41939.5400000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 5, 593742, CAST(15200.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 252)
    INSERT @Registros VALUES (1320, 23, 7, 3, CAST(N'2021-03-16' AS Date), CAST(36456.5000000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 798696, CAST(13987.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1321, 61, 7, 3, CAST(N'2021-03-17' AS Date), CAST(38463.6100000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 702590, CAST(13931.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 260)
    INSERT @Registros VALUES (1322, 42, 7, 3, CAST(N'2021-03-18' AS Date), CAST(13485.3600000000 AS Decimal(18, 10)), 63, 2, 2, N'4011209000', 5, 497511, CAST(3525.0600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 63)
    INSERT @Registros VALUES (1323, 47, 7, 3, CAST(N'2021-03-18' AS Date), CAST(2084.7200000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 5, 820590, CAST(482.6800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 30)
    INSERT @Registros VALUES (1324, 47, 7, 3, CAST(N'2021-03-18' AS Date), CAST(6186.5100000000 AS Decimal(18, 10)), 76, 3, 4, N'4011209000', 5, 897398, CAST(1494.3800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 76)
    INSERT @Registros VALUES (1325, 44, 7, 3, CAST(N'2021-03-19' AS Date), CAST(37876.1900000000 AS Decimal(18, 10)), 182, 3, 4, N'4011209000', 5, 657032, CAST(8398.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 182)
    INSERT @Registros VALUES (1326, 44, 7, 3, CAST(N'2021-03-22' AS Date), CAST(23802.3400000000 AS Decimal(18, 10)), 124, 3, 4, N'4011209000', 5, 242000, CAST(5282.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 124)
    INSERT @Registros VALUES (1327, 8, 7, 3, CAST(N'2021-03-22' AS Date), CAST(46776.6400000000 AS Decimal(18, 10)), 273, 5, 6, N'4011209000', 5, 351341, CAST(15038.4200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 273)
    INSERT @Registros VALUES (1328, 8, 7, 3, CAST(N'2021-03-22' AS Date), CAST(2201.7500000000 AS Decimal(18, 10)), 20, 5, 6, N'4011209000', 5, 355337, CAST(606.6000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 20)
    INSERT @Registros VALUES (1329, 45, 7, 3, CAST(N'2021-03-22' AS Date), CAST(9703.2300000000 AS Decimal(18, 10)), 104, 14, 15, N'4011209000', 5, 507443, CAST(1994.8400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 104)
    INSERT @Registros VALUES (1330, 45, 7, 3, CAST(N'2021-03-22' AS Date), CAST(8427.8200000000 AS Decimal(18, 10)), 108, 14, 15, N'4011209000', 5, 507443, CAST(1732.6300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 108)
    INSERT @Registros VALUES (1331, 42, 7, 3, CAST(N'2021-03-24' AS Date), CAST(4241.5000000000 AS Decimal(18, 10)), 50, 2, 2, N'4011209000', 5, 434409, CAST(1139.5600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 50)
    INSERT @Registros VALUES (1332, 23, 7, 3, CAST(N'2021-03-24' AS Date), CAST(35641.8800000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 770677, CAST(13871.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1333, 61, 7, 3, CAST(N'2021-03-24' AS Date), CAST(39557.4400000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 797449, CAST(14679.8600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1334, 9, 9, 5, CAST(N'2021-03-24' AS Date), CAST(36690.2400000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 864800, CAST(15044.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1335, 30, 7, 3, CAST(N'2021-03-24' AS Date), CAST(16527.4400000000 AS Decimal(18, 10)), 66, 3, 4, N'4011209000', 5, 999874, CAST(3904.6200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 66)
    INSERT @Registros VALUES (1336, 45, 7, 3, CAST(N'2021-03-25' AS Date), CAST(116666.3900000000 AS Decimal(18, 10)), 924, 20, 5, N'4011209000', 5, 685009, CAST(46541.8800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 924)
    INSERT @Registros VALUES (1337, 22, 7, 3, CAST(N'2021-03-26' AS Date), CAST(32649.8200000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 599517, CAST(14106.3600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1338, 22, 7, 3, CAST(N'2021-03-26' AS Date), CAST(32388.8800000000 AS Decimal(18, 10)), 258, 5, 6, N'4011209000', 5, 599517, CAST(13991.2600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 258)
    INSERT @Registros VALUES (1339, 51, 7, 3, CAST(N'2021-03-26' AS Date), CAST(92176.0900000000 AS Decimal(18, 10)), 700, 5, 6, N'4011209000', 5, 754741, CAST(37999.9900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 700)
    INSERT @Registros VALUES (1340, 35, 12, 8, CAST(N'2021-03-26' AS Date), CAST(19169.4200000000 AS Decimal(18, 10)), 220, 5, 6, N'4011209000', 5, 769562, CAST(11622.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 220)
    INSERT @Registros VALUES (1341, 12, 1, 2, CAST(N'2021-03-29' AS Date), CAST(36011.1400000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 225417, CAST(14540.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 280)
    INSERT @Registros VALUES (1342, 12, 1, 2, CAST(N'2021-03-29' AS Date), CAST(36415.8600000000 AS Decimal(18, 10)), 242, 5, 6, N'4011209000', 5, 831705, CAST(14970.0100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 242)
    INSERT @Registros VALUES (1343, 45, 7, 3, CAST(N'2021-03-29' AS Date), CAST(12944.7600000000 AS Decimal(18, 10)), 94, 5, 6, N'4011209000', 5, 862697, CAST(4366.0800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 94)
    INSERT @Registros VALUES (1344, 7, 12, 8, CAST(N'2021-03-29' AS Date), CAST(7210.0300000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 943286, CAST(1241.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1345, 7, 12, 8, CAST(N'2021-03-29' AS Date), CAST(60564.3600000000 AS Decimal(18, 10)), 840, 3, 4, N'4011209000', 5, 943286, CAST(10424.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 840)
    INSERT @Registros VALUES (1346, 46, 7, 3, CAST(N'2021-03-30' AS Date), CAST(13726.7200000000 AS Decimal(18, 10)), 74, 5, 6, N'4011209000', 5, 709774, CAST(3708.5400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 74)
    INSERT @Registros VALUES (1347, 45, 7, 3, CAST(N'2021-03-30' AS Date), CAST(16181.2900000000 AS Decimal(18, 10)), 121, 5, 6, N'4011209000', 5, 730454, CAST(5320.7500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 121)
    INSERT @Registros VALUES (1348, 27, 7, 3, CAST(N'2021-03-30' AS Date), CAST(1316.0900000000 AS Decimal(18, 10)), 16, 3, 4, N'4011209000', 5, 830171, CAST(249.9700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 16)
    INSERT @Registros VALUES (1349, 51, 7, 3, CAST(N'2021-04-05' AS Date), CAST(29698.3000000000 AS Decimal(18, 10)), 220, 5, 6, N'4011209000', 5, 191038, CAST(12420.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 220)
    INSERT @Registros VALUES (1350, 22, 7, 3, CAST(N'2021-04-05' AS Date), CAST(34267.5000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 471125, CAST(14500.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1351, 30, 7, 3, CAST(N'2021-04-05' AS Date), CAST(24214.9300000000 AS Decimal(18, 10)), 116, 20, 13, N'4011209000', 5, 850815, CAST(7142.2300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 116)
    INSERT @Registros VALUES (1352, 23, 7, 3, CAST(N'2021-04-06' AS Date), CAST(45702.3700000000 AS Decimal(18, 10)), 228, 5, 6, N'4011209000', 5, 443353, CAST(15827.7600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 228)
    INSERT @Registros VALUES (1353, 61, 7, 3, CAST(N'2021-04-07' AS Date), CAST(37040.4800000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 66921, CAST(13781.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1354, 2, 12, 8, CAST(N'2021-04-07' AS Date), CAST(136410.7000000000 AS Decimal(18, 10)), 1086, 5, 6, N'4011209000', 5, 788456, CAST(60820.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 1086)
    INSERT @Registros VALUES (1355, 61, 7, 3, CAST(N'2021-04-07' AS Date), CAST(37842.4200000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 965053, CAST(14085.2200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1356, 30, 7, 3, CAST(N'2021-04-08' AS Date), CAST(599.0100000000 AS Decimal(18, 10)), 8, 3, 4, N'4011209000', 5, 83208, CAST(108.5400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 8)
    INSERT @Registros VALUES (1357, 30, 7, 3, CAST(N'2021-04-08' AS Date), CAST(9823.9900000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 5, 83208, CAST(1938.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 30)
    INSERT @Registros VALUES (1358, 42, 7, 3, CAST(N'2021-04-08' AS Date), CAST(49005.3200000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 5, 423421, CAST(13510.8900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 220)
    INSERT @Registros VALUES (1359, 7, 12, 8, CAST(N'2021-04-08' AS Date), CAST(5786.1200000000 AS Decimal(18, 10)), 80, 3, 4, N'4011209000', 5, 950845, CAST(992.8000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 80)
    INSERT @Registros VALUES (1360, 7, 12, 8, CAST(N'2021-04-08' AS Date), CAST(60754.1700000000 AS Decimal(18, 10)), 840, 3, 4, N'4011209000', 5, 950845, CAST(10424.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 840)
    INSERT @Registros VALUES (1361, 23, 7, 3, CAST(N'2021-04-09' AS Date), CAST(38301.5300000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 330978, CAST(14391.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1362, 45, 7, 3, CAST(N'2021-04-09' AS Date), CAST(11567.6400000000 AS Decimal(18, 10)), 54, 3, 4, N'4011209000', 5, 413660, CAST(2321.9900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 54)
    INSERT @Registros VALUES (1363, 45, 7, 3, CAST(N'2021-04-09' AS Date), CAST(6880.6400000000 AS Decimal(18, 10)), 90, 3, 4, N'4011209000', 5, 413660, CAST(1381.1600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 90)
    INSERT @Registros VALUES (1364, 45, 7, 3, CAST(N'2021-04-09' AS Date), CAST(2718.1000000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 5, 413660, CAST(545.6100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 30)
    INSERT @Registros VALUES (1365, 23, 7, 3, CAST(N'2021-04-09' AS Date), CAST(56594.0300000000 AS Decimal(18, 10)), 244, 3, 4, N'4011209000', 5, 494672, CAST(14290.7200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 244)
    INSERT @Registros VALUES (1366, 45, 7, 3, CAST(N'2021-04-12' AS Date), CAST(124205.4900000000 AS Decimal(18, 10)), 764, 20, 20, N'4011209000', 5, 159435, CAST(46381.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 764)
    INSERT @Registros VALUES (1367, 47, 7, 3, CAST(N'2021-04-12' AS Date), CAST(4793.7200000000 AS Decimal(18, 10)), 59, 3, 4, N'4011209000', 5, 643324, CAST(973.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 59)
    INSERT @Registros VALUES (1368, 51, 7, 3, CAST(N'2021-04-12' AS Date), CAST(34994.6300000000 AS Decimal(18, 10)), 214, 5, 6, N'4011209000', 5, 697667, CAST(15380.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 214)
    INSERT @Registros VALUES (1369, 42, 7, 3, CAST(N'2021-04-12' AS Date), CAST(27235.8600000000 AS Decimal(18, 10)), 122, 2, 2, N'4011209000', 5, 831444, CAST(7159.0100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 122)
    INSERT @Registros VALUES (1370, 42, 7, 3, CAST(N'2021-04-13' AS Date), CAST(46667.2200000000 AS Decimal(18, 10)), 317, 5, 6, N'4011209000', 5, 39583, CAST(15329.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 317)
    INSERT @Registros VALUES (1371, 47, 7, 3, CAST(N'2021-04-13' AS Date), CAST(961.2800000000 AS Decimal(18, 10)), 14, 3, 4, N'4011209000', 5, 378416, CAST(218.8900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 14)
    INSERT @Registros VALUES (1372, 42, 7, 3, CAST(N'2021-04-13' AS Date), CAST(46889.1300000000 AS Decimal(18, 10)), 274, 5, 6, N'4011209000', 5, 723413, CAST(15373.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 274)
    INSERT @Registros VALUES (1373, 30, 7, 3, CAST(N'2021-04-13' AS Date), CAST(5016.1000000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 5, 747536, CAST(773.2800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 12)
    INSERT @Registros VALUES (1374, 30, 7, 3, CAST(N'2021-04-13' AS Date), CAST(1327.0600000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 5, 747536, CAST(261.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 20)
    INSERT @Registros VALUES (1375, 61, 7, 3, CAST(N'2021-04-13' AS Date), CAST(38970.0300000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 5, 759750, CAST(14810.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 252)
    INSERT @Registros VALUES (1376, 23, 7, 3, CAST(N'2021-04-14' AS Date), CAST(35976.2700000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 19711, CAST(14210.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 266)
    INSERT @Registros VALUES (1377, 51, 7, 3, CAST(N'2021-04-14' AS Date), CAST(15423.8400000000 AS Decimal(18, 10)), 120, 5, 6, N'4011209000', 5, 728133, CAST(5159.6000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 120)
    INSERT @Registros VALUES (1378, 6, 7, 3, CAST(N'2021-04-14' AS Date), CAST(6333.2900000000 AS Decimal(18, 10)), 48, 5, 6, N'4011209000', 5, 906033, CAST(2665.4400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 48)
    INSERT @Registros VALUES (1379, 6, 7, 3, CAST(N'2021-04-14' AS Date), CAST(32722.1100000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 5, 906033, CAST(13771.4400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 248)
    INSERT @Registros VALUES (1380, 6, 7, 3, CAST(N'2021-04-14' AS Date), CAST(11560.0500000000 AS Decimal(18, 10)), 96, 5, 6, N'4011209000', 5, 906033, CAST(5647.6800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 96)
    INSERT @Registros VALUES (1381, 64, 7, 3, CAST(N'2021-04-14' AS Date), CAST(47797.8400000000 AS Decimal(18, 10)), 433, 5, 6, N'4011209000', 5, 979028, CAST(15799.3900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 433)
    INSERT @Registros VALUES (1382, 45, 7, 3, CAST(N'2021-04-15' AS Date), CAST(113048.8100000000 AS Decimal(18, 10)), 840, 5, 6, N'4011209000', 5, 152669, CAST(44520.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 840)
    INSERT @Registros VALUES (1383, 61, 7, 3, CAST(N'2021-04-15' AS Date), CAST(39111.6300000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 736541, CAST(14600.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 264)
    INSERT @Registros VALUES (1384, 61, 7, 3, CAST(N'2021-04-15' AS Date), CAST(11117.2900000000 AS Decimal(18, 10)), 137, 5, 6, N'4011209000', 5, 774007, CAST(3154.4900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 137)
    INSERT @Registros VALUES (1385, 8, 7, 3, CAST(N'2021-04-16' AS Date), CAST(44123.1400000000 AS Decimal(18, 10)), 228, 5, 6, N'4011209000', 5, 240840, CAST(14534.1500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 228)
    INSERT @Registros VALUES (1386, 2, 12, 8, CAST(N'2021-04-22' AS Date), CAST(31353.7100000000 AS Decimal(18, 10)), 213, 5, 6, N'4011209000', 5, 374656, CAST(13985.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 213)
    INSERT @Registros VALUES (1387, 30, 7, 3, CAST(N'2021-04-22' AS Date), CAST(51012.0400000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 5, 671209, CAST(13103.6500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1388, 61, 7, 3, CAST(N'2021-04-23' AS Date), CAST(7899.3900000000 AS Decimal(18, 10)), 79, 5, 6, N'4011209000', 5, 372288, CAST(2208.4300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 79)
    INSERT @Registros VALUES (1389, 45, 7, 3, CAST(N'2021-04-23' AS Date), CAST(107184.0600000000 AS Decimal(18, 10)), 585, 20, 20, N'4011209000', 5, 447609, CAST(38390.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 585)
    INSERT @Registros VALUES (1390, 23, 7, 3, CAST(N'2021-04-23' AS Date), CAST(35744.5900000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 779797, CAST(13987.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1391, 7, 12, 8, CAST(N'2021-04-26' AS Date), CAST(1444.4300000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 5, 188160, CAST(248.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 20)
    INSERT @Registros VALUES (1392, 7, 12, 8, CAST(N'2021-04-26' AS Date), CAST(60666.1100000000 AS Decimal(18, 10)), 840, 3, 4, N'4011209000', 5, 188160, CAST(10424.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 840)
    INSERT @Registros VALUES (1393, 7, 12, 8, CAST(N'2021-04-26' AS Date), CAST(7222.1600000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 188160, CAST(1241.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1394, 47, 7, 3, CAST(N'2021-04-27' AS Date), CAST(12860.7600000000 AS Decimal(18, 10)), 155, 3, 4, N'4011209000', 5, 266715, CAST(2561.6900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 155)
    INSERT @Registros VALUES (1395, 47, 7, 3, CAST(N'2021-04-27' AS Date), CAST(33809.0300000000 AS Decimal(18, 10)), 270, 3, 4, N'4011209000', 5, 266715, CAST(8200.0100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 270)
    INSERT @Registros VALUES (1396, 30, 7, 3, CAST(N'2021-04-27' AS Date), CAST(21939.3300000000 AS Decimal(18, 10)), 104, 20, 13, N'4011209000', 5, 926726, CAST(6403.3800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 104)
    INSERT @Registros VALUES (1397, 6, 7, 3, CAST(N'2021-04-28' AS Date), CAST(31716.6800000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 5, 714591, CAST(14763.9600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 248)
    INSERT @Registros VALUES (1398, 51, 7, 3, CAST(N'2021-04-29' AS Date), CAST(33910.2400000000 AS Decimal(18, 10)), 203, 5, 6, N'4011209000', 5, 466874, CAST(15080.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 203)
    INSERT @Registros VALUES (1399, 51, 7, 3, CAST(N'2021-04-29' AS Date), CAST(20799.2400000000 AS Decimal(18, 10)), 132, 5, 6, N'4011209000', 5, 566437, CAST(7148.7200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 132)
    INSERT @Registros VALUES (1400, 51, 7, 3, CAST(N'2021-04-29' AS Date), CAST(28535.9800000000 AS Decimal(18, 10)), 220, 5, 6, N'4011209000', 5, 778947, CAST(12520.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 220)
    INSERT @Registros VALUES (1401, 42, 7, 3, CAST(N'2021-04-30' AS Date), CAST(1632.4000000000 AS Decimal(18, 10)), 10, 2, 2, N'4011209000', 5, 459490, CAST(434.0500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 10)
    INSERT @Registros VALUES (1402, 23, 7, 3, CAST(N'2021-04-30' AS Date), CAST(34536.9300000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 973806, CAST(14300.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 266)
    INSERT @Registros VALUES (1403, 23, 7, 3, CAST(N'2021-04-30' AS Date), CAST(35194.7900000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 973806, CAST(15260.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 266)
    INSERT @Registros VALUES (1404, 61, 7, 3, CAST(N'2021-05-04' AS Date), CAST(3173.3500000000 AS Decimal(18, 10)), 39, 5, 6, N'4011209000', 5, 273318, CAST(877.6800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 39)
    INSERT @Registros VALUES (1405, 45, 7, 3, CAST(N'2021-05-04' AS Date), CAST(34411.7200000000 AS Decimal(18, 10)), 149, 3, 4, N'4011209000', 5, 590208, CAST(7466.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 149)
    INSERT @Registros VALUES (1406, 45, 7, 3, CAST(N'2021-05-04' AS Date), CAST(3910.3500000000 AS Decimal(18, 10)), 52, 3, 4, N'4011209000', 5, 590208, CAST(848.4200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 52)
    INSERT @Registros VALUES (1407, 45, 7, 3, CAST(N'2021-05-04' AS Date), CAST(2307.9800000000 AS Decimal(18, 10)), 26, 3, 4, N'4011209000', 5, 590208, CAST(500.7600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 26)
    INSERT @Registros VALUES (1408, 27, 7, 3, CAST(N'2021-05-04' AS Date), CAST(1945.6400000000 AS Decimal(18, 10)), 22, 3, 4, N'4011209000', 5, 855519, CAST(374.6700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 22)
    INSERT @Registros VALUES (1409, 45, 7, 3, CAST(N'2021-05-05' AS Date), CAST(7786.9200000000 AS Decimal(18, 10)), 120, 16, 17, N'4011209000', 5, 143891, CAST(1511.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 120)
    INSERT @Registros VALUES (1410, 30, 7, 3, CAST(N'2021-05-05' AS Date), CAST(2687.5700000000 AS Decimal(18, 10)), 40, 3, 4, N'4011209000', 5, 454320, CAST(339.5600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 40)
    INSERT @Registros VALUES (1411, 23, 7, 3, CAST(N'2021-05-05' AS Date), CAST(54210.9900000000 AS Decimal(18, 10)), 224, 3, 4, N'4011209000', 5, 964425, CAST(14748.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 224)
    INSERT @Registros VALUES (1412, 45, 7, 3, CAST(N'2021-05-06' AS Date), CAST(11051.3600000000 AS Decimal(18, 10)), 140, 3, 4, N'4011209000', 5, 201190, CAST(2208.4800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 140)
    INSERT @Registros VALUES (1413, 45, 7, 3, CAST(N'2021-05-06' AS Date), CAST(2807.6600000000 AS Decimal(18, 10)), 24, 3, 4, N'4011209000', 5, 201190, CAST(561.0800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 24)
    INSERT @Registros VALUES (1414, 45, 7, 3, CAST(N'2021-05-07' AS Date), CAST(15106.2700000000 AS Decimal(18, 10)), 178, 14, 15, N'4011209000', 5, 672262, CAST(3285.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 178)
    INSERT @Registros VALUES (1415, 12, 1, 2, CAST(N'2021-05-10' AS Date), CAST(68362.0200000000 AS Decimal(18, 10)), 534, 5, 6, N'4011209000', 5, 64145, CAST(26971.6000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 534)
    INSERT @Registros VALUES (1416, 44, 7, 3, CAST(N'2021-05-10' AS Date), CAST(31179.8900000000 AS Decimal(18, 10)), 221, 5, 6, N'4011209000', 5, 173808, CAST(9756.6200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 221)
    INSERT @Registros VALUES (1417, 23, 7, 3, CAST(N'2021-05-10' AS Date), CAST(35194.7800000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 238516, CAST(15260.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 266)
    INSERT @Registros VALUES (1418, 42, 7, 3, CAST(N'2021-05-13' AS Date), CAST(8431.4700000000 AS Decimal(18, 10)), 41, 2, 2, N'4011209000', 5, 111832, CAST(2194.3600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 41)
    INSERT @Registros VALUES (1419, 12, 1, 2, CAST(N'2021-05-14' AS Date), CAST(25184.9300000000 AS Decimal(18, 10)), 202, 5, 6, N'4011209000', 5, 463253, CAST(10728.3100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 202)
    INSERT @Registros VALUES (1420, 12, 1, 2, CAST(N'2021-05-14' AS Date), CAST(28072.4600000000 AS Decimal(18, 10)), 220, 5, 6, N'4011209000', 5, 463253, CAST(12400.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 220)
    INSERT @Registros VALUES (1421, 51, 7, 3, CAST(N'2021-05-14' AS Date), CAST(24474.5900000000 AS Decimal(18, 10)), 200, 5, 6, N'4011209000', 5, 486772, CAST(10900.9600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 200)
    INSERT @Registros VALUES (1422, 12, 1, 2, CAST(N'2021-05-18' AS Date), CAST(28089.6000000000 AS Decimal(18, 10)), 220, 5, 6, N'4011209000', 5, 85090, CAST(11569.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 220)
    INSERT @Registros VALUES (1423, 51, 7, 3, CAST(N'2021-05-18' AS Date), CAST(29028.6800000000 AS Decimal(18, 10)), 220, 5, 6, N'4011209000', 5, 481207, CAST(12450.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 220)
    INSERT @Registros VALUES (1424, 44, 7, 3, CAST(N'2021-05-19' AS Date), CAST(11357.3300000000 AS Decimal(18, 10)), 54, 3, 4, N'4011209000', 5, 299771, CAST(2373.5900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 54)
    INSERT @Registros VALUES (1425, 44, 7, 3, CAST(N'2021-05-19' AS Date), CAST(46593.4600000000 AS Decimal(18, 10)), 237, 3, 4, N'4011209000', 5, 299771, CAST(12270.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 237)
    INSERT @Registros VALUES (1426, 44, 7, 3, CAST(N'2021-05-19' AS Date), CAST(19690.2600000000 AS Decimal(18, 10)), 99, 3, 4, N'4011209000', 5, 299771, CAST(4350.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 99)
    INSERT @Registros VALUES (1427, 42, 7, 3, CAST(N'2021-05-19' AS Date), CAST(32895.3200000000 AS Decimal(18, 10)), 144, 2, 2, N'4011209000', 5, 420268, CAST(8707.9600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 144)
    INSERT @Registros VALUES (1428, 30, 7, 3, CAST(N'2021-05-19' AS Date), CAST(12329.5500000000 AS Decimal(18, 10)), 58, 3, 4, N'4011209000', 5, 894425, CAST(2784.0900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 58)
    INSERT @Registros VALUES (1429, 8, 7, 3, CAST(N'2021-05-20' AS Date), CAST(4085.6600000000 AS Decimal(18, 10)), 20, 5, 6, N'4011209000', 5, 892308, CAST(1244.6000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 20)
    INSERT @Registros VALUES (1430, 13, 5, 6, CAST(N'2021-05-21' AS Date), CAST(70793.9000000000 AS Decimal(18, 10)), 530, 5, 6, N'4011209000', 5, 431868, CAST(30490.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 530)
    INSERT @Registros VALUES (1431, 61, 7, 3, CAST(N'2021-05-21' AS Date), CAST(3245.8000000000 AS Decimal(18, 10)), 20, 5, 6, N'4011209000', 5, 739038, CAST(916.0400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 20)
    INSERT @Registros VALUES (1432, 23, 7, 3, CAST(N'2021-05-21' AS Date), CAST(36438.4000000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 877898, CAST(13987.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1433, 26, 7, 3, CAST(N'2021-05-21' AS Date), CAST(39983.7200000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 912336, CAST(14800.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 260)
    INSERT @Registros VALUES (1434, 26, 7, 3, CAST(N'2021-05-21' AS Date), CAST(41420.5400000000 AS Decimal(18, 10)), 306, 5, 6, N'4011209000', 5, 952936, CAST(14770.6000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 306)
    INSERT @Registros VALUES (1435, 45, 7, 3, CAST(N'2021-05-21' AS Date), CAST(36205.5000000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 5, 993619, CAST(14520.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 256)
    INSERT @Registros VALUES (1436, 15, 7, 3, CAST(N'2021-05-24' AS Date), CAST(6276.1600000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 5, 218073, CAST(1570.3000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 30)
    INSERT @Registros VALUES (1437, 51, 7, 3, CAST(N'2021-05-24' AS Date), CAST(23992.1400000000 AS Decimal(18, 10)), 184, 5, 6, N'4011209000', 5, 312860, CAST(10335.3400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 184)
    INSERT @Registros VALUES (1438, 45, 7, 3, CAST(N'2021-05-24' AS Date), CAST(26820.7700000000 AS Decimal(18, 10)), 314, 3, 4, N'4011209000', 5, 420530, CAST(5261.0900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 314)
    INSERT @Registros VALUES (1439, 45, 7, 3, CAST(N'2021-05-24' AS Date), CAST(12757.1900000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 420530, CAST(2502.4100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1440, 15, 7, 3, CAST(N'2021-05-24' AS Date), CAST(6701.7900000000 AS Decimal(18, 10)), 32, 3, 4, N'4011209000', 5, 541061, CAST(1851.1400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 32)
    INSERT @Registros VALUES (1441, 64, 7, 3, CAST(N'2021-05-24' AS Date), CAST(41082.6400000000 AS Decimal(18, 10)), 332, 5, 6, N'4011209000', 5, 634962, CAST(15060.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 332)
    INSERT @Registros VALUES (1442, 61, 7, 3, CAST(N'2021-05-24' AS Date), CAST(35456.9400000000 AS Decimal(18, 10)), 350, 5, 6, N'4011209000', 5, 721450, CAST(11621.6300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 350)
    INSERT @Registros VALUES (1443, 47, 7, 3, CAST(N'2021-05-25' AS Date), CAST(40950.6900000000 AS Decimal(18, 10)), 230, 3, 4, N'4011209000', 5, 910221, CAST(9769.3600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 230)
    INSERT @Registros VALUES (1444, 30, 7, 3, CAST(N'2021-05-26' AS Date), CAST(24896.1100000000 AS Decimal(18, 10)), 110, 3, 4, N'4011209000', 5, 417192, CAST(5489.1300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 110)
    INSERT @Registros VALUES (1445, 23, 7, 3, CAST(N'2021-05-26' AS Date), CAST(37738.3200000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 705509, CAST(13862.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1446, 20, 7, 3, CAST(N'2021-05-27' AS Date), CAST(33892.1700000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 86063, CAST(14700.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1447, 20, 7, 3, CAST(N'2021-05-27' AS Date), CAST(38761.4300000000 AS Decimal(18, 10)), 420, 5, 6, N'4011209000', 5, 358076, CAST(16400.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 420)
    INSERT @Registros VALUES (1448, 42, 7, 3, CAST(N'2021-05-27' AS Date), CAST(51619.5200000000 AS Decimal(18, 10)), 240, 3, 4, N'4011209000', 5, 372247, CAST(13895.5800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 240)
    INSERT @Registros VALUES (1449, 42, 7, 3, CAST(N'2021-05-27' AS Date), CAST(49829.8200000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 5, 845237, CAST(13580.9400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 220)
    INSERT @Registros VALUES (1450, 24, 12, 8, CAST(N'2021-05-28' AS Date), CAST(41661.0000000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 497346, CAST(15180.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 264)
    INSERT @Registros VALUES (1451, 22, 7, 3, CAST(N'2021-05-28' AS Date), CAST(32689.1100000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 5, 502353, CAST(14402.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 254)
    INSERT @Registros VALUES (1452, 47, 7, 3, CAST(N'2021-05-28' AS Date), CAST(17578.1000000000 AS Decimal(18, 10)), 199, 3, 4, N'4011209000', 5, 704177, CAST(4129.4600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 199)
    INSERT @Registros VALUES (1453, 12, 1, 2, CAST(N'2021-05-28' AS Date), CAST(39044.5900000000 AS Decimal(18, 10)), 205, 5, 6, N'4011209000', 5, 735098, CAST(13450.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 205)
    INSERT @Registros VALUES (1454, 42, 7, 3, CAST(N'2021-05-28' AS Date), CAST(45376.5800000000 AS Decimal(18, 10)), 320, 5, 6, N'4011209000', 5, 774664, CAST(15296.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 320)
    INSERT @Registros VALUES (1455, 51, 7, 3, CAST(N'2021-05-28' AS Date), CAST(25675.5200000000 AS Decimal(18, 10)), 270, 5, 6, N'4011209000', 5, 831455, CAST(9617.4800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 270)
    INSERT @Registros VALUES (1456, 2, 12, 8, CAST(N'2021-05-31' AS Date), CAST(36057.7100000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 233636, CAST(14340.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 260)
    INSERT @Registros VALUES (1457, 45, 7, 3, CAST(N'2021-05-31' AS Date), CAST(3117.3100000000 AS Decimal(18, 10)), 40, 14, 15, N'4011209000', 5, 369201, CAST(302.8400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 40)
    INSERT @Registros VALUES (1458, 45, 7, 3, CAST(N'2021-05-31' AS Date), CAST(4995.8200000000 AS Decimal(18, 10)), 50, 14, 15, N'4011209000', 5, 369201, CAST(2170.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 50)
    INSERT @Registros VALUES (1459, 45, 7, 3, CAST(N'2021-05-31' AS Date), CAST(23704.1200000000 AS Decimal(18, 10)), 111, 3, 4, N'4011209000', 5, 381374, CAST(4889.4200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 111)
    INSERT @Registros VALUES (1460, 45, 7, 3, CAST(N'2021-05-31' AS Date), CAST(782.9500000000 AS Decimal(18, 10)), 8, 3, 4, N'4011209000', 5, 381374, CAST(161.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 8)
    INSERT @Registros VALUES (1461, 20, 7, 3, CAST(N'2021-05-31' AS Date), CAST(34920.6200000000 AS Decimal(18, 10)), 306, 5, 6, N'4011209000', 5, 488124, CAST(14240.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 306)
    INSERT @Registros VALUES (1462, 51, 7, 3, CAST(N'2021-05-31' AS Date), CAST(56847.5600000000 AS Decimal(18, 10)), 440, 5, 6, N'4011209000', 5, 497216, CAST(24720.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 440)
    INSERT @Registros VALUES (1463, 42, 7, 3, CAST(N'2021-05-31' AS Date), CAST(50970.0200000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 5, 619237, CAST(13870.7400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 220)
    INSERT @Registros VALUES (1464, 37, 8, 4, CAST(N'2021-05-31' AS Date), CAST(53129.2200000000 AS Decimal(18, 10)), 246, 5, 6, N'4011209000', 5, 743090, CAST(14812.1800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 246)
    INSERT @Registros VALUES (1465, 44, 7, 3, CAST(N'2021-05-31' AS Date), CAST(77875.4200000000 AS Decimal(18, 10)), 500, 5, 6, N'4011209000', 5, 970179, CAST(28145.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 500)
    INSERT @Registros VALUES (1466, 2, 12, 8, CAST(N'2021-05-31' AS Date), CAST(35792.7100000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 993849, CAST(14340.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 260)
    INSERT @Registros VALUES (1467, 61, 7, 3, CAST(N'2021-06-01' AS Date), CAST(38962.3300000000 AS Decimal(18, 10)), 269, 5, 6, N'4011209000', 5, 324298, CAST(15180.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 269)
    INSERT @Registros VALUES (1468, 7, 12, 8, CAST(N'2021-06-01' AS Date), CAST(1862.2300000000 AS Decimal(18, 10)), 38, 3, 4, N'4011209000', 5, 363497, CAST(591.1000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 38)
    INSERT @Registros VALUES (1469, 26, 7, 3, CAST(N'2021-06-01' AS Date), CAST(39033.6600000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 949028, CAST(14113.6000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1470, 6, 7, 3, CAST(N'2021-06-02' AS Date), CAST(11396.3800000000 AS Decimal(18, 10)), 100, 5, 6, N'4011209000', 5, 355447, CAST(5814.8200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1471, 61, 7, 3, CAST(N'2021-06-02' AS Date), CAST(34518.0100000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 5, 966325, CAST(11064.0400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 254)
    INSERT @Registros VALUES (1472, 30, 7, 3, CAST(N'2021-06-02' AS Date), CAST(54134.0600000000 AS Decimal(18, 10)), 215, 3, 4, N'4011209000', 5, 968579, CAST(12719.6100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 215)
    INSERT @Registros VALUES (1473, 64, 7, 3, CAST(N'2021-06-03' AS Date), CAST(39581.5300000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 9739, CAST(14620.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1474, 61, 7, 3, CAST(N'2021-06-04' AS Date), CAST(47361.4600000000 AS Decimal(18, 10)), 477, 5, 6, N'4011209000', 5, 729435, CAST(17600.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 477)
    INSERT @Registros VALUES (1475, 7, 12, 8, CAST(N'2021-06-07' AS Date), CAST(1350.2000000000 AS Decimal(18, 10)), 10, 3, 4, N'4011209000', 5, 389212, CAST(173.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 10)
    INSERT @Registros VALUES (1476, 45, 7, 3, CAST(N'2021-06-07' AS Date), CAST(144444.5400000000 AS Decimal(18, 10)), 1068, 5, 6, N'4011209000', 5, 410175, CAST(58680.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 1068)
    INSERT @Registros VALUES (1477, 45, 7, 3, CAST(N'2021-06-08' AS Date), CAST(86529.8900000000 AS Decimal(18, 10)), 309, 3, 4, N'4011209000', 5, 536143, CAST(21483.5300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 309)
    INSERT @Registros VALUES (1478, 45, 7, 3, CAST(N'2021-06-08' AS Date), CAST(10606.7100000000 AS Decimal(18, 10)), 159, 16, 17, N'4011209000', 5, 617431, CAST(2075.5300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 159)
    INSERT @Registros VALUES (1479, 45, 7, 3, CAST(N'2021-06-08' AS Date), CAST(15947.1200000000 AS Decimal(18, 10)), 206, 3, 4, N'4011209000', 5, 812805, CAST(3158.4200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 206)
    INSERT @Registros VALUES (1480, 42, 7, 3, CAST(N'2021-06-08' AS Date), CAST(29204.4400000000 AS Decimal(18, 10)), 124, 2, 2, N'4011209000', 5, 964056, CAST(7366.0100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 124)
    INSERT @Registros VALUES (1481, 7, 12, 8, CAST(N'2021-06-09' AS Date), CAST(7244.1600000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 956622, CAST(1241.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1482, 7, 12, 8, CAST(N'2021-06-09' AS Date), CAST(60851.0000000000 AS Decimal(18, 10)), 840, 3, 4, N'4011209000', 5, 956622, CAST(10424.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 840)
    INSERT @Registros VALUES (1483, 7, 12, 8, CAST(N'2021-06-09' AS Date), CAST(724.4200000000 AS Decimal(18, 10)), 10, 3, 4, N'4011209000', 5, 956622, CAST(124.1000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 10)
    INSERT @Registros VALUES (1484, 22, 7, 3, CAST(N'2021-06-09' AS Date), CAST(32814.5300000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 958419, CAST(14500.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1485, 23, 7, 3, CAST(N'2021-06-10' AS Date), CAST(37738.3200000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 288374, CAST(13862.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1486, 61, 7, 3, CAST(N'2021-06-10' AS Date), CAST(28011.5500000000 AS Decimal(18, 10)), 229, 5, 6, N'4011209000', 5, 577433, CAST(8245.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 229)
    INSERT @Registros VALUES (1487, 7, 12, 8, CAST(N'2021-06-10' AS Date), CAST(7246.9500000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 839352, CAST(1241.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1488, 7, 12, 8, CAST(N'2021-06-10' AS Date), CAST(60874.5400000000 AS Decimal(18, 10)), 840, 3, 4, N'4011209000', 5, 839352, CAST(10424.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 840)
    INSERT @Registros VALUES (1489, 42, 7, 3, CAST(N'2021-06-10' AS Date), CAST(9795.0800000000 AS Decimal(18, 10)), 73, 16, 17, N'4011209000', 5, 946359, CAST(1823.6600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 73)
    INSERT @Registros VALUES (1490, 40, 10, 2, CAST(N'2021-06-11' AS Date), CAST(35513.3800000000 AS Decimal(18, 10)), 222, 5, 6, N'4011209000', 5, 489541, CAST(13300.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 222)
    INSERT @Registros VALUES (1491, 51, 7, 3, CAST(N'2021-06-11' AS Date), CAST(5624.6100000000 AS Decimal(18, 10)), 40, 5, 6, N'4011209000', 5, 624943, CAST(2062.8400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 40)
    INSERT @Registros VALUES (1492, 51, 7, 3, CAST(N'2021-06-11' AS Date), CAST(18725.4800000000 AS Decimal(18, 10)), 170, 5, 6, N'4011209000', 5, 624943, CAST(6928.8400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 170)
    INSERT @Registros VALUES (1493, 61, 7, 3, CAST(N'2021-06-15' AS Date), CAST(37452.3200000000 AS Decimal(18, 10)), 304, 5, 6, N'4011209000', 5, 650214, CAST(14283.5800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 304)
    INSERT @Registros VALUES (1494, 30, 7, 3, CAST(N'2021-06-16' AS Date), CAST(566.9400000000 AS Decimal(18, 10)), 8, 3, 4, N'4011209000', 5, 632072, CAST(108.5400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 8)
    INSERT @Registros VALUES (1495, 45, 7, 3, CAST(N'2021-06-18' AS Date), CAST(21993.9400000000 AS Decimal(18, 10)), 260, 14, 15, N'4011209000', 5, 53503, CAST(4535.1000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 260)
    INSERT @Registros VALUES (1496, 23, 7, 3, CAST(N'2021-06-18' AS Date), CAST(37531.6500000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 403068, CAST(13873.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1497, 8, 7, 3, CAST(N'2021-06-18' AS Date), CAST(8261.3500000000 AS Decimal(18, 10)), 45, 5, 6, N'4011209000', 5, 527827, CAST(2484.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 45)
    INSERT @Registros VALUES (1498, 44, 7, 3, CAST(N'2021-06-18' AS Date), CAST(57497.3800000000 AS Decimal(18, 10)), 366, 5, 6, N'4011209000', 5, 654087, CAST(19475.8300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 366)
    INSERT @Registros VALUES (1499, 45, 7, 3, CAST(N'2021-06-21' AS Date), CAST(88436.6100000000 AS Decimal(18, 10)), 322, 3, 4, N'4011209000', 5, 156594, CAST(21601.0800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 322)
    INSERT @Registros VALUES (1500, 37, 8, 4, CAST(N'2021-06-21' AS Date), CAST(43067.2800000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 5, 419462, CAST(15279.1600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 256)
    INSERT @Registros VALUES (1501, 23, 7, 3, CAST(N'2021-06-21' AS Date), CAST(35815.4400000000 AS Decimal(18, 10)), 267, 5, 6, N'4011209000', 5, 802152, CAST(13508.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 267)
    INSERT @Registros VALUES (1502, 61, 7, 3, CAST(N'2021-06-21' AS Date), CAST(37571.5000000000 AS Decimal(18, 10)), 344, 5, 6, N'4011209000', 5, 856447, CAST(14372.0200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 344)
    INSERT @Registros VALUES (1503, 61, 7, 3, CAST(N'2021-06-22' AS Date), CAST(31789.3800000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 417356, CAST(9796.2300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 280)
    INSERT @Registros VALUES (1504, 44, 7, 3, CAST(N'2021-06-22' AS Date), CAST(42714.2400000000 AS Decimal(18, 10)), 194, 3, 4, N'4011209000', 5, 431257, CAST(9666.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 194)
    INSERT @Registros VALUES (1505, 61, 7, 3, CAST(N'2021-06-23' AS Date), CAST(37940.2800000000 AS Decimal(18, 10)), 269, 5, 6, N'4011209000', 5, 728837, CAST(13547.7500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 269)
    INSERT @Registros VALUES (1506, 23, 7, 3, CAST(N'2021-06-24' AS Date), CAST(45069.0900000000 AS Decimal(18, 10)), 180, 3, 4, N'4011209000', 5, 358896, CAST(12063.6000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 180)
    INSERT @Registros VALUES (1507, 29, 12, 8, CAST(N'2021-06-24' AS Date), CAST(29365.0000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 388747, CAST(14830.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1508, 40, 10, 2, CAST(N'2021-06-24' AS Date), CAST(36122.1200000000 AS Decimal(18, 10)), 222, 5, 6, N'4011209000', 5, 482444, CAST(13300.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 222)
    INSERT @Registros VALUES (1509, 27, 7, 3, CAST(N'2021-06-24' AS Date), CAST(4957.0700000000 AS Decimal(18, 10)), 56, 3, 4, N'4011209000', 5, 619973, CAST(966.9900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 56)
    INSERT @Registros VALUES (1510, 12, 1, 2, CAST(N'2021-06-25' AS Date), CAST(38532.0300000000 AS Decimal(18, 10)), 297, 5, 6, N'4011209000', 5, 147385, CAST(14253.9200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 297)
    INSERT @Registros VALUES (1511, 42, 7, 3, CAST(N'2021-06-25' AS Date), CAST(19969.0000000000 AS Decimal(18, 10)), 90, 2, 2, N'4011209000', 5, 550792, CAST(5210.1000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 90)
    INSERT @Registros VALUES (1512, 10, 7, 3, CAST(N'2021-06-25' AS Date), CAST(2951.7000000000 AS Decimal(18, 10)), 34, 3, 4, N'4011209000', 5, 835676, CAST(501.8700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 34)
    INSERT @Registros VALUES (1513, 7, 12, 8, CAST(N'2021-06-25' AS Date), CAST(7246.9500000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 883407, CAST(1241.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1514, 7, 12, 8, CAST(N'2021-06-25' AS Date), CAST(60874.5400000000 AS Decimal(18, 10)), 840, 3, 4, N'4011209000', 5, 883407, CAST(10424.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 840)
    INSERT @Registros VALUES (1515, 61, 7, 3, CAST(N'2021-06-25' AS Date), CAST(41578.9500000000 AS Decimal(18, 10)), 338, 5, 6, N'4011209000', 5, 945887, CAST(15320.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 338)
    INSERT @Registros VALUES (1516, 61, 7, 3, CAST(N'2021-06-28' AS Date), CAST(7104.2300000000 AS Decimal(18, 10)), 101, 5, 6, N'4011209000', 5, 449715, CAST(2008.8200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 101)
    INSERT @Registros VALUES (1517, 45, 7, 3, CAST(N'2021-06-29' AS Date), CAST(33355.5400000000 AS Decimal(18, 10)), 188, 3, 4, N'4011209000', 5, 356774, CAST(6843.8000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 188)
    INSERT @Registros VALUES (1518, 26, 7, 3, CAST(N'2021-06-30' AS Date), CAST(42195.8800000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 860482, CAST(14826.2400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 264)
    INSERT @Registros VALUES (1519, 30, 7, 3, CAST(N'2021-07-01' AS Date), CAST(33828.2800000000 AS Decimal(18, 10)), 123, 3, 4, N'4011209000', 5, 74719, CAST(7669.4900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 123)
    INSERT @Registros VALUES (1520, 51, 7, 3, CAST(N'2021-07-01' AS Date), CAST(12176.3700000000 AS Decimal(18, 10)), 98, 5, 6, N'4011209000', 5, 295039, CAST(4181.4900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 98)
    INSERT @Registros VALUES (1521, 51, 7, 3, CAST(N'2021-07-01' AS Date), CAST(16139.6100000000 AS Decimal(18, 10)), 115, 5, 6, N'4011209000', 5, 295039, CAST(6093.9200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 115)
    INSERT @Registros VALUES (1522, 51, 7, 3, CAST(N'2021-07-01' AS Date), CAST(28892.0500000000 AS Decimal(18, 10)), 208, 5, 6, N'4011209000', 5, 295039, CAST(11738.8900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 208)
    INSERT @Registros VALUES (1523, 23, 7, 3, CAST(N'2021-07-01' AS Date), CAST(40441.6600000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 422829, CAST(14386.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1524, 47, 7, 3, CAST(N'2021-07-01' AS Date), CAST(2514.6000000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 5, 818480, CAST(416.6400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 30)
    INSERT @Registros VALUES (1525, 47, 7, 3, CAST(N'2021-07-01' AS Date), CAST(13788.5900000000 AS Decimal(18, 10)), 65, 3, 4, N'4011209000', 5, 818480, CAST(3010.8100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 65)
    INSERT @Registros VALUES (1526, 47, 7, 3, CAST(N'2021-07-01' AS Date), CAST(6677.3300000000 AS Decimal(18, 10)), 84, 3, 4, N'4011209000', 5, 818480, CAST(1324.5100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 84)
    INSERT @Registros VALUES (1527, 61, 7, 3, CAST(N'2021-07-02' AS Date), CAST(38441.1400000000 AS Decimal(18, 10)), 322, 5, 6, N'4011209000', 5, 290137, CAST(13786.9000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 322)
    INSERT @Registros VALUES (1528, 22, 7, 3, CAST(N'2021-07-02' AS Date), CAST(33451.7100000000 AS Decimal(18, 10)), 307, 5, 6, N'4011209000', 5, 910882, CAST(14980.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 307)
    INSERT @Registros VALUES (1529, 42, 7, 3, CAST(N'2021-07-05' AS Date), CAST(49404.4200000000 AS Decimal(18, 10)), 230, 3, 4, N'4011209000', 5, 497215, CAST(13275.5700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 230)
    INSERT @Registros VALUES (1530, 27, 7, 3, CAST(N'2021-07-05' AS Date), CAST(2302.7400000000 AS Decimal(18, 10)), 26, 3, 4, N'4011209000', 5, 830370, CAST(464.0100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 26)
    INSERT @Registros VALUES (1531, 12, 1, 2, CAST(N'2021-07-06' AS Date), CAST(38757.1700000000 AS Decimal(18, 10)), 278, 5, 6, N'4011209000', 5, 160494, CAST(15680.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 278)
    INSERT @Registros VALUES (1532, 23, 7, 3, CAST(N'2021-07-06' AS Date), CAST(38170.7000000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 471475, CAST(13862.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1533, 47, 7, 3, CAST(N'2021-07-06' AS Date), CAST(15316.3400000000 AS Decimal(18, 10)), 78, 3, 4, N'4011209000', 5, 588536, CAST(3278.3400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 78)
    INSERT @Registros VALUES (1534, 47, 7, 3, CAST(N'2021-07-06' AS Date), CAST(11704.0800000000 AS Decimal(18, 10)), 142, 3, 4, N'4011209000', 5, 588536, CAST(2174.6000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 142)
    INSERT @Registros VALUES (1535, 47, 7, 3, CAST(N'2021-07-14' AS Date), CAST(3712.7400000000 AS Decimal(18, 10)), 47, 3, 4, N'4011209000', 5, 24027, CAST(766.1600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 47)
    INSERT @Registros VALUES (1536, 47, 7, 3, CAST(N'2021-07-14' AS Date), CAST(2863.8200000000 AS Decimal(18, 10)), 31, 3, 4, N'4011209000', 5, 791974, CAST(581.8100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 31)
    INSERT @Registros VALUES (1537, 7, 12, 8, CAST(N'2021-07-15' AS Date), CAST(5963.4000000000 AS Decimal(18, 10)), 126, 3, 4, N'4011209000', 5, 296099, CAST(1934.1000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 126)
    INSERT @Registros VALUES (1538, 7, 12, 8, CAST(N'2021-07-15' AS Date), CAST(3948.0900000000 AS Decimal(18, 10)), 75, 3, 4, N'4011209000', 5, 296099, CAST(1200.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 75)
    INSERT @Registros VALUES (1539, 24, 12, 8, CAST(N'2021-07-15' AS Date), CAST(43262.8400000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 368675, CAST(15440.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 266)
    INSERT @Registros VALUES (1540, 45, 7, 3, CAST(N'2021-07-15' AS Date), CAST(155573.5000000000 AS Decimal(18, 10)), 1182, 20, 20, N'4011209000', 5, 779708, CAST(60659.9400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 1182)
    INSERT @Registros VALUES (1541, 44, 7, 3, CAST(N'2021-07-16' AS Date), CAST(35040.7700000000 AS Decimal(18, 10)), 297, 5, 6, N'4011209000', 5, 85092, CAST(10228.1300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 297)
    INSERT @Registros VALUES (1542, 56, 7, 3, CAST(N'2021-07-19' AS Date), CAST(2898.0500000000 AS Decimal(18, 10)), 21, 3, 4, N'4011209000', 5, 9483, CAST(326.6700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 21)
    INSERT @Registros VALUES (1543, 56, 7, 3, CAST(N'2021-07-19' AS Date), CAST(552.0100000000 AS Decimal(18, 10)), 4, 3, 4, N'4011209000', 5, 9483, CAST(62.2200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 4)
    INSERT @Registros VALUES (1544, 56, 7, 3, CAST(N'2021-07-19' AS Date), CAST(2760.0500000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 5, 9483, CAST(311.1100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 20)
    INSERT @Registros VALUES (1545, 45, 7, 3, CAST(N'2021-07-19' AS Date), CAST(17944.0600000000 AS Decimal(18, 10)), 259, 16, 17, N'4011209000', 5, 859707, CAST(3415.2400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 259)
    INSERT @Registros VALUES (1546, 42, 7, 3, CAST(N'2021-07-19' AS Date), CAST(8515.6000000000 AS Decimal(18, 10)), 40, 2, 2, N'4011209000', 5, 995742, CAST(2218.5500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 40)
    INSERT @Registros VALUES (1547, 61, 7, 3, CAST(N'2021-07-20' AS Date), CAST(42684.8400000000 AS Decimal(18, 10)), 259, 5, 6, N'4011209000', 5, 502020, CAST(12795.7400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 259)
    INSERT @Registros VALUES (1548, 8, 7, 3, CAST(N'2021-07-21' AS Date), CAST(8602.5100000000 AS Decimal(18, 10)), 40, 5, 6, N'4011209000', 5, 60329, CAST(2489.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 40)
    INSERT @Registros VALUES (1549, 44, 7, 3, CAST(N'2021-07-22' AS Date), CAST(63405.7300000000 AS Decimal(18, 10)), 248, 3, 4, N'4011209000', 5, 244156, CAST(14638.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 248)
    INSERT @Registros VALUES (1550, 35, 12, 8, CAST(N'2021-07-22' AS Date), CAST(8467.8700000000 AS Decimal(18, 10)), 112, 5, 6, N'4011209000', 5, 260397, CAST(4802.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 112)
    INSERT @Registros VALUES (1551, 45, 7, 3, CAST(N'2021-07-22' AS Date), CAST(89910.8300000000 AS Decimal(18, 10)), 343, 3, 4, N'4011209000', 5, 498721, CAST(21395.9600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 343)
    INSERT @Registros VALUES (1552, 45, 7, 3, CAST(N'2021-07-22' AS Date), CAST(12136.8900000000 AS Decimal(18, 10)), 94, 3, 4, N'4011209000', 5, 663447, CAST(2531.0500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 94)
    INSERT @Registros VALUES (1553, 45, 7, 3, CAST(N'2021-07-22' AS Date), CAST(6240.0900000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 5, 663447, CAST(1301.3300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 30)
    INSERT @Registros VALUES (1554, 45, 7, 3, CAST(N'2021-07-22' AS Date), CAST(14314.1700000000 AS Decimal(18, 10)), 171, 3, 4, N'4011209000', 5, 663447, CAST(2985.1000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 171)
    INSERT @Registros VALUES (1555, 45, 7, 3, CAST(N'2021-07-22' AS Date), CAST(4679.1200000000 AS Decimal(18, 10)), 67, 3, 4, N'4011209000', 5, 663447, CAST(975.7800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 67)
    INSERT @Registros VALUES (1556, 26, 7, 3, CAST(N'2021-07-23' AS Date), CAST(76957.8400000000 AS Decimal(18, 10)), 503, 5, 6, N'4011209000', 5, 70929, CAST(29610.0400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 503)
    INSERT @Registros VALUES (1557, 23, 7, 3, CAST(N'2021-07-23' AS Date), CAST(40213.3500000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 547161, CAST(13866.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1558, 22, 7, 3, CAST(N'2021-07-23' AS Date), CAST(33679.8800000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 799061, CAST(14500.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1559, 23, 7, 3, CAST(N'2021-07-23' AS Date), CAST(42771.0000000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 801295, CAST(14439.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1560, 45, 7, 3, CAST(N'2021-07-23' AS Date), CAST(32643.1400000000 AS Decimal(18, 10)), 380, 14, 15, N'4011209000', 5, 883482, CAST(7472.7900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 380)
    INSERT @Registros VALUES (1561, 30, 7, 3, CAST(N'2021-07-23' AS Date), CAST(55340.5800000000 AS Decimal(18, 10)), 211, 3, 4, N'4011209000', 5, 985159, CAST(12454.9600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 211)
    INSERT @Registros VALUES (1562, 37, 8, 4, CAST(N'2021-07-26' AS Date), CAST(53752.4000000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 11033, CAST(14900.6200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1563, 44, 7, 3, CAST(N'2021-07-26' AS Date), CAST(2652.2900000000 AS Decimal(18, 10)), 9, 3, 4, N'4011209000', 5, 136112, CAST(533.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 9)
    INSERT @Registros VALUES (1564, 13, 5, 6, CAST(N'2021-07-26' AS Date), CAST(44155.1600000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 195482, CAST(15260.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 266)
    INSERT @Registros VALUES (1565, 24, 12, 8, CAST(N'2021-07-26' AS Date), CAST(41889.7000000000 AS Decimal(18, 10)), 265, 5, 6, N'4011209000', 5, 613298, CAST(14760.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 265)
    INSERT @Registros VALUES (1566, 45, 7, 3, CAST(N'2021-07-26' AS Date), CAST(77863.6800000000 AS Decimal(18, 10)), 544, 5, 6, N'4011209000', 5, 626878, CAST(26543.8900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 544)
    INSERT @Registros VALUES (1567, 25, 7, 3, CAST(N'2021-07-26' AS Date), CAST(18417.3300000000 AS Decimal(18, 10)), 124, 5, 6, N'4011209000', 5, 688577, CAST(7140.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 124)
    INSERT @Registros VALUES (1568, 51, 7, 3, CAST(N'2021-07-26' AS Date), CAST(33302.8100000000 AS Decimal(18, 10)), 197, 5, 6, N'4011209000', 5, 722025, CAST(15380.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 197)
    INSERT @Registros VALUES (1569, 51, 7, 3, CAST(N'2021-07-26' AS Date), CAST(17586.9800000000 AS Decimal(18, 10)), 131, 5, 6, N'4011209000', 5, 722025, CAST(7229.9500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 131)
    INSERT @Registros VALUES (1570, 8, 7, 3, CAST(N'2021-07-26' AS Date), CAST(11236.1100000000 AS Decimal(18, 10)), 108, 5, 6, N'4011209000', 5, 970373, CAST(3107.3100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 108)
    INSERT @Registros VALUES (1571, 37, 8, 4, CAST(N'2021-07-27' AS Date), CAST(44017.3600000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 5, 77765, CAST(15196.9600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 256)
    INSERT @Registros VALUES (1572, 44, 7, 3, CAST(N'2021-07-27' AS Date), CAST(19365.4200000000 AS Decimal(18, 10)), 113, 3, 4, N'4011209000', 5, 365888, CAST(3618.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 113)
    INSERT @Registros VALUES (1573, 4, 7, 3, CAST(N'2021-07-28' AS Date), CAST(13599.3800000000 AS Decimal(18, 10)), 128, 5, 6, N'4011209000', 5, 93711, CAST(4513.9200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 128)
    INSERT @Registros VALUES (1574, 51, 7, 3, CAST(N'2021-07-28' AS Date), CAST(1711.0100000000 AS Decimal(18, 10)), 10, 5, 6, N'4011209000', 5, 613028, CAST(511.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 10)
    INSERT @Registros VALUES (1575, 30, 7, 3, CAST(N'2021-07-29' AS Date), CAST(2198.2100000000 AS Decimal(18, 10)), 32, 3, 4, N'4011209000', 5, 90396, CAST(424.0100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 32)
    INSERT @Registros VALUES (1576, 45, 7, 3, CAST(N'2021-07-29' AS Date), CAST(114207.1900000000 AS Decimal(18, 10)), 642, 20, 20, N'4011209000', 5, 289019, CAST(40719.3600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 642)
    INSERT @Registros VALUES (1577, 45, 7, 3, CAST(N'2021-07-29' AS Date), CAST(3755.3600000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 5, 500915, CAST(719.1300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 30)
    INSERT @Registros VALUES (1578, 45, 7, 3, CAST(N'2021-07-29' AS Date), CAST(2163.2700000000 AS Decimal(18, 10)), 24, 3, 4, N'4011209000', 5, 500915, CAST(414.2500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 24)
    INSERT @Registros VALUES (1579, 45, 7, 3, CAST(N'2021-07-29' AS Date), CAST(18387.8300000000 AS Decimal(18, 10)), 218, 3, 4, N'4011209000', 5, 500915, CAST(3521.1600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 218)
    INSERT @Registros VALUES (1580, 45, 7, 3, CAST(N'2021-07-30' AS Date), CAST(34146.8900000000 AS Decimal(18, 10)), 142, 3, 4, N'4011209000', 5, 309669, CAST(7200.5800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 142)
    INSERT @Registros VALUES (1581, 22, 7, 3, CAST(N'2021-07-30' AS Date), CAST(33864.4600000000 AS Decimal(18, 10)), 301, 5, 6, N'4011209000', 5, 336867, CAST(15227.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 301)
    INSERT @Registros VALUES (1582, 23, 7, 3, CAST(N'2021-07-30' AS Date), CAST(74212.6000000000 AS Decimal(18, 10)), 370, 3, 4, N'4011209000', 5, 346381, CAST(18570.8100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 370)
    INSERT @Registros VALUES (1583, 10, 7, 3, CAST(N'2021-07-30' AS Date), CAST(1940.8600000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 5, 435336, CAST(335.2500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 20)
    INSERT @Registros VALUES (1584, 45, 7, 3, CAST(N'2021-07-30' AS Date), CAST(8573.6500000000 AS Decimal(18, 10)), 130, 16, 17, N'4011209000', 5, 907209, CAST(1603.4500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 130)
    INSERT @Registros VALUES (1585, 20, 7, 3, CAST(N'2021-08-02' AS Date), CAST(36511.5800000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 410359, CAST(13794.8900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 260)
    INSERT @Registros VALUES (1586, 42, 7, 3, CAST(N'2021-08-03' AS Date), CAST(52812.7000000000 AS Decimal(18, 10)), 308, 3, 4, N'4011209000', 5, 634039, CAST(12919.4400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 308)
    INSERT @Registros VALUES (1587, 64, 7, 3, CAST(N'2021-08-05' AS Date), CAST(40928.0100000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 312865, CAST(14740.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1588, 24, 12, 8, CAST(N'2021-08-06' AS Date), CAST(43153.8500000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 64830, CAST(14220.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 266)
    INSERT @Registros VALUES (1589, 20, 7, 3, CAST(N'2021-08-06' AS Date), CAST(38767.9100000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 429400, CAST(14593.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1590, 45, 7, 3, CAST(N'2021-08-10' AS Date), CAST(2930.3700000000 AS Decimal(18, 10)), 38, 3, 4, N'4011209000', 5, 115452, CAST(609.1000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 38)
    INSERT @Registros VALUES (1591, 45, 7, 3, CAST(N'2021-08-10' AS Date), CAST(30863.4900000000 AS Decimal(18, 10)), 119, 3, 4, N'4011209000', 5, 115452, CAST(6415.2200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 119)
    INSERT @Registros VALUES (1592, 7, 12, 8, CAST(N'2021-08-10' AS Date), CAST(7246.9500000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 285594, CAST(1241.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1593, 7, 12, 8, CAST(N'2021-08-10' AS Date), CAST(60874.5400000000 AS Decimal(18, 10)), 840, 3, 4, N'4011209000', 5, 285594, CAST(10424.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 840)
    INSERT @Registros VALUES (1594, 7, 12, 8, CAST(N'2021-08-10' AS Date), CAST(7246.9500000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 285594, CAST(1241.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1595, 7, 12, 8, CAST(N'2021-08-10' AS Date), CAST(60874.5400000000 AS Decimal(18, 10)), 840, 3, 4, N'4011209000', 5, 285594, CAST(10424.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 840)
    INSERT @Registros VALUES (1596, 44, 7, 3, CAST(N'2021-08-10' AS Date), CAST(27734.9200000000 AS Decimal(18, 10)), 130, 3, 4, N'4011209000', 5, 958973, CAST(5699.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 130)
    INSERT @Registros VALUES (1597, 7, 12, 8, CAST(N'2021-08-11' AS Date), CAST(11264.2100000000 AS Decimal(18, 10)), 238, 3, 4, N'4011209000', 5, 582404, CAST(3570.8000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 238)
    INSERT @Registros VALUES (1598, 7, 12, 8, CAST(N'2021-08-11' AS Date), CAST(6316.9400000000 AS Decimal(18, 10)), 120, 3, 4, N'4011209000', 5, 582404, CAST(2002.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 120)
    INSERT @Registros VALUES (1599, 13, 5, 6, CAST(N'2021-08-16' AS Date), CAST(43145.1600000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 168936, CAST(15260.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 266)
    INSERT @Registros VALUES (1600, 47, 7, 3, CAST(N'2021-08-16' AS Date), CAST(29694.9700000000 AS Decimal(18, 10)), 174, 3, 4, N'4011209000', 5, 490705, CAST(6194.5400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 174)
    INSERT @Registros VALUES (1601, 45, 7, 3, CAST(N'2021-08-16' AS Date), CAST(77600.9800000000 AS Decimal(18, 10)), 512, 5, 6, N'4011209000', 5, 527785, CAST(27020.1500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 512)
    INSERT @Registros VALUES (1602, 45, 7, 3, CAST(N'2021-08-17' AS Date), CAST(113195.3000000000 AS Decimal(18, 10)), 730, 20, 20, N'4011209000', 5, 137259, CAST(42111.0400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 730)
    INSERT @Registros VALUES (1603, 45, 7, 3, CAST(N'2021-08-17' AS Date), CAST(104814.6300000000 AS Decimal(18, 10)), 767, 20, 20, N'4011209000', 5, 493445, CAST(40759.7700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 767)
    INSERT @Registros VALUES (1604, 2, 12, 8, CAST(N'2021-08-17' AS Date), CAST(80305.6400000000 AS Decimal(18, 10)), 506, 5, 6, N'4011209000', 5, 740469, CAST(29520.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 506)
    INSERT @Registros VALUES (1605, 7, 12, 8, CAST(N'2021-08-17' AS Date), CAST(16581.9700000000 AS Decimal(18, 10)), 315, 3, 4, N'4011209000', 5, 777080, CAST(5220.1800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 315)
    INSERT @Registros VALUES (1606, 7, 12, 8, CAST(N'2021-08-17' AS Date), CAST(18931.4400000000 AS Decimal(18, 10)), 400, 3, 4, N'4011209000', 5, 777080, CAST(5959.8200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 400)
    INSERT @Registros VALUES (1607, 44, 7, 3, CAST(N'2021-08-17' AS Date), CAST(48735.9300000000 AS Decimal(18, 10)), 247, 3, 4, N'4011209000', 5, 793335, CAST(12707.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 247)
    INSERT @Registros VALUES (1608, 2, 12, 8, CAST(N'2021-08-18' AS Date), CAST(93730.7200000000 AS Decimal(18, 10)), 496, 5, 6, N'4011209000', 5, 838951, CAST(32413.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 496)
    INSERT @Registros VALUES (1609, 30, 7, 3, CAST(N'2021-08-19' AS Date), CAST(65329.2700000000 AS Decimal(18, 10)), 249, 3, 4, N'4011209000', 5, 341661, CAST(15571.1300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 249)
    INSERT @Registros VALUES (1610, 61, 7, 3, CAST(N'2021-08-19' AS Date), CAST(41221.7200000000 AS Decimal(18, 10)), 299, 5, 6, N'4011209000', 5, 891383, CAST(13967.8700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 299)
    INSERT @Registros VALUES (1611, 51, 7, 3, CAST(N'2021-08-19' AS Date), CAST(5120.4800000000 AS Decimal(18, 10)), 45, 5, 6, N'4011209000', 5, 902678, CAST(1540.5700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 45)
    INSERT @Registros VALUES (1612, 51, 7, 3, CAST(N'2021-08-19' AS Date), CAST(5625.6400000000 AS Decimal(18, 10)), 36, 5, 6, N'4011209000', 5, 902678, CAST(1718.1400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 36)
    INSERT @Registros VALUES (1613, 51, 7, 3, CAST(N'2021-08-19' AS Date), CAST(4008.8600000000 AS Decimal(18, 10)), 30, 5, 6, N'4011209000', 5, 902678, CAST(1254.1200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 30)
    INSERT @Registros VALUES (1614, 61, 7, 3, CAST(N'2021-08-20' AS Date), CAST(39357.4400000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 113693, CAST(13673.7800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1615, 12, 1, 2, CAST(N'2021-08-20' AS Date), CAST(980.3200000000 AS Decimal(18, 10)), 8, 14, 15, N'4011209000', 5, 163765, CAST(208.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 8)
    INSERT @Registros VALUES (1616, 12, 1, 2, CAST(N'2021-08-20' AS Date), CAST(1517.1000000000 AS Decimal(18, 10)), 13, 14, 15, N'4011209000', 5, 163765, CAST(338.1000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 13)
    INSERT @Registros VALUES (1617, 24, 12, 8, CAST(N'2021-08-20' AS Date), CAST(43794.8500000000 AS Decimal(18, 10)), 265, 5, 6, N'4011209000', 5, 169271, CAST(14840.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 265)
    INSERT @Registros VALUES (1618, 63, 12, 8, CAST(N'2021-08-20' AS Date), CAST(29460.9000000000 AS Decimal(18, 10)), 232, 5, 6, N'4011209000', 5, 178885, CAST(11792.0700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 232)
    INSERT @Registros VALUES (1619, 45, 7, 3, CAST(N'2021-08-20' AS Date), CAST(17447.2200000000 AS Decimal(18, 10)), 86, 20, 20, N'4011209000', 5, 529958, CAST(6059.5600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 86)
    INSERT @Registros VALUES (1620, 37, 8, 4, CAST(N'2021-08-20' AS Date), CAST(44352.0000000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 573412, CAST(14092.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 260)
    INSERT @Registros VALUES (1621, 42, 7, 3, CAST(N'2021-08-26' AS Date), CAST(1249.2500000000 AS Decimal(18, 10)), 24, 16, 17, N'4011209000', 5, 19162, CAST(200.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 24)
    INSERT @Registros VALUES (1622, 45, 7, 3, CAST(N'2021-08-26' AS Date), CAST(11568.6200000000 AS Decimal(18, 10)), 140, 3, 4, N'4011209000', 5, 980078, CAST(2144.7500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 140)
    INSERT @Registros VALUES (1623, 61, 7, 3, CAST(N'2021-08-27' AS Date), CAST(42605.9500000000 AS Decimal(18, 10)), 281, 5, 6, N'4011209000', 5, 508567, CAST(15040.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 281)
    INSERT @Registros VALUES (1624, 56, 7, 3, CAST(N'2021-08-27' AS Date), CAST(1909.2400000000 AS Decimal(18, 10)), 16, 3, 4, N'4011209000', 5, 566651, CAST(271.0300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 16)
    INSERT @Registros VALUES (1625, 56, 7, 3, CAST(N'2021-08-27' AS Date), CAST(1073.9500000000 AS Decimal(18, 10)), 9, 3, 4, N'4011209000', 5, 566651, CAST(152.4500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 9)
    INSERT @Registros VALUES (1626, 23, 7, 3, CAST(N'2021-08-30' AS Date), CAST(40998.8700000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 599088, CAST(13872.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1627, 56, 7, 3, CAST(N'2021-08-31' AS Date), CAST(2863.8600000000 AS Decimal(18, 10)), 24, 3, 4, N'4011209000', 5, 302622, CAST(406.5500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 24)
    INSERT @Registros VALUES (1628, 56, 7, 3, CAST(N'2021-08-31' AS Date), CAST(6682.3400000000 AS Decimal(18, 10)), 56, 3, 4, N'4011209000', 5, 302622, CAST(948.6100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 56)
    INSERT @Registros VALUES (1629, 22, 7, 3, CAST(N'2021-08-31' AS Date), CAST(35116.9400000000 AS Decimal(18, 10)), 270, 5, 6, N'4011209000', 5, 358875, CAST(15020.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 270)
    INSERT @Registros VALUES (1630, 7, 12, 8, CAST(N'2021-10-01' AS Date), CAST(10554.2800000000 AS Decimal(18, 10)), 223, 3, 4, N'4011209000', 5, 35489, CAST(3423.0500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 223)
    INSERT @Registros VALUES (1631, 7, 12, 8, CAST(N'2021-10-01' AS Date), CAST(13157.3500000000 AS Decimal(18, 10)), 278, 3, 4, N'4011209000', 5, 35489, CAST(4267.3000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 278)
    INSERT @Registros VALUES (1632, 7, 12, 8, CAST(N'2021-10-01' AS Date), CAST(662.6000000000 AS Decimal(18, 10)), 14, 3, 4, N'4011209000', 5, 35489, CAST(214.9000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 14)
    INSERT @Registros VALUES (1633, 7, 12, 8, CAST(N'2021-10-01' AS Date), CAST(7477.9200000000 AS Decimal(18, 10)), 158, 3, 4, N'4011209000', 5, 35489, CAST(2425.3000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 158)
    INSERT @Registros VALUES (1634, 23, 7, 3, CAST(N'2021-10-01' AS Date), CAST(43862.6700000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 367772, CAST(14280.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 266)
    INSERT @Registros VALUES (1635, 61, 7, 3, CAST(N'2021-10-04' AS Date), CAST(43228.9000000000 AS Decimal(18, 10)), 288, 5, 6, N'4011209000', 5, 247892, CAST(14765.3200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 288)
    INSERT @Registros VALUES (1636, 44, 7, 3, CAST(N'2021-10-04' AS Date), CAST(6009.8400000000 AS Decimal(18, 10)), 40, 3, 4, N'4011209000', 5, 377444, CAST(1144.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 40)
    INSERT @Registros VALUES (1637, 44, 7, 3, CAST(N'2021-10-04' AS Date), CAST(39330.1200000000 AS Decimal(18, 10)), 324, 5, 6, N'4011209000', 5, 555298, CAST(10927.2200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 324)
    INSERT @Registros VALUES (1638, 51, 7, 3, CAST(N'2021-10-06' AS Date), CAST(14129.9000000000 AS Decimal(18, 10)), 86, 5, 6, N'4011209000', 5, 253364, CAST(4230.4900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 86)
    INSERT @Registros VALUES (1639, 30, 7, 3, CAST(N'2021-10-06' AS Date), CAST(3641.0700000000 AS Decimal(18, 10)), 52, 3, 4, N'4011209000', 5, 408473, CAST(701.1400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 52)
    INSERT @Registros VALUES (1640, 7, 12, 8, CAST(N'2021-10-07' AS Date), CAST(17792.7200000000 AS Decimal(18, 10)), 338, 3, 4, N'4011209000', 5, 232451, CAST(5911.9500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 338)
    INSERT @Registros VALUES (1641, 7, 12, 8, CAST(N'2021-10-07' AS Date), CAST(11122.2200000000 AS Decimal(18, 10)), 235, 3, 4, N'4011209000', 5, 232451, CAST(3695.5600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 235)
    INSERT @Registros VALUES (1642, 7, 12, 8, CAST(N'2021-10-07' AS Date), CAST(4158.6500000000 AS Decimal(18, 10)), 79, 3, 4, N'4011209000', 5, 232451, CAST(1381.7900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 79)
    INSERT @Registros VALUES (1643, 7, 12, 8, CAST(N'2021-10-07' AS Date), CAST(473.7700000000 AS Decimal(18, 10)), 9, 3, 4, N'4011209000', 5, 232451, CAST(157.4200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 9)
    INSERT @Registros VALUES (1644, 7, 12, 8, CAST(N'2021-10-07' AS Date), CAST(473.7700000000 AS Decimal(18, 10)), 9, 3, 4, N'4011209000', 5, 232451, CAST(157.4200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 9)
    INSERT @Registros VALUES (1645, 30, 7, 3, CAST(N'2021-10-07' AS Date), CAST(10045.9600000000 AS Decimal(18, 10)), 36, 3, 4, N'4011209000', 5, 889412, CAST(2117.1600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 36)
    INSERT @Registros VALUES (1646, 45, 7, 3, CAST(N'2021-10-08' AS Date), CAST(70661.8500000000 AS Decimal(18, 10)), 784, 14, 15, N'4011209000', 5, 2939, CAST(18658.9900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 140)
    INSERT @Registros VALUES (1647, 45, 7, 3, CAST(N'2021-10-12' AS Date), CAST(50175.7300000000 AS Decimal(18, 10)), 226, 3, 4, N'4011209000', 5, 87606, CAST(11134.0200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 226)
    INSERT @Registros VALUES (1648, 42, 7, 3, CAST(N'2021-10-14' AS Date), CAST(55514.1300000000 AS Decimal(18, 10)), 259, 3, 4, N'4011209000', 5, 122450, CAST(14072.9900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 259)
    INSERT @Registros VALUES (1649, 44, 7, 3, CAST(N'2021-10-14' AS Date), CAST(72006.2100000000 AS Decimal(18, 10)), 450, 5, 6, N'4011209000', 5, 318359, CAST(22423.2100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 450)
    INSERT @Registros VALUES (1650, 40, 10, 2, CAST(N'2021-10-14' AS Date), CAST(77395.6600000000 AS Decimal(18, 10)), 430, 5, 6, N'4011209000', 5, 988707, CAST(26660.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 430)
    INSERT @Registros VALUES (1651, 2, 12, 8, CAST(N'2021-10-15' AS Date), CAST(79730.2400000000 AS Decimal(18, 10)), 520, 5, 6, N'4011209000', 5, 827164, CAST(28440.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 520)
    INSERT @Registros VALUES (1652, 51, 7, 3, CAST(N'2021-10-18' AS Date), CAST(105287.5300000000 AS Decimal(18, 10)), 652, 5, 6, N'4011209000', 5, 286939, CAST(39879.9900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 652)
    INSERT @Registros VALUES (1653, 30, 7, 3, CAST(N'2021-10-18' AS Date), CAST(3679.6100000000 AS Decimal(18, 10)), 6, 13, 13, N'4011209000', 5, 612328, CAST(624.2400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 6)
    INSERT @Registros VALUES (1654, 30, 7, 3, CAST(N'2021-10-18' AS Date), CAST(4240.5000000000 AS Decimal(18, 10)), 12, 18, 13, N'4011209000', 5, 612328, CAST(843.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 12)
    INSERT @Registros VALUES (1655, 42, 7, 3, CAST(N'2021-10-19' AS Date), CAST(9659.2000000000 AS Decimal(18, 10)), 40, 2, 2, N'4011209000', 5, 435286, CAST(2359.2400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 40)
    INSERT @Registros VALUES (1656, 24, 12, 8, CAST(N'2021-10-20' AS Date), CAST(45442.2600000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 222307, CAST(13728.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 264)
    INSERT @Registros VALUES (1657, 45, 7, 3, CAST(N'2021-10-20' AS Date), CAST(4383.9200000000 AS Decimal(18, 10)), 61, 16, 17, N'4011209000', 5, 809605, CAST(846.3400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 61)
    INSERT @Registros VALUES (1658, 45, 7, 3, CAST(N'2021-10-20' AS Date), CAST(7844.0100000000 AS Decimal(18, 10)), 100, 16, 17, N'4011209000', 5, 988205, CAST(1479.7500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1659, 61, 7, 3, CAST(N'2021-10-21' AS Date), CAST(42875.9500000000 AS Decimal(18, 10)), 333, 5, 6, N'4011209000', 5, 49083, CAST(13982.3900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 333)
    INSERT @Registros VALUES (1660, 8, 7, 3, CAST(N'2021-10-21' AS Date), CAST(3522.6400000000 AS Decimal(18, 10)), 32, 5, 6, N'4011209000', 5, 59741, CAST(823.7700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 32)
    INSERT @Registros VALUES (1661, 44, 7, 3, CAST(N'2021-10-21' AS Date), CAST(36463.1500000000 AS Decimal(18, 10)), 143, 3, 4, N'4011209000', 5, 152248, CAST(8029.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 143)
    INSERT @Registros VALUES (1662, 23, 7, 3, CAST(N'2021-10-21' AS Date), CAST(44943.9000000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 415043, CAST(16310.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 260)
    INSERT @Registros VALUES (1663, 45, 7, 3, CAST(N'2021-10-21' AS Date), CAST(2488.9500000000 AS Decimal(18, 10)), 36, 16, 17, N'4011209000', 5, 951245, CAST(491.9900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 36)
    INSERT @Registros VALUES (1664, 61, 7, 3, CAST(N'2021-10-22' AS Date), CAST(40698.7800000000 AS Decimal(18, 10)), 306, 5, 6, N'4011209000', 5, 274452, CAST(13878.2300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 306)
    INSERT @Registros VALUES (1665, 51, 7, 3, CAST(N'2021-10-22' AS Date), CAST(25848.1400000000 AS Decimal(18, 10)), 227, 5, 6, N'4011209000', 5, 396836, CAST(8118.5600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 227)
    INSERT @Registros VALUES (1666, 51, 7, 3, CAST(N'2021-10-22' AS Date), CAST(15496.8500000000 AS Decimal(18, 10)), 172, 5, 6, N'4011209000', 5, 680058, CAST(4762.6000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 172)
    INSERT @Registros VALUES (1667, 7, 12, 8, CAST(N'2021-10-25' AS Date), CAST(368.4900000000 AS Decimal(18, 10)), 7, 3, 4, N'4011209000', 5, 226572, CAST(123.7300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 7)
    INSERT @Registros VALUES (1668, 7, 12, 8, CAST(N'2021-10-25' AS Date), CAST(25215.1300000000 AS Decimal(18, 10)), 479, 3, 4, N'4011209000', 5, 226572, CAST(8466.9700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 479)
    INSERT @Registros VALUES (1669, 7, 12, 8, CAST(N'2021-10-25' AS Date), CAST(2105.6500000000 AS Decimal(18, 10)), 40, 3, 4, N'4011209000', 5, 226572, CAST(707.0500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 40)
    INSERT @Registros VALUES (1670, 7, 12, 8, CAST(N'2021-10-25' AS Date), CAST(7685.6100000000 AS Decimal(18, 10)), 146, 3, 4, N'4011209000', 5, 226572, CAST(2580.7500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 146)
    INSERT @Registros VALUES (1671, 44, 7, 3, CAST(N'2021-10-25' AS Date), CAST(57722.4900000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 5, 387247, CAST(15078.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 300)
    INSERT @Registros VALUES (1672, 8, 7, 3, CAST(N'2021-10-25' AS Date), CAST(15125.8100000000 AS Decimal(18, 10)), 75, 5, 6, N'4011209000', 5, 456402, CAST(4073.3000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 75)
    INSERT @Registros VALUES (1673, 37, 8, 4, CAST(N'2021-10-25' AS Date), CAST(55074.3800000000 AS Decimal(18, 10)), 253, 5, 6, N'4011209000', 5, 670422, CAST(14953.0100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 253)
    INSERT @Registros VALUES (1674, 12, 1, 2, CAST(N'2021-10-26' AS Date), CAST(41316.1100000000 AS Decimal(18, 10)), 334, 5, 6, N'4011209000', 5, 669295, CAST(10000.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 334)
    INSERT @Registros VALUES (1675, 42, 7, 3, CAST(N'2021-10-27' AS Date), CAST(13902.3500000000 AS Decimal(18, 10)), 83, 2, 2, N'4011209000', 5, 889747, CAST(3443.5800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 83)
    INSERT @Registros VALUES (1676, 51, 7, 3, CAST(N'2021-10-28' AS Date), CAST(5079.3300000000 AS Decimal(18, 10)), 20, 5, 6, N'4011209000', 5, 829908, CAST(1394.3300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 20)
    INSERT @Registros VALUES (1677, 30, 7, 3, CAST(N'2021-10-28' AS Date), CAST(9267.1100000000 AS Decimal(18, 10)), 32, 3, 4, N'4011209000', 5, 894118, CAST(1724.5800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 32)
    INSERT @Registros VALUES (1678, 44, 7, 3, CAST(N'2021-10-28' AS Date), CAST(55508.6500000000 AS Decimal(18, 10)), 323, 3, 4, N'4011209000', 5, 987979, CAST(13630.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 323)
    INSERT @Registros VALUES (1679, 2, 12, 8, CAST(N'2021-10-29' AS Date), CAST(143496.2300000000 AS Decimal(18, 10)), 744, 5, 6, N'4011209000', 5, 23614, CAST(47540.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 744)
    INSERT @Registros VALUES (1680, 12, 1, 2, CAST(N'2021-10-29' AS Date), CAST(4145.2100000000 AS Decimal(18, 10)), 20, 14, 15, N'4011209000', 5, 118082, CAST(1205.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 20)
    INSERT @Registros VALUES (1681, 12, 1, 2, CAST(N'2021-10-29' AS Date), CAST(17506.2600000000 AS Decimal(18, 10)), 80, 14, 15, N'4011209000', 5, 118082, CAST(5003.8500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 80)
    INSERT @Registros VALUES (1682, 42, 7, 3, CAST(N'2021-11-01' AS Date), CAST(54165.9000000000 AS Decimal(18, 10)), 260, 3, 4, N'4011209000', 5, 701546, CAST(13673.9500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 260)
    INSERT @Registros VALUES (1683, 7, 12, 8, CAST(N'2021-11-01' AS Date), CAST(2811.6000000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 5, 906577, CAST(951.7900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 60)
    INSERT @Registros VALUES (1684, 7, 12, 8, CAST(N'2021-11-01' AS Date), CAST(4169.6000000000 AS Decimal(18, 10)), 80, 3, 4, N'4011209000', 5, 906577, CAST(1411.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 80)
    INSERT @Registros VALUES (1685, 7, 12, 8, CAST(N'2021-11-01' AS Date), CAST(27779.9600000000 AS Decimal(18, 10)), 533, 3, 4, N'4011209000', 5, 906577, CAST(9404.1300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 533)
    INSERT @Registros VALUES (1686, 23, 7, 3, CAST(N'2021-11-03' AS Date), CAST(78667.8200000000 AS Decimal(18, 10)), 283, 3, 4, N'4011209000', 5, 252098, CAST(18683.9200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 283)
    INSERT @Registros VALUES (1687, 45, 7, 3, CAST(N'2021-11-05' AS Date), CAST(39720.5200000000 AS Decimal(18, 10)), 278, 3, 4, N'4011209000', 5, 241551, CAST(8217.1000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 278)
    INSERT @Registros VALUES (1688, 47, 7, 3, CAST(N'2021-11-05' AS Date), CAST(5026.9400000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 877196, CAST(1007.7800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 50)
    INSERT @Registros VALUES (1689, 44, 7, 3, CAST(N'2021-11-08' AS Date), CAST(88536.8400000000 AS Decimal(18, 10)), 566, 5, 6, N'4011209000', 5, 1308, CAST(28714.1400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 566)
    INSERT @Registros VALUES (1690, 23, 7, 3, CAST(N'2021-11-08' AS Date), CAST(43397.2700000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 70339, CAST(13826.1000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1691, 45, 7, 3, CAST(N'2021-11-08' AS Date), CAST(9108.6400000000 AS Decimal(18, 10)), 106, 14, 15, N'4011209000', 5, 270172, CAST(1702.5200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 106)
    INSERT @Registros VALUES (1692, 12, 1, 2, CAST(N'2021-11-08' AS Date), CAST(40012.4200000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 622914, CAST(13639.7200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1693, 23, 7, 3, CAST(N'2021-11-08' AS Date), CAST(17413.7100000000 AS Decimal(18, 10)), 100, 5, 6, N'4011209000', 5, 835851, CAST(5662.3500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1694, 61, 7, 3, CAST(N'2021-11-10' AS Date), CAST(32832.7400000000 AS Decimal(18, 10)), 374, 5, 6, N'4011209000', 5, 790884, CAST(8609.9000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 374)
    INSERT @Registros VALUES (1695, 10, 7, 3, CAST(N'2021-11-10' AS Date), CAST(3366.2800000000 AS Decimal(18, 10)), 34, 3, 4, N'4011209000', 5, 883736, CAST(578.6900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 34)
    INSERT @Registros VALUES (1696, 51, 7, 3, CAST(N'2021-11-11' AS Date), CAST(8014.8600000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 722681, CAST(1651.6800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1697, 45, 7, 3, CAST(N'2021-11-12' AS Date), CAST(17348.3000000000 AS Decimal(18, 10)), 69, 3, 4, N'4011209000', 5, 34556, CAST(3562.7900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 69)
    INSERT @Registros VALUES (1698, 51, 7, 3, CAST(N'2021-11-12' AS Date), CAST(1859.9100000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 5, 63825, CAST(353.8900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 20)
    INSERT @Registros VALUES (1699, 45, 7, 3, CAST(N'2021-11-12' AS Date), CAST(11529.1000000000 AS Decimal(18, 10)), 148, 3, 4, N'4011209000', 5, 525604, CAST(2255.8400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 148)
    INSERT @Registros VALUES (1700, 47, 7, 3, CAST(N'2021-11-12' AS Date), CAST(4808.1200000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 666547, CAST(973.5100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 50)
    INSERT @Registros VALUES (1701, 47, 7, 3, CAST(N'2021-11-15' AS Date), CAST(9384.2700000000 AS Decimal(18, 10)), 110, 3, 4, N'4011209000', 5, 764216, CAST(1708.3500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 110)
    INSERT @Registros VALUES (1702, 47, 7, 3, CAST(N'2021-11-15' AS Date), CAST(28693.4600000000 AS Decimal(18, 10)), 137, 3, 4, N'4011209000', 5, 827953, CAST(6021.3100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 137)
    INSERT @Registros VALUES (1703, 47, 7, 3, CAST(N'2021-11-15' AS Date), CAST(2102.3900000000 AS Decimal(18, 10)), 23, 3, 4, N'4011209000', 5, 959072, CAST(366.4600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 23)
    INSERT @Registros VALUES (1704, 6, 7, 3, CAST(N'2021-11-16' AS Date), CAST(46209.2200000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 5, 143174, CAST(15207.3600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 248)
    INSERT @Registros VALUES (1705, 12, 1, 2, CAST(N'2021-11-16' AS Date), CAST(41254.0300000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 339034, CAST(14600.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 266)
    INSERT @Registros VALUES (1706, 47, 7, 3, CAST(N'2021-11-16' AS Date), CAST(29847.8500000000 AS Decimal(18, 10)), 317, 3, 4, N'4011209000', 5, 637533, CAST(6329.1100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 317)
    INSERT @Registros VALUES (1707, 30, 7, 3, CAST(N'2021-11-16' AS Date), CAST(1718.0500000000 AS Decimal(18, 10)), 25, 3, 4, N'4011209000', 5, 821331, CAST(320.6500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 25)
    INSERT @Registros VALUES (1708, 6, 7, 3, CAST(N'2021-11-17' AS Date), CAST(44227.7000000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 5, 15687, CAST(13771.4400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 248)
    INSERT @Registros VALUES (1709, 43, 12, 8, CAST(N'2021-11-17' AS Date), CAST(29253.6900000000 AS Decimal(18, 10)), 236, 5, 6, N'4011209000', 5, 27600, CAST(13688.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 236)
    INSERT @Registros VALUES (1710, 21, 12, 8, CAST(N'2021-11-17' AS Date), CAST(31806.0900000000 AS Decimal(18, 10)), 214, 5, 6, N'4011209000', 5, 174496, CAST(13758.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 214)
    INSERT @Registros VALUES (1711, 63, 12, 8, CAST(N'2021-11-17' AS Date), CAST(13265.1800000000 AS Decimal(18, 10)), 96, 5, 6, N'4011209000', 5, 366344, CAST(4537.1000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 96)
    INSERT @Registros VALUES (1712, 44, 7, 3, CAST(N'2021-11-17' AS Date), CAST(42194.3100000000 AS Decimal(18, 10)), 163, 3, 4, N'4011209000', 5, 539733, CAST(9052.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 163)
    INSERT @Registros VALUES (1713, 6, 7, 3, CAST(N'2021-11-17' AS Date), CAST(31170.4300000000 AS Decimal(18, 10)), 198, 5, 6, N'4011209000', 5, 631268, CAST(9486.2300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 198)
    INSERT @Registros VALUES (1714, 57, 12, 8, CAST(N'2021-11-18' AS Date), CAST(17399.0200000000 AS Decimal(18, 10)), 140, 5, 6, N'4011209000', 5, 341629, CAST(7780.6400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 140)
    INSERT @Registros VALUES (1715, 42, 7, 3, CAST(N'2021-11-18' AS Date), CAST(57575.1600000000 AS Decimal(18, 10)), 242, 2, 2, N'4011209000', 5, 425167, CAST(14041.9200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 242)
    INSERT @Registros VALUES (1716, 12, 1, 2, CAST(N'2021-11-18' AS Date), CAST(41197.9900000000 AS Decimal(18, 10)), 322, 5, 6, N'4011209000', 5, 944175, CAST(15300.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 322)
    INSERT @Registros VALUES (1717, 44, 7, 3, CAST(N'2021-11-22' AS Date), CAST(62090.7800000000 AS Decimal(18, 10)), 284, 3, 4, N'4011209000', 5, 313841, CAST(14998.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 284)
    INSERT @Registros VALUES (1718, 45, 7, 3, CAST(N'2021-11-23' AS Date), CAST(107300.2800000000 AS Decimal(18, 10)), 668, 20, 20, N'4011209000', 5, 422284, CAST(39417.7600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 668)
    INSERT @Registros VALUES (1719, 45, 7, 3, CAST(N'2021-11-23' AS Date), CAST(11033.9500000000 AS Decimal(18, 10)), 160, 16, 17, N'4011209000', 5, 733273, CAST(2059.4500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 160)
    INSERT @Registros VALUES (1720, 45, 7, 3, CAST(N'2021-11-24' AS Date), CAST(114748.2100000000 AS Decimal(18, 10)), 728, 20, 20, N'4011209000', 5, 29818, CAST(41767.4400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 728)
    INSERT @Registros VALUES (1721, 23, 7, 3, CAST(N'2021-11-24' AS Date), CAST(43863.4500000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 260039, CAST(13866.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1722, 59, 12, 8, CAST(N'2021-11-25' AS Date), CAST(32254.8600000000 AS Decimal(18, 10)), 187, 5, 6, N'4011209000', 5, 73111, CAST(10125.7200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 187)
    INSERT @Registros VALUES (1723, 22, 7, 3, CAST(N'2021-11-25' AS Date), CAST(37786.3600000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 553511, CAST(14460.6400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1724, 22, 7, 3, CAST(N'2021-11-25' AS Date), CAST(37620.8600000000 AS Decimal(18, 10)), 261, 5, 6, N'4011209000', 5, 553511, CAST(14396.3600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 261)
    INSERT @Registros VALUES (1725, 23, 7, 3, CAST(N'2021-11-25' AS Date), CAST(43367.7900000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 571350, CAST(13826.1000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1726, 20, 7, 3, CAST(N'2021-11-26' AS Date), CAST(17327.4100000000 AS Decimal(18, 10)), 400, 5, 6, N'4011209000', 5, 3477, CAST(5644.8700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 400)
    INSERT @Registros VALUES (1727, 51, 7, 3, CAST(N'2021-11-26' AS Date), CAST(118951.6800000000 AS Decimal(18, 10)), 772, 5, 6, N'4011209000', 5, 81096, CAST(43010.0300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 772)
    INSERT @Registros VALUES (1728, 51, 7, 3, CAST(N'2021-11-26' AS Date), CAST(13647.6800000000 AS Decimal(18, 10)), 76, 5, 6, N'4011209000', 5, 133293, CAST(3929.1700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 76)
    INSERT @Registros VALUES (1729, 7, 12, 8, CAST(N'2021-11-26' AS Date), CAST(2811.6000000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 5, 230014, CAST(951.7900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 60)
    INSERT @Registros VALUES (1730, 7, 12, 8, CAST(N'2021-11-26' AS Date), CAST(31949.5600000000 AS Decimal(18, 10)), 613, 3, 4, N'4011209000', 5, 230014, CAST(10815.6300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 613)
    INSERT @Registros VALUES (1731, 7, 12, 8, CAST(N'2021-11-26' AS Date), CAST(33304.6800000000 AS Decimal(18, 10)), 639, 3, 4, N'4011209000', 5, 514254, CAST(11306.4600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 639)
    INSERT @Registros VALUES (1732, 7, 12, 8, CAST(N'2021-11-26' AS Date), CAST(1772.0800000000 AS Decimal(18, 10)), 34, 3, 4, N'4011209000', 5, 514254, CAST(601.6000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 34)
    INSERT @Registros VALUES (1733, 43, 12, 8, CAST(N'2021-11-28' AS Date), CAST(30950.9500000000 AS Decimal(18, 10)), 240, 5, 6, N'4011209000', 5, 70196, CAST(13920.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 240)
    INSERT @Registros VALUES (1734, 57, 12, 8, CAST(N'2021-11-28' AS Date), CAST(20694.5800000000 AS Decimal(18, 10)), 220, 5, 6, N'4011209000', 5, 973268, CAST(10817.0100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 220)
    INSERT @Registros VALUES (1735, 47, 7, 3, CAST(N'2021-11-29' AS Date), CAST(2556.0200000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 5, 51165, CAST(500.3400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 30)
    INSERT @Registros VALUES (1736, 35, 12, 8, CAST(N'2021-11-29' AS Date), CAST(17687.8600000000 AS Decimal(18, 10)), 200, 5, 6, N'4011209000', 5, 208327, CAST(9926.2500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 200)
    INSERT @Registros VALUES (1737, 7, 12, 8, CAST(N'2021-11-29' AS Date), CAST(33721.6400000000 AS Decimal(18, 10)), 647, 3, 4, N'4011209000', 5, 250985, CAST(11448.0200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 647)
    INSERT @Registros VALUES (1738, 7, 12, 8, CAST(N'2021-11-29' AS Date), CAST(1355.1200000000 AS Decimal(18, 10)), 26, 3, 4, N'4011209000', 5, 250985, CAST(460.0500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 26)
    INSERT @Registros VALUES (1739, 26, 7, 3, CAST(N'2021-11-29' AS Date), CAST(95410.6600000000 AS Decimal(18, 10)), 516, 5, 6, N'4011209000', 5, 280469, CAST(29237.7000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 516)
    INSERT @Registros VALUES (1740, 42, 7, 3, CAST(N'2021-11-29' AS Date), CAST(52838.3000000000 AS Decimal(18, 10)), 357, 5, 6, N'4011209000', 5, 396674, CAST(15563.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 357)
    INSERT @Registros VALUES (1741, 6, 7, 3, CAST(N'2021-11-29' AS Date), CAST(6989.1400000000 AS Decimal(18, 10)), 56, 5, 6, N'4011209000', 5, 502924, CAST(1824.6800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 56)
    INSERT @Registros VALUES (1742, 61, 7, 3, CAST(N'2021-11-29' AS Date), CAST(44006.5400000000 AS Decimal(18, 10)), 270, 5, 6, N'4011209000', 5, 569912, CAST(13903.7400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 270)
    INSERT @Registros VALUES (1743, 29, 12, 8, CAST(N'2021-11-29' AS Date), CAST(27773.6400000000 AS Decimal(18, 10)), 240, 5, 6, N'4011209000', 5, 871446, CAST(14184.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 240)
    INSERT @Registros VALUES (1744, 23, 7, 3, CAST(N'2021-11-30' AS Date), CAST(8928.9900000000 AS Decimal(18, 10)), 40, 5, 6, N'4011209000', 5, 452213, CAST(2829.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 40)
    INSERT @Registros VALUES (1745, 23, 7, 3, CAST(N'2021-11-30' AS Date), CAST(26991.2300000000 AS Decimal(18, 10)), 155, 5, 6, N'4011209000', 5, 721921, CAST(8776.6500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 155)
    INSERT @Registros VALUES (1746, 61, 7, 3, CAST(N'2021-11-30' AS Date), CAST(43128.2000000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 888683, CAST(13639.7200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1747, 44, 7, 3, CAST(N'2021-12-01' AS Date), CAST(55601.8100000000 AS Decimal(18, 10)), 308, 3, 4, N'4011209000', 5, 188390, CAST(13953.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 308)
    INSERT @Registros VALUES (1748, 42, 7, 3, CAST(N'2021-12-02' AS Date), CAST(12642.3000000000 AS Decimal(18, 10)), 54, 2, 2, N'4011209000', 5, 163160, CAST(3108.3000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 54)
    INSERT @Registros VALUES (1749, 23, 7, 3, CAST(N'2021-12-03' AS Date), CAST(25353.5400000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 51565, CAST(6517.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1750, 45, 7, 3, CAST(N'2021-12-03' AS Date), CAST(89916.8300000000 AS Decimal(18, 10)), 320, 3, 4, N'4011209000', 5, 138581, CAST(22248.3200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 320)
    INSERT @Registros VALUES (1751, 45, 7, 3, CAST(N'2021-12-03' AS Date), CAST(27350.7300000000 AS Decimal(18, 10)), 354, 3, 4, N'4011209000', 5, 652841, CAST(5271.2100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 354)
    INSERT @Registros VALUES (1752, 6, 7, 3, CAST(N'2021-12-06' AS Date), CAST(26393.9300000000 AS Decimal(18, 10)), 148, 5, 23, N'4011209000', 5, 658824, CAST(8218.4400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 148)
    INSERT @Registros VALUES (1753, 51, 7, 3, CAST(N'2021-12-06' AS Date), CAST(67651.6900000000 AS Decimal(18, 10)), 490, 5, 6, N'4011209000', 5, 880880, CAST(20681.7300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 490)
    INSERT @Registros VALUES (1754, 51, 7, 3, CAST(N'2021-12-06' AS Date), CAST(5992.7000000000 AS Decimal(18, 10)), 30, 5, 6, N'4011209000', 5, 880880, CAST(1615.3200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 30)
    INSERT @Registros VALUES (1755, 45, 7, 3, CAST(N'2021-12-07' AS Date), CAST(107270.2200000000 AS Decimal(18, 10)), 681, 20, 20, N'4011209000', 5, 24, CAST(40381.2200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 681)
    INSERT @Registros VALUES (1756, 61, 7, 3, CAST(N'2021-12-08' AS Date), CAST(54012.9500000000 AS Decimal(18, 10)), 322, 5, 6, N'4011209000', 5, 153730, CAST(16650.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 322)
    INSERT @Registros VALUES (1757, 61, 7, 3, CAST(N'2021-12-09' AS Date), CAST(48296.5600000000 AS Decimal(18, 10)), 337, 5, 6, N'4011209000', 5, 66441, CAST(14147.2300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 337)
    INSERT @Registros VALUES (1758, 51, 7, 3, CAST(N'2021-12-10' AS Date), CAST(159.7600000000 AS Decimal(18, 10)), 2, 5, 6, N'4011209000', 5, 11168, CAST(45.2900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 2)
    INSERT @Registros VALUES (1759, 51, 7, 3, CAST(N'2021-12-10' AS Date), CAST(13743.0500000000 AS Decimal(18, 10)), 120, 5, 6, N'4011209000', 5, 11168, CAST(3959.5700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 120)
    INSERT @Registros VALUES (1760, 12, 1, 2, CAST(N'2021-12-10' AS Date), CAST(83509.2200000000 AS Decimal(18, 10)), 674, 5, 6, N'4011209000', 5, 74996, CAST(28062.9800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 674)
    INSERT @Registros VALUES (1761, 61, 7, 3, CAST(N'2021-12-10' AS Date), CAST(44862.5600000000 AS Decimal(18, 10)), 267, 5, 6, N'4011209000', 5, 952359, CAST(13731.5500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 267)
    INSERT @Registros VALUES (1762, 14, 4, 2, CAST(N'2021-12-13' AS Date), CAST(2267.0300000000 AS Decimal(18, 10)), 16, 5, 6, N'4011209000', 5, 70369, CAST(769.9400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 16)
    INSERT @Registros VALUES (1763, 9, 9, 5, CAST(N'2021-12-13' AS Date), CAST(23651.2700000000 AS Decimal(18, 10)), 102, 5, 6, N'4011209000', 5, 112779, CAST(6184.7400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 102)
    INSERT @Registros VALUES (1764, 37, 8, 4, CAST(N'2021-12-13' AS Date), CAST(56744.3800000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 5, 113008, CAST(14686.5600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 256)
    INSERT @Registros VALUES (1765, 30, 7, 3, CAST(N'2021-12-13' AS Date), CAST(68431.4700000000 AS Decimal(18, 10)), 354, 3, 4, N'4011209000', 5, 423823, CAST(16560.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 354)
    INSERT @Registros VALUES (1766, 35, 12, 8, CAST(N'2021-12-13' AS Date), CAST(4321.8200000000 AS Decimal(18, 10)), 204, 5, 6, N'4011209000', 5, 682931, CAST(2654.0200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 204)
    INSERT @Registros VALUES (1767, 30, 7, 3, CAST(N'2021-12-13' AS Date), CAST(501.7200000000 AS Decimal(18, 10)), 7, 3, 4, N'4011209000', 5, 815682, CAST(83.2300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 7)
    INSERT @Registros VALUES (1768, 64, 7, 3, CAST(N'2021-12-13' AS Date), CAST(49210.2400000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 884312, CAST(13960.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 280)
    INSERT @Registros VALUES (1769, 22, 7, 3, CAST(N'2021-12-14' AS Date), CAST(34185.0000000000 AS Decimal(18, 10)), 240, 5, 6, N'4011209000', 5, 104926, CAST(13766.6900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 240)
    INSERT @Registros VALUES (1770, 22, 7, 3, CAST(N'2021-12-14' AS Date), CAST(34930.3300000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 5, 104926, CAST(14067.9100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 248)
    INSERT @Registros VALUES (1771, 20, 7, 3, CAST(N'2021-12-14' AS Date), CAST(59346.6900000000 AS Decimal(18, 10)), 1130, 5, 6, N'4011209000', 5, 210983, CAST(13034.8500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 1130)
    INSERT @Registros VALUES (1772, 42, 7, 3, CAST(N'2021-12-14' AS Date), CAST(31430.0000000000 AS Decimal(18, 10)), 150, 2, 2, N'4011209000', 5, 298995, CAST(7215.0500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 150)
    INSERT @Registros VALUES (1773, 2, 12, 8, CAST(N'2021-12-14' AS Date), CAST(85443.0700000000 AS Decimal(18, 10)), 545, 5, 6, N'4011209000', 5, 339562, CAST(28760.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 545)
    INSERT @Registros VALUES (1774, 45, 7, 3, CAST(N'2021-12-14' AS Date), CAST(6777.9200000000 AS Decimal(18, 10)), 66, 3, 4, N'4011209000', 5, 370476, CAST(1326.4400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 66)
    INSERT @Registros VALUES (1775, 25, 7, 3, CAST(N'2021-12-14' AS Date), CAST(43222.8800000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 5, 958737, CAST(14810.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 256)
    INSERT @Registros VALUES (1776, 59, 12, 8, CAST(N'2021-12-15' AS Date), CAST(82577.8200000000 AS Decimal(18, 10)), 520, 5, 6, N'4011209000', 5, 13054, CAST(29400.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 520)
    INSERT @Registros VALUES (1777, 8, 7, 3, CAST(N'2021-12-15' AS Date), CAST(6258.2000000000 AS Decimal(18, 10)), 24, 5, 6, N'4011209000', 5, 73284, CAST(1572.1200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 24)
    INSERT @Registros VALUES (1778, 59, 12, 8, CAST(N'2021-12-15' AS Date), CAST(41763.1200000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 108567, CAST(14780.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 260)
    INSERT @Registros VALUES (1779, 59, 12, 8, CAST(N'2021-12-15' AS Date), CAST(41304.2200000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 150212, CAST(14720.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 260)
    INSERT @Registros VALUES (1780, 24, 12, 8, CAST(N'2021-12-15' AS Date), CAST(47253.9000000000 AS Decimal(18, 10)), 268, 5, 6, N'4011209000', 5, 627004, CAST(13936.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 268)
    INSERT @Registros VALUES (1781, 59, 12, 8, CAST(N'2021-12-15' AS Date), CAST(167233.3000000000 AS Decimal(18, 10)), 1016, 5, 6, N'4011209000', 5, 712714, CAST(58560.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 1016)
    INSERT @Registros VALUES (1782, 7, 12, 8, CAST(N'2021-12-15' AS Date), CAST(35076.7600000000 AS Decimal(18, 10)), 673, 3, 4, N'4011209000', 5, 914570, CAST(11908.0600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 673)
    INSERT @Registros VALUES (1783, 61, 7, 3, CAST(N'2021-12-15' AS Date), CAST(53051.0300000000 AS Decimal(18, 10)), 393, 5, 6, N'4011209000', 5, 970740, CAST(15660.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 393)
    INSERT @Registros VALUES (1784, 23, 7, 3, CAST(N'2021-12-16' AS Date), CAST(43908.4500000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 147001, CAST(13866.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1785, 61, 7, 3, CAST(N'2021-12-16' AS Date), CAST(44523.2000000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 749470, CAST(13639.7200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1786, 45, 7, 3, CAST(N'2021-12-17' AS Date), CAST(18991.6900000000 AS Decimal(18, 10)), 240, 14, 15, N'4011209000', 5, 78839, CAST(3669.0900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 240)
    INSERT @Registros VALUES (1787, 44, 7, 3, CAST(N'2021-12-17' AS Date), CAST(33735.8500000000 AS Decimal(18, 10)), 182, 5, 6, N'4011209000', 5, 162659, CAST(9817.7500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 182)
    INSERT @Registros VALUES (1788, 26, 7, 3, CAST(N'2021-12-17' AS Date), CAST(47759.0500000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 178958, CAST(14931.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1789, 61, 7, 3, CAST(N'2021-12-17' AS Date), CAST(47420.9400000000 AS Decimal(18, 10)), 286, 5, 6, N'4011209000', 5, 218164, CAST(12501.3800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 286)
    INSERT @Registros VALUES (1790, 61, 7, 3, CAST(N'2021-12-17' AS Date), CAST(43883.9200000000 AS Decimal(18, 10)), 224, 5, 6, N'4011209000', 5, 221905, CAST(11661.4400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 224)
    INSERT @Registros VALUES (1791, 30, 7, 3, CAST(N'2021-12-17' AS Date), CAST(87425.9100000000 AS Decimal(18, 10)), 310, 3, 4, N'4011209000', 5, 333509, CAST(18955.6800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 310)
    INSERT @Registros VALUES (1792, 44, 7, 3, CAST(N'2021-12-17' AS Date), CAST(51145.0700000000 AS Decimal(18, 10)), 255, 3, 4, N'4011209000', 5, 862941, CAST(12994.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1793, 44, 7, 3, CAST(N'2021-12-17' AS Date), CAST(16569.3900000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 5, 862941, CAST(3244.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 60)
    INSERT @Registros VALUES (1794, 22, 7, 3, CAST(N'2021-12-17' AS Date), CAST(8149.6700000000 AS Decimal(18, 10)), 40, 5, 21, N'4011209000', 5, 937781, CAST(1930.0500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 40)
    INSERT @Registros VALUES (1795, 6, 7, 3, CAST(N'2021-12-20' AS Date), CAST(49572.4000000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 5, 22765, CAST(14978.0800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 248)
    INSERT @Registros VALUES (1796, 51, 7, 3, CAST(N'2021-12-20' AS Date), CAST(33393.5500000000 AS Decimal(18, 10)), 174, 5, 6, N'4011209000', 5, 117865, CAST(10179.3600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 174)
    INSERT @Registros VALUES (1797, 51, 7, 3, CAST(N'2021-12-20' AS Date), CAST(19035.8500000000 AS Decimal(18, 10)), 140, 5, 6, N'4011209000', 5, 117865, CAST(5520.8100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 140)
    INSERT @Registros VALUES (1798, 47, 7, 3, CAST(N'2021-12-20' AS Date), CAST(4761.5800000000 AS Decimal(18, 10)), 29, 3, 4, N'4011209000', 5, 217305, CAST(895.2200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 29)
    INSERT @Registros VALUES (1799, 23, 7, 3, CAST(N'2021-12-21' AS Date), CAST(56028.2300000000 AS Decimal(18, 10)), 243, 3, 4, N'4011209000', 5, 90716, CAST(12433.6500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 243)
    INSERT @Registros VALUES (1800, 26, 7, 3, CAST(N'2021-12-21' AS Date), CAST(47009.7500000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 205350, CAST(15289.7200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1801, 61, 7, 3, CAST(N'2021-12-21' AS Date), CAST(22399.2100000000 AS Decimal(18, 10)), 263, 5, 6, N'4011209000', 5, 472627, CAST(5704.5100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 263)
    INSERT @Registros VALUES (1802, 27, 7, 3, CAST(N'2021-12-22' AS Date), CAST(4294.6000000000 AS Decimal(18, 10)), 44, 3, 4, N'4011209000', 5, 126197, CAST(729.9300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 44)
    INSERT @Registros VALUES (1803, 47, 7, 3, CAST(N'2021-12-22' AS Date), CAST(2717.7700000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 5, 398127, CAST(466.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 30)
    INSERT @Registros VALUES (1804, 45, 7, 3, CAST(N'2021-12-23' AS Date), CAST(14073.1100000000 AS Decimal(18, 10)), 58, 3, 4, N'4011209000', 5, 127662, CAST(2851.3600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 58)
    INSERT @Registros VALUES (1805, 2, 12, 8, CAST(N'2021-12-27' AS Date), CAST(46340.7300000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 173269, CAST(15220.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 260)
    INSERT @Registros VALUES (1806, 27, 7, 3, CAST(N'2021-12-27' AS Date), CAST(2094.5200000000 AS Decimal(18, 10)), 19, 1, 1, N'4011209000', 5, 304933, CAST(236.2200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 19)
    INSERT @Registros VALUES (1807, 44, 7, 3, CAST(N'2021-12-27' AS Date), CAST(57899.4800000000 AS Decimal(18, 10)), 284, 3, 4, N'4011209000', 5, 353081, CAST(14453.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 284)
    INSERT @Registros VALUES (1808, 45, 7, 3, CAST(N'2021-12-27' AS Date), CAST(14100.2900000000 AS Decimal(18, 10)), 108, 20, 20, N'4011209000', 5, 358804, CAST(5439.9600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 108)
    INSERT @Registros VALUES (1809, 27, 7, 3, CAST(N'2021-12-27' AS Date), CAST(572.2100000000 AS Decimal(18, 10)), 6, 3, 4, N'4011209000', 5, 631959, CAST(96.9600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 6)
    INSERT @Registros VALUES (1810, 47, 7, 3, CAST(N'2021-12-27' AS Date), CAST(2761.3800000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 5, 738405, CAST(558.6100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 30)
    INSERT @Registros VALUES (1811, 44, 7, 3, CAST(N'2021-12-27' AS Date), CAST(3133.7700000000 AS Decimal(18, 10)), 11, 3, 4, N'4011209000', 5, 743491, CAST(647.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 11)
    INSERT @Registros VALUES (1812, 42, 7, 3, CAST(N'2021-12-27' AS Date), CAST(54050.9100000000 AS Decimal(18, 10)), 345, 5, 6, N'4011209000', 5, 751643, CAST(15795.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 345)
    INSERT @Registros VALUES (1813, 42, 7, 3, CAST(N'2021-12-27' AS Date), CAST(1525.4400000000 AS Decimal(18, 10)), 8, 2, 2, N'4011209000', 5, 804806, CAST(357.3400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 8)
    INSERT @Registros VALUES (1814, 44, 7, 3, CAST(N'2021-12-27' AS Date), CAST(48843.3600000000 AS Decimal(18, 10)), 309, 5, 6, N'4011209000', 5, 843859, CAST(12692.6600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 309)
    INSERT @Registros VALUES (1815, 51, 7, 3, CAST(N'2021-12-27' AS Date), CAST(10554.6000000000 AS Decimal(18, 10)), 57, 5, 6, N'4011209000', 5, 870617, CAST(2771.6000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 57)
    INSERT @Registros VALUES (1816, 51, 7, 3, CAST(N'2021-12-28' AS Date), CAST(120800.0300000000 AS Decimal(18, 10)), 730, 5, 6, N'4011209000', 5, 21718, CAST(42143.9700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 730)
    INSERT @Registros VALUES (1817, 61, 7, 3, CAST(N'2021-12-28' AS Date), CAST(47084.8000000000 AS Decimal(18, 10)), 340, 5, 6, N'4011209000', 5, 113596, CAST(15440.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 340)
    INSERT @Registros VALUES (1818, 45, 7, 3, CAST(N'2021-12-28' AS Date), CAST(57563.4000000000 AS Decimal(18, 10)), 690, 3, 4, N'4011209000', 5, 125758, CAST(11024.0400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 690)
    INSERT @Registros VALUES (1819, 30, 7, 3, CAST(N'2021-12-28' AS Date), CAST(47240.6000000000 AS Decimal(18, 10)), 166, 3, 4, N'4011209000', 5, 168549, CAST(10128.3200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 166)
    INSERT @Registros VALUES (1820, 45, 7, 3, CAST(N'2021-12-28' AS Date), CAST(103811.1000000000 AS Decimal(18, 10)), 816, 20, 20, N'4011209000', 5, 450170, CAST(41101.9200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 816)
    INSERT @Registros VALUES (1821, 7, 12, 8, CAST(N'2021-12-28' AS Date), CAST(3514.5000000000 AS Decimal(18, 10)), 75, 3, 4, N'4011209000', 5, 483888, CAST(1013.5800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 75)
    INSERT @Registros VALUES (1822, 7, 12, 8, CAST(N'2021-12-28' AS Date), CAST(5055.6400000000 AS Decimal(18, 10)), 97, 3, 4, N'4011209000', 5, 483888, CAST(1458.0500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 97)
    INSERT @Registros VALUES (1823, 7, 12, 8, CAST(N'2021-12-28' AS Date), CAST(24367.2000000000 AS Decimal(18, 10)), 520, 3, 4, N'4011209000', 5, 483888, CAST(7027.4900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 520)
    INSERT @Registros VALUES (1824, 7, 12, 8, CAST(N'2021-12-28' AS Date), CAST(15797.4600000000 AS Decimal(18, 10)), 203, 3, 4, N'4011209000', 5, 483888, CAST(4555.9800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 203)
    INSERT @Registros VALUES (1825, 7, 12, 8, CAST(N'2021-12-28' AS Date), CAST(5597.6000000000 AS Decimal(18, 10)), 80, 3, 4, N'4011209000', 5, 483888, CAST(1614.3500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 80)
    INSERT @Registros VALUES (1826, 7, 12, 8, CAST(N'2021-12-28' AS Date), CAST(31536.7800000000 AS Decimal(18, 10)), 673, 3, 4, N'4011209000', 5, 715722, CAST(11330.5500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 673)
    INSERT @Registros VALUES (1827, 42, 7, 3, CAST(N'2021-12-28' AS Date), CAST(54225.4000000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 5, 943484, CAST(13418.0100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1828, 7, 12, 8, CAST(N'2021-12-28' AS Date), CAST(16260.4200000000 AS Decimal(18, 10)), 347, 3, 4, N'4011209000', 5, 958241, CAST(4117.9900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 347)
    INSERT @Registros VALUES (1829, 7, 12, 8, CAST(N'2021-12-28' AS Date), CAST(46692.0000000000 AS Decimal(18, 10)), 600, 3, 4, N'4011209000', 5, 958241, CAST(11824.8600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 600)
    INSERT @Registros VALUES (1830, 45, 7, 3, CAST(N'2021-12-29' AS Date), CAST(2754.0300000000 AS Decimal(18, 10)), 38, 14, 15, N'4011209000', 5, 297907, CAST(472.3000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 38)
    INSERT @Registros VALUES (1831, 12, 1, 2, CAST(N'2021-12-29' AS Date), CAST(43742.8300000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 772109, CAST(15120.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 280)
    INSERT @Registros VALUES (1832, 22, 7, 3, CAST(N'2021-12-30' AS Date), CAST(33297.2800000000 AS Decimal(18, 10)), 242, 5, 6, N'4011209000', 5, 8388, CAST(13540.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 242)
    INSERT @Registros VALUES (1833, 12, 1, 2, CAST(N'2021-12-30' AS Date), CAST(39589.3600000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 95471, CAST(13474.8000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1834, 30, 7, 3, CAST(N'2021-12-30' AS Date), CAST(5998.7000000000 AS Decimal(18, 10)), 18, 10, 13, N'4011209000', 5, 339449, CAST(1290.9900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 18)
    INSERT @Registros VALUES (1835, 61, 7, 3, CAST(N'2021-12-30' AS Date), CAST(43931.7900000000 AS Decimal(18, 10)), 268, 5, 6, N'4011209000', 5, 649779, CAST(13901.1100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 268)
    INSERT @Registros VALUES (1836, 45, 7, 3, CAST(N'2021-12-30' AS Date), CAST(13969.7100000000 AS Decimal(18, 10)), 181, 3, 4, N'4011209000', 5, 686059, CAST(2732.9100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 181)
    INSERT @Registros VALUES (1837, 6, 7, 3, CAST(N'2021-12-30' AS Date), CAST(17833.7300000000 AS Decimal(18, 10)), 100, 5, 6, N'4011209000', 5, 747374, CAST(5553.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1838, 51, 7, 3, CAST(N'2021-12-30' AS Date), CAST(91445.0600000000 AS Decimal(18, 10)), 612, 5, 6, N'4011209000', 5, 771603, CAST(33384.7500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 612)
    INSERT @Registros VALUES (1839, 6, 7, 3, CAST(N'2021-12-30' AS Date), CAST(48716.9000000000 AS Decimal(18, 10)), 268, 5, 6, N'4011209000', 5, 893376, CAST(15277.3600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 268)
    INSERT @Registros VALUES (1840, 45, 7, 3, CAST(N'2021-12-30' AS Date), CAST(76059.3200000000 AS Decimal(18, 10)), 418, 20, 20, N'4011209000', 5, 944294, CAST(27590.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 418)
    INSERT @Registros VALUES (1841, 30, 7, 3, CAST(N'2021-12-30' AS Date), CAST(86643.9400000000 AS Decimal(18, 10)), 310, 3, 4, N'4011209000', 5, 968810, CAST(18654.3100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 310)
    INSERT @Registros VALUES (1842, 44, 7, 3, CAST(N'2021-12-31' AS Date), CAST(72576.4700000000 AS Decimal(18, 10)), 332, 3, 4, N'4011209000', 5, 989717, CAST(15995.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 332)
    INSERT @Registros VALUES (1843, 12, 1, 2, CAST(N'2022-01-03' AS Date), CAST(15634.8000000000 AS Decimal(18, 10)), 86, 5, 6, N'4011209000', 5, 452943, CAST(5400.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 86)
    INSERT @Registros VALUES (1844, 24, 12, 8, CAST(N'2022-01-03' AS Date), CAST(47405.0000000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 955851, CAST(14766.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1845, 7, 12, 8, CAST(N'2022-01-04' AS Date), CAST(6507.4300000000 AS Decimal(18, 10)), 90, 3, 4, N'4011209000', 5, 437070, CAST(1116.9000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 90)
    INSERT @Registros VALUES (1846, 7, 12, 8, CAST(N'2022-01-04' AS Date), CAST(61459.0600000000 AS Decimal(18, 10)), 850, 3, 4, N'4011209000', 5, 437070, CAST(10548.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 850)
    INSERT @Registros VALUES (1847, 7, 12, 8, CAST(N'2022-01-04' AS Date), CAST(6507.4300000000 AS Decimal(18, 10)), 90, 3, 4, N'4011209000', 5, 437070, CAST(1116.9000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 90)
    INSERT @Registros VALUES (1848, 7, 12, 8, CAST(N'2022-01-04' AS Date), CAST(61459.0600000000 AS Decimal(18, 10)), 850, 3, 4, N'4011209000', 5, 437070, CAST(10548.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 850)
    INSERT @Registros VALUES (1849, 45, 7, 3, CAST(N'2022-01-04' AS Date), CAST(33205.3000000000 AS Decimal(18, 10)), 255, 3, 4, N'4011209000', 5, 915849, CAST(6765.9200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1850, 30, 7, 3, CAST(N'2022-01-05' AS Date), CAST(87605.3700000000 AS Decimal(18, 10)), 314, 3, 4, N'4011209000', 5, 371646, CAST(19222.9000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 314)
    INSERT @Registros VALUES (1851, 42, 7, 3, CAST(N'2022-01-05' AS Date), CAST(52261.2000000000 AS Decimal(18, 10)), 240, 3, 4, N'4011209000', 5, 414066, CAST(13120.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 240)
    INSERT @Registros VALUES (1852, 42, 7, 3, CAST(N'2022-01-05' AS Date), CAST(59555.8000000000 AS Decimal(18, 10)), 260, 3, 4, N'4011209000', 5, 543351, CAST(14683.9400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 260)
    INSERT @Registros VALUES (1853, 30, 7, 3, CAST(N'2022-01-05' AS Date), CAST(244.2800000000 AS Decimal(18, 10)), 3, 3, 4, N'4011209000', 5, 545928, CAST(35.4700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 3)
    INSERT @Registros VALUES (1854, 30, 7, 3, CAST(N'2022-01-05' AS Date), CAST(14089.4200000000 AS Decimal(18, 10)), 62, 3, 4, N'4011209000', 5, 545928, CAST(3194.2400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 62)
    INSERT @Registros VALUES (1855, 7, 12, 8, CAST(N'2022-01-05' AS Date), CAST(7250.0600000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 683532, CAST(1241.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1856, 7, 12, 8, CAST(N'2022-01-05' AS Date), CAST(60900.5300000000 AS Decimal(18, 10)), 840, 3, 4, N'4011209000', 5, 683532, CAST(10424.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 840)
    INSERT @Registros VALUES (1857, 42, 7, 3, CAST(N'2022-01-05' AS Date), CAST(54414.6000000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 5, 861572, CAST(13480.5600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1858, 22, 7, 3, CAST(N'2022-01-07' AS Date), CAST(31253.6500000000 AS Decimal(18, 10)), 236, 5, 6, N'4011209000', 5, 29638, CAST(12455.7600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 236)
    INSERT @Registros VALUES (1859, 22, 7, 3, CAST(N'2022-01-07' AS Date), CAST(27746.3100000000 AS Decimal(18, 10)), 210, 5, 6, N'4011209000', 5, 29638, CAST(11062.4400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 210)
    INSERT @Registros VALUES (1860, 51, 7, 3, CAST(N'2022-01-07' AS Date), CAST(4114.6900000000 AS Decimal(18, 10)), 23, 5, 6, N'4011209000', 5, 282342, CAST(1153.7500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 23)
    INSERT @Registros VALUES (1861, 51, 7, 3, CAST(N'2022-01-07' AS Date), CAST(23382.9300000000 AS Decimal(18, 10)), 125, 5, 6, N'4011209000', 5, 628934, CAST(7571.9800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 125)
    INSERT @Registros VALUES (1862, 51, 7, 3, CAST(N'2022-01-07' AS Date), CAST(16781.0100000000 AS Decimal(18, 10)), 133, 5, 6, N'4011209000', 5, 628934, CAST(5113.2700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 133)
    INSERT @Registros VALUES (1863, 22, 7, 3, CAST(N'2022-01-07' AS Date), CAST(32931.7000000000 AS Decimal(18, 10)), 240, 5, 6, N'4011209000', 5, 736974, CAST(12854.0100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 240)
    INSERT @Registros VALUES (1864, 22, 7, 3, CAST(N'2022-01-07' AS Date), CAST(32962.0000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 736974, CAST(12865.9900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1865, 22, 7, 3, CAST(N'2022-01-07' AS Date), CAST(32775.7100000000 AS Decimal(18, 10)), 242, 5, 6, N'4011209000', 5, 875407, CAST(12506.9200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 242)
    INSERT @Registros VALUES (1866, 22, 7, 3, CAST(N'2022-01-07' AS Date), CAST(2979.8600000000 AS Decimal(18, 10)), 40, 5, 6, N'4011209000', 5, 875407, CAST(1136.3800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 40)
    INSERT @Registros VALUES (1867, 22, 7, 3, CAST(N'2022-01-07' AS Date), CAST(9977.5700000000 AS Decimal(18, 10)), 72, 5, 6, N'4011209000', 5, 875407, CAST(3804.9900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 72)
    INSERT @Registros VALUES (1868, 51, 7, 3, CAST(N'2022-01-07' AS Date), CAST(64398.1900000000 AS Decimal(18, 10)), 552, 5, 6, N'4011209000', 5, 976798, CAST(23708.5500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 552)
    INSERT @Registros VALUES (1869, 23, 7, 3, CAST(N'2022-01-10' AS Date), CAST(46169.0400000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 408691, CAST(15080.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 266)
    INSERT @Registros VALUES (1870, 45, 7, 3, CAST(N'2022-01-11' AS Date), CAST(41030.6500000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 28604, CAST(14100.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 264)
    INSERT @Registros VALUES (1871, 23, 7, 3, CAST(N'2022-01-11' AS Date), CAST(43951.5500000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 347337, CAST(13826.1000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1872, 8, 7, 3, CAST(N'2022-01-11' AS Date), CAST(4671.0900000000 AS Decimal(18, 10)), 20, 5, 6, N'4011209000', 5, 401933, CAST(1204.3600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 20)
    INSERT @Registros VALUES (1873, 45, 7, 3, CAST(N'2022-01-11' AS Date), CAST(41296.4300000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 495933, CAST(13900.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 264)
    INSERT @Registros VALUES (1874, 30, 7, 3, CAST(N'2022-01-11' AS Date), CAST(644.1300000000 AS Decimal(18, 10)), 9, 3, 4, N'4011209000', 5, 606248, CAST(106.4100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 9)
    INSERT @Registros VALUES (1875, 23, 7, 3, CAST(N'2022-01-11' AS Date), CAST(44447.7300000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 622457, CAST(13935.7500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (1876, 12, 1, 2, CAST(N'2022-01-11' AS Date), CAST(39088.0200000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 678773, CAST(13168.1600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 264)
    INSERT @Registros VALUES (1877, 64, 7, 3, CAST(N'2022-01-11' AS Date), CAST(48692.4400000000 AS Decimal(18, 10)), 291, 5, 6, N'4011209000', 5, 693735, CAST(15940.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 291)
    INSERT @Registros VALUES (1878, 12, 1, 2, CAST(N'2022-01-11' AS Date), CAST(43085.5900000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 725787, CAST(14960.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 260)
    INSERT @Registros VALUES (1879, 61, 7, 3, CAST(N'2022-01-12' AS Date), CAST(51242.4500000000 AS Decimal(18, 10)), 258, 5, 6, N'4011209000', 5, 489898, CAST(13674.4800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 258)
    INSERT @Registros VALUES (1880, 12, 1, 2, CAST(N'2022-01-12' AS Date), CAST(40645.1900000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 638728, CAST(13843.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1881, 61, 7, 3, CAST(N'2022-01-12' AS Date), CAST(56471.8700000000 AS Decimal(18, 10)), 300, 5, 6, N'4011209000', 5, 678943, CAST(15240.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 300)
    INSERT @Registros VALUES (1882, 12, 1, 2, CAST(N'2022-01-12' AS Date), CAST(41121.6300000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 989197, CAST(14023.9200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 260)
    INSERT @Registros VALUES (1883, 12, 1, 2, CAST(N'2022-01-13' AS Date), CAST(42552.9200000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 5, 87668, CAST(14840.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 256)
    INSERT @Registros VALUES (1884, 15, 7, 3, CAST(N'2022-01-13' AS Date), CAST(14531.5500000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 5, 620361, CAST(3397.3100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 60)
    INSERT @Registros VALUES (1885, 7, 12, 8, CAST(N'2022-01-14' AS Date), CAST(25952.1100000000 AS Decimal(18, 10)), 493, 3, 4, N'4011209000', 5, 486333, CAST(8723.1400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 493)
    INSERT @Registros VALUES (1886, 7, 12, 8, CAST(N'2022-01-14' AS Date), CAST(9317.4900000000 AS Decimal(18, 10)), 177, 3, 4, N'4011209000', 5, 486333, CAST(3131.8400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 177)
    INSERT @Registros VALUES (1887, 45, 7, 3, CAST(N'2022-01-17' AS Date), CAST(90833.5400000000 AS Decimal(18, 10)), 594, 20, 20, N'4011209000', 5, 225867, CAST(33395.7200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 594)
    INSERT @Registros VALUES (1888, 24, 12, 8, CAST(N'2022-01-17' AS Date), CAST(47203.9000000000 AS Decimal(18, 10)), 268, 5, 6, N'4011209000', 5, 462224, CAST(13936.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 268)
    INSERT @Registros VALUES (1889, 42, 7, 3, CAST(N'2022-01-18' AS Date), CAST(35913.3600000000 AS Decimal(18, 10)), 222, 19, 1, N'4011209000', 5, 115872, CAST(7989.4900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 222)
    INSERT @Registros VALUES (1890, 42, 7, 3, CAST(N'2022-01-18' AS Date), CAST(5756.6400000000 AS Decimal(18, 10)), 30, 9, 1, N'4011209000', 5, 115872, CAST(1280.6500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 30)
    INSERT @Registros VALUES (1891, 57, 12, 8, CAST(N'2022-01-18' AS Date), CAST(41597.9600000000 AS Decimal(18, 10)), 246, 5, 6, N'4011209000', 5, 892695, CAST(16257.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 246)
    INSERT @Registros VALUES (1892, 45, 7, 3, CAST(N'2022-01-18' AS Date), CAST(86836.0700000000 AS Decimal(18, 10)), 595, 20, 20, N'4011209000', 5, 904499, CAST(32151.1800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 595)
    INSERT @Registros VALUES (1893, 59, 12, 8, CAST(N'2022-01-19' AS Date), CAST(42938.5900000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 5, 562693, CAST(14480.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 252)
    INSERT @Registros VALUES (1894, 7, 12, 8, CAST(N'2022-01-19' AS Date), CAST(14198.5800000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 5, 573490, CAST(4337.8100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 300)
    INSERT @Registros VALUES (1895, 7, 12, 8, CAST(N'2022-01-19' AS Date), CAST(23056.8400000000 AS Decimal(18, 10)), 438, 3, 4, N'4011209000', 5, 573490, CAST(7044.1000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 438)
    INSERT @Registros VALUES (1896, 7, 12, 8, CAST(N'2022-01-19' AS Date), CAST(12104.1200000000 AS Decimal(18, 10)), 154, 3, 4, N'4011209000', 5, 573490, CAST(3697.9300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 154)
    INSERT @Registros VALUES (1897, 61, 7, 3, CAST(N'2022-01-19' AS Date), CAST(45971.3200000000 AS Decimal(18, 10)), 300, 5, 6, N'4011209000', 5, 881550, CAST(14283.2800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 300)
    INSERT @Registros VALUES (1898, 12, 1, 2, CAST(N'2022-01-20' AS Date), CAST(81717.7100000000 AS Decimal(18, 10)), 524, 5, 6, N'4011209000', 5, 408632, CAST(26841.3500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 524)
    INSERT @Registros VALUES (1899, 22, 7, 3, CAST(N'2022-01-20' AS Date), CAST(35668.5200000000 AS Decimal(18, 10)), 240, 5, 6, N'4011209000', 5, 410376, CAST(13920.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 240)
    INSERT @Registros VALUES (1900, 45, 7, 3, CAST(N'2022-01-20' AS Date), CAST(19760.3000000000 AS Decimal(18, 10)), 232, 14, 15, N'4011209000', 5, 517310, CAST(4160.5600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 232)
    INSERT @Registros VALUES (1901, 8, 7, 3, CAST(N'2022-01-20' AS Date), CAST(18762.4400000000 AS Decimal(18, 10)), 112, 5, 6, N'4011209000', 5, 895655, CAST(4689.8100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 112)
    INSERT @Registros VALUES (1902, 61, 7, 3, CAST(N'2022-01-21' AS Date), CAST(45256.5700000000 AS Decimal(18, 10)), 326, 5, 6, N'4011209000', 5, 14484, CAST(14358.7000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 326)
    INSERT @Registros VALUES (1903, 37, 8, 4, CAST(N'2022-01-21' AS Date), CAST(58265.1600000000 AS Decimal(18, 10)), 259, 5, 6, N'4011209000', 5, 95262, CAST(14888.8600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 259)
    INSERT @Registros VALUES (1904, 51, 7, 3, CAST(N'2022-01-21' AS Date), CAST(2086.0100000000 AS Decimal(18, 10)), 8, 5, 6, N'4011209000', 5, 281780, CAST(568.6700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 8)
    INSERT @Registros VALUES (1905, 51, 7, 3, CAST(N'2022-01-21' AS Date), CAST(2574.8300000000 AS Decimal(18, 10)), 30, 5, 6, N'4011209000', 5, 281780, CAST(679.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 30)
    INSERT @Registros VALUES (1906, 61, 7, 3, CAST(N'2022-01-21' AS Date), CAST(45866.2800000000 AS Decimal(18, 10)), 294, 5, 6, N'4011209000', 5, 633049, CAST(13863.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 294)
    INSERT @Registros VALUES (1907, 26, 7, 3, CAST(N'2022-01-21' AS Date), CAST(47440.9000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 909564, CAST(14790.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1908, 47, 7, 3, CAST(N'2022-01-21' AS Date), CAST(6024.2000000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 5, 916410, CAST(1053.5400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 60)
    INSERT @Registros VALUES (1909, 22, 7, 3, CAST(N'2022-01-21' AS Date), CAST(31352.0400000000 AS Decimal(18, 10)), 224, 5, 6, N'4011209000', 5, 923100, CAST(11961.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 224)
    INSERT @Registros VALUES (1910, 30, 7, 3, CAST(N'2022-01-24' AS Date), CAST(1841.3600000000 AS Decimal(18, 10)), 24, 3, 4, N'4011209000', 5, 403604, CAST(357.4800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 24)
    INSERT @Registros VALUES (1911, 8, 7, 3, CAST(N'2022-01-24' AS Date), CAST(10039.6500000000 AS Decimal(18, 10)), 68, 5, 6, N'4011209000', 5, 923704, CAST(2575.0500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 68)
    INSERT @Registros VALUES (1912, 44, 7, 3, CAST(N'2022-01-25' AS Date), CAST(71073.0600000000 AS Decimal(18, 10)), 286, 3, 4, N'4011209000', 5, 461743, CAST(16267.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 286)
    INSERT @Registros VALUES (1913, 44, 7, 3, CAST(N'2022-01-25' AS Date), CAST(58514.0700000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 5, 967927, CAST(15039.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 300)
    INSERT @Registros VALUES (1914, 61, 7, 3, CAST(N'2022-01-26' AS Date), CAST(43471.9000000000 AS Decimal(18, 10)), 287, 5, 6, N'4011209000', 5, 397289, CAST(13846.9200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 287)
    INSERT @Registros VALUES (1915, 59, 12, 8, CAST(N'2022-01-26' AS Date), CAST(127870.0800000000 AS Decimal(18, 10)), 780, 5, 6, N'4011209000', 5, 461483, CAST(44070.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 780)
    INSERT @Registros VALUES (1916, 23, 7, 3, CAST(N'2022-01-26' AS Date), CAST(9385.3600000000 AS Decimal(18, 10)), 39, 3, 4, N'4011209000', 5, 551442, CAST(2541.6300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 39)
    INSERT @Registros VALUES (1917, 23, 7, 3, CAST(N'2022-01-26' AS Date), CAST(1521.2100000000 AS Decimal(18, 10)), 6, 3, 4, N'4011209000', 5, 551442, CAST(391.0200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 6)
    INSERT @Registros VALUES (1918, 23, 7, 3, CAST(N'2022-01-26' AS Date), CAST(23207.2000000000 AS Decimal(18, 10)), 79, 3, 4, N'4011209000', 5, 551442, CAST(5411.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 79)
    INSERT @Registros VALUES (1919, 23, 7, 3, CAST(N'2022-01-26' AS Date), CAST(25191.1800000000 AS Decimal(18, 10)), 92, 3, 4, N'4011209000', 5, 551442, CAST(5995.6400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 92)
    INSERT @Registros VALUES (1920, 23, 7, 3, CAST(N'2022-01-28' AS Date), CAST(47378.7100000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 305366, CAST(16240.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 260)
    INSERT @Registros VALUES (1921, 7, 12, 8, CAST(N'2022-01-28' AS Date), CAST(19241.7500000000 AS Decimal(18, 10)), 275, 3, 4, N'4011209000', 5, 768977, CAST(4330.8800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 275)
    INSERT @Registros VALUES (1922, 7, 12, 8, CAST(N'2022-01-28' AS Date), CAST(1749.2500000000 AS Decimal(18, 10)), 25, 3, 4, N'4011209000', 5, 768977, CAST(393.7200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 25)
    INSERT @Registros VALUES (1923, 7, 12, 8, CAST(N'2022-01-28' AS Date), CAST(26536.6200000000 AS Decimal(18, 10)), 341, 3, 4, N'4011209000', 5, 768977, CAST(5972.7900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 341)
    INSERT @Registros VALUES (1924, 7, 12, 8, CAST(N'2022-01-28' AS Date), CAST(25602.7800000000 AS Decimal(18, 10)), 329, 3, 4, N'4011209000', 5, 768977, CAST(5762.6000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 329)
    INSERT @Registros VALUES (1925, 61, 7, 3, CAST(N'2022-01-28' AS Date), CAST(45132.3800000000 AS Decimal(18, 10)), 288, 5, 6, N'4011209000', 5, 773059, CAST(13962.5900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 288)
    INSERT @Registros VALUES (1926, 64, 7, 3, CAST(N'2022-01-31' AS Date), CAST(96532.2200000000 AS Decimal(18, 10)), 582, 5, 6, N'4011209000', 5, 8025, CAST(31460.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 582)
    INSERT @Registros VALUES (1927, 45, 7, 3, CAST(N'2022-01-31' AS Date), CAST(11158.2200000000 AS Decimal(18, 10)), 45, 3, 4, N'4011209000', 5, 701614, CAST(2155.0200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 45)
    INSERT @Registros VALUES (1928, 45, 7, 3, CAST(N'2022-01-31' AS Date), CAST(3358.4800000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 5, 701614, CAST(648.6300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 12)
    INSERT @Registros VALUES (1929, 45, 7, 3, CAST(N'2022-01-31' AS Date), CAST(9138.6500000000 AS Decimal(18, 10)), 110, 3, 4, N'4011209000', 5, 701614, CAST(1764.9700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 110)
    INSERT @Registros VALUES (1930, 30, 7, 3, CAST(N'2022-01-31' AS Date), CAST(47507.7500000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 769711, CAST(16719.2400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 264)
    INSERT @Registros VALUES (1931, 30, 7, 3, CAST(N'2022-01-31' AS Date), CAST(46469.1600000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 844782, CAST(16061.7600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 264)
    INSERT @Registros VALUES (1932, 51, 7, 3, CAST(N'2022-01-31' AS Date), CAST(35835.9000000000 AS Decimal(18, 10)), 215, 5, 6, N'4011209000', 5, 927124, CAST(11971.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 215)
    INSERT @Registros VALUES (1933, 51, 7, 3, CAST(N'2022-01-31' AS Date), CAST(23548.6300000000 AS Decimal(18, 10)), 160, 5, 6, N'4011209000', 5, 927124, CAST(7135.7200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 160)
    INSERT @Registros VALUES (1934, 51, 7, 3, CAST(N'2022-01-31' AS Date), CAST(30720.7800000000 AS Decimal(18, 10)), 199, 5, 6, N'4011209000', 5, 927124, CAST(9881.5400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 199)
    INSERT @Registros VALUES (1935, 51, 7, 3, CAST(N'2022-01-31' AS Date), CAST(3732.5000000000 AS Decimal(18, 10)), 20, 5, 6, N'4011209000', 5, 927124, CAST(976.1400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 20)
    INSERT @Registros VALUES (1936, 6, 7, 3, CAST(N'2022-01-31' AS Date), CAST(32019.4600000000 AS Decimal(18, 10)), 246, 5, 6, N'4011209000', 5, 996379, CAST(8901.7300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 246)
    INSERT @Registros VALUES (1937, 12, 1, 2, CAST(N'2022-02-01' AS Date), CAST(43646.5600000000 AS Decimal(18, 10)), 354, 5, 6, N'4011209000', 5, 130096, CAST(14285.4300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 354)
    INSERT @Registros VALUES (1938, 46, 7, 3, CAST(N'2022-02-01' AS Date), CAST(34352.7800000000 AS Decimal(18, 10)), 164, 5, 6, N'4011209000', 5, 742432, CAST(8958.2800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 164)
    INSERT @Registros VALUES (1939, 8, 7, 3, CAST(N'2022-02-01' AS Date), CAST(28943.8900000000 AS Decimal(18, 10)), 130, 5, 6, N'4011209000', 5, 954292, CAST(7466.7600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 130)
    INSERT @Registros VALUES (1940, 51, 7, 3, CAST(N'2022-02-02' AS Date), CAST(36060.4500000000 AS Decimal(18, 10)), 230, 5, 6, N'4011209000', 5, 283887, CAST(11780.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 230)
    INSERT @Registros VALUES (1941, 51, 7, 3, CAST(N'2022-02-02' AS Date), CAST(21543.6100000000 AS Decimal(18, 10)), 100, 5, 6, N'4011209000', 5, 318728, CAST(6951.9100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (1942, 51, 7, 3, CAST(N'2022-02-02' AS Date), CAST(87545.9300000000 AS Decimal(18, 10)), 562, 5, 6, N'4011209000', 5, 318728, CAST(32397.0900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 562)
    INSERT @Registros VALUES (1943, 7, 12, 8, CAST(N'2022-02-02' AS Date), CAST(30271.9800000000 AS Decimal(18, 10)), 389, 3, 4, N'4011209000', 5, 400231, CAST(6803.8800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 389)
    INSERT @Registros VALUES (1944, 7, 12, 8, CAST(N'2022-02-02' AS Date), CAST(3579.7200000000 AS Decimal(18, 10)), 46, 3, 4, N'4011209000', 5, 400231, CAST(804.5700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 46)
    INSERT @Registros VALUES (1945, 7, 12, 8, CAST(N'2022-02-02' AS Date), CAST(839.6400000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 5, 400231, CAST(188.7200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 12)
    INSERT @Registros VALUES (1946, 7, 12, 8, CAST(N'2022-02-02' AS Date), CAST(15603.3100000000 AS Decimal(18, 10)), 223, 3, 4, N'4011209000', 5, 400231, CAST(3506.9700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 223)
    INSERT @Registros VALUES (1947, 30, 7, 3, CAST(N'2022-02-03' AS Date), CAST(57066.2400000000 AS Decimal(18, 10)), 202, 3, 4, N'4011209000', 5, 197562, CAST(12476.5100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 202)
    INSERT @Registros VALUES (1948, 12, 1, 2, CAST(N'2022-02-03' AS Date), CAST(42549.6400000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 664956, CAST(14940.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 266)
    INSERT @Registros VALUES (1949, 22, 7, 3, CAST(N'2022-02-04' AS Date), CAST(62851.1500000000 AS Decimal(18, 10)), 473, 5, 6, N'4011209000', 5, 116345, CAST(25200.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 473)
    INSERT @Registros VALUES (1950, 26, 7, 3, CAST(N'2022-02-04' AS Date), CAST(49420.3300000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 500637, CAST(15023.7300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 250)
    INSERT @Registros VALUES (1951, 47, 7, 3, CAST(N'2022-02-04' AS Date), CAST(6738.3400000000 AS Decimal(18, 10)), 70, 3, 4, N'4011209000', 5, 692070, CAST(1343.7400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 70)
    INSERT @Registros VALUES (1952, 51, 7, 3, CAST(N'2022-02-04' AS Date), CAST(21971.9100000000 AS Decimal(18, 10)), 230, 5, 6, N'4011209000', 5, 748280, CAST(6270.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 230)
    INSERT @Registros VALUES (1953, 51, 7, 3, CAST(N'2022-02-04' AS Date), CAST(17623.1000000000 AS Decimal(18, 10)), 101, 5, 6, N'4011209000', 5, 748280, CAST(5303.8600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 101)
    INSERT @Registros VALUES (1954, 30, 7, 3, CAST(N'2022-02-07' AS Date), CAST(41305.0000000000 AS Decimal(18, 10)), 178, 20, 13, N'4011209000', 5, 292157, CAST(11001.1500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 178)
    INSERT @Registros VALUES (1955, 44, 7, 3, CAST(N'2022-02-08' AS Date), CAST(80925.2600000000 AS Decimal(18, 10)), 442, 5, 6, N'4011209000', 5, 11717, CAST(24604.7700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 442)
    INSERT @Registros VALUES (1956, 63, 12, 8, CAST(N'2022-02-08' AS Date), CAST(26826.1200000000 AS Decimal(18, 10)), 297, 5, 6, N'4011209000', 5, 166795, CAST(8239.2100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 297)
    INSERT @Registros VALUES (1957, 45, 7, 3, CAST(N'2022-02-08' AS Date), CAST(5974.6800000000 AS Decimal(18, 10)), 90, 16, 17, N'4011209000', 5, 286650, CAST(1102.6600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 90)
    INSERT @Registros VALUES (1958, 45, 7, 3, CAST(N'2022-02-08' AS Date), CAST(95810.8500000000 AS Decimal(18, 10)), 506, 20, 20, N'4011209000', 5, 420350, CAST(34389.9400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 506)
    INSERT @Registros VALUES (1959, 12, 1, 2, CAST(N'2022-02-08' AS Date), CAST(5269.6800000000 AS Decimal(18, 10)), 24, 14, 15, N'4011209000', 5, 427078, CAST(1446.0500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 24)
    INSERT @Registros VALUES (1960, 12, 1, 2, CAST(N'2022-02-08' AS Date), CAST(2636.9800000000 AS Decimal(18, 10)), 12, 14, 15, N'4011209000', 5, 427078, CAST(723.1400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 12)
    INSERT @Registros VALUES (1961, 61, 7, 3, CAST(N'2022-02-08' AS Date), CAST(45286.6000000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 570662, CAST(14598.2600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1962, 26, 7, 3, CAST(N'2022-02-08' AS Date), CAST(47242.1400000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 5, 603304, CAST(14400.6900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 248)
    INSERT @Registros VALUES (1963, 51, 7, 3, CAST(N'2022-02-08' AS Date), CAST(4551.3500000000 AS Decimal(18, 10)), 27, 5, 6, N'4011209000', 5, 688325, CAST(1333.1800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 27)
    INSERT @Registros VALUES (1964, 64, 7, 3, CAST(N'2022-02-09' AS Date), CAST(94801.6400000000 AS Decimal(18, 10)), 528, 5, 6, N'4011209000', 5, 37521, CAST(30000.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 528)
    INSERT @Registros VALUES (1965, 44, 7, 3, CAST(N'2022-02-09' AS Date), CAST(4994.4300000000 AS Decimal(18, 10)), 38, 3, 4, N'4011209000', 5, 229462, CAST(906.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 38)
    INSERT @Registros VALUES (1966, 44, 7, 3, CAST(N'2022-02-09' AS Date), CAST(4136.3800000000 AS Decimal(18, 10)), 28, 3, 4, N'4011209000', 5, 229462, CAST(635.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 28)
    INSERT @Registros VALUES (1967, 42, 7, 3, CAST(N'2022-02-09' AS Date), CAST(53703.2200000000 AS Decimal(18, 10)), 242, 3, 4, N'4011209000', 5, 727116, CAST(13357.9100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 242)
    INSERT @Registros VALUES (1968, 42, 7, 3, CAST(N'2022-02-09' AS Date), CAST(9461.6600000000 AS Decimal(18, 10)), 110, 16, 17, N'4011209000', 5, 921228, CAST(1616.2300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 110)
    INSERT @Registros VALUES (1969, 45, 7, 3, CAST(N'2022-02-10' AS Date), CAST(2577.4900000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 5, 458185, CAST(488.6000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 20)
    INSERT @Registros VALUES (1970, 45, 7, 3, CAST(N'2022-02-10' AS Date), CAST(43470.5300000000 AS Decimal(18, 10)), 516, 3, 4, N'4011209000', 5, 458185, CAST(8240.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 516)
    INSERT @Registros VALUES (1971, 7, 12, 8, CAST(N'2022-02-14' AS Date), CAST(53228.8800000000 AS Decimal(18, 10)), 684, 3, 4, N'4011209000', 5, 125160, CAST(12102.7000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 684)
    INSERT @Registros VALUES (1972, 42, 7, 3, CAST(N'2022-02-14' AS Date), CAST(41193.0000000000 AS Decimal(18, 10)), 164, 2, 2, N'4011209000', 5, 338139, CAST(9180.3600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 164)
    INSERT @Registros VALUES (1973, 61, 7, 3, CAST(N'2022-02-15' AS Date), CAST(42687.8200000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 205639, CAST(13686.8800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1974, 30, 7, 3, CAST(N'2022-02-15' AS Date), CAST(39426.9300000000 AS Decimal(18, 10)), 150, 3, 4, N'4011209000', 5, 408997, CAST(8963.5500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 150)
    INSERT @Registros VALUES (1975, 30, 7, 3, CAST(N'2022-02-15' AS Date), CAST(1313.4300000000 AS Decimal(18, 10)), 13, 3, 4, N'4011209000', 5, 408997, CAST(183.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 13)
    INSERT @Registros VALUES (1976, 61, 7, 3, CAST(N'2022-02-15' AS Date), CAST(44504.1100000000 AS Decimal(18, 10)), 321, 5, 6, N'4011209000', 5, 993045, CAST(13994.1800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 321)
    INSERT @Registros VALUES (1977, 7, 12, 8, CAST(N'2022-02-16' AS Date), CAST(3629.7200000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 58716, CAST(620.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 50)
    INSERT @Registros VALUES (1978, 7, 12, 8, CAST(N'2022-02-16' AS Date), CAST(64608.8700000000 AS Decimal(18, 10)), 890, 3, 4, N'4011209000', 5, 58716, CAST(11044.9000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 890)
    INSERT @Registros VALUES (1979, 7, 12, 8, CAST(N'2022-02-17' AS Date), CAST(53761.1600000000 AS Decimal(18, 10)), 684, 3, 4, N'4011209000', 5, 550605, CAST(12102.7000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 684)
    INSERT @Registros VALUES (1980, 12, 1, 2, CAST(N'2022-02-17' AS Date), CAST(43225.7100000000 AS Decimal(18, 10)), 318, 5, 6, N'4011209000', 5, 915071, CAST(14297.6900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 318)
    INSERT @Registros VALUES (1981, 61, 7, 3, CAST(N'2022-02-17' AS Date), CAST(45335.3400000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 917560, CAST(14030.8600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (1982, 8, 7, 3, CAST(N'2022-02-17' AS Date), CAST(25154.2700000000 AS Decimal(18, 10)), 116, 5, 6, N'4011209000', 5, 930310, CAST(7254.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 116)
    INSERT @Registros VALUES (1983, 61, 7, 3, CAST(N'2022-02-18' AS Date), CAST(46870.9500000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 5, 663591, CAST(15720.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 256)
    INSERT @Registros VALUES (1984, 61, 7, 3, CAST(N'2022-02-18' AS Date), CAST(53910.7300000000 AS Decimal(18, 10)), 523, 5, 6, N'4011209000', 5, 976902, CAST(17840.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 523)
    INSERT @Registros VALUES (1985, 59, 12, 8, CAST(N'2022-02-22' AS Date), CAST(85760.4400000000 AS Decimal(18, 10)), 512, 5, 6, N'4011209000', 5, 890644, CAST(29190.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 512)
    INSERT @Registros VALUES (1986, 61, 7, 3, CAST(N'2022-02-22' AS Date), CAST(43696.4000000000 AS Decimal(18, 10)), 257, 5, 6, N'4011209000', 5, 957798, CAST(14620.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 257)
    INSERT @Registros VALUES (1987, 9, 9, 5, CAST(N'2022-02-23' AS Date), CAST(60181.0100000000 AS Decimal(18, 10)), 705, 5, 6, N'4011209000', 5, 475563, CAST(16928.8200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 705)
    INSERT @Registros VALUES (1988, 30, 7, 3, CAST(N'2022-02-24' AS Date), CAST(45463.5100000000 AS Decimal(18, 10)), 240, 5, 6, N'4011209000', 5, 20240, CAST(15578.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 240)
    INSERT @Registros VALUES (1989, 45, 7, 3, CAST(N'2022-02-24' AS Date), CAST(28952.2300000000 AS Decimal(18, 10)), 305, 14, 15, N'4011209000', 5, 115598, CAST(5794.3500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 305)
    INSERT @Registros VALUES (1990, 61, 7, 3, CAST(N'2022-02-24' AS Date), CAST(36847.0800000000 AS Decimal(18, 10)), 224, 5, 6, N'4011209000', 5, 137071, CAST(11701.7600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 224)
    INSERT @Registros VALUES (1991, 23, 7, 3, CAST(N'2022-02-24' AS Date), CAST(21333.4700000000 AS Decimal(18, 10)), 125, 5, 6, N'4011209000', 5, 199860, CAST(7049.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 125)
    INSERT @Registros VALUES (1992, 45, 7, 3, CAST(N'2022-02-24' AS Date), CAST(32054.4800000000 AS Decimal(18, 10)), 327, 3, 4, N'4011209000', 5, 502829, CAST(6099.5200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 327)
    INSERT @Registros VALUES (1993, 23, 7, 3, CAST(N'2022-02-24' AS Date), CAST(21809.2000000000 AS Decimal(18, 10)), 125, 5, 6, N'4011209000', 5, 724058, CAST(6777.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 125)
    INSERT @Registros VALUES (1994, 45, 7, 3, CAST(N'2022-02-24' AS Date), CAST(89963.9100000000 AS Decimal(18, 10)), 560, 20, 20, N'4011209000', 5, 902768, CAST(33924.9000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 560)
    INSERT @Registros VALUES (1995, 23, 7, 3, CAST(N'2022-02-25' AS Date), CAST(7241.2100000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 5, 415212, CAST(1504.6600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 30)
    INSERT @Registros VALUES (1996, 23, 7, 3, CAST(N'2022-02-25' AS Date), CAST(6855.4900000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 415212, CAST(1424.5200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 50)
    INSERT @Registros VALUES (1997, 23, 7, 3, CAST(N'2022-02-25' AS Date), CAST(19987.4700000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 5, 415212, CAST(4153.2300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 60)
    INSERT @Registros VALUES (1998, 23, 7, 3, CAST(N'2022-02-25' AS Date), CAST(7241.2100000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 5, 415212, CAST(1504.6600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 30)
    INSERT @Registros VALUES (1999, 23, 7, 3, CAST(N'2022-02-25' AS Date), CAST(12297.8600000000 AS Decimal(18, 10)), 40, 3, 4, N'4011209000', 5, 415212, CAST(2555.3900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 40)
    INSERT @Registros VALUES (2000, 23, 7, 3, CAST(N'2022-02-25' AS Date), CAST(3007.4800000000 AS Decimal(18, 10)), 11, 3, 4, N'4011209000', 5, 415212, CAST(624.9300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 11)
    INSERT @Registros VALUES (2001, 12, 1, 2, CAST(N'2022-03-02' AS Date), CAST(82180.8100000000 AS Decimal(18, 10)), 572, 5, 6, N'4011209000', 5, 428418, CAST(26322.2100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 572)
    INSERT @Registros VALUES (2002, 44, 7, 3, CAST(N'2022-03-02' AS Date), CAST(55137.2600000000 AS Decimal(18, 10)), 428, 5, 6, N'4011209000', 5, 541749, CAST(15230.8000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 428)
    INSERT @Registros VALUES (2003, 23, 7, 3, CAST(N'2022-03-03' AS Date), CAST(19159.3700000000 AS Decimal(18, 10)), 120, 5, 6, N'4011209000', 5, 321829, CAST(6600.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 120)
    INSERT @Registros VALUES (2004, 2, 12, 8, CAST(N'2022-03-03' AS Date), CAST(10031.0900000000 AS Decimal(18, 10)), 40, 5, 25, N'4011209000', 5, 450880, CAST(3171.1300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 40)
    INSERT @Registros VALUES (2005, 2, 12, 8, CAST(N'2022-03-03' AS Date), CAST(13029.0400000000 AS Decimal(18, 10)), 70, 5, 25, N'4011209000', 5, 450880, CAST(4118.8700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 70)
    INSERT @Registros VALUES (2006, 47, 7, 3, CAST(N'2022-03-03' AS Date), CAST(13487.3700000000 AS Decimal(18, 10)), 148, 3, 4, N'4011209000', 5, 521169, CAST(2258.0400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 148)
    INSERT @Registros VALUES (2007, 47, 7, 3, CAST(N'2022-03-03' AS Date), CAST(13938.7300000000 AS Decimal(18, 10)), 160, 3, 4, N'4011209000', 5, 890016, CAST(2473.5600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 160)
    INSERT @Registros VALUES (2008, 45, 7, 3, CAST(N'2022-03-04' AS Date), CAST(35617.0600000000 AS Decimal(18, 10)), 293, 3, 4, N'4011209000', 5, 191287, CAST(6672.8000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 293)
    INSERT @Registros VALUES (2009, 45, 7, 3, CAST(N'2022-03-04' AS Date), CAST(13003.5300000000 AS Decimal(18, 10)), 198, 16, 17, N'4011209000', 5, 262945, CAST(2409.4000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 198)
    INSERT @Registros VALUES (2010, 47, 7, 3, CAST(N'2022-03-04' AS Date), CAST(20644.1200000000 AS Decimal(18, 10)), 212, 3, 4, N'4011209000', 5, 786292, CAST(3749.2600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 212)
    INSERT @Registros VALUES (2011, 47, 7, 3, CAST(N'2022-03-04' AS Date), CAST(25399.9400000000 AS Decimal(18, 10)), 280, 3, 4, N'4011209000', 5, 930886, CAST(4562.5200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 280)
    INSERT @Registros VALUES (2012, 44, 7, 3, CAST(N'2022-03-04' AS Date), CAST(57662.6800000000 AS Decimal(18, 10)), 345, 5, 6, N'4011209000', 5, 985514, CAST(13971.7900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 345)
    INSERT @Registros VALUES (2013, 51, 7, 3, CAST(N'2022-03-07' AS Date), CAST(6108.7600000000 AS Decimal(18, 10)), 70, 3, 4, N'4011209000', 5, 159399, CAST(1269.1300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 70)
    INSERT @Registros VALUES (2014, 47, 7, 3, CAST(N'2022-03-07' AS Date), CAST(4971.1600000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 409575, CAST(972.0100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 50)
    INSERT @Registros VALUES (2015, 61, 7, 3, CAST(N'2022-03-07' AS Date), CAST(42233.4100000000 AS Decimal(18, 10)), 343, 5, 6, N'4011209000', 5, 784122, CAST(13198.6500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 343)
    INSERT @Registros VALUES (2016, 45, 7, 3, CAST(N'2022-03-07' AS Date), CAST(360493.8600000000 AS Decimal(18, 10)), 2507, 20, 20, N'4011209000', 5, 827927, CAST(136816.2600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 2507)
    INSERT @Registros VALUES (2017, 47, 7, 3, CAST(N'2022-03-07' AS Date), CAST(2563.4300000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 5, 838790, CAST(450.1400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 30)
    INSERT @Registros VALUES (2018, 51, 7, 3, CAST(N'2022-03-08' AS Date), CAST(2418.7900000000 AS Decimal(18, 10)), 10, 5, 6, N'4011209000', 5, 329779, CAST(688.8500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 10)
    INSERT @Registros VALUES (2019, 51, 7, 3, CAST(N'2022-03-08' AS Date), CAST(21286.7400000000 AS Decimal(18, 10)), 110, 5, 6, N'4011209000', 5, 329779, CAST(6110.0900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 110)
    INSERT @Registros VALUES (2020, 51, 7, 3, CAST(N'2022-03-08' AS Date), CAST(3528.7300000000 AS Decimal(18, 10)), 20, 5, 6, N'4011209000', 5, 329779, CAST(1012.7600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 20)
    INSERT @Registros VALUES (2021, 22, 7, 3, CAST(N'2022-03-08' AS Date), CAST(36348.9700000000 AS Decimal(18, 10)), 246, 5, 6, N'4011209000', 5, 673643, CAST(14058.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 246)
    INSERT @Registros VALUES (2022, 61, 7, 3, CAST(N'2022-03-09' AS Date), CAST(27063.2400000000 AS Decimal(18, 10)), 296, 5, 6, N'4011209000', 5, 142533, CAST(6894.1600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 296)
    INSERT @Registros VALUES (2023, 45, 7, 3, CAST(N'2022-03-10' AS Date), CAST(40756.3800000000 AS Decimal(18, 10)), 242, 3, 4, N'4011209000', 5, 203754, CAST(8981.8600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 242)
    INSERT @Registros VALUES (2024, 59, 12, 8, CAST(N'2022-03-10' AS Date), CAST(15025.1500000000 AS Decimal(18, 10)), 198, 5, 6, N'4011209000', 5, 457009, CAST(4527.3300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 198)
    INSERT @Registros VALUES (2025, 61, 7, 3, CAST(N'2022-03-10' AS Date), CAST(37978.2800000000 AS Decimal(18, 10)), 224, 5, 6, N'4011209000', 5, 538967, CAST(12094.8800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 224)
    INSERT @Registros VALUES (2026, 64, 7, 3, CAST(N'2022-03-10' AS Date), CAST(46270.3100000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 984555, CAST(14120.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 264)
    INSERT @Registros VALUES (2027, 45, 7, 3, CAST(N'2022-03-11' AS Date), CAST(37717.0900000000 AS Decimal(18, 10)), 206, 3, 4, N'4011209000', 5, 110822, CAST(7583.0800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 206)
    INSERT @Registros VALUES (2028, 61, 7, 3, CAST(N'2022-03-14' AS Date), CAST(48217.5200000000 AS Decimal(18, 10)), 386, 5, 6, N'4011209000', 5, 255230, CAST(14576.4600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 386)
    INSERT @Registros VALUES (2029, 45, 7, 3, CAST(N'2022-03-14' AS Date), CAST(20654.9700000000 AS Decimal(18, 10)), 280, 7, 8, N'4011209000', 5, 792690, CAST(1.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 280)
    INSERT @Registros VALUES (2030, 61, 7, 3, CAST(N'2022-03-15' AS Date), CAST(45438.3100000000 AS Decimal(18, 10)), 291, 5, 6, N'4011209000', 5, 920693, CAST(13936.8300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 291)
    INSERT @Registros VALUES (2031, 42, 7, 3, CAST(N'2022-03-16' AS Date), CAST(52143.6000000000 AS Decimal(18, 10)), 222, 3, 4, N'4011209000', 5, 277507, CAST(12667.1300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 222)
    INSERT @Registros VALUES (2032, 44, 7, 3, CAST(N'2022-03-16' AS Date), CAST(66373.4600000000 AS Decimal(18, 10)), 281, 3, 4, N'4011209000', 5, 396694, CAST(15329.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 281)
    INSERT @Registros VALUES (2033, 30, 7, 3, CAST(N'2022-03-16' AS Date), CAST(45404.5000000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 633374, CAST(16146.2400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 264)
    INSERT @Registros VALUES (2034, 61, 7, 3, CAST(N'2022-03-16' AS Date), CAST(43063.6900000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 830913, CAST(14760.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 260)
    INSERT @Registros VALUES (2035, 44, 7, 3, CAST(N'2022-03-17' AS Date), CAST(31928.2900000000 AS Decimal(18, 10)), 177, 5, 6, N'4011209000', 5, 38950, CAST(9557.8400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 177)
    INSERT @Registros VALUES (2036, 42, 7, 3, CAST(N'2022-03-17' AS Date), CAST(7822.5000000000 AS Decimal(18, 10)), 30, 2, 2, N'4011209000', 5, 194837, CAST(1615.3800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 30)
    INSERT @Registros VALUES (2037, 61, 7, 3, CAST(N'2022-03-17' AS Date), CAST(24028.3300000000 AS Decimal(18, 10)), 140, 5, 6, N'4011209000', 5, 246583, CAST(6971.6800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 140)
    INSERT @Registros VALUES (2038, 64, 7, 3, CAST(N'2022-03-17' AS Date), CAST(101072.3800000000 AS Decimal(18, 10)), 750, 5, 6, N'4011209000', 5, 300958, CAST(31810.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 750)
    INSERT @Registros VALUES (2039, 64, 7, 3, CAST(N'2022-03-17' AS Date), CAST(46270.2200000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 548900, CAST(14120.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 264)
    INSERT @Registros VALUES (2040, 57, 12, 8, CAST(N'2022-03-17' AS Date), CAST(26163.0200000000 AS Decimal(18, 10)), 288, 5, 6, N'4011209000', 5, 690288, CAST(10822.7100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 288)
    INSERT @Registros VALUES (2041, 44, 7, 3, CAST(N'2022-03-17' AS Date), CAST(17931.1300000000 AS Decimal(18, 10)), 75, 3, 4, N'4011209000', 5, 824704, CAST(3480.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 75)
    INSERT @Registros VALUES (2042, 61, 7, 3, CAST(N'2022-03-18' AS Date), CAST(46274.5400000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 153562, CAST(14529.2800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (2043, 61, 7, 3, CAST(N'2022-03-18' AS Date), CAST(46496.7400000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 524527, CAST(14606.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 262)
    INSERT @Registros VALUES (2044, 8, 7, 3, CAST(N'2022-03-21' AS Date), CAST(18048.1400000000 AS Decimal(18, 10)), 100, 5, 6, N'4011209000', 5, 305501, CAST(2912.2400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 100)
    INSERT @Registros VALUES (2045, 23, 7, 3, CAST(N'2022-03-21' AS Date), CAST(2559.4900000000 AS Decimal(18, 10)), 14, 3, 4, N'4011209000', 5, 326107, CAST(445.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 14)
    INSERT @Registros VALUES (2046, 23, 7, 3, CAST(N'2022-03-21' AS Date), CAST(23424.2200000000 AS Decimal(18, 10)), 80, 3, 4, N'4011209000', 5, 326107, CAST(5008.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 80)
    INSERT @Registros VALUES (2047, 23, 7, 3, CAST(N'2022-03-21' AS Date), CAST(12297.8600000000 AS Decimal(18, 10)), 40, 3, 4, N'4011209000', 5, 326107, CAST(2504.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 40)
    INSERT @Registros VALUES (2048, 23, 7, 3, CAST(N'2022-03-21' AS Date), CAST(6910.7600000000 AS Decimal(18, 10)), 36, 3, 4, N'4011209000', 5, 326107, CAST(1144.8000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 36)
    INSERT @Registros VALUES (2049, 23, 7, 3, CAST(N'2022-03-21' AS Date), CAST(1093.6300000000 AS Decimal(18, 10)), 4, 3, 4, N'4011209000', 5, 326107, CAST(230.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 4)
    INSERT @Registros VALUES (2050, 23, 7, 3, CAST(N'2022-03-21' AS Date), CAST(5098.6000000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 326107, CAST(1009.0500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 50)
    INSERT @Registros VALUES (2051, 23, 7, 3, CAST(N'2022-03-21' AS Date), CAST(1498.9500000000 AS Decimal(18, 10)), 14, 3, 4, N'4011209000', 5, 326107, CAST(282.5300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 14)
    INSERT @Registros VALUES (2052, 23, 7, 3, CAST(N'2022-03-21' AS Date), CAST(13324.9700000000 AS Decimal(18, 10)), 40, 3, 4, N'4011209000', 5, 326107, CAST(2740.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 40)
    INSERT @Registros VALUES (2053, 23, 7, 3, CAST(N'2022-03-21' AS Date), CAST(1640.4500000000 AS Decimal(18, 10)), 6, 3, 4, N'4011209000', 5, 326107, CAST(345.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 6)
    INSERT @Registros VALUES (2054, 23, 7, 3, CAST(N'2022-03-21' AS Date), CAST(2413.7400000000 AS Decimal(18, 10)), 10, 3, 4, N'4011209000', 5, 848599, CAST(542.6500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 10)
    INSERT @Registros VALUES (2055, 23, 7, 3, CAST(N'2022-03-21' AS Date), CAST(15525.3500000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 848599, CAST(3258.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 50)
    INSERT @Registros VALUES (2056, 23, 7, 3, CAST(N'2022-03-21' AS Date), CAST(2734.0700000000 AS Decimal(18, 10)), 10, 3, 4, N'4011209000', 5, 848599, CAST(575.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 10)
    INSERT @Registros VALUES (2057, 61, 7, 3, CAST(N'2022-03-22' AS Date), CAST(46234.1400000000 AS Decimal(18, 10)), 352, 5, 6, N'4011209000', 5, 95647, CAST(14079.7600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 352)
    INSERT @Registros VALUES (2058, 45, 7, 3, CAST(N'2022-03-22' AS Date), CAST(117922.7400000000 AS Decimal(18, 10)), 688, 20, 20, N'4011209000', 5, 340334, CAST(41055.5400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 688)
    INSERT @Registros VALUES (2059, 44, 7, 3, CAST(N'2022-03-22' AS Date), CAST(57029.7700000000 AS Decimal(18, 10)), 284, 3, 4, N'4011209000', 5, 559322, CAST(14241.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 284)
    INSERT @Registros VALUES (2060, 7, 12, 8, CAST(N'2022-03-22' AS Date), CAST(1413.3900000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 5, 565858, CAST(317.8900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 20)
    INSERT @Registros VALUES (2061, 7, 12, 8, CAST(N'2022-03-22' AS Date), CAST(52660.7900000000 AS Decimal(18, 10)), 670, 3, 4, N'4011209000', 5, 565858, CAST(11844.0900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 670)
    INSERT @Registros VALUES (2062, 15, 7, 3, CAST(N'2022-03-22' AS Date), CAST(1525.8900000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 5, 986788, CAST(326.6000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 12)
    INSERT @Registros VALUES (2063, 7, 12, 8, CAST(N'2022-03-23' AS Date), CAST(28267.8800000000 AS Decimal(18, 10)), 400, 3, 4, N'4011209000', 5, 257016, CAST(6254.9000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 400)
    INSERT @Registros VALUES (2064, 7, 12, 8, CAST(N'2022-03-23' AS Date), CAST(29867.3100000000 AS Decimal(18, 10)), 380, 3, 4, N'4011209000', 5, 257016, CAST(6608.8200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 380)
    INSERT @Registros VALUES (2065, 26, 7, 3, CAST(N'2022-03-23' AS Date), CAST(46552.7300000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 495743, CAST(14873.7000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 260)
    INSERT @Registros VALUES (2066, 37, 8, 4, CAST(N'2022-03-23' AS Date), CAST(55708.2900000000 AS Decimal(18, 10)), 268, 5, 6, N'4011209000', 5, 903420, CAST(14484.5400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 268)
    INSERT @Registros VALUES (2067, 61, 7, 3, CAST(N'2022-03-24' AS Date), CAST(28244.4400000000 AS Decimal(18, 10)), 202, 5, 6, N'4011209000', 5, 71028, CAST(7466.9900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 202)
    INSERT @Registros VALUES (2068, 44, 7, 3, CAST(N'2022-03-24' AS Date), CAST(44927.9500000000 AS Decimal(18, 10)), 204, 3, 4, N'4011209000', 5, 125711, CAST(9551.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 204)
    INSERT @Registros VALUES (2069, 8, 7, 3, CAST(N'2022-03-24' AS Date), CAST(38570.5800000000 AS Decimal(18, 10)), 172, 5, 6, N'4011209000', 5, 657413, CAST(11170.0500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 172)
    INSERT @Registros VALUES (2070, 61, 7, 3, CAST(N'2022-03-25' AS Date), CAST(3733.9600000000 AS Decimal(18, 10)), 40, 5, 6, N'4011209000', 5, 419684, CAST(883.5300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 40)
    INSERT @Registros VALUES (2071, 44, 7, 3, CAST(N'2022-03-28' AS Date), CAST(11895.5100000000 AS Decimal(18, 10)), 68, 3, 4, N'4011209000', 5, 605998, CAST(2199.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 68)
    INSERT @Registros VALUES (2072, 61, 7, 3, CAST(N'2022-03-28' AS Date), CAST(52038.9000000000 AS Decimal(18, 10)), 398, 5, 6, N'4011209000', 5, 867097, CAST(14820.0200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 398)
    INSERT @Registros VALUES (2073, 30, 7, 3, CAST(N'2022-03-29' AS Date), CAST(2457.8100000000 AS Decimal(18, 10)), 8, 10, 13, N'4011209000', 5, 420206, CAST(498.2400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 8)
    INSERT @Registros VALUES (2074, 30, 7, 3, CAST(N'2022-03-29' AS Date), CAST(9644.4700000000 AS Decimal(18, 10)), 42, 20, 13, N'4011209000', 5, 420206, CAST(2611.8900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 42)
    INSERT @Registros VALUES (2075, 29, 12, 8, CAST(N'2022-03-29' AS Date), CAST(27180.6700000000 AS Decimal(18, 10)), 240, 5, 6, N'4011209000', 5, 450824, CAST(14495.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 240)
    INSERT @Registros VALUES (2076, 44, 7, 3, CAST(N'2022-03-29' AS Date), CAST(64526.2200000000 AS Decimal(18, 10)), 482, 5, 6, N'4011209000', 5, 490667, CAST(15726.7800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 482)
    INSERT @Registros VALUES (2077, 7, 12, 8, CAST(N'2022-03-29' AS Date), CAST(1959.1600000000 AS Decimal(18, 10)), 28, 3, 4, N'4011209000', 5, 957541, CAST(440.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 28)
    INSERT @Registros VALUES (2078, 7, 12, 8, CAST(N'2022-03-29' AS Date), CAST(22879.0800000000 AS Decimal(18, 10)), 294, 3, 4, N'4011209000', 5, 957541, CAST(5138.3000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 294)
    INSERT @Registros VALUES (2079, 7, 12, 8, CAST(N'2022-03-29' AS Date), CAST(15533.3400000000 AS Decimal(18, 10)), 222, 3, 4, N'4011209000', 5, 957541, CAST(3488.5600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 222)
    INSERT @Registros VALUES (2080, 7, 12, 8, CAST(N'2022-03-29' AS Date), CAST(9805.3200000000 AS Decimal(18, 10)), 126, 3, 4, N'4011209000', 5, 957541, CAST(2202.1300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 126)
    INSERT @Registros VALUES (2081, 22, 7, 3, CAST(N'2022-03-30' AS Date), CAST(33501.1200000000 AS Decimal(18, 10)), 228, 5, 6, N'4011209000', 5, 203923, CAST(13344.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 228)
    INSERT @Registros VALUES (2082, 61, 7, 3, CAST(N'2022-03-30' AS Date), CAST(3122.5300000000 AS Decimal(18, 10)), 16, 5, 6, N'4011209000', 5, 670627, CAST(743.0100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 16)
    INSERT @Registros VALUES (2083, 45, 7, 3, CAST(N'2022-03-30' AS Date), CAST(141183.7800000000 AS Decimal(18, 10)), 1030, 20, 20, N'4011209000', 5, 967410, CAST(53860.6000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 1030)
    INSERT @Registros VALUES (2084, 30, 7, 3, CAST(N'2022-03-31' AS Date), CAST(31400.6300000000 AS Decimal(18, 10)), 104, 3, 4, N'4011209000', 5, 118981, CAST(6581.8200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 104)
    INSERT @Registros VALUES (2085, 45, 7, 3, CAST(N'2022-03-31' AS Date), CAST(92330.8900000000 AS Decimal(18, 10)), 342, 3, 4, N'4011209000', 5, 426774, CAST(21320.0500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 342)
    INSERT @Registros VALUES (2086, 24, 12, 8, CAST(N'2022-03-31' AS Date), CAST(46716.3600000000 AS Decimal(18, 10)), 268, 5, 6, N'4011209000', 5, 717904, CAST(13936.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 268)
    INSERT @Registros VALUES (2087, 8, 7, 3, CAST(N'2022-03-31' AS Date), CAST(5642.6400000000 AS Decimal(18, 10)), 48, 5, 6, N'4011209000', 5, 952603, CAST(1395.8300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 48)
    INSERT @Registros VALUES (2088, 7, 12, 8, CAST(N'2022-04-01' AS Date), CAST(3611.9900000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 140993, CAST(620.5000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 50)
    INSERT @Registros VALUES (2089, 7, 12, 8, CAST(N'2022-04-01' AS Date), CAST(64293.6000000000 AS Decimal(18, 10)), 890, 3, 4, N'4011209000', 5, 140993, CAST(11044.9000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 890)
    INSERT @Registros VALUES (2090, 7, 12, 8, CAST(N'2022-04-01' AS Date), CAST(3611.9900000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 805827, CAST(620.5000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 50)
    INSERT @Registros VALUES (2091, 7, 12, 8, CAST(N'2022-04-01' AS Date), CAST(64293.6000000000 AS Decimal(18, 10)), 890, 3, 4, N'4011209000', 5, 805827, CAST(11044.9000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 890)
    INSERT @Registros VALUES (2092, 45, 7, 3, CAST(N'2022-04-04' AS Date), CAST(8601.5300000000 AS Decimal(18, 10)), 64, 3, 4, N'4011209000', 5, 128361, CAST(1579.7300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 64)
    INSERT @Registros VALUES (2093, 45, 7, 3, CAST(N'2022-04-04' AS Date), CAST(16487.0900000000 AS Decimal(18, 10)), 216, 3, 4, N'4011209000', 5, 128361, CAST(3027.9700000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 216)
    INSERT @Registros VALUES (2094, 45, 7, 3, CAST(N'2022-04-04' AS Date), CAST(6134.5000000000 AS Decimal(18, 10)), 70, 3, 4, N'4011209000', 5, 128361, CAST(1126.6400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 70)
    INSERT @Registros VALUES (2095, 47, 7, 3, CAST(N'2022-04-04' AS Date), CAST(6058.8400000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 5, 191034, CAST(1116.3300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 60)
    INSERT @Registros VALUES (2096, 45, 7, 3, CAST(N'2022-04-04' AS Date), CAST(37405.1300000000 AS Decimal(18, 10)), 412, 14, 15, N'4011209000', 5, 855246, CAST(8260.0600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 412)
    INSERT @Registros VALUES (2097, 23, 7, 3, CAST(N'2022-04-04' AS Date), CAST(22681.5900000000 AS Decimal(18, 10)), 130, 5, 6, N'4011209000', 5, 993580, CAST(7048.6000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 130)
    INSERT @Registros VALUES (2098, 2, 12, 8, CAST(N'2022-04-05' AS Date), CAST(24196.8100000000 AS Decimal(18, 10)), 130, 5, 25, N'4011209000', 5, 42007, CAST(7670.0000000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 130)
    INSERT @Registros VALUES (2099, 9, 9, 5, CAST(N'2022-04-07' AS Date), CAST(53926.0100000000 AS Decimal(18, 10)), 330, 5, 6, N'4011209000', 5, 117296, CAST(15552.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 330)
    INSERT @Registros VALUES (2100, 51, 7, 3, CAST(N'2022-04-07' AS Date), CAST(1774.6500000000 AS Decimal(18, 10)), 30, 5, 6, N'4011209000', 5, 143853, CAST(488.3600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 30)
    INSERT @Registros VALUES (2101, 51, 7, 3, CAST(N'2022-04-07' AS Date), CAST(31958.9100000000 AS Decimal(18, 10)), 323, 5, 6, N'4011209000', 5, 143853, CAST(10327.8100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 323)
    INSERT @Registros VALUES (2102, 51, 7, 3, CAST(N'2022-04-07' AS Date), CAST(25063.5700000000 AS Decimal(18, 10)), 130, 5, 6, N'4011209000', 5, 458413, CAST(10203.1000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 130)
    INSERT @Registros VALUES (2103, 6, 7, 3, CAST(N'2022-04-07' AS Date), CAST(46778.6000000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 5, 590303, CAST(13771.4400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (2104, 45, 7, 3, CAST(N'2022-04-08' AS Date), CAST(248335.5300000000 AS Decimal(18, 10)), 1852, 20, 20, N'4011209000', 5, 693375, CAST(97075.8800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1852)
    INSERT @Registros VALUES (2105, 42, 7, 3, CAST(N'2022-04-08' AS Date), CAST(28860.5800000000 AS Decimal(18, 10)), 108, 2, 2, N'4011209000', 5, 728209, CAST(5874.9000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 108)
    INSERT @Registros VALUES (2106, 4, 7, 3, CAST(N'2022-04-11' AS Date), CAST(26009.2100000000 AS Decimal(18, 10)), 180, 5, 6, N'4011209000', 5, 299575, CAST(8232.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 180)
    INSERT @Registros VALUES (2107, 23, 7, 3, CAST(N'2022-04-12' AS Date), CAST(21394.6200000000 AS Decimal(18, 10)), 134, 5, 6, N'4011209000', 5, 772054, CAST(7370.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 134)
    INSERT @Registros VALUES (2108, 7, 12, 8, CAST(N'2022-04-13' AS Date), CAST(18598.9800000000 AS Decimal(18, 10)), 239, 3, 4, N'4011209000', 5, 546613, CAST(4228.8700000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 239)
    INSERT @Registros VALUES (2109, 7, 12, 8, CAST(N'2022-04-13' AS Date), CAST(8638.0200000000 AS Decimal(18, 10)), 111, 3, 4, N'4011209000', 5, 546613, CAST(1964.0400000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 111)
    INSERT @Registros VALUES (2110, 42, 7, 3, CAST(N'2022-04-19' AS Date), CAST(52164.0000000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 5, 87895, CAST(13245.5400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (2111, 42, 7, 3, CAST(N'2022-04-19' AS Date), CAST(56610.9400000000 AS Decimal(18, 10)), 222, 3, 4, N'4011209000', 5, 202057, CAST(13707.7500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 222)
    INSERT @Registros VALUES (2112, 7, 12, 8, CAST(N'2022-04-19' AS Date), CAST(24734.3900000000 AS Decimal(18, 10)), 350, 3, 4, N'4011209000', 5, 417656, CAST(5475.5500000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 350)
    INSERT @Registros VALUES (2113, 7, 12, 8, CAST(N'2022-04-19' AS Date), CAST(22400.4800000000 AS Decimal(18, 10)), 285, 3, 4, N'4011209000', 5, 417656, CAST(4958.8800000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 285)
    INSERT @Registros VALUES (2114, 7, 12, 8, CAST(N'2022-04-19' AS Date), CAST(5108.8800000000 AS Decimal(18, 10)), 65, 3, 4, N'4011209000', 5, 417656, CAST(1130.9700000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 65)
    INSERT @Registros VALUES (2115, 30, 7, 3, CAST(N'2022-04-19' AS Date), CAST(645.4400000000 AS Decimal(18, 10)), 8, 3, 4, N'4011209000', 5, 655000, CAST(119.1600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 8)
    INSERT @Registros VALUES (2116, 42, 7, 3, CAST(N'2022-04-19' AS Date), CAST(53650.3000000000 AS Decimal(18, 10)), 245, 3, 4, N'4011209000', 5, 962154, CAST(12589.8200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 245)
    INSERT @Registros VALUES (2117, 45, 7, 3, CAST(N'2022-04-20' AS Date), CAST(9953.4500000000 AS Decimal(18, 10)), 108, 14, 15, N'4011209000', 5, 42736, CAST(1640.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 108)
    INSERT @Registros VALUES (2118, 15, 7, 3, CAST(N'2022-04-20' AS Date), CAST(1984.2400000000 AS Decimal(18, 10)), 8, 3, 4, N'4011209000', 5, 444792, CAST(397.2900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 8)
    INSERT @Registros VALUES (2119, 41, 7, 3, CAST(N'2022-04-21' AS Date), CAST(4858.8300000000 AS Decimal(18, 10)), 20, 5, 18, N'4011209000', 5, 308630, CAST(933.4400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (2120, 10, 7, 3, CAST(N'2022-04-22' AS Date), CAST(6029.6200000000 AS Decimal(18, 10)), 53, 3, 4, N'4011209000', 5, 273538, CAST(892.3600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 53)
    INSERT @Registros VALUES (2121, 23, 7, 3, CAST(N'2022-04-22' AS Date), CAST(44746.5600000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 887509, CAST(13935.7500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (2122, 44, 7, 3, CAST(N'2022-04-25' AS Date), CAST(24383.8600000000 AS Decimal(18, 10)), 116, 3, 4, N'4011209000', 5, 30970, CAST(4790.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 116)
    INSERT @Registros VALUES (2123, 47, 7, 3, CAST(N'2022-04-25' AS Date), CAST(25814.4800000000 AS Decimal(18, 10)), 194, 3, 4, N'4011209000', 5, 592185, CAST(4336.0300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 194)
    INSERT @Registros VALUES (2124, 42, 7, 3, CAST(N'2022-04-25' AS Date), CAST(13786.7200000000 AS Decimal(18, 10)), 52, 2, 2, N'4011209000', 5, 826159, CAST(2931.7500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 52)
    INSERT @Registros VALUES (2125, 44, 7, 3, CAST(N'2022-04-25' AS Date), CAST(52256.6400000000 AS Decimal(18, 10)), 253, 3, 4, N'4011209000', 5, 869180, CAST(12552.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 253)
    INSERT @Registros VALUES (2126, 8, 7, 3, CAST(N'2022-04-26' AS Date), CAST(1024.0200000000 AS Decimal(18, 10)), 8, 5, 6, N'4011209000', 5, 16226, CAST(253.3200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 8)
    INSERT @Registros VALUES (2127, 45, 7, 3, CAST(N'2022-04-26' AS Date), CAST(91656.4500000000 AS Decimal(18, 10)), 353, 3, 4, N'4011209000', 5, 512253, CAST(20906.0500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 353)
    INSERT @Registros VALUES (2128, 7, 12, 8, CAST(N'2022-04-27' AS Date), CAST(52660.7900000000 AS Decimal(18, 10)), 670, 3, 4, N'4011209000', 5, 467099, CAST(11854.9800000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 670)
    INSERT @Registros VALUES (2129, 45, 7, 3, CAST(N'2022-04-27' AS Date), CAST(7545.3200000000 AS Decimal(18, 10)), 43, 3, 4, N'4011209000', 5, 483511, CAST(1350.1700000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 43)
    INSERT @Registros VALUES (2130, 45, 7, 3, CAST(N'2022-04-27' AS Date), CAST(9220.0000000000 AS Decimal(18, 10)), 92, 3, 4, N'4011209000', 5, 483511, CAST(1649.8400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 92)
    INSERT @Registros VALUES (2131, 45, 7, 3, CAST(N'2022-04-27' AS Date), CAST(3426.6400000000 AS Decimal(18, 10)), 36, 3, 4, N'4011209000', 5, 483511, CAST(613.1600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 36)
    INSERT @Registros VALUES (2132, 47, 7, 3, CAST(N'2022-04-27' AS Date), CAST(3752.8900000000 AS Decimal(18, 10)), 40, 3, 4, N'4011209000', 5, 692284, CAST(702.3500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 40)
    INSERT @Registros VALUES (2133, 40, 10, 2, CAST(N'2022-04-27' AS Date), CAST(77279.6200000000 AS Decimal(18, 10)), 428, 5, 6, N'4011209000', 5, 697178, CAST(24845.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 428)
    INSERT @Registros VALUES (2134, 47, 7, 3, CAST(N'2022-04-28' AS Date), CAST(29222.9100000000 AS Decimal(18, 10)), 292, 3, 4, N'4011209000', 5, 470883, CAST(4825.3100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 292)
    INSERT @Registros VALUES (2135, 47, 7, 3, CAST(N'2022-04-28' AS Date), CAST(9040.5500000000 AS Decimal(18, 10)), 90, 3, 4, N'4011209000', 5, 470883, CAST(1492.7800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 90)
    INSERT @Registros VALUES (2136, 47, 7, 3, CAST(N'2022-04-28' AS Date), CAST(9709.5500000000 AS Decimal(18, 10)), 103, 3, 4, N'4011209000', 5, 470883, CAST(1603.2500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 103)
    INSERT @Registros VALUES (2137, 47, 7, 3, CAST(N'2022-04-28' AS Date), CAST(28471.9700000000 AS Decimal(18, 10)), 269, 3, 4, N'4011209000', 5, 470883, CAST(4701.3100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 269)
    INSERT @Registros VALUES (2138, 45, 7, 3, CAST(N'2022-04-29' AS Date), CAST(103396.5600000000 AS Decimal(18, 10)), 545, 20, 20, N'4011209000', 5, 19288, CAST(35128.6200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 545)
    INSERT @Registros VALUES (2139, 1, 11, 7, CAST(N'2022-04-29' AS Date), CAST(35016.2700000000 AS Decimal(18, 10)), 225, 5, 6, N'4011209000', 5, 280222, CAST(11614.6600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 225)
    INSERT @Registros VALUES (2140, 1, 11, 7, CAST(N'2022-04-29' AS Date), CAST(6009.7400000000 AS Decimal(18, 10)), 40, 5, 6, N'4011209000', 5, 280222, CAST(1993.3900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (2141, 30, 7, 3, CAST(N'2022-04-29' AS Date), CAST(405.4800000000 AS Decimal(18, 10)), 5, 3, 4, N'4011209000', 5, 498375, CAST(62.6200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 5)
    INSERT @Registros VALUES (2142, 27, 7, 3, CAST(N'2022-04-29' AS Date), CAST(6470.4500000000 AS Decimal(18, 10)), 55, 3, 4, N'4011209000', 5, 603868, CAST(973.4200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 55)
    INSERT @Registros VALUES (2143, 59, 12, 8, CAST(N'2022-05-02' AS Date), CAST(40202.3800000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 319496, CAST(14720.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (2144, 7, 12, 8, CAST(N'2022-05-02' AS Date), CAST(14699.3000000000 AS Decimal(18, 10)), 208, 3, 4, N'4011209000', 5, 408240, CAST(3278.7700000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 208)
    INSERT @Registros VALUES (2145, 7, 12, 8, CAST(N'2022-05-02' AS Date), CAST(41657.0400000000 AS Decimal(18, 10)), 530, 3, 4, N'4011209000', 5, 408240, CAST(9291.8500000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 530)
    INSERT @Registros VALUES (2146, 51, 7, 3, CAST(N'2022-05-02' AS Date), CAST(33140.4200000000 AS Decimal(18, 10)), 244, 5, 6, N'4011209000', 5, 611915, CAST(11136.8200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 244)
    INSERT @Registros VALUES (2147, 45, 7, 3, CAST(N'2022-05-02' AS Date), CAST(2812.5700000000 AS Decimal(18, 10)), 42, 16, 17, N'4011209000', 5, 818639, CAST(492.9700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 42)
    INSERT @Registros VALUES (2148, 23, 7, 3, CAST(N'2022-05-03' AS Date), CAST(40554.0100000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 5, 736547, CAST(13970.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 254)
    INSERT @Registros VALUES (2149, 61, 7, 3, CAST(N'2022-05-03' AS Date), CAST(5040.3600000000 AS Decimal(18, 10)), 94, 5, 6, N'4011209000', 5, 904400, CAST(1261.4100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 94)
    INSERT @Registros VALUES (2150, 42, 7, 3, CAST(N'2022-05-03' AS Date), CAST(828.9600000000 AS Decimal(18, 10)), 4, 2, 2, N'4011209000', 5, 934569, CAST(171.5800000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 4)
    INSERT @Registros VALUES (2151, 45, 7, 3, CAST(N'2022-05-03' AS Date), CAST(5280.5000000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 947178, CAST(1031.7200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 100)
    INSERT @Registros VALUES (2152, 23, 7, 3, CAST(N'2022-05-04' AS Date), CAST(44490.8000000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 782650, CAST(13826.1000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (2153, 45, 7, 3, CAST(N'2022-05-05' AS Date), CAST(53038.1700000000 AS Decimal(18, 10)), 189, 3, 4, N'4011209000', 5, 227265, CAST(6204.5100000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 189)
    INSERT @Registros VALUES (2154, 45, 7, 3, CAST(N'2022-05-05' AS Date), CAST(5570.5400000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 5, 227265, CAST(6921.5100000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 60)
    INSERT @Registros VALUES (2155, 61, 7, 3, CAST(N'2022-05-05' AS Date), CAST(886.3500000000 AS Decimal(18, 10)), 6, 5, 6, N'4011209000', 5, 387205, CAST(221.7100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 6)
    INSERT @Registros VALUES (2156, 7, 12, 8, CAST(N'2022-05-05' AS Date), CAST(3618.9300000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 660383, CAST(620.5000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 50)
    INSERT @Registros VALUES (2157, 7, 12, 8, CAST(N'2022-05-05' AS Date), CAST(64416.8600000000 AS Decimal(18, 10)), 890, 3, 4, N'4011209000', 5, 660383, CAST(11044.9000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 890)
    INSERT @Registros VALUES (2158, 7, 12, 8, CAST(N'2022-05-05' AS Date), CAST(3618.9300000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 674021, CAST(620.5000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 50)
    INSERT @Registros VALUES (2159, 7, 12, 8, CAST(N'2022-05-05' AS Date), CAST(64416.8600000000 AS Decimal(18, 10)), 890, 3, 4, N'4011209000', 5, 674021, CAST(11044.9000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 890)
    INSERT @Registros VALUES (2160, 40, 10, 2, CAST(N'2022-05-05' AS Date), CAST(43615.4600000000 AS Decimal(18, 10)), 222, 5, 6, N'4011209000', 5, 896226, CAST(13000.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 222)
    INSERT @Registros VALUES (2161, 51, 7, 3, CAST(N'2022-05-05' AS Date), CAST(69933.1700000000 AS Decimal(18, 10)), 457, 5, 6, N'4011209000', 5, 911389, CAST(27310.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 457)
    INSERT @Registros VALUES (2162, 51, 7, 3, CAST(N'2022-05-05' AS Date), CAST(32739.3200000000 AS Decimal(18, 10)), 211, 5, 6, N'4011209000', 5, 911389, CAST(13114.4400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 211)
    INSERT @Registros VALUES (2163, 47, 7, 3, CAST(N'2022-05-06' AS Date), CAST(23743.7700000000 AS Decimal(18, 10)), 215, 3, 4, N'4011209000', 5, 168200, CAST(3677.8600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 215)
    INSERT @Registros VALUES (2164, 47, 7, 3, CAST(N'2022-05-06' AS Date), CAST(9238.5800000000 AS Decimal(18, 10)), 86, 3, 4, N'4011209000', 5, 168200, CAST(1431.0400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 86)
    INSERT @Registros VALUES (2165, 22, 7, 3, CAST(N'2022-05-06' AS Date), CAST(29712.4900000000 AS Decimal(18, 10)), 224, 5, 6, N'4011209000', 5, 216033, CAST(11562.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 224)
    INSERT @Registros VALUES (2166, 22, 7, 3, CAST(N'2022-05-06' AS Date), CAST(29715.5000000000 AS Decimal(18, 10)), 221, 5, 6, N'4011209000', 5, 504424, CAST(11446.2500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 221)
    INSERT @Registros VALUES (2167, 22, 7, 3, CAST(N'2022-05-06' AS Date), CAST(29413.6000000000 AS Decimal(18, 10)), 224, 5, 6, N'4011209000', 5, 518918, CAST(11468.3600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 224)
    INSERT @Registros VALUES (2168, 22, 7, 3, CAST(N'2022-05-06' AS Date), CAST(29293.2400000000 AS Decimal(18, 10)), 224, 5, 6, N'4011209000', 5, 957202, CAST(11426.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 224)
    INSERT @Registros VALUES (2169, 61, 7, 3, CAST(N'2022-05-09' AS Date), CAST(41672.3600000000 AS Decimal(18, 10)), 305, 5, 6, N'4011209000', 5, 31501, CAST(13352.6900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 305)
    INSERT @Registros VALUES (2170, 23, 7, 3, CAST(N'2022-05-09' AS Date), CAST(40986.1700000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 58561, CAST(14351.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (2171, 30, 7, 3, CAST(N'2022-05-09' AS Date), CAST(94881.9900000000 AS Decimal(18, 10)), 316, 3, 4, N'4011209000', 5, 68770, CAST(19382.5400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 316)
    INSERT @Registros VALUES (2172, 26, 7, 3, CAST(N'2022-05-09' AS Date), CAST(46330.7500000000 AS Decimal(18, 10)), 261, 5, 6, N'4011209000', 5, 193919, CAST(14820.6700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 261)
    INSERT @Registros VALUES (2173, 23, 7, 3, CAST(N'2022-05-10' AS Date), CAST(12297.8600000000 AS Decimal(18, 10)), 40, 3, 4, N'4011209000', 5, 171001, CAST(2504.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (2174, 23, 7, 3, CAST(N'2022-05-10' AS Date), CAST(15525.3500000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 171001, CAST(3258.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (2175, 23, 7, 3, CAST(N'2022-05-10' AS Date), CAST(3873.7900000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 5, 171001, CAST(794.6000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 12)
    INSERT @Registros VALUES (2176, 23, 7, 3, CAST(N'2022-05-10' AS Date), CAST(11068.0700000000 AS Decimal(18, 10)), 36, 3, 4, N'4011209000', 5, 171001, CAST(2149.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 36)
    INSERT @Registros VALUES (2177, 23, 7, 3, CAST(N'2022-05-10' AS Date), CAST(2120.3700000000 AS Decimal(18, 10)), 24, 3, 4, N'4011209000', 5, 171001, CAST(306.7200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 24)
    INSERT @Registros VALUES (2178, 23, 7, 3, CAST(N'2022-05-10' AS Date), CAST(2408.1600000000 AS Decimal(18, 10)), 24, 3, 4, N'4011209000', 5, 171001, CAST(318.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 24)
    INSERT @Registros VALUES (2179, 23, 7, 3, CAST(N'2022-05-10' AS Date), CAST(19987.4700000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 5, 552888, CAST(4110.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 60)
    INSERT @Registros VALUES (2180, 23, 7, 3, CAST(N'2022-05-10' AS Date), CAST(11483.1000000000 AS Decimal(18, 10)), 42, 3, 4, N'4011209000', 5, 552888, CAST(2415.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 42)
    INSERT @Registros VALUES (2181, 23, 7, 3, CAST(N'2022-05-10' AS Date), CAST(10558.1100000000 AS Decimal(18, 10)), 55, 3, 4, N'4011209000', 5, 552888, CAST(1749.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 55)
    INSERT @Registros VALUES (2182, 23, 7, 3, CAST(N'2022-05-10' AS Date), CAST(3689.3600000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 5, 552888, CAST(751.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 12)
    INSERT @Registros VALUES (2183, 23, 7, 3, CAST(N'2022-05-10' AS Date), CAST(17404.1600000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 552888, CAST(3425.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (2184, 23, 7, 3, CAST(N'2022-05-10' AS Date), CAST(7819.4200000000 AS Decimal(18, 10)), 31, 3, 4, N'4011209000', 5, 552888, CAST(1682.2200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 31)
    INSERT @Registros VALUES (2185, 23, 7, 3, CAST(N'2022-05-11' AS Date), CAST(8388.0400000000 AS Decimal(18, 10)), 40, 5, 6, N'4011209000', 5, 150469, CAST(2593.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (2186, 23, 7, 3, CAST(N'2022-05-11' AS Date), CAST(33038.0900000000 AS Decimal(18, 10)), 148, 5, 6, N'4011209000', 5, 150469, CAST(10468.0400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 148)
    INSERT @Registros VALUES (2187, 57, 12, 8, CAST(N'2022-05-11' AS Date), CAST(5281.0400000000 AS Decimal(18, 10)), 40, 5, 6, N'4011209000', 5, 484480, CAST(1982.5800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (2188, 45, 7, 3, CAST(N'2022-05-11' AS Date), CAST(75417.3700000000 AS Decimal(18, 10)), 528, 5, 6, N'4011209000', 5, 971013, CAST(29000.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 528)
    INSERT @Registros VALUES (2189, 2, 12, 8, CAST(N'2022-05-12' AS Date), CAST(96674.6700000000 AS Decimal(18, 10)), 644, 5, 6, N'4011209000', 5, 682595, CAST(31982.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 644)
    INSERT @Registros VALUES (2190, 44, 7, 3, CAST(N'2022-05-17' AS Date), CAST(57334.1900000000 AS Decimal(18, 10)), 264, 3, 4, N'4011209000', 5, 581208, CAST(12349.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 264)
    INSERT @Registros VALUES (2191, 44, 7, 3, CAST(N'2022-05-18' AS Date), CAST(43977.5600000000 AS Decimal(18, 10)), 158, 3, 4, N'4011209000', 5, 186867, CAST(9064.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 158)
    INSERT @Registros VALUES (2192, 45, 7, 3, CAST(N'2022-05-18' AS Date), CAST(29495.4600000000 AS Decimal(18, 10)), 350, 3, 4, N'4011209000', 5, 442256, CAST(5806.3100000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 350)
    INSERT @Registros VALUES (2193, 24, 12, 8, CAST(N'2022-05-19' AS Date), CAST(43330.2000000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 163626, CAST(13728.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2194, 12, 1, 2, CAST(N'2022-05-20' AS Date), CAST(2792.6000000000 AS Decimal(18, 10)), 12, 14, 15, N'4011209000', 5, 60900, CAST(723.1800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 12)
    INSERT @Registros VALUES (2195, 12, 1, 2, CAST(N'2022-05-20' AS Date), CAST(2793.8200000000 AS Decimal(18, 10)), 12, 14, 15, N'4011209000', 5, 60900, CAST(721.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 12)
    INSERT @Registros VALUES (2196, 7, 12, 8, CAST(N'2022-05-20' AS Date), CAST(8174.2100000000 AS Decimal(18, 10)), 104, 3, 4, N'4011209000', 5, 63007, CAST(1818.0900000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 104)
    INSERT @Registros VALUES (2197, 7, 12, 8, CAST(N'2022-05-20' AS Date), CAST(6925.6300000000 AS Decimal(18, 10)), 98, 3, 4, N'4011209000', 5, 63007, CAST(1540.3800000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 98)
    INSERT @Registros VALUES (2198, 7, 12, 8, CAST(N'2022-05-20' AS Date), CAST(14304.8700000000 AS Decimal(18, 10)), 182, 3, 4, N'4011209000', 5, 63007, CAST(3181.6500000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 182)
    INSERT @Registros VALUES (2199, 7, 12, 8, CAST(N'2022-05-20' AS Date), CAST(12155.1900000000 AS Decimal(18, 10)), 172, 3, 4, N'4011209000', 5, 63007, CAST(2703.5200000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 172)
    INSERT @Registros VALUES (2200, 7, 12, 8, CAST(N'2022-05-20' AS Date), CAST(2829.5300000000 AS Decimal(18, 10)), 36, 3, 4, N'4011209000', 5, 63007, CAST(629.3400000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 36)
    INSERT @Registros VALUES (2201, 7, 12, 8, CAST(N'2022-05-20' AS Date), CAST(11475.3400000000 AS Decimal(18, 10)), 146, 3, 4, N'4011209000', 5, 63007, CAST(2552.3100000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 146)
    INSERT @Registros VALUES (2202, 7, 12, 8, CAST(N'2022-05-20' AS Date), CAST(32649.4000000000 AS Decimal(18, 10)), 462, 3, 4, N'4011209000', 5, 438114, CAST(7207.0200000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 462)
    INSERT @Registros VALUES (2203, 7, 12, 8, CAST(N'2022-05-20' AS Date), CAST(26330.3900000000 AS Decimal(18, 10)), 335, 3, 4, N'4011209000', 5, 438114, CAST(5812.1700000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 335)
    INSERT @Registros VALUES (2204, 59, 12, 8, CAST(N'2022-05-20' AS Date), CAST(2304.1300000000 AS Decimal(18, 10)), 30, 5, 6, N'4011209000', 5, 677772, CAST(694.2100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 30)
    INSERT @Registros VALUES (2205, 51, 7, 3, CAST(N'2022-05-20' AS Date), CAST(60741.3400000000 AS Decimal(18, 10)), 474, 5, 6, N'4011209000', 5, 753300, CAST(21983.7800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 474)
    INSERT @Registros VALUES (2206, 44, 7, 3, CAST(N'2022-05-23' AS Date), CAST(66534.3100000000 AS Decimal(18, 10)), 347, 3, 4, N'4011209000', 5, 133480, CAST(15303.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 347)
    INSERT @Registros VALUES (2207, 12, 1, 2, CAST(N'2022-05-23' AS Date), CAST(40913.9100000000 AS Decimal(18, 10)), 372, 5, 6, N'4011209000', 5, 328697, CAST(13382.8200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 372)
    INSERT @Registros VALUES (2208, 61, 7, 3, CAST(N'2022-05-23' AS Date), CAST(37796.2500000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 5, 675443, CAST(11351.1100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (2209, 51, 7, 3, CAST(N'2022-05-23' AS Date), CAST(14844.2500000000 AS Decimal(18, 10)), 101, 5, 6, N'4011209000', 5, 991660, CAST(5025.6500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 101)
    INSERT @Registros VALUES (2210, 47, 7, 3, CAST(N'2022-05-24' AS Date), CAST(20693.7100000000 AS Decimal(18, 10)), 199, 3, 4, N'4011209000', 5, 324761, CAST(3326.0500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 199)
    INSERT @Registros VALUES (2211, 8, 7, 3, CAST(N'2022-05-24' AS Date), CAST(13817.8400000000 AS Decimal(18, 10)), 120, 5, 6, N'4011209000', 5, 808852, CAST(3515.4400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 120)
    INSERT @Registros VALUES (2212, 61, 7, 3, CAST(N'2022-05-24' AS Date), CAST(49971.6600000000 AS Decimal(18, 10)), 384, 5, 6, N'4011209000', 5, 850351, CAST(15539.5500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 384)
    INSERT @Registros VALUES (2213, 42, 7, 3, CAST(N'2022-05-25' AS Date), CAST(59111.2900000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 5, 174395, CAST(13856.4500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (2214, 54, 12, 8, CAST(N'2022-05-25' AS Date), CAST(27327.3400000000 AS Decimal(18, 10)), 388, 5, 6, N'4011209000', 5, 400347, CAST(20803.9500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 388)
    INSERT @Registros VALUES (2215, 15, 7, 3, CAST(N'2022-05-26' AS Date), CAST(10408.5400000000 AS Decimal(18, 10)), 48, 3, 4, N'4011209000', 5, 512879, CAST(2143.9400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 48)
    INSERT @Registros VALUES (2216, 45, 7, 3, CAST(N'2022-05-26' AS Date), CAST(15403.5800000000 AS Decimal(18, 10)), 185, 3, 4, N'4011209000', 5, 920297, CAST(2859.3000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 185)
    INSERT @Registros VALUES (2217, 30, 7, 3, CAST(N'2022-05-27' AS Date), CAST(1017.6000000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 5, 75699, CAST(142.3100000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 12)
    INSERT @Registros VALUES (2218, 45, 7, 3, CAST(N'2022-05-27' AS Date), CAST(29037.6300000000 AS Decimal(18, 10)), 340, 14, 15, N'4011209000', 5, 386977, CAST(5936.6200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 340)
    INSERT @Registros VALUES (2219, 47, 7, 3, CAST(N'2022-05-27' AS Date), CAST(2880.2800000000 AS Decimal(18, 10)), 27, 3, 4, N'4011209000', 5, 473337, CAST(472.5200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 27)
    INSERT @Registros VALUES (2220, 45, 7, 3, CAST(N'2022-05-30' AS Date), CAST(91140.5300000000 AS Decimal(18, 10)), 322, 3, 4, N'4011209000', 5, 3227, CAST(20618.7800000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 322)
    INSERT @Registros VALUES (2221, 66, 12, 8, CAST(N'2022-05-30' AS Date), CAST(30118.1200000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 512144, CAST(14745.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (2222, 45, 7, 3, CAST(N'2022-05-30' AS Date), CAST(91883.6400000000 AS Decimal(18, 10)), 380, 3, 4, N'4011209000', 5, 807685, CAST(20932.1000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 380)
    INSERT @Registros VALUES (2223, 30, 7, 3, CAST(N'2022-05-30' AS Date), CAST(5976.6700000000 AS Decimal(18, 10)), 16, 18, 13, N'4011209000', 5, 955137, CAST(1125.3700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 16)
    INSERT @Registros VALUES (2224, 30, 7, 3, CAST(N'2022-05-30' AS Date), CAST(2241.5800000000 AS Decimal(18, 10)), 4, 10, 13, N'4011209000', 5, 955137, CAST(342.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 4)
    INSERT @Registros VALUES (2225, 12, 1, 2, CAST(N'2022-05-31' AS Date), CAST(38565.5100000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 5, 1911, CAST(14840.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 256)
    INSERT @Registros VALUES (2226, 45, 7, 3, CAST(N'2022-05-31' AS Date), CAST(36996.9300000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 43319, CAST(14500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2227, 51, 7, 3, CAST(N'2022-05-31' AS Date), CAST(37253.0500000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 174370, CAST(13612.2100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (2228, 59, 12, 8, CAST(N'2022-05-31' AS Date), CAST(69050.7200000000 AS Decimal(18, 10)), 582, 5, 6, N'4011209000', 5, 175492, CAST(26449.7400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 582)
    INSERT @Registros VALUES (2229, 7, 12, 8, CAST(N'2022-05-31' AS Date), CAST(31050.1800000000 AS Decimal(18, 10)), 399, 3, 4, N'4011209000', 5, 272263, CAST(7033.4200000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 399)
    INSERT @Registros VALUES (2230, 7, 12, 8, CAST(N'2022-05-31' AS Date), CAST(5291.7600000000 AS Decimal(18, 10)), 68, 3, 4, N'4011209000', 5, 272263, CAST(1198.6800000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 68)
    INSERT @Registros VALUES (2231, 7, 12, 8, CAST(N'2022-05-31' AS Date), CAST(5597.6000000000 AS Decimal(18, 10)), 80, 3, 4, N'4011209000', 5, 272263, CAST(1267.9600000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 80)
    INSERT @Registros VALUES (2232, 7, 12, 8, CAST(N'2022-05-31' AS Date), CAST(10505.7000000000 AS Decimal(18, 10)), 135, 3, 4, N'4011209000', 5, 272263, CAST(2379.7300000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 135)
    INSERT @Registros VALUES (2233, 45, 7, 3, CAST(N'2022-05-31' AS Date), CAST(69217.9000000000 AS Decimal(18, 10)), 350, 3, 4, N'4011209000', 5, 280104, CAST(14438.9300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 350)
    INSERT @Registros VALUES (2234, 45, 7, 3, CAST(N'2022-05-31' AS Date), CAST(51881.2500000000 AS Decimal(18, 10)), 657, 3, 4, N'4011209000', 5, 456608, CAST(9461.4200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 657)
    INSERT @Registros VALUES (2235, 26, 7, 3, CAST(N'2022-05-31' AS Date), CAST(42964.5100000000 AS Decimal(18, 10)), 290, 5, 6, N'4011209000', 5, 463210, CAST(14474.4800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 290)
    INSERT @Registros VALUES (2236, 45, 7, 3, CAST(N'2022-05-31' AS Date), CAST(41470.0100000000 AS Decimal(18, 10)), 140, 3, 4, N'4011209000', 5, 517203, CAST(9061.3400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 140)
    INSERT @Registros VALUES (2237, 30, 7, 3, CAST(N'2022-05-31' AS Date), CAST(42390.1400000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 524987, CAST(16146.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2238, 44, 7, 3, CAST(N'2022-05-31' AS Date), CAST(38255.0200000000 AS Decimal(18, 10)), 286, 5, 6, N'4011209000', 5, 546007, CAST(12367.3000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 286)
    INSERT @Registros VALUES (2239, 7, 12, 8, CAST(N'2022-05-31' AS Date), CAST(7836.6400000000 AS Decimal(18, 10)), 112, 3, 4, N'4011209000', 5, 575644, CAST(1757.0800000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 112)
    INSERT @Registros VALUES (2240, 7, 12, 8, CAST(N'2022-05-31' AS Date), CAST(629.7300000000 AS Decimal(18, 10)), 9, 3, 4, N'4011209000', 5, 575644, CAST(141.1900000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 9)
    INSERT @Registros VALUES (2241, 7, 12, 8, CAST(N'2022-05-31' AS Date), CAST(3078.6800000000 AS Decimal(18, 10)), 44, 3, 4, N'4011209000', 5, 575644, CAST(690.2800000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 44)
    INSERT @Registros VALUES (2242, 7, 12, 8, CAST(N'2022-05-31' AS Date), CAST(7237.2600000000 AS Decimal(18, 10)), 93, 3, 4, N'4011209000', 5, 575644, CAST(1622.6900000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 93)
    INSERT @Registros VALUES (2243, 7, 12, 8, CAST(N'2022-05-31' AS Date), CAST(2448.9500000000 AS Decimal(18, 10)), 35, 3, 4, N'4011209000', 5, 575644, CAST(549.0900000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 35)
    INSERT @Registros VALUES (2244, 7, 12, 8, CAST(N'2022-05-31' AS Date), CAST(4408.1100000000 AS Decimal(18, 10)), 63, 3, 4, N'4011209000', 5, 575644, CAST(988.3600000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 63)
    INSERT @Registros VALUES (2245, 7, 12, 8, CAST(N'2022-05-31' AS Date), CAST(27781.7400000000 AS Decimal(18, 10)), 357, 3, 4, N'4011209000', 5, 575644, CAST(6229.0200000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 357)
    INSERT @Registros VALUES (2246, 7, 12, 8, CAST(N'2022-05-31' AS Date), CAST(4478.0800000000 AS Decimal(18, 10)), 64, 3, 4, N'4011209000', 5, 575644, CAST(1004.0400000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 64)
    INSERT @Registros VALUES (2247, 30, 7, 3, CAST(N'2022-05-31' AS Date), CAST(86162.7300000000 AS Decimal(18, 10)), 534, 5, 6, N'4011209000', 5, 623394, CAST(32983.1400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 534)
    INSERT @Registros VALUES (2248, 64, 7, 3, CAST(N'2022-06-01' AS Date), CAST(48868.7900000000 AS Decimal(18, 10)), 476, 5, 6, N'4011209000', 5, 165164, CAST(16510.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 476)
    INSERT @Registros VALUES (2249, 6, 7, 3, CAST(N'2022-06-01' AS Date), CAST(38000.2900000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 624396, CAST(13800.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2250, 20, 7, 3, CAST(N'2022-06-01' AS Date), CAST(32118.7400000000 AS Decimal(18, 10)), 750, 5, 6, N'4011209000', 5, 824006, CAST(11695.6700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 750)
    INSERT @Registros VALUES (2251, 37, 8, 4, CAST(N'2022-06-01' AS Date), CAST(53089.2900000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 5, 972353, CAST(15111.7200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 256)
    INSERT @Registros VALUES (2252, 7, 12, 8, CAST(N'2022-06-02' AS Date), CAST(15326.6500000000 AS Decimal(18, 10)), 195, 3, 4, N'4011209000', 5, 874568, CAST(3450.3300000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 195)
    INSERT @Registros VALUES (2253, 7, 12, 8, CAST(N'2022-06-02' AS Date), CAST(38434.5100000000 AS Decimal(18, 10)), 489, 3, 4, N'4011209000', 5, 874568, CAST(8652.3600000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 489)
    INSERT @Registros VALUES (2254, 7, 12, 8, CAST(N'2022-06-06' AS Date), CAST(3735.3600000000 AS Decimal(18, 10)), 48, 3, 4, N'4011209000', 5, 117527, CAST(849.3100000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 48)
    INSERT @Registros VALUES (2255, 7, 12, 8, CAST(N'2022-06-06' AS Date), CAST(10194.4200000000 AS Decimal(18, 10)), 131, 3, 4, N'4011209000', 5, 117527, CAST(2317.9100000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 131)
    INSERT @Registros VALUES (2256, 7, 12, 8, CAST(N'2022-06-06' AS Date), CAST(36030.6600000000 AS Decimal(18, 10)), 463, 3, 4, N'4011209000', 5, 117527, CAST(8192.3200000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 463)
    INSERT @Registros VALUES (2257, 7, 12, 8, CAST(N'2022-06-06' AS Date), CAST(4357.9200000000 AS Decimal(18, 10)), 56, 3, 4, N'4011209000', 5, 117527, CAST(990.8700000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 56)
    INSERT @Registros VALUES (2258, 30, 7, 3, CAST(N'2022-06-06' AS Date), CAST(13929.7300000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 895885, CAST(2776.5500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 50)
    INSERT @Registros VALUES (2259, 23, 7, 3, CAST(N'2022-06-06' AS Date), CAST(44746.5600000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 970969, CAST(13935.7500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (2260, 23, 7, 3, CAST(N'2022-06-06' AS Date), CAST(40044.4900000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 5, 976482, CAST(13843.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 254)
    INSERT @Registros VALUES (2261, 23, 7, 3, CAST(N'2022-06-07' AS Date), CAST(40554.0100000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 5, 200074, CAST(13970.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 254)
    INSERT @Registros VALUES (2262, 44, 7, 3, CAST(N'2022-06-07' AS Date), CAST(39739.6000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 745305, CAST(14500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (2263, 47, 7, 3, CAST(N'2022-06-08' AS Date), CAST(15188.3600000000 AS Decimal(18, 10)), 151, 3, 4, N'4011209000', 5, 122563, CAST(2359.0500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 151)
    INSERT @Registros VALUES (2264, 45, 7, 3, CAST(N'2022-06-08' AS Date), CAST(54500.0900000000 AS Decimal(18, 10)), 555, 3, 4, N'4011209000', 5, 304222, CAST(9946.2900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 555)
    INSERT @Registros VALUES (2265, 7, 12, 8, CAST(N'2022-06-08' AS Date), CAST(7629.8300000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 347427, CAST(1241.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 100)
    INSERT @Registros VALUES (2266, 7, 12, 8, CAST(N'2022-06-08' AS Date), CAST(135811.2000000000 AS Decimal(18, 10)), 1780, 3, 4, N'4011209000', 5, 347427, CAST(22089.8000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1780)
    INSERT @Registros VALUES (2267, 10, 7, 3, CAST(N'2022-06-09' AS Date), CAST(4462.1800000000 AS Decimal(18, 10)), 36, 3, 4, N'4011209000', 5, 153092, CAST(646.5600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 36)
    INSERT @Registros VALUES (2268, 13, 5, 6, CAST(N'2022-06-09' AS Date), CAST(34708.8500000000 AS Decimal(18, 10)), 120, 3, 4, N'4011209000', 5, 344125, CAST(7313.9800000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 120)
    INSERT @Registros VALUES (2269, 22, 7, 3, CAST(N'2022-06-09' AS Date), CAST(31368.8900000000 AS Decimal(18, 10)), 240, 5, 6, N'4011209000', 5, 420383, CAST(13480.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 240)
    INSERT @Registros VALUES (2270, 22, 7, 3, CAST(N'2022-06-09' AS Date), CAST(31268.8900000000 AS Decimal(18, 10)), 240, 5, 6, N'4011209000', 5, 485836, CAST(13585.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 240)
    INSERT @Registros VALUES (2271, 42, 7, 3, CAST(N'2022-06-09' AS Date), CAST(42570.8800000000 AS Decimal(18, 10)), 142, 2, 2, N'4011209000', 5, 928851, CAST(8766.4400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 142)
    INSERT @Registros VALUES (2272, 64, 7, 3, CAST(N'2022-06-10' AS Date), CAST(50094.3900000000 AS Decimal(18, 10)), 534, 5, 6, N'4011209000', 5, 444950, CAST(16632.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 534)
    INSERT @Registros VALUES (2273, 24, 12, 8, CAST(N'2022-06-10' AS Date), CAST(43733.0600000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 625883, CAST(14560.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (2274, 20, 7, 3, CAST(N'2022-06-13' AS Date), CAST(72123.0800000000 AS Decimal(18, 10)), 550, 5, 6, N'4011209000', 5, 310166, CAST(26940.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 550)
    INSERT @Registros VALUES (2275, 45, 7, 3, CAST(N'2022-06-14' AS Date), CAST(15167.8900000000 AS Decimal(18, 10)), 173, 3, 4, N'4011209000', 5, 514200, CAST(2924.7100000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 173)
    INSERT @Registros VALUES (2276, 61, 7, 3, CAST(N'2022-06-14' AS Date), CAST(40222.1600000000 AS Decimal(18, 10)), 310, 5, 6, N'4011209000', 5, 866043, CAST(13674.2900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 310)
    INSERT @Registros VALUES (2277, 44, 7, 3, CAST(N'2022-06-15' AS Date), CAST(61498.8700000000 AS Decimal(18, 10)), 291, 3, 4, N'4011209000', 5, 28509, CAST(14373.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 291)
    INSERT @Registros VALUES (2278, 42, 7, 3, CAST(N'2022-06-15' AS Date), CAST(56951.4000000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 5, 503472, CAST(13490.7000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (2279, 51, 7, 3, CAST(N'2022-06-17' AS Date), CAST(12500.2700000000 AS Decimal(18, 10)), 90, 5, 6, N'4011209000', 5, 139510, CAST(4022.3400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 90)
    INSERT @Registros VALUES (2280, 13, 5, 6, CAST(N'2022-06-17' AS Date), CAST(74963.4500000000 AS Decimal(18, 10)), 524, 5, 6, N'4011209000', 5, 187544, CAST(28760.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 524)
    INSERT @Registros VALUES (2281, 61, 7, 3, CAST(N'2022-06-17' AS Date), CAST(38985.9200000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 451900, CAST(13364.6200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (2282, 51, 7, 3, CAST(N'2022-06-17' AS Date), CAST(31044.1800000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 610430, CAST(13020.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (2283, 61, 7, 3, CAST(N'2022-06-17' AS Date), CAST(21238.9800000000 AS Decimal(18, 10)), 134, 5, 6, N'4011209000', 5, 818315, CAST(6896.4100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 134)
    INSERT @Registros VALUES (2284, 51, 7, 3, CAST(N'2022-06-17' AS Date), CAST(34321.0200000000 AS Decimal(18, 10)), 233, 5, 6, N'4011209000', 5, 872147, CAST(13770.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 233)
    INSERT @Registros VALUES (2285, 41, 7, 3, CAST(N'2022-06-20' AS Date), CAST(14635.9500000000 AS Decimal(18, 10)), 60, 5, 18, N'4011209000', 5, 6900, CAST(2753.1200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 60)
    INSERT @Registros VALUES (2286, 63, 12, 8, CAST(N'2022-06-20' AS Date), CAST(4269.8300000000 AS Decimal(18, 10)), 30, 5, 6, N'4011209000', 5, 98794, CAST(1355.1700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 30)
    INSERT @Registros VALUES (2287, 63, 12, 8, CAST(N'2022-06-20' AS Date), CAST(37463.4900000000 AS Decimal(18, 10)), 270, 5, 6, N'4011209000', 5, 197045, CAST(14200.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 270)
    INSERT @Registros VALUES (2288, 44, 7, 3, CAST(N'2022-06-20' AS Date), CAST(19850.5700000000 AS Decimal(18, 10)), 113, 5, 6, N'4011209000', 5, 224397, CAST(5041.1000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 113)
    INSERT @Registros VALUES (2289, 45, 7, 3, CAST(N'2022-06-20' AS Date), CAST(77241.1700000000 AS Decimal(18, 10)), 350, 3, 4, N'4011209000', 5, 300963, CAST(20462.5500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 350)
    INSERT @Registros VALUES (2290, 24, 12, 8, CAST(N'2022-06-20' AS Date), CAST(44405.0600000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 380859, CAST(13728.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2291, 61, 7, 3, CAST(N'2022-06-20' AS Date), CAST(42392.1600000000 AS Decimal(18, 10)), 392, 5, 6, N'4011209000', 5, 583916, CAST(14694.7600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 392)
    INSERT @Registros VALUES (2292, 26, 7, 3, CAST(N'2022-06-20' AS Date), CAST(45359.3100000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 769999, CAST(15900.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2293, 7, 12, 8, CAST(N'2022-06-21' AS Date), CAST(59833.6500000000 AS Decimal(18, 10)), 684, 3, 4, N'4011209000', 5, 19677, CAST(12102.7000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 684)
    INSERT @Registros VALUES (2294, 61, 7, 3, CAST(N'2022-06-21' AS Date), CAST(38676.6800000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 102179, CAST(14066.6200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (2295, 7, 12, 8, CAST(N'2022-06-21' AS Date), CAST(14695.9800000000 AS Decimal(18, 10)), 168, 3, 4, N'4011209000', 5, 260544, CAST(2972.5900000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 168)
    INSERT @Registros VALUES (2296, 7, 12, 8, CAST(N'2022-06-21' AS Date), CAST(35340.3400000000 AS Decimal(18, 10)), 404, 3, 4, N'4011209000', 5, 260544, CAST(7148.3800000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 404)
    INSERT @Registros VALUES (2297, 7, 12, 8, CAST(N'2022-06-21' AS Date), CAST(9797.3200000000 AS Decimal(18, 10)), 112, 3, 4, N'4011209000', 5, 260544, CAST(1981.7300000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 112)
    INSERT @Registros VALUES (2298, 7, 12, 8, CAST(N'2022-06-21' AS Date), CAST(58171.6000000000 AS Decimal(18, 10)), 665, 3, 4, N'4011209000', 5, 386608, CAST(11754.5800000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 665)
    INSERT @Registros VALUES (2299, 7, 12, 8, CAST(N'2022-06-21' AS Date), CAST(1730.2700000000 AS Decimal(18, 10)), 22, 3, 4, N'4011209000', 5, 386608, CAST(349.6300000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 22)
    INSERT @Registros VALUES (2300, 23, 7, 3, CAST(N'2022-06-22' AS Date), CAST(40768.7400000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 8245, CAST(14351.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (2301, 61, 7, 3, CAST(N'2022-06-22' AS Date), CAST(36656.6800000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 94356, CAST(13364.6200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (2302, 26, 7, 3, CAST(N'2022-06-22' AS Date), CAST(44474.8400000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 281522, CAST(15712.5700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2303, 44, 7, 3, CAST(N'2022-06-22' AS Date), CAST(80830.2200000000 AS Decimal(18, 10)), 522, 5, 6, N'4011209000', 5, 297851, CAST(29620.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 522)
    INSERT @Registros VALUES (2304, 61, 7, 3, CAST(N'2022-06-22' AS Date), CAST(2391.0700000000 AS Decimal(18, 10)), 16, 5, 6, N'4011209000', 5, 582318, CAST(731.1800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 16)
    INSERT @Registros VALUES (2305, 47, 7, 3, CAST(N'2022-06-23' AS Date), CAST(31583.1800000000 AS Decimal(18, 10)), 293, 3, 4, N'4011209000', 5, 77104, CAST(5224.7000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 293)
    INSERT @Registros VALUES (2306, 30, 7, 3, CAST(N'2022-06-23' AS Date), CAST(1014.7000000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 5, 154343, CAST(143.1700000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 12)
    INSERT @Registros VALUES (2307, 30, 7, 3, CAST(N'2022-06-23' AS Date), CAST(1906.3500000000 AS Decimal(18, 10)), 21, 3, 4, N'4011209000', 5, 187425, CAST(313.8000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 21)
    INSERT @Registros VALUES (2308, 23, 7, 3, CAST(N'2022-06-23' AS Date), CAST(9598.2800000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 479689, CAST(1590.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (2309, 23, 7, 3, CAST(N'2022-06-23' AS Date), CAST(6087.5800000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 5, 479689, CAST(1235.6000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (2310, 23, 7, 3, CAST(N'2022-06-23' AS Date), CAST(15357.2400000000 AS Decimal(18, 10)), 80, 3, 4, N'4011209000', 5, 479689, CAST(2544.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 80)
    INSERT @Registros VALUES (2311, 23, 7, 3, CAST(N'2022-06-23' AS Date), CAST(3597.1000000000 AS Decimal(18, 10)), 24, 3, 4, N'4011209000', 5, 479689, CAST(664.8000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 24)
    INSERT @Registros VALUES (2312, 23, 7, 3, CAST(N'2022-06-23' AS Date), CAST(1830.0000000000 AS Decimal(18, 10)), 5, 3, 4, N'4011209000', 5, 479689, CAST(376.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 5)
    INSERT @Registros VALUES (2313, 23, 7, 3, CAST(N'2022-06-23' AS Date), CAST(7868.8500000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 479689, CAST(1385.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (2314, 23, 7, 3, CAST(N'2022-06-23' AS Date), CAST(6148.9300000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 5, 479689, CAST(1194.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (2315, 12, 1, 2, CAST(N'2022-06-23' AS Date), CAST(36276.7500000000 AS Decimal(18, 10)), 286, 5, 6, N'4011209000', 5, 964890, CAST(14910.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 286)
    INSERT @Registros VALUES (2316, 44, 7, 3, CAST(N'2022-06-24' AS Date), CAST(33419.1700000000 AS Decimal(18, 10)), 137, 3, 4, N'4011209000', 5, 108756, CAST(6358.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 137)
    INSERT @Registros VALUES (2317, 61, 7, 3, CAST(N'2022-06-24' AS Date), CAST(38535.2800000000 AS Decimal(18, 10)), 267, 5, 6, N'4011209000', 5, 295054, CAST(13974.1200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 267)
    INSERT @Registros VALUES (2318, 12, 1, 2, CAST(N'2022-06-24' AS Date), CAST(4162.7200000000 AS Decimal(18, 10)), 16, 14, 15, N'4011209000', 5, 428790, CAST(957.8200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 16)
    INSERT @Registros VALUES (2319, 44, 7, 3, CAST(N'2022-06-24' AS Date), CAST(66107.8300000000 AS Decimal(18, 10)), 278, 3, 4, N'4011209000', 5, 457485, CAST(14514.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 278)
    INSERT @Registros VALUES (2320, 45, 7, 3, CAST(N'2022-06-24' AS Date), CAST(38815.3800000000 AS Decimal(18, 10)), 203, 20, 20, N'4011209000', 5, 498182, CAST(13310.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 203)
    INSERT @Registros VALUES (2321, 25, 7, 3, CAST(N'2022-06-27' AS Date), CAST(25607.3400000000 AS Decimal(18, 10)), 220, 5, 6, N'4011209000', 5, 133402, CAST(10214.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (2322, 45, 7, 3, CAST(N'2022-06-27' AS Date), CAST(25086.9400000000 AS Decimal(18, 10)), 304, 14, 15, N'4011209000', 5, 297600, CAST(4997.8700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 304)
    INSERT @Registros VALUES (2323, 51, 7, 3, CAST(N'2022-06-27' AS Date), CAST(62239.0300000000 AS Decimal(18, 10)), 482, 5, 6, N'4011209000', 5, 351129, CAST(25830.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 482)
    INSERT @Registros VALUES (2324, 59, 12, 8, CAST(N'2022-06-27' AS Date), CAST(148580.0600000000 AS Decimal(18, 10)), 1065, 5, 6, N'4011209000', 5, 774844, CAST(57725.7600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1065)
    INSERT @Registros VALUES (2325, 45, 7, 3, CAST(N'2022-06-27' AS Date), CAST(12688.3300000000 AS Decimal(18, 10)), 179, 16, 17, N'4011209000', 5, 785700, CAST(2251.5100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 179)
    INSERT @Registros VALUES (2326, 45, 7, 3, CAST(N'2022-06-27' AS Date), CAST(91595.8400000000 AS Decimal(18, 10)), 386, 3, 4, N'4011209000', 5, 969344, CAST(21724.6300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 386)
    INSERT @Registros VALUES (2327, 45, 7, 3, CAST(N'2022-06-28' AS Date), CAST(207829.4900000000 AS Decimal(18, 10)), 1189, 20, 20, N'4011209000', 5, 90796, CAST(72723.5800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1189)
    INSERT @Registros VALUES (2328, 51, 7, 3, CAST(N'2022-06-28' AS Date), CAST(6111.4500000000 AS Decimal(18, 10)), 50, 6, 7, N'4011209000', 5, 382855, CAST(1419.3200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (2329, 45, 7, 3, CAST(N'2022-06-28' AS Date), CAST(117321.2100000000 AS Decimal(18, 10)), 759, 20, 20, N'4011209000', 5, 482338, CAST(42550.1800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 759)
    INSERT @Registros VALUES (2330, 6, 7, 3, CAST(N'2022-06-28' AS Date), CAST(30529.2600000000 AS Decimal(18, 10)), 100, 5, 6, N'4011209000', 5, 665780, CAST(5553.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 100)
    INSERT @Registros VALUES (2331, 42, 7, 3, CAST(N'2022-06-28' AS Date), CAST(2499.2000000000 AS Decimal(18, 10)), 8, 2, 2, N'4011209000', 5, 988518, CAST(506.2700000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 8)
    INSERT @Registros VALUES (2332, 30, 7, 3, CAST(N'2022-06-29' AS Date), CAST(74016.5100000000 AS Decimal(18, 10)), 227, 3, 4, N'4011209000', 5, 116014, CAST(14099.3300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 227)
    INSERT @Registros VALUES (2333, 30, 7, 3, CAST(N'2022-06-29' AS Date), CAST(43511.9400000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 991758, CAST(17056.9500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (2334, 51, 7, 3, CAST(N'2022-06-30' AS Date), CAST(36561.0300000000 AS Decimal(18, 10)), 364, 5, 6, N'4011209000', 5, 111398, CAST(13115.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 364)
    INSERT @Registros VALUES (2335, 51, 7, 3, CAST(N'2022-06-30' AS Date), CAST(33765.2200000000 AS Decimal(18, 10)), 224, 5, 6, N'4011209000', 5, 111398, CAST(12532.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 224)
    INSERT @Registros VALUES (2336, 51, 7, 3, CAST(N'2022-06-30' AS Date), CAST(2576.3300000000 AS Decimal(18, 10)), 20, 5, 6, N'4011209000', 5, 111398, CAST(766.5900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (2337, 22, 7, 3, CAST(N'2022-06-30' AS Date), CAST(33875.9400000000 AS Decimal(18, 10)), 252, 5, 16, N'4011209000', 5, 564792, CAST(14736.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (2338, 47, 7, 3, CAST(N'2022-06-30' AS Date), CAST(5667.2900000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 996581, CAST(936.4700000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 50)
    INSERT @Registros VALUES (2339, 20, 7, 3, CAST(N'2022-07-01' AS Date), CAST(40116.6100000000 AS Decimal(18, 10)), 680, 5, 6, N'4011209000', 5, 8893, CAST(16940.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 680)
    INSERT @Registros VALUES (2340, 61, 7, 3, CAST(N'2022-07-01' AS Date), CAST(38439.9100000000 AS Decimal(18, 10)), 370, 5, 6, N'4011209000', 5, 90507, CAST(13186.6000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 370)
    INSERT @Registros VALUES (2341, 14, 4, 2, CAST(N'2022-07-01' AS Date), CAST(33958.8500000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 5, 160409, CAST(12198.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 256)
    INSERT @Registros VALUES (2342, 20, 7, 3, CAST(N'2022-07-01' AS Date), CAST(24319.4700000000 AS Decimal(18, 10)), 200, 5, 6, N'4011209000', 5, 586572, CAST(10574.3600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 200)
    INSERT @Registros VALUES (2343, 7, 12, 8, CAST(N'2022-07-01' AS Date), CAST(59833.6500000000 AS Decimal(18, 10)), 684, 3, 4, N'4011209000', 5, 822116, CAST(12102.6900000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 684)
    INSERT @Registros VALUES (2344, 51, 7, 3, CAST(N'2022-07-04' AS Date), CAST(2013.8200000000 AS Decimal(18, 10)), 20, 5, 6, N'4011209000', 5, 139521, CAST(609.4900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (2345, 51, 7, 3, CAST(N'2022-07-04' AS Date), CAST(58710.0800000000 AS Decimal(18, 10)), 447, 5, 6, N'4011209000', 5, 509127, CAST(24162.5300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 447)
    INSERT @Registros VALUES (2346, 42, 7, 3, CAST(N'2022-07-04' AS Date), CAST(49488.0400000000 AS Decimal(18, 10)), 394, 5, 6, N'4011209000', 5, 626488, CAST(15954.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 394)
    INSERT @Registros VALUES (2347, 22, 7, 3, CAST(N'2022-07-04' AS Date), CAST(24099.0800000000 AS Decimal(18, 10)), 192, 5, 6, N'4011209000', 5, 637754, CAST(9630.0100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 192)
    INSERT @Registros VALUES (2348, 22, 7, 3, CAST(N'2022-07-05' AS Date), CAST(28155.2600000000 AS Decimal(18, 10)), 228, 5, 6, N'4011209000', 5, 210005, CAST(11456.5500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 228)
    INSERT @Registros VALUES (2349, 22, 7, 3, CAST(N'2022-07-05' AS Date), CAST(22080.0000000000 AS Decimal(18, 10)), 224, 5, 6, N'4011209000', 5, 246700, CAST(8702.6700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 224)
    INSERT @Registros VALUES (2350, 7, 12, 8, CAST(N'2022-07-05' AS Date), CAST(71782.8400000000 AS Decimal(18, 10)), 940, 3, 4, N'4011209000', 5, 274167, CAST(11665.4000000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 940)
    INSERT @Registros VALUES (2351, 7, 12, 8, CAST(N'2022-07-05' AS Date), CAST(71782.8400000000 AS Decimal(18, 10)), 940, 3, 4, N'4011209000', 5, 274167, CAST(11665.4000000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 940)
    INSERT @Registros VALUES (2352, 61, 7, 3, CAST(N'2022-07-05' AS Date), CAST(1240.6100000000 AS Decimal(18, 10)), 18, 5, 6, N'4011209000', 5, 897148, CAST(338.5500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 18)
    INSERT @Registros VALUES (2353, 7, 12, 8, CAST(N'2022-07-06' AS Date), CAST(1625.4000000000 AS Decimal(18, 10)), 23, 3, 4, N'4011209000', 5, 47916, CAST(345.9000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 23)
    INSERT @Registros VALUES (2354, 7, 12, 8, CAST(N'2022-07-06' AS Date), CAST(1966.2200000000 AS Decimal(18, 10)), 25, 3, 4, N'4011209000', 5, 47916, CAST(418.4300000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 25)
    INSERT @Registros VALUES (2355, 7, 12, 8, CAST(N'2022-07-06' AS Date), CAST(15745.7000000000 AS Decimal(18, 10)), 180, 3, 4, N'4011209000', 5, 47916, CAST(3350.8100000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 180)
    INSERT @Registros VALUES (2356, 7, 12, 8, CAST(N'2022-07-06' AS Date), CAST(43956.5500000000 AS Decimal(18, 10)), 622, 3, 4, N'4011209000', 5, 47916, CAST(9354.2900000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 622)
    INSERT @Registros VALUES (2357, 23, 7, 3, CAST(N'2022-07-06' AS Date), CAST(90231.4100000000 AS Decimal(18, 10)), 262, 3, 4, N'4011209000', 5, 383366, CAST(17255.9500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 262)
    INSERT @Registros VALUES (2358, 61, 7, 3, CAST(N'2022-07-06' AS Date), CAST(39532.8800000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 608935, CAST(14284.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (2359, 42, 7, 3, CAST(N'2022-07-07' AS Date), CAST(57415.0000000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 5, 54970, CAST(13245.5400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (2360, 42, 7, 3, CAST(N'2022-07-07' AS Date), CAST(52521.7900000000 AS Decimal(18, 10)), 241, 3, 4, N'4011209000', 5, 141914, CAST(11567.6500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 241)
    INSERT @Registros VALUES (2361, 61, 7, 3, CAST(N'2022-07-07' AS Date), CAST(39158.4800000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 645180, CAST(14102.9600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (2362, 47, 7, 3, CAST(N'2022-07-07' AS Date), CAST(36391.5000000000 AS Decimal(18, 10)), 360, 3, 4, N'4011209000', 5, 702161, CAST(5441.9800000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 360)
    INSERT @Registros VALUES (2363, 24, 12, 8, CAST(N'2022-07-07' AS Date), CAST(43929.0000000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 940595, CAST(13728.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2364, 30, 7, 3, CAST(N'2022-07-08' AS Date), CAST(3838.8100000000 AS Decimal(18, 10)), 46, 3, 4, N'4011209000', 5, 83431, CAST(600.7600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 46)
    INSERT @Registros VALUES (2365, 45, 7, 3, CAST(N'2022-07-08' AS Date), CAST(11530.8300000000 AS Decimal(18, 10)), 157, 16, 17, N'4011209000', 5, 241253, CAST(1972.4100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 157)
    INSERT @Registros VALUES (2366, 51, 7, 3, CAST(N'2022-07-11' AS Date), CAST(17758.6400000000 AS Decimal(18, 10)), 113, 5, 6, N'4011209000', 5, 12507, CAST(5877.5600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 113)
    INSERT @Registros VALUES (2367, 7, 12, 8, CAST(N'2022-07-12' AS Date), CAST(6910.6100000000 AS Decimal(18, 10)), 79, 3, 4, N'4011209000', 5, 161835, CAST(1376.3400000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 79)
    INSERT @Registros VALUES (2368, 7, 12, 8, CAST(N'2022-07-12' AS Date), CAST(27527.0400000000 AS Decimal(18, 10)), 350, 3, 4, N'4011209000', 5, 161835, CAST(5482.3700000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 350)
    INSERT @Registros VALUES (2369, 7, 12, 8, CAST(N'2022-07-12' AS Date), CAST(14171.1300000000 AS Decimal(18, 10)), 162, 3, 4, N'4011209000', 5, 161835, CAST(2822.3700000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 162)
    INSERT @Registros VALUES (2370, 7, 12, 8, CAST(N'2022-07-12' AS Date), CAST(14258.6000000000 AS Decimal(18, 10)), 163, 3, 4, N'4011209000', 5, 161835, CAST(2839.7900000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 163)
    INSERT @Registros VALUES (2371, 30, 7, 3, CAST(N'2022-07-12' AS Date), CAST(12563.6100000000 AS Decimal(18, 10)), 50, 20, 3, N'4011209000', 5, 401820, CAST(3093.8500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (2372, 45, 7, 3, CAST(N'2022-07-13' AS Date), CAST(34281.3900000000 AS Decimal(18, 10)), 154, 3, 4, N'4011209000', 5, 182709, CAST(6794.3500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 154)
    INSERT @Registros VALUES (2373, 61, 7, 3, CAST(N'2022-07-13' AS Date), CAST(36956.6800000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 345101, CAST(13364.6200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (2374, 10, 7, 3, CAST(N'2022-07-13' AS Date), CAST(4119.2400000000 AS Decimal(18, 10)), 38, 3, 4, N'4011209000', 5, 583160, CAST(527.4900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 38)
    INSERT @Registros VALUES (2375, 23, 7, 3, CAST(N'2022-07-14' AS Date), CAST(24064.1300000000 AS Decimal(18, 10)), 141, 5, 6, N'4011209000', 5, 136096, CAST(8020.0400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 141)
    INSERT @Registros VALUES (2376, 45, 7, 3, CAST(N'2022-07-15' AS Date), CAST(30043.5300000000 AS Decimal(18, 10)), 106, 3, 4, N'4011209000', 5, 263353, CAST(6423.3900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 106)
    INSERT @Registros VALUES (2377, 45, 7, 3, CAST(N'2022-07-15' AS Date), CAST(7701.2500000000 AS Decimal(18, 10)), 112, 3, 4, N'4011209000', 5, 263353, CAST(1646.5500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 112)
    INSERT @Registros VALUES (2378, 61, 7, 3, CAST(N'2022-07-15' AS Date), CAST(36956.6800000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 785639, CAST(13349.9800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (2379, 8, 7, 3, CAST(N'2022-07-15' AS Date), CAST(10713.0000000000 AS Decimal(18, 10)), 46, 5, 6, N'4011209000', 5, 915759, CAST(2896.7700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 46)
    INSERT @Registros VALUES (2380, 45, 7, 3, CAST(N'2022-07-19' AS Date), CAST(96026.2100000000 AS Decimal(18, 10)), 345, 3, 4, N'4011209000', 5, 52648, CAST(22474.8000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 345)
    INSERT @Registros VALUES (2381, 6, 7, 3, CAST(N'2022-07-19' AS Date), CAST(42136.4400000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 5, 211785, CAST(15207.3600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (2382, 59, 12, 8, CAST(N'2022-07-19' AS Date), CAST(37588.5400000000 AS Decimal(18, 10)), 282, 5, 6, N'4011209000', 5, 238279, CAST(13640.4200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 282)
    INSERT @Registros VALUES (2383, 44, 7, 3, CAST(N'2022-07-19' AS Date), CAST(56742.2500000000 AS Decimal(18, 10)), 441, 5, 6, N'4011209000', 5, 734130, CAST(15077.6500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 441)
    INSERT @Registros VALUES (2384, 27, 7, 3, CAST(N'2022-07-19' AS Date), CAST(5856.7600000000 AS Decimal(18, 10)), 51, 3, 4, N'4011209000', 5, 783625, CAST(798.8300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 51)
    INSERT @Registros VALUES (2385, 4, 7, 3, CAST(N'2022-07-19' AS Date), CAST(9180.5700000000 AS Decimal(18, 10)), 90, 5, 6, N'4011209000', 5, 784321, CAST(2990.8700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 90)
    INSERT @Registros VALUES (2386, 45, 7, 3, CAST(N'2022-07-19' AS Date), CAST(96545.2200000000 AS Decimal(18, 10)), 350, 3, 4, N'4011209000', 5, 995353, CAST(21743.4000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 350)
    INSERT @Registros VALUES (2387, 45, 7, 3, CAST(N'2022-07-20' AS Date), CAST(41974.1100000000 AS Decimal(18, 10)), 207, 20, 20, N'4011209000', 5, 105120, CAST(14042.7900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 207)
    INSERT @Registros VALUES (2388, 30, 7, 3, CAST(N'2022-07-20' AS Date), CAST(106189.7300000000 AS Decimal(18, 10)), 350, 3, 4, N'4011209000', 5, 211834, CAST(20126.6600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 350)
    INSERT @Registros VALUES (2389, 61, 7, 3, CAST(N'2022-07-20' AS Date), CAST(14907.7400000000 AS Decimal(18, 10)), 106, 5, 6, N'4011209000', 5, 428752, CAST(4962.5200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 106)
    INSERT @Registros VALUES (2390, 23, 7, 3, CAST(N'2022-07-20' AS Date), CAST(37415.1600000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 649411, CAST(13826.1000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (2391, 7, 12, 8, CAST(N'2022-07-20' AS Date), CAST(17232.7900000000 AS Decimal(18, 10)), 197, 3, 4, N'4011209000', 5, 960227, CAST(3485.7200000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 197)
    INSERT @Registros VALUES (2392, 7, 12, 8, CAST(N'2022-07-20' AS Date), CAST(44000.4800000000 AS Decimal(18, 10)), 503, 3, 4, N'4011209000', 5, 960227, CAST(8900.0800000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 503)
    INSERT @Registros VALUES (2393, 23, 7, 3, CAST(N'2022-07-22' AS Date), CAST(45805.3400000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 164504, CAST(15000.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 266)
    INSERT @Registros VALUES (2394, 44, 7, 3, CAST(N'2022-07-22' AS Date), CAST(47004.6200000000 AS Decimal(18, 10)), 192, 3, 4, N'4011209000', 5, 818608, CAST(10152.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 192)
    INSERT @Registros VALUES (2395, 45, 7, 3, CAST(N'2022-07-22' AS Date), CAST(56873.1900000000 AS Decimal(18, 10)), 572, 14, 15, N'4011209000', 5, 841663, CAST(11741.9000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 572)
    INSERT @Registros VALUES (2396, 7, 12, 8, CAST(N'2022-07-25' AS Date), CAST(12159.1800000000 AS Decimal(18, 10)), 139, 3, 4, N'4011209000', 5, 835688, CAST(2459.4700000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 139)
    INSERT @Registros VALUES (2397, 7, 12, 8, CAST(N'2022-07-25' AS Date), CAST(39276.7700000000 AS Decimal(18, 10)), 449, 3, 4, N'4011209000', 5, 835688, CAST(7944.6100000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 449)
    INSERT @Registros VALUES (2398, 7, 12, 8, CAST(N'2022-07-25' AS Date), CAST(3061.6600000000 AS Decimal(18, 10)), 35, 3, 4, N'4011209000', 5, 835688, CAST(619.2900000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 35)
    INSERT @Registros VALUES (2399, 7, 12, 8, CAST(N'2022-07-25' AS Date), CAST(4898.6600000000 AS Decimal(18, 10)), 56, 3, 4, N'4011209000', 5, 835688, CAST(990.8600000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 56)
    INSERT @Registros VALUES (2400, 61, 7, 3, CAST(N'2022-07-25' AS Date), CAST(10174.9300000000 AS Decimal(18, 10)), 112, 5, 6, N'4011209000', 5, 922700, CAST(3239.7200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 112)
    INSERT @Registros VALUES (2401, 30, 7, 3, CAST(N'2022-07-25' AS Date), CAST(93900.2500000000 AS Decimal(18, 10)), 303, 3, 4, N'4011209000', 5, 926984, CAST(18253.9200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 303)
    INSERT @Registros VALUES (2402, 44, 7, 3, CAST(N'2022-07-25' AS Date), CAST(40628.8900000000 AS Decimal(18, 10)), 179, 3, 4, N'4011209000', 5, 970314, CAST(9019.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 179)
    INSERT @Registros VALUES (2403, 45, 7, 3, CAST(N'2022-07-26' AS Date), CAST(60476.9800000000 AS Decimal(18, 10)), 277, 3, 4, N'4011209000', 5, 10336, CAST(12619.3500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 277)
    INSERT @Registros VALUES (2404, 45, 7, 3, CAST(N'2022-07-26' AS Date), CAST(98310.3600000000 AS Decimal(18, 10)), 329, 3, 4, N'4011209000', 5, 104648, CAST(21215.4900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 329)
    INSERT @Registros VALUES (2405, 30, 7, 3, CAST(N'2022-07-27' AS Date), CAST(51923.4900000000 AS Decimal(18, 10)), 171, 3, 4, N'4011209000', 5, 165765, CAST(10125.9400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 171)
    INSERT @Registros VALUES (2406, 45, 7, 3, CAST(N'2022-07-27' AS Date), CAST(23109.0500000000 AS Decimal(18, 10)), 124, 3, 4, N'4011209000', 5, 524542, CAST(4685.9000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 124)
    INSERT @Registros VALUES (2407, 45, 7, 3, CAST(N'2022-07-27' AS Date), CAST(5486.8600000000 AS Decimal(18, 10)), 61, 3, 4, N'4011209000', 5, 524542, CAST(1112.5900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 61)
    INSERT @Registros VALUES (2408, 44, 7, 3, CAST(N'2022-07-27' AS Date), CAST(21129.7500000000 AS Decimal(18, 10)), 106, 3, 4, N'4011209000', 5, 690309, CAST(3806.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 106)
    INSERT @Registros VALUES (2409, 30, 7, 3, CAST(N'2022-07-28' AS Date), CAST(82181.4700000000 AS Decimal(18, 10)), 516, 5, 6, N'4011209000', 5, 139100, CAST(32221.5400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 516)
    INSERT @Registros VALUES (2410, 7, 12, 8, CAST(N'2022-07-28' AS Date), CAST(59921.1300000000 AS Decimal(18, 10)), 685, 3, 4, N'4011209000', 5, 183304, CAST(12120.3900000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 685)
    INSERT @Registros VALUES (2411, 7, 12, 8, CAST(N'2022-07-28' AS Date), CAST(1312.1400000000 AS Decimal(18, 10)), 15, 3, 4, N'4011209000', 5, 183304, CAST(265.4100000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 15)
    INSERT @Registros VALUES (2412, 45, 7, 3, CAST(N'2022-07-28' AS Date), CAST(72024.2600000000 AS Decimal(18, 10)), 525, 20, 20, N'4011209000', 5, 413459, CAST(26973.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 525)
    INSERT @Registros VALUES (2413, 47, 7, 3, CAST(N'2022-07-28' AS Date), CAST(22142.1200000000 AS Decimal(18, 10)), 198, 3, 4, N'4011209000', 5, 702370, CAST(3232.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 198)
    INSERT @Registros VALUES (2414, 47, 7, 3, CAST(N'2022-07-28' AS Date), CAST(45539.7000000000 AS Decimal(18, 10)), 396, 3, 4, N'4011209000', 5, 702370, CAST(6928.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 396)
    INSERT @Registros VALUES (2415, 42, 7, 3, CAST(N'2022-07-28' AS Date), CAST(40149.8700000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 971253, CAST(14947.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (2416, 22, 7, 3, CAST(N'2022-07-29' AS Date), CAST(36812.9000000000 AS Decimal(18, 10)), 291, 5, 6, N'4011209000', 5, 305897, CAST(15942.0200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 291)
    INSERT @Registros VALUES (2417, 63, 12, 8, CAST(N'2022-07-29' AS Date), CAST(38540.0000000000 AS Decimal(18, 10)), 272, 5, 6, N'4011209000', 5, 457056, CAST(14600.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 272)
    INSERT @Registros VALUES (2418, 8, 7, 3, CAST(N'2022-07-29' AS Date), CAST(1807.4200000000 AS Decimal(18, 10)), 16, 5, 6, N'4011209000', 5, 783543, CAST(498.8800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 16)
    INSERT @Registros VALUES (2419, 2, 12, 8, CAST(N'2022-08-01' AS Date), CAST(88517.9300000000 AS Decimal(18, 10)), 574, 5, 6, N'4011209000', 5, 221737, CAST(32486.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 574)
    INSERT @Registros VALUES (2420, 2, 12, 8, CAST(N'2022-08-01' AS Date), CAST(72874.2300000000 AS Decimal(18, 10)), 520, 5, 6, N'4011209000', 5, 370349, CAST(27040.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 520)
    INSERT @Registros VALUES (2421, 23, 7, 3, CAST(N'2022-08-01' AS Date), CAST(14757.4400000000 AS Decimal(18, 10)), 48, 3, 4, N'4011209000', 5, 520130, CAST(3004.8000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 48)
    INSERT @Registros VALUES (2422, 23, 7, 3, CAST(N'2022-08-01' AS Date), CAST(4939.8300000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 5, 520130, CAST(902.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 12)
    INSERT @Registros VALUES (2423, 23, 7, 3, CAST(N'2022-08-01' AS Date), CAST(19189.2400000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 5, 520130, CAST(3910.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 60)
    INSERT @Registros VALUES (2424, 23, 7, 3, CAST(N'2022-08-01' AS Date), CAST(12359.7300000000 AS Decimal(18, 10)), 49, 3, 4, N'4011209000', 5, 520130, CAST(2658.9900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 49)
    INSERT @Registros VALUES (2425, 23, 7, 3, CAST(N'2022-08-01' AS Date), CAST(14285.0300000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 520130, CAST(2875.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (2426, 61, 7, 3, CAST(N'2022-08-01' AS Date), CAST(31632.8200000000 AS Decimal(18, 10)), 233, 5, 6, N'4011209000', 5, 542420, CAST(9815.4300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 233)
    INSERT @Registros VALUES (2427, 45, 7, 3, CAST(N'2022-08-01' AS Date), CAST(9260.9400000000 AS Decimal(18, 10)), 88, 3, 4, N'4011209000', 5, 594667, CAST(1734.6900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 88)
    INSERT @Registros VALUES (2428, 45, 7, 3, CAST(N'2022-08-01' AS Date), CAST(8845.7300000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 606645, CAST(1537.8800000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 100)
    INSERT @Registros VALUES (2429, 45, 7, 3, CAST(N'2022-08-01' AS Date), CAST(19267.7300000000 AS Decimal(18, 10)), 200, 3, 4, N'4011209000', 5, 606645, CAST(3349.7900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 200)
    INSERT @Registros VALUES (2430, 45, 7, 3, CAST(N'2022-08-01' AS Date), CAST(3232.4400000000 AS Decimal(18, 10)), 34, 3, 4, N'4011209000', 5, 634194, CAST(565.8300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 34)
    INSERT @Registros VALUES (2431, 45, 7, 3, CAST(N'2022-08-02' AS Date), CAST(38327.6300000000 AS Decimal(18, 10)), 228, 20, 20, N'4011209000', 5, 334960, CAST(13593.3600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 228)
    INSERT @Registros VALUES (2432, 61, 7, 3, CAST(N'2022-08-02' AS Date), CAST(4092.5900000000 AS Decimal(18, 10)), 50, 5, 6, N'4011209000', 5, 466493, CAST(1129.7800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (2433, 23, 7, 3, CAST(N'2022-08-05' AS Date), CAST(40744.3400000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 169344, CAST(14364.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 266)
    INSERT @Registros VALUES (2434, 30, 7, 3, CAST(N'2022-08-05' AS Date), CAST(59842.1100000000 AS Decimal(18, 10)), 193, 3, 4, N'4011209000', 5, 185908, CAST(11471.8500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 193)
    INSERT @Registros VALUES (2435, 47, 7, 3, CAST(N'2022-08-05' AS Date), CAST(1034.1900000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 5, 310675, CAST(176.1800000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 12)
    INSERT @Registros VALUES (2436, 7, 12, 8, CAST(N'2022-08-05' AS Date), CAST(12946.4600000000 AS Decimal(18, 10)), 148, 3, 4, N'4011209000', 5, 919495, CAST(2547.7500000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 148)
    INSERT @Registros VALUES (2437, 7, 12, 8, CAST(N'2022-08-05' AS Date), CAST(2624.2800000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 5, 919495, CAST(516.4400000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 30)
    INSERT @Registros VALUES (2438, 7, 12, 8, CAST(N'2022-08-05' AS Date), CAST(1651.6200000000 AS Decimal(18, 10)), 21, 3, 4, N'4011209000', 5, 919495, CAST(325.0300000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 21)
    INSERT @Registros VALUES (2439, 7, 12, 8, CAST(N'2022-08-05' AS Date), CAST(38537.8600000000 AS Decimal(18, 10)), 490, 3, 4, N'4011209000', 5, 919495, CAST(7583.9100000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 490)
    INSERT @Registros VALUES (2440, 7, 12, 8, CAST(N'2022-08-05' AS Date), CAST(12505.1400000000 AS Decimal(18, 10)), 159, 3, 4, N'4011209000', 5, 919495, CAST(2460.9000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 159)
    INSERT @Registros VALUES (2441, 30, 7, 3, CAST(N'2022-08-10' AS Date), CAST(3062.7400000000 AS Decimal(18, 10)), 35, 3, 4, N'4011209000', 5, 239066, CAST(486.0800000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 35)
    INSERT @Registros VALUES (2442, 23, 7, 3, CAST(N'2022-08-10' AS Date), CAST(37285.2200000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 349683, CAST(13348.2300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (2443, 45, 7, 3, CAST(N'2022-08-10' AS Date), CAST(97328.3800000000 AS Decimal(18, 10)), 350, 3, 4, N'4011209000', 5, 479057, CAST(20091.2000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 350)
    INSERT @Registros VALUES (2444, 45, 7, 3, CAST(N'2022-08-10' AS Date), CAST(1828.1200000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 5, 563757, CAST(320.2500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 20)
    INSERT @Registros VALUES (2445, 63, 12, 8, CAST(N'2022-08-10' AS Date), CAST(41340.1000000000 AS Decimal(18, 10)), 294, 5, 6, N'4011209000', 5, 965370, CAST(15380.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 294)
    INSERT @Registros VALUES (2446, 9, 9, 5, CAST(N'2022-08-11' AS Date), CAST(34387.0100000000 AS Decimal(18, 10)), 152, 5, 6, N'4011209000', 5, 371106, CAST(10356.8500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 152)
    INSERT @Registros VALUES (2447, 45, 7, 3, CAST(N'2022-08-12' AS Date), CAST(38223.4400000000 AS Decimal(18, 10)), 228, 20, 20, N'4011209000', 5, 180978, CAST(13593.3600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 228)
    INSERT @Registros VALUES (2448, 12, 1, 2, CAST(N'2022-08-12' AS Date), CAST(36189.5900000000 AS Decimal(18, 10)), 284, 5, 6, N'4011209000', 5, 388272, CAST(14830.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 284)
    INSERT @Registros VALUES (2449, 51, 7, 3, CAST(N'2022-08-12' AS Date), CAST(32512.4000000000 AS Decimal(18, 10)), 232, 5, 6, N'4011209000', 5, 972780, CAST(10678.0800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 232)
    INSERT @Registros VALUES (2450, 27, 7, 3, CAST(N'2022-08-12' AS Date), CAST(5010.4700000000 AS Decimal(18, 10)), 33, 3, 4, N'4011209000', 5, 973705, CAST(651.8600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 33)
    INSERT @Registros VALUES (2451, 61, 7, 3, CAST(N'2022-08-15' AS Date), CAST(36971.5400000000 AS Decimal(18, 10)), 270, 5, 6, N'4011209000', 5, 47236, CAST(14400.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 270)
    INSERT @Registros VALUES (2452, 44, 7, 3, CAST(N'2022-08-15' AS Date), CAST(41323.9500000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 183542, CAST(14700.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (2453, 10, 7, 3, CAST(N'2022-08-15' AS Date), CAST(14825.3300000000 AS Decimal(18, 10)), 122, 3, 4, N'4011209000', 5, 191899, CAST(1938.7800000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 122)
    INSERT @Registros VALUES (2454, 26, 7, 3, CAST(N'2022-08-15' AS Date), CAST(87967.4900000000 AS Decimal(18, 10)), 525, 5, 6, N'4011209000', 5, 247821, CAST(30496.3000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 525)
    INSERT @Registros VALUES (2455, 2, 12, 8, CAST(N'2022-08-15' AS Date), CAST(39915.0300000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 840268, CAST(15080.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (2456, 45, 7, 3, CAST(N'2022-08-16' AS Date), CAST(2621.0000000000 AS Decimal(18, 10)), 32, 3, 4, N'4011209000', 5, 294650, CAST(442.4700000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 32)
    INSERT @Registros VALUES (2457, 7, 12, 8, CAST(N'2022-08-16' AS Date), CAST(32366.1500000000 AS Decimal(18, 10)), 370, 3, 4, N'4011209000', 5, 806735, CAST(6546.7800000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 370)
    INSERT @Registros VALUES (2458, 7, 12, 8, CAST(N'2022-08-16' AS Date), CAST(787.2800000000 AS Decimal(18, 10)), 9, 3, 4, N'4011209000', 5, 806735, CAST(159.2500000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 9)
    INSERT @Registros VALUES (2459, 7, 12, 8, CAST(N'2022-08-16' AS Date), CAST(6473.2300000000 AS Decimal(18, 10)), 74, 3, 4, N'4011209000', 5, 806735, CAST(1309.3600000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 74)
    INSERT @Registros VALUES (2460, 45, 7, 3, CAST(N'2022-08-16' AS Date), CAST(103536.5200000000 AS Decimal(18, 10)), 350, 3, 4, N'4011209000', 5, 894619, CAST(21816.2700000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 350)
    INSERT @Registros VALUES (2461, 45, 7, 3, CAST(N'2022-08-16' AS Date), CAST(1617.0800000000 AS Decimal(18, 10)), 10, 3, 4, N'4011209000', 5, 933677, CAST(288.8300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 10)
    INSERT @Registros VALUES (2462, 45, 7, 3, CAST(N'2022-08-16' AS Date), CAST(1203.6400000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 5, 933677, CAST(214.9800000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 12)
    INSERT @Registros VALUES (2463, 61, 7, 3, CAST(N'2022-08-16' AS Date), CAST(39839.6400000000 AS Decimal(18, 10)), 286, 5, 6, N'4011209000', 5, 970511, CAST(15590.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 286)
    INSERT @Registros VALUES (2464, 22, 7, 3, CAST(N'2022-08-16' AS Date), CAST(3276.8400000000 AS Decimal(18, 10)), 24, 5, 6, N'4011209000', 5, 973499, CAST(1167.5500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 24)
    INSERT @Registros VALUES (2465, 42, 7, 3, CAST(N'2022-08-17' AS Date), CAST(60987.8400000000 AS Decimal(18, 10)), 216, 3, 4, N'4011209000', 5, 12651, CAST(12686.0100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 216)
    INSERT @Registros VALUES (2466, 7, 12, 8, CAST(N'2022-08-17' AS Date), CAST(22925.4200000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 5, 479402, CAST(3723.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 300)
    INSERT @Registros VALUES (2467, 7, 12, 8, CAST(N'2022-08-17' AS Date), CAST(48907.5900000000 AS Decimal(18, 10)), 640, 3, 4, N'4011209000', 5, 479402, CAST(7942.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 640)
    INSERT @Registros VALUES (2468, 7, 12, 8, CAST(N'2022-08-17' AS Date), CAST(22925.4200000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 5, 479402, CAST(3723.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 300)
    INSERT @Registros VALUES (2469, 7, 12, 8, CAST(N'2022-08-17' AS Date), CAST(48907.5900000000 AS Decimal(18, 10)), 640, 3, 4, N'4011209000', 5, 479402, CAST(7942.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 640)
    INSERT @Registros VALUES (2470, 56, 7, 3, CAST(N'2022-08-18' AS Date), CAST(5319.0800000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 5, 251929, CAST(1089.9200000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 60)
    INSERT @Registros VALUES (2471, 56, 7, 3, CAST(N'2022-08-18' AS Date), CAST(3465.2800000000 AS Decimal(18, 10)), 40, 3, 4, N'4011209000', 5, 251929, CAST(710.0600000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 40)
    INSERT @Registros VALUES (2472, 22, 7, 3, CAST(N'2022-08-19' AS Date), CAST(34280.8000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 489311, CAST(14500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (2473, 22, 7, 3, CAST(N'2022-08-19' AS Date), CAST(34492.2300000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 709259, CAST(14500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (2474, 51, 7, 3, CAST(N'2022-08-19' AS Date), CAST(26772.4100000000 AS Decimal(18, 10)), 181, 5, 6, N'4011209000', 5, 752580, CAST(8523.6900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 181)
    INSERT @Registros VALUES (2475, 6, 7, 3, CAST(N'2022-08-19' AS Date), CAST(28128.5800000000 AS Decimal(18, 10)), 148, 5, 6, N'4011209000', 5, 822219, CAST(8218.4400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 148)
    INSERT @Registros VALUES (2476, 45, 7, 3, CAST(N'2022-08-19' AS Date), CAST(5006.3700000000 AS Decimal(18, 10)), 62, 14, 15, N'4011209000', 5, 966290, CAST(781.8100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 62)
    INSERT @Registros VALUES (2477, 45, 7, 3, CAST(N'2022-08-22' AS Date), CAST(14630.3000000000 AS Decimal(18, 10)), 148, 3, 4, N'4011209000', 5, 158580, CAST(2420.5000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 148)
    INSERT @Registros VALUES (2478, 45, 7, 3, CAST(N'2022-08-22' AS Date), CAST(8383.2600000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 158580, CAST(1386.9600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 100)
    INSERT @Registros VALUES (2479, 24, 12, 8, CAST(N'2022-08-22' AS Date), CAST(45510.7400000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 380632, CAST(14960.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (2480, 45, 7, 3, CAST(N'2022-08-22' AS Date), CAST(10736.6600000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 725682, CAST(1795.4000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 100)
    INSERT @Registros VALUES (2481, 45, 7, 3, CAST(N'2022-08-22' AS Date), CAST(1425.3500000000 AS Decimal(18, 10)), 16, 3, 4, N'4011209000', 5, 725682, CAST(238.3500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 16)
    INSERT @Registros VALUES (2482, 45, 7, 3, CAST(N'2022-08-22' AS Date), CAST(13827.1600000000 AS Decimal(18, 10)), 129, 3, 4, N'4011209000', 5, 921081, CAST(2287.8500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 129)
    INSERT @Registros VALUES (2483, 23, 7, 3, CAST(N'2022-08-23' AS Date), CAST(39892.8900000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 284768, CAST(13924.0400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 266)
    INSERT @Registros VALUES (2484, 30, 7, 3, CAST(N'2022-08-23' AS Date), CAST(31289.2000000000 AS Decimal(18, 10)), 94, 3, 4, N'4011209000', 5, 956494, CAST(6070.2800000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 94)
    INSERT @Registros VALUES (2485, 30, 7, 3, CAST(N'2022-08-23' AS Date), CAST(1176.3000000000 AS Decimal(18, 10)), 14, 3, 4, N'4011209000', 5, 956494, CAST(167.0300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 14)
    INSERT @Registros VALUES (2486, 45, 7, 3, CAST(N'2022-08-24' AS Date), CAST(2100.6700000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 5, 489838, CAST(363.0200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 20)
    INSERT @Registros VALUES (2487, 47, 7, 3, CAST(N'2022-08-24' AS Date), CAST(15946.8300000000 AS Decimal(18, 10)), 142, 3, 4, N'4011209000', 5, 844524, CAST(2527.6400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 142)
    INSERT @Registros VALUES (2488, 47, 7, 3, CAST(N'2022-08-24' AS Date), CAST(13872.3400000000 AS Decimal(18, 10)), 124, 3, 4, N'4011209000', 5, 844524, CAST(2161.2300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 124)
    INSERT @Registros VALUES (2489, 47, 7, 3, CAST(N'2022-08-24' AS Date), CAST(39992.9000000000 AS Decimal(18, 10)), 368, 3, 4, N'4011209000', 5, 844524, CAST(5954.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 368)
    INSERT @Registros VALUES (2490, 47, 7, 3, CAST(N'2022-08-24' AS Date), CAST(37345.3300000000 AS Decimal(18, 10)), 365, 3, 4, N'4011209000', 5, 928207, CAST(5949.7800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 365)
    INSERT @Registros VALUES (2491, 47, 7, 3, CAST(N'2022-08-24' AS Date), CAST(5033.7400000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 928207, CAST(756.1300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (2492, 1, 11, 7, CAST(N'2022-08-26' AS Date), CAST(35826.6600000000 AS Decimal(18, 10)), 1372, 5, 6, N'4011209000', 5, 15835, CAST(10843.8500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1372)
    INSERT @Registros VALUES (2493, 1, 11, 7, CAST(N'2022-08-26' AS Date), CAST(5386.4500000000 AS Decimal(18, 10)), 40, 5, 6, N'4011209000', 5, 15835, CAST(1630.3500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (2494, 22, 7, 3, CAST(N'2022-08-26' AS Date), CAST(33743.0900000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 44313, CAST(13364.6200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (2495, 51, 7, 3, CAST(N'2022-08-26' AS Date), CAST(31012.8400000000 AS Decimal(18, 10)), 240, 5, 6, N'4011209000', 5, 137756, CAST(12230.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 240)
    INSERT @Registros VALUES (2496, 51, 7, 3, CAST(N'2022-08-26' AS Date), CAST(32716.7300000000 AS Decimal(18, 10)), 263, 5, 6, N'4011209000', 5, 137756, CAST(13100.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 263)
    INSERT @Registros VALUES (2497, 30, 7, 3, CAST(N'2022-08-26' AS Date), CAST(1257.2300000000 AS Decimal(18, 10)), 2, 13, 3, N'4011209000', 5, 189741, CAST(175.6500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 2)
    INSERT @Registros VALUES (2498, 30, 7, 3, CAST(N'2022-08-26' AS Date), CAST(1947.7800000000 AS Decimal(18, 10)), 5, 18, 3, N'4011209000', 5, 189741, CAST(351.5100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 5)
    INSERT @Registros VALUES (2499, 30, 7, 3, CAST(N'2022-08-26' AS Date), CAST(17176.1400000000 AS Decimal(18, 10)), 52, 10, 3, N'4011209000', 5, 189741, CAST(2858.2200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 52)
    INSERT @Registros VALUES (2500, 29, 12, 8, CAST(N'2022-08-26' AS Date), CAST(27750.3600000000 AS Decimal(18, 10)), 240, 5, 6, N'4011209000', 5, 613069, CAST(13375.1700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 240)
    INSERT @Registros VALUES (2501, 12, 1, 2, CAST(N'2022-08-26' AS Date), CAST(38977.2500000000 AS Decimal(18, 10)), 344, 5, 6, N'4011209000', 5, 624539, CAST(14770.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 344)
    INSERT @Registros VALUES (2502, 22, 7, 3, CAST(N'2022-08-26' AS Date), CAST(34539.0900000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 642959, CAST(13670.6000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (2503, 30, 7, 3, CAST(N'2022-08-26' AS Date), CAST(25050.3000000000 AS Decimal(18, 10)), 100, 20, 3, N'4011209000', 5, 906557, CAST(6187.7000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 100)
    INSERT @Registros VALUES (2504, 22, 7, 3, CAST(N'2022-08-26' AS Date), CAST(35779.1800000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 922802, CAST(13894.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (2505, 6, 7, 3, CAST(N'2022-08-29' AS Date), CAST(39226.0600000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 53533, CAST(13500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2506, 7, 12, 8, CAST(N'2022-08-29' AS Date), CAST(59833.6500000000 AS Decimal(18, 10)), 684, 3, 4, N'4011209000', 5, 111196, CAST(12102.7000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 684)
    INSERT @Registros VALUES (2507, 37, 8, 4, CAST(N'2022-08-29' AS Date), CAST(50719.3200000000 AS Decimal(18, 10)), 282, 5, 6, N'4011209000', 5, 152045, CAST(14133.0800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 282)
    INSERT @Registros VALUES (2508, 56, 7, 3, CAST(N'2022-08-29' AS Date), CAST(11225.9900000000 AS Decimal(18, 10)), 130, 3, 4, N'4011209000', 5, 159134, CAST(2292.5200000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 130)
    INSERT @Registros VALUES (2509, 56, 7, 3, CAST(N'2022-08-29' AS Date), CAST(38982.3500000000 AS Decimal(18, 10)), 440, 3, 4, N'4011209000', 5, 159134, CAST(7960.8000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 440)
    INSERT @Registros VALUES (2510, 44, 7, 3, CAST(N'2022-08-29' AS Date), CAST(41500.5600000000 AS Decimal(18, 10)), 292, 5, 6, N'4011209000', 5, 332799, CAST(10917.1400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 292)
    INSERT @Registros VALUES (2511, 44, 7, 3, CAST(N'2022-08-29' AS Date), CAST(13391.8300000000 AS Decimal(18, 10)), 61, 3, 4, N'4011209000', 5, 364353, CAST(3043.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 61)
    INSERT @Registros VALUES (2512, 61, 7, 3, CAST(N'2022-08-29' AS Date), CAST(40206.9600000000 AS Decimal(18, 10)), 258, 5, 6, N'4011209000', 5, 521372, CAST(13625.3000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 258)
    INSERT @Registros VALUES (2513, 51, 7, 3, CAST(N'2022-08-29' AS Date), CAST(66847.9100000000 AS Decimal(18, 10)), 538, 5, 6, N'4011209000', 5, 623015, CAST(26880.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 538)
    INSERT @Registros VALUES (2514, 6, 7, 3, CAST(N'2022-08-29' AS Date), CAST(24649.2500000000 AS Decimal(18, 10)), 150, 5, 6, N'4011209000', 5, 655871, CAST(7298.3700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 150)
    INSERT @Registros VALUES (2515, 56, 7, 3, CAST(N'2022-08-29' AS Date), CAST(24363.9700000000 AS Decimal(18, 10)), 275, 3, 4, N'4011209000', 5, 767219, CAST(4942.5800000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 275)
    INSERT @Registros VALUES (2516, 51, 7, 3, CAST(N'2022-08-29' AS Date), CAST(1570.0300000000 AS Decimal(18, 10)), 10, 5, 6, N'4011209000', 5, 907639, CAST(431.3900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 10)
    INSERT @Registros VALUES (2517, 64, 7, 3, CAST(N'2022-08-29' AS Date), CAST(44214.4700000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 979374, CAST(15500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2518, 64, 7, 3, CAST(N'2022-08-29' AS Date), CAST(47392.1400000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 997105, CAST(14419.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (2519, 12, 1, 2, CAST(N'2022-08-30' AS Date), CAST(2188.2700000000 AS Decimal(18, 10)), 8, 14, 15, N'4011209000', 5, 56215, CAST(435.2700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 8)
    INSERT @Registros VALUES (2520, 12, 1, 2, CAST(N'2022-08-30' AS Date), CAST(986.7600000000 AS Decimal(18, 10)), 4, 14, 15, N'4011209000', 5, 56215, CAST(188.2300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 4)
    INSERT @Registros VALUES (2521, 23, 7, 3, CAST(N'2022-08-30' AS Date), CAST(40589.8100000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 132122, CAST(13826.1000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (2522, 30, 7, 3, CAST(N'2022-08-30' AS Date), CAST(91952.9000000000 AS Decimal(18, 10)), 332, 3, 4, N'4011209000', 5, 465097, CAST(16984.5100000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 332)
    INSERT @Registros VALUES (2523, 51, 7, 3, CAST(N'2022-08-30' AS Date), CAST(1065.7100000000 AS Decimal(18, 10)), 13, 5, 6, N'4011209000', 5, 579636, CAST(288.8600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 13)
    INSERT @Registros VALUES (2524, 51, 7, 3, CAST(N'2022-08-30' AS Date), CAST(19740.9800000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 5, 579636, CAST(5716.4900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (2525, 51, 7, 3, CAST(N'2022-08-30' AS Date), CAST(12784.5800000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 579636, CAST(3920.0800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (2526, 51, 7, 3, CAST(N'2022-08-30' AS Date), CAST(34177.5900000000 AS Decimal(18, 10)), 210, 5, 6, N'4011209000', 5, 579636, CAST(11679.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 210)
    INSERT @Registros VALUES (2527, 51, 7, 3, CAST(N'2022-08-30' AS Date), CAST(33535.2700000000 AS Decimal(18, 10)), 210, 5, 6, N'4011209000', 5, 579636, CAST(11602.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 210)
    INSERT @Registros VALUES (2528, 7, 12, 8, CAST(N'2022-08-30' AS Date), CAST(7669.2100000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 588036, CAST(1241.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 100)
    INSERT @Registros VALUES (2529, 7, 12, 8, CAST(N'2022-08-30' AS Date), CAST(64421.3800000000 AS Decimal(18, 10)), 840, 3, 4, N'4011209000', 5, 588036, CAST(10424.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 840)
    INSERT @Registros VALUES (2530, 7, 12, 8, CAST(N'2022-08-30' AS Date), CAST(34290.6300000000 AS Decimal(18, 10)), 392, 3, 4, N'4011209000', 5, 739132, CAST(6936.0500000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 392)
    INSERT @Registros VALUES (2531, 7, 12, 8, CAST(N'2022-08-30' AS Date), CAST(25368.0700000000 AS Decimal(18, 10)), 290, 3, 4, N'4011209000', 5, 739132, CAST(5131.2600000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 290)
    INSERT @Registros VALUES (2532, 8, 7, 3, CAST(N'2022-08-31' AS Date), CAST(9618.8500000000 AS Decimal(18, 10)), 40, 5, 6, N'4011209000', 5, 51716, CAST(2777.3400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (2533, 8, 7, 3, CAST(N'2022-08-31' AS Date), CAST(9995.4500000000 AS Decimal(18, 10)), 40, 5, 6, N'4011209000', 5, 857477, CAST(2730.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (2534, 40, 10, 2, CAST(N'2022-10-03' AS Date), CAST(70659.2700000000 AS Decimal(18, 10)), 464, 5, 6, N'4011209000', 5, 209295, CAST(23670.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 464)
    INSERT @Registros VALUES (2535, 12, 1, 2, CAST(N'2022-10-03' AS Date), CAST(25347.0100000000 AS Decimal(18, 10)), 117, 5, 6, N'4011209000', 5, 498467, CAST(7375.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 117)
    INSERT @Registros VALUES (2536, 12, 1, 2, CAST(N'2022-10-03' AS Date), CAST(23661.3800000000 AS Decimal(18, 10)), 103, 5, 6, N'4011209000', 5, 498467, CAST(6495.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 103)
    INSERT @Registros VALUES (2537, 47, 7, 3, CAST(N'2022-10-03' AS Date), CAST(7379.8300000000 AS Decimal(18, 10)), 52, 3, 4, N'4011209000', 5, 557061, CAST(982.2200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 52)
    INSERT @Registros VALUES (2538, 45, 7, 3, CAST(N'2022-10-04' AS Date), CAST(3921.2400000000 AS Decimal(18, 10)), 44, 16, 17, N'4011209000', 5, 129236, CAST(673.6100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 44)
    INSERT @Registros VALUES (2539, 45, 7, 3, CAST(N'2022-10-04' AS Date), CAST(1483.8100000000 AS Decimal(18, 10)), 16, 16, 17, N'4011209000', 5, 265518, CAST(249.0700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 16)
    INSERT @Registros VALUES (2540, 42, 7, 3, CAST(N'2022-10-04' AS Date), CAST(65469.0000000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 5, 392175, CAST(13635.8400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (2541, 45, 7, 3, CAST(N'2022-10-05' AS Date), CAST(39035.3200000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 141156, CAST(14500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2542, 45, 7, 3, CAST(N'2022-10-05' AS Date), CAST(39035.3200000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 417763, CAST(14500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2543, 45, 7, 3, CAST(N'2022-10-05' AS Date), CAST(39035.3200000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 615923, CAST(14500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2544, 44, 7, 3, CAST(N'2022-10-06' AS Date), CAST(90839.8600000000 AS Decimal(18, 10)), 517, 5, 6, N'4011209000', 5, 165823, CAST(29260.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 517)
    INSERT @Registros VALUES (2545, 40, 10, 2, CAST(N'2022-10-06' AS Date), CAST(35747.3800000000 AS Decimal(18, 10)), 742, 5, 6, N'4011209000', 5, 614071, CAST(10607.2600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 742)
    INSERT @Registros VALUES (2546, 61, 7, 3, CAST(N'2022-10-11' AS Date), CAST(46073.3000000000 AS Decimal(18, 10)), 312, 5, 6, N'4011209000', 5, 354497, CAST(15910.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 312)
    INSERT @Registros VALUES (2547, 30, 7, 3, CAST(N'2022-10-11' AS Date), CAST(1545.7400000000 AS Decimal(18, 10)), 4, 18, 3, N'4011209000', 5, 609223, CAST(280.3400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 4)
    INSERT @Registros VALUES (2548, 6, 7, 3, CAST(N'2022-10-11' AS Date), CAST(31915.9200000000 AS Decimal(18, 10)), 204, 5, 6, N'4011209000', 5, 992255, CAST(10353.1300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 204)
    INSERT @Registros VALUES (2549, 6, 7, 3, CAST(N'2022-10-11' AS Date), CAST(9392.6700000000 AS Decimal(18, 10)), 56, 5, 6, N'4011209000', 5, 992255, CAST(3046.8700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 56)
    INSERT @Registros VALUES (2550, 44, 7, 3, CAST(N'2022-10-12' AS Date), CAST(87286.9600000000 AS Decimal(18, 10)), 500, 5, 6, N'4011209000', 5, 399102, CAST(29000.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 500)
    INSERT @Registros VALUES (2551, 23, 7, 3, CAST(N'2022-10-12' AS Date), CAST(42284.7100000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 5, 781408, CAST(13949.6800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 254)
    INSERT @Registros VALUES (2552, 45, 7, 3, CAST(N'2022-10-12' AS Date), CAST(32788.5300000000 AS Decimal(18, 10)), 172, 3, 4, N'4011209000', 5, 827009, CAST(8811.3600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 172)
    INSERT @Registros VALUES (2553, 45, 7, 3, CAST(N'2022-10-12' AS Date), CAST(26559.3300000000 AS Decimal(18, 10)), 354, 3, 4, N'4011209000', 5, 827009, CAST(2595.5300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 354)
    INSERT @Registros VALUES (2554, 56, 7, 3, CAST(N'2022-10-12' AS Date), CAST(39240.0100000000 AS Decimal(18, 10)), 439, 3, 4, N'4011209000', 5, 960322, CAST(7942.1600000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 439)
    INSERT @Registros VALUES (2555, 56, 7, 3, CAST(N'2022-10-12' AS Date), CAST(11151.6900000000 AS Decimal(18, 10)), 128, 3, 4, N'4011209000', 5, 960322, CAST(2257.1000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 128)
    INSERT @Registros VALUES (2556, 23, 7, 3, CAST(N'2022-10-12' AS Date), CAST(43574.5800000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 997519, CAST(14351.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (2557, 23, 7, 3, CAST(N'2022-10-12' AS Date), CAST(28835.4000000000 AS Decimal(18, 10)), 210, 5, 6, N'4011209000', 5, 997946, CAST(10405.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 210)
    INSERT @Registros VALUES (2558, 33, 12, 8, CAST(N'2022-10-13' AS Date), CAST(61377.5200000000 AS Decimal(18, 10)), 430, 5, 6, N'4011209000', 5, 13566, CAST(16636.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 430)
    INSERT @Registros VALUES (2559, 40, 10, 2, CAST(N'2022-10-13' AS Date), CAST(127867.0300000000 AS Decimal(18, 10)), 668, 5, 6, N'4011209000', 5, 929415, CAST(40200.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 668)
    INSERT @Registros VALUES (2560, 59, 12, 8, CAST(N'2022-10-14' AS Date), CAST(86881.7400000000 AS Decimal(18, 10)), 643, 5, 6, N'4011209000', 5, 441206, CAST(30230.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 643)
    INSERT @Registros VALUES (2561, 59, 12, 8, CAST(N'2022-10-14' AS Date), CAST(124267.3700000000 AS Decimal(18, 10)), 789, 5, 6, N'4011209000', 5, 848130, CAST(41642.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 789)
    INSERT @Registros VALUES (2562, 61, 7, 3, CAST(N'2022-10-17' AS Date), CAST(44097.5000000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 316469, CAST(14284.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (2563, 51, 7, 3, CAST(N'2022-10-17' AS Date), CAST(75441.9700000000 AS Decimal(18, 10)), 481, 5, 6, N'4011209000', 5, 683297, CAST(27420.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 481)
    INSERT @Registros VALUES (2564, 42, 7, 3, CAST(N'2022-10-17' AS Date), CAST(44256.4500000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 923384, CAST(14947.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (2565, 23, 7, 3, CAST(N'2022-10-18' AS Date), CAST(36590.7100000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 74772, CAST(13348.2300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (2566, 2, 12, 8, CAST(N'2022-10-18' AS Date), CAST(48603.2700000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 347578, CAST(15533.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (2567, 2, 12, 8, CAST(N'2022-10-18' AS Date), CAST(48310.7200000000 AS Decimal(18, 10)), 300, 5, 6, N'4011209000', 5, 381732, CAST(15324.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 300)
    INSERT @Registros VALUES (2568, 42, 7, 3, CAST(N'2022-10-18' AS Date), CAST(64104.5000000000 AS Decimal(18, 10)), 232, 3, 4, N'4011209000', 5, 434921, CAST(13261.1300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 232)
    INSERT @Registros VALUES (2569, 61, 7, 3, CAST(N'2022-10-18' AS Date), CAST(38013.2400000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 528312, CAST(12051.5700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (2570, 2, 12, 8, CAST(N'2022-10-18' AS Date), CAST(48489.0600000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 893578, CAST(15596.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (2571, 61, 7, 3, CAST(N'2022-10-20' AS Date), CAST(41521.6800000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 197078, CAST(13364.6200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (2572, 15, 7, 3, CAST(N'2022-10-20' AS Date), CAST(8059.7500000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 5, 327614, CAST(1831.8000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 30)
    INSERT @Registros VALUES (2573, 44, 7, 3, CAST(N'2022-10-20' AS Date), CAST(27135.9900000000 AS Decimal(18, 10)), 140, 3, 4, N'4011209000', 5, 637637, CAST(5104.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 140)
    INSERT @Registros VALUES (2574, 44, 7, 3, CAST(N'2022-10-20' AS Date), CAST(48229.1700000000 AS Decimal(18, 10)), 162, 3, 4, N'4011209000', 5, 758758, CAST(9332.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 162)
    INSERT @Registros VALUES (2575, 12, 1, 2, CAST(N'2022-10-20' AS Date), CAST(41250.8200000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 983477, CAST(15100.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (2576, 61, 7, 3, CAST(N'2022-10-21' AS Date), CAST(41521.6800000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 278418, CAST(13364.6200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (2577, 30, 7, 3, CAST(N'2022-10-21' AS Date), CAST(125164.8400000000 AS Decimal(18, 10)), 800, 5, 6, N'4011209000', 5, 636802, CAST(45820.3000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 800)
    INSERT @Registros VALUES (2578, 8, 7, 3, CAST(N'2022-10-21' AS Date), CAST(18905.3600000000 AS Decimal(18, 10)), 84, 5, 6, N'4011209000', 5, 709089, CAST(5009.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 84)
    INSERT @Registros VALUES (2579, 51, 7, 3, CAST(N'2022-10-24' AS Date), CAST(5608.4100000000 AS Decimal(18, 10)), 47, 5, 6, N'4011209000', 5, 125371, CAST(1593.8500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 47)
    INSERT @Registros VALUES (2580, 7, 12, 8, CAST(N'2022-10-24' AS Date), CAST(7656.9000000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 538459, CAST(1241.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 100)
    INSERT @Registros VALUES (2581, 7, 12, 8, CAST(N'2022-10-24' AS Date), CAST(64318.0300000000 AS Decimal(18, 10)), 840, 3, 4, N'4011209000', 5, 538459, CAST(10424.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 840)
    INSERT @Registros VALUES (2582, 61, 7, 3, CAST(N'2022-10-24' AS Date), CAST(41387.4200000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 5, 549146, CAST(13231.5400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 256)
    INSERT @Registros VALUES (2583, 45, 7, 3, CAST(N'2022-10-24' AS Date), CAST(75842.3900000000 AS Decimal(18, 10)), 328, 20, 20, N'4011209000', 5, 958422, CAST(20725.9200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 328)
    INSERT @Registros VALUES (2584, 45, 7, 3, CAST(N'2022-10-25' AS Date), CAST(160083.6900000000 AS Decimal(18, 10)), 684, 20, 20, N'4011209000', 5, 395447, CAST(43220.1600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 684)
    INSERT @Registros VALUES (2585, 61, 7, 3, CAST(N'2022-10-25' AS Date), CAST(30669.9800000000 AS Decimal(18, 10)), 210, 5, 6, N'4011209000', 5, 564035, CAST(9438.5700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 210)
    INSERT @Registros VALUES (2586, 45, 7, 3, CAST(N'2022-10-25' AS Date), CAST(78589.9600000000 AS Decimal(18, 10)), 530, 5, 6, N'4011209000', 5, 765900, CAST(28600.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 530)
    INSERT @Registros VALUES (2587, 61, 7, 3, CAST(N'2022-10-26' AS Date), CAST(41805.8000000000 AS Decimal(18, 10)), 270, 5, 6, N'4011209000', 5, 219066, CAST(13574.9000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 270)
    INSERT @Registros VALUES (2588, 18, 7, 3, CAST(N'2022-10-26' AS Date), CAST(32018.0300000000 AS Decimal(18, 10)), 340, 5, 6, N'4011209000', 5, 681368, CAST(9418.2800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 340)
    INSERT @Registros VALUES (2589, 45, 7, 3, CAST(N'2022-10-27' AS Date), CAST(7625.5400000000 AS Decimal(18, 10)), 64, 14, 15, N'4011209000', 5, 253597, CAST(1161.5900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 64)
    INSERT @Registros VALUES (2590, 45, 7, 3, CAST(N'2022-10-28' AS Date), CAST(20654.2600000000 AS Decimal(18, 10)), 215, 3, 4, N'4011209000', 5, 482228, CAST(3426.9100000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 215)
    INSERT @Registros VALUES (2591, 42, 7, 3, CAST(N'2022-10-28' AS Date), CAST(18486.3000000000 AS Decimal(18, 10)), 60, 2, 2, N'4011209000', 5, 847631, CAST(3253.0300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 60)
    INSERT @Registros VALUES (2592, 42, 7, 3, CAST(N'2022-10-28' AS Date), CAST(67409.0600000000 AS Decimal(18, 10)), 264, 3, 4, N'4011209000', 5, 969917, CAST(13773.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2593, 22, 7, 3, CAST(N'2022-10-31' AS Date), CAST(34772.6200000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 53266, CAST(13619.1800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (2594, 30, 7, 3, CAST(N'2022-10-31' AS Date), CAST(87855.5600000000 AS Decimal(18, 10)), 516, 5, 6, N'4011209000', 5, 107207, CAST(32667.4400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 516)
    INSERT @Registros VALUES (2595, 12, 1, 2, CAST(N'2022-11-01' AS Date), CAST(37396.2400000000 AS Decimal(18, 10)), 258, 5, 6, N'4011209000', 5, 468040, CAST(15080.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 258)
    INSERT @Registros VALUES (2596, 30, 7, 3, CAST(N'2022-11-01' AS Date), CAST(5634.8300000000 AS Decimal(18, 10)), 62, 3, 4, N'4011209000', 5, 956831, CAST(475.0100000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 62)
    INSERT @Registros VALUES (2597, 26, 7, 3, CAST(N'2022-11-03' AS Date), CAST(7031.9700000000 AS Decimal(18, 10)), 48, 5, 6, N'4011209000', 5, 22452, CAST(2249.6100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 48)
    INSERT @Registros VALUES (2598, 26, 7, 3, CAST(N'2022-11-03' AS Date), CAST(26248.9100000000 AS Decimal(18, 10)), 170, 5, 6, N'4011209000', 5, 22452, CAST(8397.3300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 170)
    INSERT @Registros VALUES (2599, 26, 7, 3, CAST(N'2022-11-03' AS Date), CAST(11655.7800000000 AS Decimal(18, 10)), 64, 5, 6, N'4011209000', 5, 22452, CAST(3728.8200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 64)
    INSERT @Registros VALUES (2600, 23, 7, 3, CAST(N'2022-11-03' AS Date), CAST(17330.9400000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 492735, CAST(2888.3000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (2601, 23, 7, 3, CAST(N'2022-11-03' AS Date), CAST(34912.2800000000 AS Decimal(18, 10)), 90, 3, 4, N'4011209000', 5, 492735, CAST(5818.3300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 90)
    INSERT @Registros VALUES (2602, 23, 7, 3, CAST(N'2022-11-03' AS Date), CAST(30350.2300000000 AS Decimal(18, 10)), 79, 3, 4, N'4011209000', 5, 492735, CAST(5058.0400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 79)
    INSERT @Registros VALUES (2603, 61, 7, 3, CAST(N'2022-11-04' AS Date), CAST(33519.9600000000 AS Decimal(18, 10)), 231, 5, 6, N'4011209000', 5, 473678, CAST(9438.1500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 231)
    INSERT @Registros VALUES (2604, 59, 12, 8, CAST(N'2022-11-07' AS Date), CAST(45493.8800000000 AS Decimal(18, 10)), 317, 5, 6, N'4011209000', 5, 222513, CAST(15200.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 317)
    INSERT @Registros VALUES (2605, 45, 7, 3, CAST(N'2022-11-07' AS Date), CAST(21076.2800000000 AS Decimal(18, 10)), 230, 14, 15, N'4011209000', 5, 564456, CAST(3383.4600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 230)
    INSERT @Registros VALUES (2606, 7, 12, 8, CAST(N'2022-11-07' AS Date), CAST(34990.4400000000 AS Decimal(18, 10)), 400, 3, 4, N'4011209000', 5, 636769, CAST(6969.7900000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 400)
    INSERT @Registros VALUES (2607, 7, 12, 8, CAST(N'2022-11-07' AS Date), CAST(20448.6600000000 AS Decimal(18, 10)), 260, 3, 4, N'4011209000', 5, 636769, CAST(4073.2000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 260)
    INSERT @Registros VALUES (2608, 7, 12, 8, CAST(N'2022-11-07' AS Date), CAST(2831.3500000000 AS Decimal(18, 10)), 36, 3, 4, N'4011209000', 5, 636769, CAST(563.9800000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 36)
    INSERT @Registros VALUES (2609, 7, 12, 8, CAST(N'2022-11-07' AS Date), CAST(3539.1900000000 AS Decimal(18, 10)), 45, 3, 4, N'4011209000', 5, 636769, CAST(704.9800000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 45)
    INSERT @Registros VALUES (2610, 7, 12, 8, CAST(N'2022-11-07' AS Date), CAST(59921.1200000000 AS Decimal(18, 10)), 685, 3, 4, N'4011209000', 5, 685440, CAST(12120.3900000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 685)
    INSERT @Registros VALUES (2611, 45, 7, 3, CAST(N'2022-11-07' AS Date), CAST(38236.5300000000 AS Decimal(18, 10)), 158, 20, 20, N'4011209000', 5, 856449, CAST(10629.2200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 158)
    INSERT @Registros VALUES (2612, 30, 7, 3, CAST(N'2022-11-07' AS Date), CAST(388.7000000000 AS Decimal(18, 10)), 3, 3, 4, N'4011209000', 5, 944973, CAST(40.5700000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 3)
    INSERT @Registros VALUES (2613, 56, 7, 3, CAST(N'2022-11-08' AS Date), CAST(11606.1100000000 AS Decimal(18, 10)), 131, 3, 4, N'4011209000', 5, 42138, CAST(2408.2000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 131)
    INSERT @Registros VALUES (2614, 56, 7, 3, CAST(N'2022-11-08' AS Date), CAST(37995.6700000000 AS Decimal(18, 10)), 440, 3, 4, N'4011209000', 5, 42138, CAST(7883.8700000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 440)
    INSERT @Registros VALUES (2615, 61, 7, 3, CAST(N'2022-11-08' AS Date), CAST(29382.0400000000 AS Decimal(18, 10)), 397, 5, 6, N'4011209000', 5, 54690, CAST(8391.7100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 397)
    INSERT @Registros VALUES (2616, 30, 7, 3, CAST(N'2022-11-08' AS Date), CAST(1104.4700000000 AS Decimal(18, 10)), 3, 3, 4, N'4011209000', 5, 963915, CAST(204.0500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 3)
    INSERT @Registros VALUES (2617, 47, 7, 3, CAST(N'2022-11-09' AS Date), CAST(68537.8400000000 AS Decimal(18, 10)), 647, 3, 4, N'4011209000', 5, 116356, CAST(9757.9500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 647)
    INSERT @Registros VALUES (2618, 61, 7, 3, CAST(N'2022-11-09' AS Date), CAST(36255.6400000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 486647, CAST(13460.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (2619, 30, 7, 3, CAST(N'2022-11-09' AS Date), CAST(1287.4800000000 AS Decimal(18, 10)), 2, 13, 3, N'4011209000', 5, 634002, CAST(144.7800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 2)
    INSERT @Registros VALUES (2620, 30, 7, 3, CAST(N'2022-11-09' AS Date), CAST(861.0900000000 AS Decimal(18, 10)), 2, 18, 3, N'4011209000', 5, 634002, CAST(159.8300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 2)
    INSERT @Registros VALUES (2621, 42, 7, 3, CAST(N'2022-11-10' AS Date), CAST(9306.6000000000 AS Decimal(18, 10)), 30, 2, 2, N'4011209000', 5, 67836, CAST(1641.9900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 30)
    INSERT @Registros VALUES (2622, 7, 12, 8, CAST(N'2022-11-10' AS Date), CAST(45050.1900000000 AS Decimal(18, 10)), 515, 3, 4, N'4011209000', 5, 421757, CAST(9112.4100000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 515)
    INSERT @Registros VALUES (2623, 8, 7, 3, CAST(N'2022-11-10' AS Date), CAST(39291.3000000000 AS Decimal(18, 10)), 185, 5, 6, N'4011209000', 5, 668685, CAST(11691.4700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 185)
    INSERT @Registros VALUES (2624, 2, 12, 8, CAST(N'2022-11-10' AS Date), CAST(49116.9700000000 AS Decimal(18, 10)), 251, 5, 6, N'4011209000', 5, 749873, CAST(17159.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 251)
    INSERT @Registros VALUES (2625, 46, 7, 3, CAST(N'2022-11-10' AS Date), CAST(47096.5100000000 AS Decimal(18, 10)), 232, 5, 6, N'4011209000', 5, 840025, CAST(13142.3600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 232)
    INSERT @Registros VALUES (2626, 22, 7, 3, CAST(N'2022-11-11' AS Date), CAST(34010.9500000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 114197, CAST(13633.4800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (2627, 22, 7, 3, CAST(N'2022-11-11' AS Date), CAST(34195.6000000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 180665, CAST(13812.2800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (2628, 56, 7, 3, CAST(N'2022-11-11' AS Date), CAST(50499.8600000000 AS Decimal(18, 10)), 570, 3, 4, N'4011209000', 5, 249601, CAST(10244.6100000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 570)
    INSERT @Registros VALUES (2629, 24, 12, 8, CAST(N'2022-11-11' AS Date), CAST(47744.0300000000 AS Decimal(18, 10)), 302, 5, 6, N'4011209000', 5, 842849, CAST(14320.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 302)
    INSERT @Registros VALUES (2630, 61, 7, 3, CAST(N'2022-11-11' AS Date), CAST(5482.9900000000 AS Decimal(18, 10)), 49, 5, 6, N'4011209000', 5, 954327, CAST(1616.9500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 49)
    INSERT @Registros VALUES (2631, 45, 7, 3, CAST(N'2022-11-14' AS Date), CAST(20597.7900000000 AS Decimal(18, 10)), 252, 16, 17, N'4011209000', 5, 381137, CAST(3100.2900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (2632, 20, 7, 3, CAST(N'2022-11-14' AS Date), CAST(14863.9700000000 AS Decimal(18, 10)), 180, 5, 6, N'4011209000', 5, 614937, CAST(5150.0300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 180)
    INSERT @Registros VALUES (2633, 64, 7, 3, CAST(N'2022-11-15' AS Date), CAST(28866.5600000000 AS Decimal(18, 10)), 208, 5, 6, N'4011209000', 5, 824727, CAST(9640.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 208)
    INSERT @Registros VALUES (2634, 15, 7, 3, CAST(N'2022-11-15' AS Date), CAST(10712.4900000000 AS Decimal(18, 10)), 40, 3, 4, N'4011209000', 5, 839447, CAST(2442.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (2635, 61, 7, 3, CAST(N'2022-11-15' AS Date), CAST(32748.7400000000 AS Decimal(18, 10)), 202, 5, 6, N'4011209000', 5, 941935, CAST(9603.7800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 202)
    INSERT @Registros VALUES (2636, 27, 7, 3, CAST(N'2022-11-16' AS Date), CAST(12043.3200000000 AS Decimal(18, 10)), 92, 3, 4, N'4011209000', 5, 668040, CAST(1599.0500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 92)
    INSERT @Registros VALUES (2637, 56, 7, 3, CAST(N'2022-11-16' AS Date), CAST(37650.2600000000 AS Decimal(18, 10)), 436, 3, 4, N'4011209000', 5, 905688, CAST(7815.3300000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 436)
    INSERT @Registros VALUES (2638, 56, 7, 3, CAST(N'2022-11-16' AS Date), CAST(10631.5500000000 AS Decimal(18, 10)), 120, 3, 4, N'4011209000', 5, 905688, CAST(2206.8700000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 120)
    INSERT @Registros VALUES (2639, 44, 7, 3, CAST(N'2022-11-17' AS Date), CAST(78760.2900000000 AS Decimal(18, 10)), 500, 5, 6, N'4011209000', 5, 43028, CAST(29000.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 500)
    INSERT @Registros VALUES (2640, 45, 7, 3, CAST(N'2022-11-17' AS Date), CAST(246.0300000000 AS Decimal(18, 10)), 2, 3, 4, N'4011209000', 5, 463477, CAST(40.5700000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 2)
    INSERT @Registros VALUES (2641, 51, 7, 3, CAST(N'2022-11-17' AS Date), CAST(35802.4900000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 629951, CAST(13999.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (2642, 61, 7, 3, CAST(N'2022-11-17' AS Date), CAST(36190.6400000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 818850, CAST(13440.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (2643, 30, 7, 3, CAST(N'2022-11-17' AS Date), CAST(56814.1600000000 AS Decimal(18, 10)), 183, 3, 4, N'4011209000', 5, 859590, CAST(10948.0600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 183)
    INSERT @Registros VALUES (2644, 45, 7, 3, CAST(N'2022-11-18' AS Date), CAST(1060.5700000000 AS Decimal(18, 10)), 15, 3, 4, N'4011209000', 5, 433283, CAST(176.8400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 15)
    INSERT @Registros VALUES (2645, 12, 1, 2, CAST(N'2022-11-18' AS Date), CAST(520.3400000000 AS Decimal(18, 10)), 2, 14, 15, N'4011209000', 5, 434228, CAST(120.1200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 2)
    INSERT @Registros VALUES (2646, 9, 9, 5, CAST(N'2022-11-18' AS Date), CAST(49058.7300000000 AS Decimal(18, 10)), 270, 5, 6, N'4011209000', 5, 623901, CAST(15749.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 270)
    INSERT @Registros VALUES (2647, 66, 12, 8, CAST(N'2022-11-19' AS Date), CAST(3706.9600000000 AS Decimal(18, 10)), 30, 5, 6, N'4011201000', 4, 499556, CAST(1608.6300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 30)
    INSERT @Registros VALUES (2648, 66, 12, 8, CAST(N'2022-11-19' AS Date), CAST(30905.5500000000 AS Decimal(18, 10)), 230, 5, 6, N'4011209000', 5, 499556, CAST(13411.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 230)
    INSERT @Registros VALUES (2649, 66, 12, 8, CAST(N'2022-11-19' AS Date), CAST(14012.0900000000 AS Decimal(18, 10)), 116, 5, 6, N'4011201000', 4, 900183, CAST(6299.5800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 116)
    INSERT @Registros VALUES (2650, 66, 12, 8, CAST(N'2022-11-19' AS Date), CAST(20024.0300000000 AS Decimal(18, 10)), 198, 5, 6, N'4011209000', 5, 900183, CAST(9002.4200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 198)
    INSERT @Registros VALUES (2651, 37, 8, 4, CAST(N'2022-11-21' AS Date), CAST(51219.2600000000 AS Decimal(18, 10)), 267, 5, 6, N'4011209000', 5, 102551, CAST(15135.4200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 267)
    INSERT @Registros VALUES (2652, 8, 7, 3, CAST(N'2022-11-21' AS Date), CAST(6592.6300000000 AS Decimal(18, 10)), 60, 5, 6, N'4011209000', 5, 196242, CAST(1728.0900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 60)
    INSERT @Registros VALUES (2653, 45, 7, 3, CAST(N'2022-11-21' AS Date), CAST(84529.5100000000 AS Decimal(18, 10)), 279, 3, 4, N'4011209000', 5, 507619, CAST(18073.5700000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 279)
    INSERT @Registros VALUES (2654, 47, 7, 3, CAST(N'2022-11-21' AS Date), CAST(13690.0400000000 AS Decimal(18, 10)), 127, 3, 4, N'4011209000', 5, 734484, CAST(2036.5800000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 127)
    INSERT @Registros VALUES (2655, 45, 7, 3, CAST(N'2022-11-21' AS Date), CAST(95744.1900000000 AS Decimal(18, 10)), 430, 20, 20, N'4011209000', 5, 763708, CAST(26245.4500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 430)
    INSERT @Registros VALUES (2656, 51, 7, 3, CAST(N'2022-11-21' AS Date), CAST(37752.8600000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 5, 797677, CAST(15710.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (2657, 51, 7, 3, CAST(N'2022-11-21' AS Date), CAST(33820.2700000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 797677, CAST(13760.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 266)
    INSERT @Registros VALUES (2658, 51, 7, 3, CAST(N'2022-11-22' AS Date), CAST(73642.6900000000 AS Decimal(18, 10)), 487, 5, 6, N'4011209000', 5, 125920, CAST(24654.1500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 487)
    INSERT @Registros VALUES (2659, 25, 7, 3, CAST(N'2022-11-22' AS Date), CAST(6488.8000000000 AS Decimal(18, 10)), 48, 5, 6, N'4011209000', 5, 349260, CAST(2763.8400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 48)
    INSERT @Registros VALUES (2660, 30, 7, 3, CAST(N'2022-11-22' AS Date), CAST(84377.2900000000 AS Decimal(18, 10)), 600, 5, 6, N'4011209000', 5, 895677, CAST(30066.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 600)
    INSERT @Registros VALUES (2661, 30, 7, 3, CAST(N'2022-11-22' AS Date), CAST(2417.6500000000 AS Decimal(18, 10)), 6, 18, 3, N'4011209000', 5, 944983, CAST(440.1700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 6)
    INSERT @Registros VALUES (2662, 26, 7, 3, CAST(N'2022-11-23' AS Date), CAST(42077.5800000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 18126, CAST(15462.4800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2663, 61, 7, 3, CAST(N'2022-11-23' AS Date), CAST(45695.9800000000 AS Decimal(18, 10)), 349, 5, 6, N'4011209000', 5, 177813, CAST(17000.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 349)
    INSERT @Registros VALUES (2664, 54, 12, 8, CAST(N'2022-11-23' AS Date), CAST(26462.1400000000 AS Decimal(18, 10)), 412, 5, 6, N'4011209000', 5, 481358, CAST(20578.3900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 412)
    INSERT @Registros VALUES (2665, 2, 12, 8, CAST(N'2022-11-24' AS Date), CAST(45321.4000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 689224, CAST(17090.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (2666, 56, 7, 3, CAST(N'2022-11-24' AS Date), CAST(27907.8200000000 AS Decimal(18, 10)), 315, 3, 4, N'4011209000', 5, 695463, CAST(5661.5000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 315)
    INSERT @Registros VALUES (2667, 56, 7, 3, CAST(N'2022-11-24' AS Date), CAST(11225.9900000000 AS Decimal(18, 10)), 130, 3, 4, N'4011209000', 5, 902929, CAST(2292.5200000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 130)
    INSERT @Registros VALUES (2668, 56, 7, 3, CAST(N'2022-11-24' AS Date), CAST(38982.3500000000 AS Decimal(18, 10)), 440, 3, 4, N'4011209000', 5, 902929, CAST(7960.8000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 440)
    INSERT @Registros VALUES (2669, 13, 5, 6, CAST(N'2022-11-24' AS Date), CAST(21560.9700000000 AS Decimal(18, 10)), 150, 5, 25, N'4011209000', 5, 991737, CAST(8033.1900000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 150)
    INSERT @Registros VALUES (2670, 2, 12, 8, CAST(N'2022-11-25' AS Date), CAST(69620.0000000000 AS Decimal(18, 10)), 520, 5, 6, N'4011209000', 5, 32115, CAST(27820.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 520)
    INSERT @Registros VALUES (2671, 44, 7, 3, CAST(N'2022-11-25' AS Date), CAST(22752.3200000000 AS Decimal(18, 10)), 166, 5, 6, N'4011209000', 5, 391540, CAST(6091.6100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 166)
    INSERT @Registros VALUES (2672, 27, 7, 3, CAST(N'2022-11-25' AS Date), CAST(3376.0800000000 AS Decimal(18, 10)), 24, 3, 4, N'4011209000', 5, 406792, CAST(431.6600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 24)
    INSERT @Registros VALUES (2673, 59, 12, 8, CAST(N'2022-11-25' AS Date), CAST(158102.1900000000 AS Decimal(18, 10)), 1063, 5, 6, N'4011209000', 5, 587946, CAST(58840.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1063)
    INSERT @Registros VALUES (2674, 45, 7, 3, CAST(N'2022-11-28' AS Date), CAST(1522.3500000000 AS Decimal(18, 10)), 10, 14, 15, N'4011209000', 5, 107208, CAST(230.0300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 10)
    INSERT @Registros VALUES (2675, 45, 7, 3, CAST(N'2022-11-29' AS Date), CAST(18941.6500000000 AS Decimal(18, 10)), 141, 5, 6, N'4011209000', 5, 658255, CAST(6618.4800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 141)
    INSERT @Registros VALUES (2676, 51, 7, 3, CAST(N'2022-11-29' AS Date), CAST(1047.9400000000 AS Decimal(18, 10)), 10, 3, 4, N'4011209000', 5, 973424, CAST(182.1000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 10)
    INSERT @Registros VALUES (2677, 15, 7, 3, CAST(N'2022-11-30' AS Date), CAST(36165.9800000000 AS Decimal(18, 10)), 144, 3, 4, N'4011209000', 5, 444672, CAST(8792.6400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 144)
    INSERT @Registros VALUES (2678, 6, 7, 3, CAST(N'2022-11-30' AS Date), CAST(39714.9600000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 5, 714468, CAST(13806.1600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (2679, 63, 12, 8, CAST(N'2022-11-30' AS Date), CAST(36665.0800000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 832823, CAST(14900.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (2680, 27, 7, 3, CAST(N'2022-12-01' AS Date), CAST(1343.6700000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 5, 178592, CAST(165.8500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 12)
    INSERT @Registros VALUES (2681, 45, 7, 3, CAST(N'2022-12-01' AS Date), CAST(11973.2300000000 AS Decimal(18, 10)), 160, 16, 17, N'4011209000', 5, 358486, CAST(1834.7700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 160)
    INSERT @Registros VALUES (2682, 45, 7, 3, CAST(N'2022-12-01' AS Date), CAST(1585.6900000000 AS Decimal(18, 10)), 16, 16, 17, N'4011209000', 5, 631398, CAST(238.8400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 16)
    INSERT @Registros VALUES (2683, 42, 7, 3, CAST(N'2022-12-05' AS Date), CAST(63220.6200000000 AS Decimal(18, 10)), 246, 3, 4, N'4011209000', 5, 67627, CAST(13366.5300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 246)
    INSERT @Registros VALUES (2684, 44, 7, 3, CAST(N'2022-12-05' AS Date), CAST(36004.4300000000 AS Decimal(18, 10)), 148, 3, 4, N'4011209000', 5, 106268, CAST(7345.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 148)
    INSERT @Registros VALUES (2685, 7, 12, 8, CAST(N'2022-12-05' AS Date), CAST(15729.7400000000 AS Decimal(18, 10)), 200, 3, 4, N'4011209000', 5, 291169, CAST(3152.1500000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 200)
    INSERT @Registros VALUES (2686, 7, 12, 8, CAST(N'2022-12-05' AS Date), CAST(43738.0500000000 AS Decimal(18, 10)), 500, 3, 4, N'4011209000', 5, 291169, CAST(8764.8500000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 500)
    INSERT @Registros VALUES (2687, 42, 7, 3, CAST(N'2022-12-05' AS Date), CAST(63220.6200000000 AS Decimal(18, 10)), 246, 3, 4, N'4011209000', 5, 341653, CAST(13366.5300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 246)
    INSERT @Registros VALUES (2688, 10, 7, 3, CAST(N'2022-12-05' AS Date), CAST(10127.1600000000 AS Decimal(18, 10)), 78, 3, 4, N'4011209000', 5, 706481, CAST(1247.5600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 78)
    INSERT @Registros VALUES (2689, 47, 7, 3, CAST(N'2022-12-05' AS Date), CAST(2924.1900000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 5, 771481, CAST(506.1200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 30)
    INSERT @Registros VALUES (2690, 7, 12, 8, CAST(N'2022-12-05' AS Date), CAST(34990.4400000000 AS Decimal(18, 10)), 400, 3, 4, N'4011209000', 5, 896725, CAST(6966.6500000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 400)
    INSERT @Registros VALUES (2691, 7, 12, 8, CAST(N'2022-12-05' AS Date), CAST(28234.8800000000 AS Decimal(18, 10)), 359, 3, 4, N'4011209000', 5, 896725, CAST(5621.6100000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 359)
    INSERT @Registros VALUES (2692, 56, 7, 3, CAST(N'2022-12-06' AS Date), CAST(46803.7700000000 AS Decimal(18, 10)), 542, 3, 4, N'4011209000', 5, 445943, CAST(9763.9200000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 542)
    INSERT @Registros VALUES (2693, 56, 7, 3, CAST(N'2022-12-06' AS Date), CAST(2392.1000000000 AS Decimal(18, 10)), 27, 3, 4, N'4011209000', 5, 445943, CAST(499.0300000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 27)
    INSERT @Registros VALUES (2694, 47, 7, 3, CAST(N'2022-12-07' AS Date), CAST(8903.0300000000 AS Decimal(18, 10)), 80, 3, 4, N'4011209000', 5, 471198, CAST(1422.5900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 80)
    INSERT @Registros VALUES (2695, 47, 7, 3, CAST(N'2022-12-07' AS Date), CAST(51578.9700000000 AS Decimal(18, 10)), 429, 3, 4, N'4011209000', 5, 471198, CAST(7532.3300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 429)
    INSERT @Registros VALUES (2696, 22, 7, 3, CAST(N'2022-12-08' AS Date), CAST(29961.8900000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 311138, CAST(13706.0800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (2697, 23, 7, 3, CAST(N'2022-12-09' AS Date), CAST(14883.2700000000 AS Decimal(18, 10)), 100, 5, 6, N'4011209000', 5, 141643, CAST(5400.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 100)
    INSERT @Registros VALUES (2698, 6, 7, 3, CAST(N'2022-12-09' AS Date), CAST(35729.9100000000 AS Decimal(18, 10)), 206, 5, 6, N'4011209000', 5, 631048, CAST(11810.0900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 206)
    INSERT @Registros VALUES (2699, 45, 7, 3, CAST(N'2022-12-09' AS Date), CAST(22772.4700000000 AS Decimal(18, 10)), 171, 3, 4, N'4011209000', 5, 737418, CAST(5306.8000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 171)
    INSERT @Registros VALUES (2700, 13, 5, 6, CAST(N'2022-12-09' AS Date), CAST(26555.3800000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 996150, CAST(5782.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 100)
    INSERT @Registros VALUES (2701, 51, 7, 3, CAST(N'2022-12-12' AS Date), CAST(7041.6500000000 AS Decimal(18, 10)), 50, 6, 7, N'4011209000', 5, 495569, CAST(1343.3700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (2702, 45, 7, 3, CAST(N'2022-12-12' AS Date), CAST(20064.2900000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 770756, CAST(3572.1900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 100)
    INSERT @Registros VALUES (2703, 44, 7, 3, CAST(N'2022-12-12' AS Date), CAST(33696.1000000000 AS Decimal(18, 10)), 122, 3, 4, N'4011209000', 5, 857682, CAST(6683.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 122)
    INSERT @Registros VALUES (2704, 61, 7, 3, CAST(N'2022-12-13' AS Date), CAST(32250.6400000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 113872, CAST(13500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2705, 13, 5, 6, CAST(N'2022-12-13' AS Date), CAST(21697.4600000000 AS Decimal(18, 10)), 150, 5, 25, N'4011209000', 5, 966333, CAST(8033.1900000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 150)
    INSERT @Registros VALUES (2706, 24, 12, 8, CAST(N'2022-12-14' AS Date), CAST(45257.0300000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 83515, CAST(14370.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (2707, 12, 1, 2, CAST(N'2022-12-14' AS Date), CAST(29985.3100000000 AS Decimal(18, 10)), 127, 5, 6, N'4011209000', 5, 97484, CAST(8165.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 127)
    INSERT @Registros VALUES (2708, 12, 1, 2, CAST(N'2022-12-14' AS Date), CAST(24047.2600000000 AS Decimal(18, 10)), 92, 5, 6, N'4011209000', 5, 97484, CAST(5915.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 92)
    INSERT @Registros VALUES (2709, 59, 12, 8, CAST(N'2022-12-14' AS Date), CAST(72304.1500000000 AS Decimal(18, 10)), 560, 5, 6, N'4011209000', 5, 256663, CAST(27563.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 560)
    INSERT @Registros VALUES (2710, 30, 7, 3, CAST(N'2022-12-14' AS Date), CAST(92103.8700000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 5, 283159, CAST(18003.5000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 300)
    INSERT @Registros VALUES (2711, 56, 7, 3, CAST(N'2022-12-14' AS Date), CAST(49221.6700000000 AS Decimal(18, 10)), 570, 3, 4, N'4011209000', 5, 390732, CAST(10282.8000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 570)
    INSERT @Registros VALUES (2712, 56, 7, 3, CAST(N'2022-12-14' AS Date), CAST(44907.2300000000 AS Decimal(18, 10)), 520, 3, 4, N'4011209000', 5, 604549, CAST(9380.8000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 520)
    INSERT @Registros VALUES (2713, 45, 7, 3, CAST(N'2022-12-15' AS Date), CAST(27474.4400000000 AS Decimal(18, 10)), 349, 7, 8, N'4011209000', 5, 92405, CAST(5384.4200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 349)
    INSERT @Registros VALUES (2714, 30, 7, 3, CAST(N'2022-12-15' AS Date), CAST(2598.5800000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 5, 536120, CAST(348.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 30)
    INSERT @Registros VALUES (2715, 23, 7, 3, CAST(N'2022-12-15' AS Date), CAST(35909.1900000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 547047, CAST(13826.1000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (2716, 23, 7, 3, CAST(N'2022-12-15' AS Date), CAST(35445.9800000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 656620, CAST(13924.0400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 266)
    INSERT @Registros VALUES (2717, 44, 7, 3, CAST(N'2022-12-16' AS Date), CAST(53215.9400000000 AS Decimal(18, 10)), 194, 3, 4, N'4011209000', 5, 729499, CAST(10237.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 194)
    INSERT @Registros VALUES (2718, 61, 7, 3, CAST(N'2022-12-19' AS Date), CAST(32958.9600000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 5, 257307, CAST(13330.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 256)
    INSERT @Registros VALUES (2719, 47, 7, 3, CAST(N'2022-12-19' AS Date), CAST(48282.7800000000 AS Decimal(18, 10)), 460, 3, 4, N'4011209000', 5, 264755, CAST(6940.6800000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 460)
    INSERT @Registros VALUES (2720, 44, 7, 3, CAST(N'2022-12-19' AS Date), CAST(56424.9100000000 AS Decimal(18, 10)), 214, 3, 4, N'4011209000', 5, 519426, CAST(11643.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 214)
    INSERT @Registros VALUES (2721, 59, 12, 8, CAST(N'2022-12-19' AS Date), CAST(38393.7500000000 AS Decimal(18, 10)), 281, 5, 6, N'4011209000', 5, 673000, CAST(14900.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 281)
    INSERT @Registros VALUES (2722, 47, 7, 3, CAST(N'2022-12-19' AS Date), CAST(37365.8800000000 AS Decimal(18, 10)), 327, 3, 4, N'4011209000', 5, 899816, CAST(5641.8700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 327)
    INSERT @Registros VALUES (2723, 47, 7, 3, CAST(N'2022-12-20' AS Date), CAST(6487.8500000000 AS Decimal(18, 10)), 70, 3, 4, N'4011209000', 5, 60234, CAST(1079.6900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 70)
    INSERT @Registros VALUES (2724, 27, 7, 3, CAST(N'2022-12-20' AS Date), CAST(18324.7600000000 AS Decimal(18, 10)), 176, 3, 4, N'4011209000', 5, 392361, CAST(2364.8500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 176)
    INSERT @Registros VALUES (2725, 12, 1, 2, CAST(N'2022-12-21' AS Date), CAST(37430.4400000000 AS Decimal(18, 10)), 362, 5, 6, N'4011209000', 5, 333471, CAST(14962.0900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 362)
    INSERT @Registros VALUES (2726, 59, 12, 8, CAST(N'2022-12-21' AS Date), CAST(658.4900000000 AS Decimal(18, 10)), 20, 5, 6, N'4011209000', 5, 374485, CAST(212.1600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (2727, 45, 7, 3, CAST(N'2022-12-21' AS Date), CAST(22451.7400000000 AS Decimal(18, 10)), 196, 14, 15, N'4011209000', 5, 552263, CAST(3463.1800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 196)
    INSERT @Registros VALUES (2728, 61, 7, 3, CAST(N'2022-12-22' AS Date), CAST(38043.9900000000 AS Decimal(18, 10)), 291, 5, 6, N'4011209000', 5, 98483, CAST(13762.0100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 291)
    INSERT @Registros VALUES (2729, 51, 7, 3, CAST(N'2022-12-22' AS Date), CAST(43961.5100000000 AS Decimal(18, 10)), 362, 5, 6, N'4011209000', 5, 383381, CAST(13927.9800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 362)
    INSERT @Registros VALUES (2730, 1, 11, 7, CAST(N'2022-12-22' AS Date), CAST(40565.6400000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 389386, CAST(14316.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2731, 20, 7, 3, CAST(N'2022-12-22' AS Date), CAST(39551.5800000000 AS Decimal(18, 10)), 258, 5, 6, N'4011209000', 5, 521627, CAST(15940.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 258)
    INSERT @Registros VALUES (2732, 61, 7, 3, CAST(N'2022-12-22' AS Date), CAST(35447.2800000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 836901, CAST(13481.3000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2733, 44, 7, 3, CAST(N'2022-12-23' AS Date), CAST(33800.2100000000 AS Decimal(18, 10)), 227, 5, 6, N'4011209000', 5, 34264, CAST(12303.8000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 227)
    INSERT @Registros VALUES (2734, 15, 7, 3, CAST(N'2022-12-23' AS Date), CAST(2900.0500000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 5, 580681, CAST(557.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (2735, 44, 7, 3, CAST(N'2022-12-23' AS Date), CAST(74486.0200000000 AS Decimal(18, 10)), 500, 5, 6, N'4011209000', 5, 824185, CAST(29000.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 500)
    INSERT @Registros VALUES (2736, 61, 7, 3, CAST(N'2022-12-23' AS Date), CAST(39995.0000000000 AS Decimal(18, 10)), 332, 5, 6, N'4011209000', 5, 875386, CAST(14663.1000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 332)
    INSERT @Registros VALUES (2737, 45, 7, 3, CAST(N'2022-12-23' AS Date), CAST(83831.7600000000 AS Decimal(18, 10)), 371, 3, 4, N'4011209000', 5, 995996, CAST(19640.2500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 371)
    INSERT @Registros VALUES (2738, 61, 7, 3, CAST(N'2022-12-26' AS Date), CAST(45573.9900000000 AS Decimal(18, 10)), 367, 5, 6, N'4011209000', 5, 440267, CAST(17310.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 367)
    INSERT @Registros VALUES (2739, 45, 7, 3, CAST(N'2022-12-26' AS Date), CAST(72638.0100000000 AS Decimal(18, 10)), 530, 5, 6, N'4011209000', 5, 810055, CAST(28400.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 530)
    INSERT @Registros VALUES (2740, 30, 7, 3, CAST(N'2022-12-27' AS Date), CAST(97370.3800000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 5, 7350, CAST(18614.0600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 300)
    INSERT @Registros VALUES (2741, 45, 7, 3, CAST(N'2022-12-27' AS Date), CAST(77508.5800000000 AS Decimal(18, 10)), 354, 3, 4, N'4011209000', 5, 17189, CAST(18341.3200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 354)
    INSERT @Registros VALUES (2742, 63, 12, 8, CAST(N'2022-12-27' AS Date), CAST(37414.0800000000 AS Decimal(18, 10)), 286, 5, 6, N'4011209000', 5, 263575, CAST(15220.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 286)
    INSERT @Registros VALUES (2743, 45, 7, 3, CAST(N'2022-12-27' AS Date), CAST(1545.5600000000 AS Decimal(18, 10)), 17, 16, 17, N'4011209000', 5, 346428, CAST(230.6900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 17)
    INSERT @Registros VALUES (2744, 30, 7, 3, CAST(N'2022-12-27' AS Date), CAST(108418.2600000000 AS Decimal(18, 10)), 347, 3, 4, N'4011209000', 5, 533323, CAST(20747.1300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 347)
    INSERT @Registros VALUES (2745, 30, 7, 3, CAST(N'2022-12-27' AS Date), CAST(108418.2600000000 AS Decimal(18, 10)), 347, 3, 4, N'4011209000', 5, 544639, CAST(20747.1300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 347)
    INSERT @Registros VALUES (2746, 59, 12, 8, CAST(N'2022-12-27' AS Date), CAST(71917.0200000000 AS Decimal(18, 10)), 560, 5, 6, N'4011209000', 5, 596630, CAST(27224.4200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 560)
    INSERT @Registros VALUES (2747, 30, 7, 3, CAST(N'2022-12-28' AS Date), CAST(6210.1300000000 AS Decimal(18, 10)), 16, 18, 3, N'4011209000', 5, 860533, CAST(1121.3700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 16)
    INSERT @Registros VALUES (2748, 22, 7, 3, CAST(N'2022-12-28' AS Date), CAST(32009.6800000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 860637, CAST(14500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (2749, 53, 12, 8, CAST(N'2022-12-28' AS Date), CAST(639.6200000000 AS Decimal(18, 10)), 4, 5, 6, N'4011209000', 5, 947819, CAST(218.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 4)
    INSERT @Registros VALUES (2750, 22, 7, 3, CAST(N'2022-12-29' AS Date), CAST(18639.9500000000 AS Decimal(18, 10)), 155, 5, 6, N'4011209000', 5, 272, CAST(9048.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 155)
    INSERT @Registros VALUES (2751, 22, 7, 3, CAST(N'2022-12-29' AS Date), CAST(34928.4100000000 AS Decimal(18, 10)), 310, 5, 6, N'4011209000', 5, 107844, CAST(15418.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 310)
    INSERT @Registros VALUES (2752, 45, 7, 3, CAST(N'2022-12-29' AS Date), CAST(34659.6400000000 AS Decimal(18, 10)), 482, 3, 4, N'4011209000', 5, 223046, CAST(6329.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 482)
    INSERT @Registros VALUES (2753, 26, 7, 3, CAST(N'2022-12-29' AS Date), CAST(39379.0600000000 AS Decimal(18, 10)), 270, 5, 6, N'4011209000', 5, 258613, CAST(14547.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 270)
    INSERT @Registros VALUES (2754, 26, 7, 3, CAST(N'2022-12-29' AS Date), CAST(41851.9500000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 267707, CAST(15656.3700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2755, 12, 1, 2, CAST(N'2022-12-29' AS Date), CAST(71319.5300000000 AS Decimal(18, 10)), 600, 5, 6, N'4011209000', 5, 287361, CAST(29820.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 600)
    INSERT @Registros VALUES (2756, 22, 7, 3, CAST(N'2022-12-29' AS Date), CAST(31853.2100000000 AS Decimal(18, 10)), 258, 5, 6, N'4011209000', 5, 451701, CAST(14454.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 258)
    INSERT @Registros VALUES (2757, 49, 12, 8, CAST(N'2022-12-29' AS Date), CAST(21020.0000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 630954, CAST(14500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (2758, 22, 7, 3, CAST(N'2022-12-29' AS Date), CAST(32719.8000000000 AS Decimal(18, 10)), 270, 5, 6, N'4011209000', 5, 994472, CAST(14740.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 270)
    INSERT @Registros VALUES (2759, 6, 7, 3, CAST(N'2022-12-30' AS Date), CAST(5526.6500000000 AS Decimal(18, 10)), 52, 5, 6, N'4011209000', 5, 372439, CAST(1756.5400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 52)
    INSERT @Registros VALUES (2760, 6, 7, 3, CAST(N'2022-12-30' AS Date), CAST(39469.0800000000 AS Decimal(18, 10)), 246, 5, 6, N'4011209000', 5, 501695, CAST(14515.6600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 246)
    INSERT @Registros VALUES (2761, 8, 7, 3, CAST(N'2022-12-30' AS Date), CAST(6399.3200000000 AS Decimal(18, 10)), 36, 5, 6, N'4011209000', 5, 749205, CAST(2189.4400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 36)
    INSERT @Registros VALUES (2762, 61, 7, 3, CAST(N'2023-01-03' AS Date), CAST(22277.0900000000 AS Decimal(18, 10)), 208, 5, 6, N'4011209000', 5, 546530, CAST(8182.8000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 208)
    INSERT @Registros VALUES (2763, 51, 7, 3, CAST(N'2023-01-04' AS Date), CAST(61858.4700000000 AS Decimal(18, 10)), 468, 5, 6, N'4011209000', 5, 676574, CAST(27158.8200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 468)
    INSERT @Registros VALUES (2764, 51, 7, 3, CAST(N'2023-01-04' AS Date), CAST(32993.3000000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 5, 676574, CAST(14404.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (2765, 51, 7, 3, CAST(N'2023-01-05' AS Date), CAST(26483.6000000000 AS Decimal(18, 10)), 222, 5, 6, N'4011209000', 5, 136284, CAST(8606.9600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 222)
    INSERT @Registros VALUES (2766, 13, 5, 6, CAST(N'2023-01-05' AS Date), CAST(32907.7000000000 AS Decimal(18, 10)), 230, 5, 25, N'4011209000', 5, 692345, CAST(12183.6200000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 230)
    INSERT @Registros VALUES (2767, 27, 7, 3, CAST(N'2023-01-05' AS Date), CAST(1656.7300000000 AS Decimal(18, 10)), 12, 1, 1, N'4011209000', 5, 764990, CAST(142.9900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 12)
    INSERT @Registros VALUES (2768, 51, 7, 3, CAST(N'2023-01-05' AS Date), CAST(18116.8900000000 AS Decimal(18, 10)), 132, 5, 6, N'4011209000', 5, 937836, CAST(5904.9200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 132)
    INSERT @Registros VALUES (2769, 30, 7, 3, CAST(N'2023-01-09' AS Date), CAST(975.9900000000 AS Decimal(18, 10)), 3, 4, 9, N'4011209000', 5, 766203, CAST(160.5600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 3)
    INSERT @Registros VALUES (2770, 51, 7, 3, CAST(N'2023-01-09' AS Date), CAST(96032.0300000000 AS Decimal(18, 10)), 859, 5, 6, N'4011209000', 5, 904861, CAST(36017.8800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 859)
    INSERT @Registros VALUES (2771, 2, 12, 8, CAST(N'2023-01-10' AS Date), CAST(32563.6000000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 46809, CAST(13590.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (2772, 42, 7, 3, CAST(N'2023-01-10' AS Date), CAST(58799.0000000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 5, 668943, CAST(13075.2600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (2773, 59, 12, 8, CAST(N'2023-01-11' AS Date), CAST(73007.5700000000 AS Decimal(18, 10)), 646, 5, 6, N'4011209000', 5, 123698, CAST(28995.6800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 646)
    INSERT @Registros VALUES (2774, 24, 12, 8, CAST(N'2023-01-11' AS Date), CAST(42789.7100000000 AS Decimal(18, 10)), 268, 5, 6, N'4011209000', 5, 315160, CAST(15230.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 268)
    INSERT @Registros VALUES (2775, 42, 7, 3, CAST(N'2023-01-11' AS Date), CAST(26058.5200000000 AS Decimal(18, 10)), 74, 2, 2, N'4011209000', 5, 867833, CAST(4560.2800000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 74)
    INSERT @Registros VALUES (2776, 6, 7, 3, CAST(N'2023-01-12' AS Date), CAST(39226.0600000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 333037, CAST(13300.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2777, 8, 7, 3, CAST(N'2023-01-12' AS Date), CAST(4863.3900000000 AS Decimal(18, 10)), 24, 5, 6, N'4011209000', 5, 377436, CAST(1309.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 24)
    INSERT @Registros VALUES (2778, 45, 7, 3, CAST(N'2023-01-12' AS Date), CAST(12444.2600000000 AS Decimal(18, 10)), 159, 16, 17, N'4011209000', 5, 724331, CAST(1916.8700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 159)
    INSERT @Registros VALUES (2779, 12, 1, 2, CAST(N'2023-01-12' AS Date), CAST(32816.5600000000 AS Decimal(18, 10)), 288, 5, 6, N'4011209000', 5, 774954, CAST(14870.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 288)
    INSERT @Registros VALUES (2780, 7, 12, 8, CAST(N'2023-01-12' AS Date), CAST(59921.1200000000 AS Decimal(18, 10)), 685, 3, 4, N'4011209000', 5, 847696, CAST(12120.3900000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 685)
    INSERT @Registros VALUES (2781, 66, 12, 8, CAST(N'2023-01-13' AS Date), CAST(12834.9800000000 AS Decimal(18, 10)), 240, 5, 6, N'4011209000', 5, 235507, CAST(6252.0200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 240)
    INSERT @Registros VALUES (2782, 12, 1, 2, CAST(N'2023-01-13' AS Date), CAST(33047.2100000000 AS Decimal(18, 10)), 270, 5, 6, N'4011209000', 5, 594221, CAST(13535.1700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 270)
    INSERT @Registros VALUES (2783, 7, 12, 8, CAST(N'2023-01-13' AS Date), CAST(59921.1200000000 AS Decimal(18, 10)), 685, 3, 4, N'4011209000', 5, 720586, CAST(12120.3900000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 685)
    INSERT @Registros VALUES (2784, 61, 7, 3, CAST(N'2023-01-13' AS Date), CAST(31321.0600000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 721968, CAST(12711.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (2785, 38, 12, 8, CAST(N'2023-01-13' AS Date), CAST(28379.1200000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 908684, CAST(14500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (2786, 1, 11, 7, CAST(N'2023-01-16' AS Date), CAST(36943.7900000000 AS Decimal(18, 10)), 323, 5, 6, N'4011209000', 5, 36138, CAST(13671.0300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 323)
    INSERT @Registros VALUES (2787, 30, 7, 3, CAST(N'2023-01-16' AS Date), CAST(84420.7600000000 AS Decimal(18, 10)), 276, 3, 4, N'4011209000', 5, 355454, CAST(16725.9800000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 276)
    INSERT @Registros VALUES (2788, 44, 7, 3, CAST(N'2023-01-16' AS Date), CAST(50156.2400000000 AS Decimal(18, 10)), 215, 3, 4, N'4011209000', 5, 650142, CAST(9881.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 215)
    INSERT @Registros VALUES (2789, 45, 7, 3, CAST(N'2023-01-16' AS Date), CAST(5963.6800000000 AS Decimal(18, 10)), 40, 3, 4, N'4011209000', 5, 730139, CAST(1071.2100000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 40)
    INSERT @Registros VALUES (2790, 23, 7, 3, CAST(N'2023-01-17' AS Date), CAST(38573.5800000000 AS Decimal(18, 10)), 290, 5, 6, N'4011209000', 5, 71993, CAST(14369.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 290)
    INSERT @Registros VALUES (2791, 23, 7, 3, CAST(N'2023-01-17' AS Date), CAST(19888.5500000000 AS Decimal(18, 10)), 147, 5, 6, N'4011209000', 5, 241881, CAST(7362.6300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 147)
    INSERT @Registros VALUES (2792, 23, 7, 3, CAST(N'2023-01-17' AS Date), CAST(24706.2500000000 AS Decimal(18, 10)), 166, 5, 6, N'4011209000', 5, 304258, CAST(8964.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 166)
    INSERT @Registros VALUES (2793, 23, 7, 3, CAST(N'2023-01-17' AS Date), CAST(10004.1200000000 AS Decimal(18, 10)), 80, 5, 6, N'4011209000', 5, 402665, CAST(3548.8000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 80)
    INSERT @Registros VALUES (2794, 51, 7, 3, CAST(N'2023-01-18' AS Date), CAST(63790.2300000000 AS Decimal(18, 10)), 481, 5, 6, N'4011209000', 5, 634486, CAST(29634.1700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 481)
    INSERT @Registros VALUES (2795, 42, 7, 3, CAST(N'2023-01-18' AS Date), CAST(62823.1000000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 5, 774895, CAST(13749.5700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (2796, 29, 12, 8, CAST(N'2023-01-18' AS Date), CAST(26854.4800000000 AS Decimal(18, 10)), 234, 5, 6, N'4011209000', 5, 957112, CAST(13053.2100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 234)
    INSERT @Registros VALUES (2797, 56, 7, 3, CAST(N'2023-01-19' AS Date), CAST(49221.6700000000 AS Decimal(18, 10)), 570, 3, 4, N'4011209000', 5, 112574, CAST(10282.8000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 570)
    INSERT @Registros VALUES (2798, 7, 12, 8, CAST(N'2023-01-20' AS Date), CAST(24055.9200000000 AS Decimal(18, 10)), 275, 3, 4, N'4011209000', 5, 75255, CAST(4865.8500000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 275)
    INSERT @Registros VALUES (2799, 7, 12, 8, CAST(N'2023-01-20' AS Date), CAST(7522.9400000000 AS Decimal(18, 10)), 86, 3, 4, N'4011209000', 5, 75255, CAST(1521.6800000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 86)
    INSERT @Registros VALUES (2800, 7, 12, 8, CAST(N'2023-01-20' AS Date), CAST(27904.8700000000 AS Decimal(18, 10)), 319, 3, 4, N'4011209000', 5, 75255, CAST(5644.3900000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 319)
    INSERT @Registros VALUES (2801, 30, 7, 3, CAST(N'2023-01-20' AS Date), CAST(10127.4400000000 AS Decimal(18, 10)), 30, 10, 3, N'4011209000', 5, 646457, CAST(2151.6600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 30)
    INSERT @Registros VALUES (2802, 30, 7, 3, CAST(N'2023-01-24' AS Date), CAST(54834.0400000000 AS Decimal(18, 10)), 166, 3, 4, N'4011209000', 5, 414087, CAST(10504.4800000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 166)
    INSERT @Registros VALUES (2803, 2, 12, 8, CAST(N'2023-01-24' AS Date), CAST(37842.2900000000 AS Decimal(18, 10)), 300, 5, 6, N'4011209000', 5, 987437, CAST(15324.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 300)
    INSERT @Registros VALUES (2804, 23, 7, 3, CAST(N'2023-01-25' AS Date), CAST(12771.2700000000 AS Decimal(18, 10)), 100, 5, 6, N'4011209000', 5, 294875, CAST(5422.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 100)
    INSERT @Registros VALUES (2805, 44, 7, 3, CAST(N'2023-01-25' AS Date), CAST(34550.5100000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 365956, CAST(14500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (2806, 24, 12, 8, CAST(N'2023-01-25' AS Date), CAST(40270.0000000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 369746, CAST(14430.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (2807, 15, 7, 3, CAST(N'2023-01-26' AS Date), CAST(2903.4900000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 5, 344690, CAST(521.0600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 20)
    INSERT @Registros VALUES (2808, 7, 12, 8, CAST(N'2023-01-26' AS Date), CAST(8196.1500000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 428351, CAST(1326.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 100)
    INSERT @Registros VALUES (2809, 7, 12, 8, CAST(N'2023-01-26' AS Date), CAST(77207.7300000000 AS Decimal(18, 10)), 942, 3, 4, N'4011209000', 5, 428351, CAST(12490.9200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 942)
    INSERT @Registros VALUES (2810, 8, 7, 3, CAST(N'2023-01-26' AS Date), CAST(7008.5200000000 AS Decimal(18, 10)), 40, 5, 6, N'4011209000', 5, 441475, CAST(2174.8300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (2811, 30, 7, 3, CAST(N'2023-01-26' AS Date), CAST(34170.9500000000 AS Decimal(18, 10)), 299, 5, 6, N'4011209000', 5, 717089, CAST(14982.8900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 299)
    INSERT @Registros VALUES (2812, 42, 7, 3, CAST(N'2023-01-26' AS Date), CAST(7350.3000000000 AS Decimal(18, 10)), 30, 2, 2, N'4011209000', 5, 818135, CAST(1306.3400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 30)
    INSERT @Registros VALUES (2813, 20, 7, 3, CAST(N'2023-01-26' AS Date), CAST(59424.0000000000 AS Decimal(18, 10)), 516, 5, 6, N'4011209000', 5, 934692, CAST(28580.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 516)
    INSERT @Registros VALUES (2814, 6, 7, 3, CAST(N'2023-01-30' AS Date), CAST(31986.2400000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 193207, CAST(13500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2815, 23, 7, 3, CAST(N'2023-01-30' AS Date), CAST(20434.0800000000 AS Decimal(18, 10)), 160, 5, 6, N'4011209000', 5, 282089, CAST(8675.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 160)
    INSERT @Registros VALUES (2816, 16, 12, 8, CAST(N'2023-01-30' AS Date), CAST(1234.0000000000 AS Decimal(18, 10)), 7, 8, 9, N'4011209000', 5, 479348, CAST(100.6400000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 7)
    INSERT @Registros VALUES (2817, 61, 7, 3, CAST(N'2023-01-30' AS Date), CAST(25297.3300000000 AS Decimal(18, 10)), 201, 5, 6, N'4011209000', 5, 486284, CAST(10629.8500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 201)
    INSERT @Registros VALUES (2818, 45, 7, 3, CAST(N'2023-01-30' AS Date), CAST(27455.8300000000 AS Decimal(18, 10)), 243, 14, 15, N'4011209000', 5, 733520, CAST(4743.6700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 243)
    INSERT @Registros VALUES (2819, 22, 7, 3, CAST(N'2023-01-31' AS Date), CAST(34221.0300000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 5, 42256, CAST(15300.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (2820, 7, 12, 8, CAST(N'2023-01-31' AS Date), CAST(27527.0400000000 AS Decimal(18, 10)), 350, 3, 4, N'4011209000', 5, 107754, CAST(5438.1000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 350)
    INSERT @Registros VALUES (2821, 7, 12, 8, CAST(N'2023-01-31' AS Date), CAST(13908.7000000000 AS Decimal(18, 10)), 159, 3, 4, N'4011209000', 5, 107754, CAST(2747.7300000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 159)
    INSERT @Registros VALUES (2822, 12, 1, 2, CAST(N'2023-01-31' AS Date), CAST(29673.6400000000 AS Decimal(18, 10)), 108, 14, 15, N'4011209000', 5, 308382, CAST(6733.5500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 108)
    INSERT @Registros VALUES (2823, 12, 1, 2, CAST(N'2023-01-31' AS Date), CAST(10406.8000000000 AS Decimal(18, 10)), 40, 14, 15, N'4011209000', 5, 308382, CAST(2145.4200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (2824, 22, 7, 3, CAST(N'2023-01-31' AS Date), CAST(25549.1000000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 493645, CAST(13500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2825, 22, 7, 3, CAST(N'2023-01-31' AS Date), CAST(25602.2600000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 883531, CAST(13430.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (2826, 23, 7, 3, CAST(N'2023-02-01' AS Date), CAST(67560.6300000000 AS Decimal(18, 10)), 160, 3, 4, N'4011209000', 5, 77356, CAST(10960.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 160)
    INSERT @Registros VALUES (2827, 23, 7, 3, CAST(N'2023-02-01' AS Date), CAST(24826.5200000000 AS Decimal(18, 10)), 64, 3, 4, N'4011209000', 5, 77356, CAST(4170.8800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 64)
    INSERT @Registros VALUES (2828, 30, 7, 3, CAST(N'2023-02-02' AS Date), CAST(1181.0200000000 AS Decimal(18, 10)), 14, 3, 4, N'4011209000', 5, 41083, CAST(167.0300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 14)
    INSERT @Registros VALUES (2829, 42, 7, 3, CAST(N'2023-02-02' AS Date), CAST(62923.6000000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 5, 262460, CAST(12716.0500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (2830, 42, 7, 3, CAST(N'2023-02-03' AS Date), CAST(22129.4000000000 AS Decimal(18, 10)), 114, 2, 2, N'4011209000', 5, 78347, CAST(3804.2500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 114)
    INSERT @Registros VALUES (2831, 2, 12, 8, CAST(N'2023-02-03' AS Date), CAST(40738.5000000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 5, 167646, CAST(15060.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (2832, 13, 5, 6, CAST(N'2023-02-03' AS Date), CAST(31115.5700000000 AS Decimal(18, 10)), 224, 5, 25, N'4011209000', 5, 611997, CAST(11912.0000000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 224)
    INSERT @Registros VALUES (2833, 59, 12, 8, CAST(N'2023-02-03' AS Date), CAST(35713.9800000000 AS Decimal(18, 10)), 330, 5, 6, N'4011209000', 5, 882297, CAST(14850.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 330)
    INSERT @Registros VALUES (2834, 26, 7, 3, CAST(N'2023-02-03' AS Date), CAST(18363.6000000000 AS Decimal(18, 10)), 150, 5, 6, N'4011209000', 5, 988519, CAST(7597.8000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 150)
    INSERT @Registros VALUES (2835, 26, 7, 3, CAST(N'2023-02-03' AS Date), CAST(18191.0900000000 AS Decimal(18, 10)), 124, 5, 6, N'4011209000', 5, 988519, CAST(7526.4200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 124)
    INSERT @Registros VALUES (2836, 26, 7, 3, CAST(N'2023-02-03' AS Date), CAST(36978.0200000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 988519, CAST(15299.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2837, 45, 7, 3, CAST(N'2023-02-06' AS Date), CAST(46384.3600000000 AS Decimal(18, 10)), 225, 20, 20, N'4011209000', 5, 17528, CAST(12566.1000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 225)
    INSERT @Registros VALUES (2838, 45, 7, 3, CAST(N'2023-02-06' AS Date), CAST(119099.1300000000 AS Decimal(18, 10)), 555, 20, 20, N'4011209000', 5, 675489, CAST(32615.6300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 555)
    INSERT @Registros VALUES (2839, 7, 12, 8, CAST(N'2023-02-07' AS Date), CAST(35391.9100000000 AS Decimal(18, 10)), 450, 3, 4, N'4011209000', 5, 251887, CAST(6907.5000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 450)
    INSERT @Registros VALUES (2840, 47, 7, 3, CAST(N'2023-02-07' AS Date), CAST(26443.9800000000 AS Decimal(18, 10)), 225, 3, 4, N'4011209000', 5, 305360, CAST(3835.8100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 225)
    INSERT @Registros VALUES (2841, 47, 7, 3, CAST(N'2023-02-07' AS Date), CAST(3947.1700000000 AS Decimal(18, 10)), 32, 3, 4, N'4011209000', 5, 305360, CAST(597.8600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 32)
    INSERT @Registros VALUES (2842, 47, 7, 3, CAST(N'2023-02-07' AS Date), CAST(36657.5700000000 AS Decimal(18, 10)), 314, 3, 4, N'4011209000', 5, 305360, CAST(5164.0800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 314)
    INSERT @Registros VALUES (2843, 9, 9, 5, CAST(N'2023-02-08' AS Date), CAST(49664.7600000000 AS Decimal(18, 10)), 450, 5, 6, N'4011209000', 5, 2724, CAST(18151.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 450)
    INSERT @Registros VALUES (2844, 24, 12, 8, CAST(N'2023-02-08' AS Date), CAST(39270.0000000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 307811, CAST(14430.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (2845, 44, 7, 3, CAST(N'2023-02-08' AS Date), CAST(55720.5600000000 AS Decimal(18, 10)), 225, 3, 4, N'4011209000', 5, 366714, CAST(10777.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 225)
    INSERT @Registros VALUES (2846, 51, 7, 3, CAST(N'2023-02-08' AS Date), CAST(26790.8600000000 AS Decimal(18, 10)), 202, 5, 6, N'4011209000', 5, 742144, CAST(9534.3300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 202)
    INSERT @Registros VALUES (2847, 59, 12, 8, CAST(N'2023-02-09' AS Date), CAST(828.3300000000 AS Decimal(18, 10)), 50, 5, 6, N'4011209000', 5, 454032, CAST(267.9700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (2848, 51, 7, 3, CAST(N'2023-02-09' AS Date), CAST(60528.4000000000 AS Decimal(18, 10)), 448, 5, 6, N'4011209000', 5, 611526, CAST(26097.0600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 448)
    INSERT @Registros VALUES (2849, 23, 7, 3, CAST(N'2023-02-09' AS Date), CAST(17857.4500000000 AS Decimal(18, 10)), 130, 5, 6, N'4011209000', 5, 680871, CAST(7316.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 130)
    INSERT @Registros VALUES (2850, 23, 7, 3, CAST(N'2023-02-09' AS Date), CAST(17473.4300000000 AS Decimal(18, 10)), 133, 5, 6, N'4011209000', 5, 885570, CAST(6962.0200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 133)
    INSERT @Registros VALUES (2851, 47, 7, 3, CAST(N'2023-02-10' AS Date), CAST(6733.5500000000 AS Decimal(18, 10)), 59, 3, 4, N'4011209000', 5, 97052, CAST(1173.6700000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 59)
    INSERT @Registros VALUES (2852, 6, 7, 3, CAST(N'2023-02-10' AS Date), CAST(36734.4800000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 5, 247795, CAST(14486.1600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (2853, 47, 7, 3, CAST(N'2023-02-10' AS Date), CAST(23594.0400000000 AS Decimal(18, 10)), 236, 3, 4, N'4011209000', 5, 394682, CAST(3741.6500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 236)
    INSERT @Registros VALUES (2854, 37, 8, 4, CAST(N'2023-02-13' AS Date), CAST(44283.0700000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 385258, CAST(14479.2200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (2855, 27, 7, 3, CAST(N'2023-02-13' AS Date), CAST(14041.3100000000 AS Decimal(18, 10)), 112, 3, 4, N'4011209000', 5, 500508, CAST(1813.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 112)
    INSERT @Registros VALUES (2856, 45, 7, 3, CAST(N'2023-02-13' AS Date), CAST(48023.6000000000 AS Decimal(18, 10)), 241, 20, 20, N'4011209000', 5, 579656, CAST(12763.9000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 241)
    INSERT @Registros VALUES (2857, 7, 12, 8, CAST(N'2023-02-14' AS Date), CAST(50736.1300000000 AS Decimal(18, 10)), 580, 3, 4, N'4011209000', 5, 272327, CAST(10262.5200000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 580)
    INSERT @Registros VALUES (2858, 12, 1, 2, CAST(N'2023-02-15' AS Date), CAST(59065.0600000000 AS Decimal(18, 10)), 542, 5, 6, N'4011209000', 5, 43482, CAST(26349.8000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 542)
    INSERT @Registros VALUES (2859, 45, 7, 3, CAST(N'2023-02-15' AS Date), CAST(5617.0400000000 AS Decimal(18, 10)), 57, 3, 5, N'4011209000', 5, 781290, CAST(942.6100000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 57)
    INSERT @Registros VALUES (2860, 55, 12, 8, CAST(N'2023-02-16' AS Date), CAST(40922.7000000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 5, 138247, CAST(14780.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (2861, 59, 12, 8, CAST(N'2023-02-16' AS Date), CAST(153.4700000000 AS Decimal(18, 10)), 5, 5, 6, N'4011209000', 5, 166591, CAST(52.8800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 5)
    INSERT @Registros VALUES (2862, 51, 7, 3, CAST(N'2023-02-22' AS Date), CAST(12360.3100000000 AS Decimal(18, 10)), 97, 5, 6, N'4011209000', 5, 990551, CAST(4405.6500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 97)
    INSERT @Registros VALUES (2863, 7, 12, 8, CAST(N'2023-02-23' AS Date), CAST(32366.1500000000 AS Decimal(18, 10)), 370, 3, 4, N'4011209000', 5, 91563, CAST(6448.3400000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 370)
    INSERT @Registros VALUES (2864, 7, 12, 8, CAST(N'2023-02-23' AS Date), CAST(27527.0400000000 AS Decimal(18, 10)), 350, 3, 4, N'4011209000', 5, 91563, CAST(5484.2400000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 350)
    INSERT @Registros VALUES (2865, 7, 12, 8, CAST(N'2023-02-23' AS Date), CAST(4373.8000000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 91563, CAST(871.4000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 50)
    INSERT @Registros VALUES (2866, 20, 7, 3, CAST(N'2023-02-24' AS Date), CAST(8604.5600000000 AS Decimal(18, 10)), 150, 5, 6, N'4011209000', 5, 95342, CAST(3757.9900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 150)
    INSERT @Registros VALUES (2867, 56, 7, 3, CAST(N'2023-02-24' AS Date), CAST(49221.6700000000 AS Decimal(18, 10)), 570, 3, 4, N'4011209000', 5, 182866, CAST(10282.8000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 570)
    INSERT @Registros VALUES (2868, 8, 7, 3, CAST(N'2023-02-24' AS Date), CAST(29813.1100000000 AS Decimal(18, 10)), 150, 5, 6, N'4011209000', 5, 479358, CAST(10240.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 150)
    INSERT @Registros VALUES (2869, 7, 12, 8, CAST(N'2023-02-24' AS Date), CAST(8196.1500000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 813461, CAST(1326.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 100)
    INSERT @Registros VALUES (2870, 7, 12, 8, CAST(N'2023-02-24' AS Date), CAST(77207.7300000000 AS Decimal(18, 10)), 942, 3, 4, N'4011209000', 5, 813461, CAST(12490.9200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 942)
    INSERT @Registros VALUES (2871, 56, 7, 3, CAST(N'2023-02-24' AS Date), CAST(50499.8600000000 AS Decimal(18, 10)), 570, 3, 4, N'4011209000', 5, 911043, CAST(10244.6100000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 570)
    INSERT @Registros VALUES (2872, 2, 12, 8, CAST(N'2023-02-27' AS Date), CAST(31752.2600000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 229823, CAST(14300.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (2873, 13, 5, 6, CAST(N'2023-02-27' AS Date), CAST(11865.9400000000 AS Decimal(18, 10)), 52, 12, 14, N'4011201000', 4, 892087, CAST(3107.5200000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 52)
    INSERT @Registros VALUES (2874, 13, 5, 6, CAST(N'2023-02-27' AS Date), CAST(23509.3000000000 AS Decimal(18, 10)), 172, 5, 14, N'4011209000', 5, 892087, CAST(9161.4500000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 172)
    INSERT @Registros VALUES (2875, 6, 7, 3, CAST(N'2023-02-28' AS Date), CAST(36905.8200000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 49592, CAST(13800.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2876, 30, 7, 3, CAST(N'2023-02-28' AS Date), CAST(70764.2300000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 5, 145309, CAST(13781.9400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (2877, 15, 7, 3, CAST(N'2023-02-28' AS Date), CAST(21005.2600000000 AS Decimal(18, 10)), 91, 3, 4, N'4011209000', 5, 222071, CAST(4057.8700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 91)
    INSERT @Registros VALUES (2878, 22, 7, 3, CAST(N'2023-02-28' AS Date), CAST(25015.3200000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 289006, CAST(13400.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2879, 22, 7, 3, CAST(N'2023-02-28' AS Date), CAST(24822.7500000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 357415, CAST(13590.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (2880, 23, 7, 3, CAST(N'2023-02-28' AS Date), CAST(19794.7600000000 AS Decimal(18, 10)), 133, 5, 6, N'4011209000', 5, 473060, CAST(7182.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 133)
    INSERT @Registros VALUES (2881, 22, 7, 3, CAST(N'2023-02-28' AS Date), CAST(26220.4300000000 AS Decimal(18, 10)), 274, 5, 6, N'4011209000', 5, 500022, CAST(13765.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 274)
    INSERT @Registros VALUES (2882, 45, 7, 3, CAST(N'2023-02-28' AS Date), CAST(11628.0100000000 AS Decimal(18, 10)), 57, 3, 4, N'4011209000', 5, 513088, CAST(1910.8300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 57)
    INSERT @Registros VALUES (2883, 45, 7, 3, CAST(N'2023-02-28' AS Date), CAST(12946.4400000000 AS Decimal(18, 10)), 138, 3, 4, N'4011209000', 5, 513088, CAST(2127.4900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 138)
    INSERT @Registros VALUES (2884, 45, 7, 3, CAST(N'2023-02-28' AS Date), CAST(10413.7900000000 AS Decimal(18, 10)), 112, 3, 4, N'4011209000', 5, 513088, CAST(1711.3000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 112)
    INSERT @Registros VALUES (2885, 22, 7, 3, CAST(N'2023-02-28' AS Date), CAST(25039.3900000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 812211, CAST(13450.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (2886, 10, 7, 3, CAST(N'2023-03-02' AS Date), CAST(13081.1100000000 AS Decimal(18, 10)), 90, 3, 4, N'4011209000', 5, 88097, CAST(1691.7000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 90)
    INSERT @Registros VALUES (2887, 26, 7, 3, CAST(N'2023-03-02' AS Date), CAST(24628.4900000000 AS Decimal(18, 10)), 180, 5, 6, N'4011209000', 5, 455442, CAST(10544.6300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 180)
    INSERT @Registros VALUES (2888, 26, 7, 3, CAST(N'2023-03-02' AS Date), CAST(12037.6500000000 AS Decimal(18, 10)), 84, 5, 6, N'4011209000', 5, 455442, CAST(5153.8900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 84)
    INSERT @Registros VALUES (2889, 30, 7, 3, CAST(N'2023-03-02' AS Date), CAST(39729.1500000000 AS Decimal(18, 10)), 130, 3, 4, N'4011209000', 5, 492345, CAST(7785.3100000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 130)
    INSERT @Registros VALUES (2890, 24, 12, 8, CAST(N'2023-03-02' AS Date), CAST(39270.0000000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 744678, CAST(14430.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (2891, 30, 7, 3, CAST(N'2023-03-02' AS Date), CAST(2311.2700000000 AS Decimal(18, 10)), 7, 4, 9, N'4011209000', 5, 975865, CAST(374.6400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 7)
    INSERT @Registros VALUES (2892, 2, 12, 8, CAST(N'2023-03-03' AS Date), CAST(62254.3700000000 AS Decimal(18, 10)), 570, 5, 6, N'4011209000', 5, 498002, CAST(28500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 570)
    INSERT @Registros VALUES (2893, 23, 7, 3, CAST(N'2023-03-03' AS Date), CAST(17473.4300000000 AS Decimal(18, 10)), 133, 5, 6, N'4011209000', 5, 523419, CAST(6962.0200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 133)
    INSERT @Registros VALUES (2894, 51, 7, 3, CAST(N'2023-03-06' AS Date), CAST(120048.8700000000 AS Decimal(18, 10)), 1011, 5, 6, N'4011209000', 5, 604847, CAST(58680.0100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1011)
    INSERT @Registros VALUES (2895, 2, 12, 8, CAST(N'2023-03-06' AS Date), CAST(36943.8500000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 778235, CAST(15936.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (2896, 47, 7, 3, CAST(N'2023-03-06' AS Date), CAST(11902.0400000000 AS Decimal(18, 10)), 102, 3, 4, N'4011209000', 5, 859433, CAST(1761.0100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 102)
    INSERT @Registros VALUES (2897, 47, 7, 3, CAST(N'2023-03-06' AS Date), CAST(8083.8800000000 AS Decimal(18, 10)), 80, 3, 4, N'4011209000', 5, 859433, CAST(1173.3000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 80)
    INSERT @Registros VALUES (2898, 47, 7, 3, CAST(N'2023-03-06' AS Date), CAST(49851.8300000000 AS Decimal(18, 10)), 210, 3, 4, N'4011209000', 5, 859433, CAST(8194.8300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 210)
    INSERT @Registros VALUES (2899, 64, 7, 3, CAST(N'2023-03-06' AS Date), CAST(17359.5300000000 AS Decimal(18, 10)), 160, 5, 6, N'4011209000', 5, 968522, CAST(7052.9800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 160)
    INSERT @Registros VALUES (2900, 64, 7, 3, CAST(N'2023-03-06' AS Date), CAST(22932.0300000000 AS Decimal(18, 10)), 242, 5, 6, N'4011209000', 5, 968522, CAST(9317.0200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 242)
    INSERT @Registros VALUES (2901, 47, 7, 3, CAST(N'2023-03-07' AS Date), CAST(4054.7400000000 AS Decimal(18, 10)), 40, 3, 4, N'4011209000', 5, 500124, CAST(675.3600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 40)
    INSERT @Registros VALUES (2902, 46, 7, 3, CAST(N'2023-03-07' AS Date), CAST(44584.0000000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 719695, CAST(15198.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (2903, 61, 7, 3, CAST(N'2023-03-07' AS Date), CAST(30039.4000000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 5, 737449, CAST(13540.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 254)
    INSERT @Registros VALUES (2904, 45, 7, 3, CAST(N'2023-03-07' AS Date), CAST(12578.4900000000 AS Decimal(18, 10)), 124, 14, 15, N'4011209000', 5, 929302, CAST(2032.8100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 124)
    INSERT @Registros VALUES (2905, 45, 7, 3, CAST(N'2023-03-08' AS Date), CAST(2771.8500000000 AS Decimal(18, 10)), 32, 16, 17, N'4011209000', 5, 53094, CAST(416.5700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 32)
    INSERT @Registros VALUES (2906, 51, 7, 3, CAST(N'2023-03-08' AS Date), CAST(10577.3300000000 AS Decimal(18, 10)), 105, 5, 6, N'4011209000', 5, 704331, CAST(3782.0400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 105)
    INSERT @Registros VALUES (2907, 51, 7, 3, CAST(N'2023-03-08' AS Date), CAST(28796.1300000000 AS Decimal(18, 10)), 268, 5, 6, N'4011209000', 5, 926694, CAST(13980.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 268)
    INSERT @Registros VALUES (2908, 45, 7, 3, CAST(N'2023-03-09' AS Date), CAST(6654.3700000000 AS Decimal(18, 10)), 64, 3, 4, N'4011209000', 5, 388150, CAST(1058.5100000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 64)
    INSERT @Registros VALUES (2909, 45, 7, 3, CAST(N'2023-03-09' AS Date), CAST(33880.5800000000 AS Decimal(18, 10)), 146, 3, 4, N'4011209000', 5, 524367, CAST(6124.6500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 146)
    INSERT @Registros VALUES (2910, 7, 12, 8, CAST(N'2023-03-09' AS Date), CAST(31459.4800000000 AS Decimal(18, 10)), 400, 3, 4, N'4011209000', 5, 540465, CAST(6250.1700000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 400)
    INSERT @Registros VALUES (2911, 7, 12, 8, CAST(N'2023-03-09' AS Date), CAST(30616.6300000000 AS Decimal(18, 10)), 350, 3, 4, N'4011209000', 5, 540465, CAST(6082.7200000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 350)
    INSERT @Registros VALUES (2912, 44, 7, 3, CAST(N'2023-03-10' AS Date), CAST(61864.7300000000 AS Decimal(18, 10)), 249, 3, 4, N'4011209000', 5, 284204, CAST(11684.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 249)
    INSERT @Registros VALUES (2913, 51, 7, 3, CAST(N'2023-03-10' AS Date), CAST(6586.8700000000 AS Decimal(18, 10)), 50, 6, 7, N'4011209000', 5, 351453, CAST(1318.9600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (2914, 47, 7, 3, CAST(N'2023-03-10' AS Date), CAST(2508.0800000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 5, 436802, CAST(443.8400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 20)
    INSERT @Registros VALUES (2915, 27, 7, 3, CAST(N'2023-03-10' AS Date), CAST(1768.3400000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 5, 472451, CAST(246.8600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 12)
    INSERT @Registros VALUES (2916, 59, 12, 8, CAST(N'2023-03-10' AS Date), CAST(31617.5400000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 671268, CAST(13577.0600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (2917, 53, 12, 8, CAST(N'2023-03-13' AS Date), CAST(40609.3600000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 5, 267836, CAST(13909.6000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 256)
    INSERT @Registros VALUES (2918, 47, 7, 3, CAST(N'2023-03-13' AS Date), CAST(28859.2200000000 AS Decimal(18, 10)), 138, 3, 4, N'4011209000', 5, 292492, CAST(4868.6000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 138)
    INSERT @Registros VALUES (2919, 47, 7, 3, CAST(N'2023-03-13' AS Date), CAST(5085.3100000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 5, 303959, CAST(789.2600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 60)
    INSERT @Registros VALUES (2920, 49, 12, 8, CAST(N'2023-03-13' AS Date), CAST(17949.0300000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 601073, CAST(14157.1000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (2921, 30, 7, 3, CAST(N'2023-03-13' AS Date), CAST(897.2800000000 AS Decimal(18, 10)), 10, 3, 4, N'4011209000', 5, 978173, CAST(149.4300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 10)
    INSERT @Registros VALUES (2922, 23, 7, 3, CAST(N'2023-03-14' AS Date), CAST(17857.4500000000 AS Decimal(18, 10)), 130, 5, 6, N'4011209000', 5, 110925, CAST(7316.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 130)
    INSERT @Registros VALUES (2923, 30, 7, 3, CAST(N'2023-03-14' AS Date), CAST(33662.4000000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 484659, CAST(15003.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (2924, 13, 5, 6, CAST(N'2023-03-14' AS Date), CAST(15365.4400000000 AS Decimal(18, 10)), 80, 12, 25, N'4011201000', 4, 779655, CAST(4625.6000000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 80)
    INSERT @Registros VALUES (2925, 13, 5, 6, CAST(N'2023-03-14' AS Date), CAST(3196.5200000000 AS Decimal(18, 10)), 24, 5, 25, N'4011209000', 5, 779655, CAST(1260.4600000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 24)
    INSERT @Registros VALUES (2926, 13, 5, 6, CAST(N'2023-03-14' AS Date), CAST(6655.0400000000 AS Decimal(18, 10)), 60, 5, 25, N'4011209000', 5, 779655, CAST(2794.7400000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 60)
    INSERT @Registros VALUES (2927, 13, 5, 6, CAST(N'2023-03-14' AS Date), CAST(7889.0300000000 AS Decimal(18, 10)), 60, 5, 25, N'4011209000', 5, 779655, CAST(3265.3800000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 60)
    INSERT @Registros VALUES (2928, 2, 12, 8, CAST(N'2023-03-14' AS Date), CAST(36423.1400000000 AS Decimal(18, 10)), 240, 5, 6, N'4011209000', 5, 866593, CAST(15734.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 240)
    INSERT @Registros VALUES (2929, 23, 7, 3, CAST(N'2023-03-14' AS Date), CAST(19794.7600000000 AS Decimal(18, 10)), 133, 5, 6, N'4011209000', 5, 902048, CAST(7182.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 133)
    INSERT @Registros VALUES (2930, 30, 7, 3, CAST(N'2023-03-14' AS Date), CAST(36349.1000000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 942496, CAST(16500.6000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (2931, 24, 12, 8, CAST(N'2023-03-15' AS Date), CAST(40120.0000000000 AS Decimal(18, 10)), 265, 5, 6, N'4011209000', 5, 171172, CAST(14260.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 265)
    INSERT @Registros VALUES (2932, 45, 7, 3, CAST(N'2023-03-15' AS Date), CAST(8799.8000000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 5, 337509, CAST(1411.3000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 60)
    INSERT @Registros VALUES (2933, 45, 7, 3, CAST(N'2023-03-15' AS Date), CAST(8683.7900000000 AS Decimal(18, 10)), 82, 3, 4, N'4011209000', 5, 337509, CAST(1392.6900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 82)
    INSERT @Registros VALUES (2934, 45, 7, 3, CAST(N'2023-03-15' AS Date), CAST(11091.1100000000 AS Decimal(18, 10)), 126, 3, 4, N'4011209000', 5, 337509, CAST(1778.7700000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 126)
    INSERT @Registros VALUES (2935, 47, 7, 3, CAST(N'2023-03-15' AS Date), CAST(15156.9700000000 AS Decimal(18, 10)), 145, 3, 4, N'4011209000', 5, 599148, CAST(2223.3100000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 145)
    INSERT @Registros VALUES (2936, 51, 7, 3, CAST(N'2023-03-16' AS Date), CAST(7250.6600000000 AS Decimal(18, 10)), 64, 5, 6, N'4011209000', 5, 295712, CAST(2505.1800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 64)
    INSERT @Registros VALUES (2937, 12, 1, 2, CAST(N'2023-03-17' AS Date), CAST(30458.0600000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 592692, CAST(14900.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 266)
    INSERT @Registros VALUES (2938, 2, 12, 8, CAST(N'2023-03-17' AS Date), CAST(31059.4300000000 AS Decimal(18, 10)), 285, 5, 6, N'4011209000', 5, 866173, CAST(14250.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 285)
    INSERT @Registros VALUES (2939, 42, 7, 3, CAST(N'2023-03-21' AS Date), CAST(9334.4000000000 AS Decimal(18, 10)), 40, 2, 2, N'4011209000', 5, 552320, CAST(1720.9900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 40)
    INSERT @Registros VALUES (2940, 6, 7, 3, CAST(N'2023-03-21' AS Date), CAST(31986.2400000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 854649, CAST(13500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2941, 4, 7, 3, CAST(N'2023-03-22' AS Date), CAST(15790.2100000000 AS Decimal(18, 10)), 132, 5, 6, N'4011209000', 5, 127269, CAST(5856.1900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 132)
    INSERT @Registros VALUES (2942, 61, 7, 3, CAST(N'2023-03-22' AS Date), CAST(18203.3400000000 AS Decimal(18, 10)), 170, 5, 6, N'4011209000', 5, 148375, CAST(7256.8900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 170)
    INSERT @Registros VALUES (2943, 64, 7, 3, CAST(N'2023-03-22' AS Date), CAST(35497.9000000000 AS Decimal(18, 10)), 258, 5, 6, N'4011209000', 5, 177404, CAST(15080.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 258)
    INSERT @Registros VALUES (2944, 45, 7, 3, CAST(N'2023-03-22' AS Date), CAST(28012.8600000000 AS Decimal(18, 10)), 320, 3, 4, N'4011209000', 5, 201152, CAST(4544.9300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 320)
    INSERT @Registros VALUES (2945, 64, 7, 3, CAST(N'2023-03-22' AS Date), CAST(70719.7500000000 AS Decimal(18, 10)), 516, 5, 6, N'4011209000', 5, 416112, CAST(29720.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 516)
    INSERT @Registros VALUES (2946, 59, 12, 8, CAST(N'2023-03-24' AS Date), CAST(24533.5200000000 AS Decimal(18, 10)), 298, 5, 6, N'4011209000', 5, 12481, CAST(10147.7100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 298)
    INSERT @Registros VALUES (2947, 59, 12, 8, CAST(N'2023-03-27' AS Date), CAST(95467.0700000000 AS Decimal(18, 10)), 840, 5, 6, N'4011209000', 5, 15227, CAST(40871.4900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 840)
    INSERT @Registros VALUES (2948, 59, 12, 8, CAST(N'2023-03-27' AS Date), CAST(31848.7800000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 168452, CAST(13561.6500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (2949, 42, 7, 3, CAST(N'2023-03-27' AS Date), CAST(34776.0700000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 968018, CAST(14947.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (2950, 30, 7, 3, CAST(N'2023-03-28' AS Date), CAST(4876.9000000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 724570, CAST(647.6900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 50)
    INSERT @Registros VALUES (2951, 47, 7, 3, CAST(N'2023-03-28' AS Date), CAST(30732.1900000000 AS Decimal(18, 10)), 294, 3, 4, N'4011209000', 5, 996356, CAST(4842.6500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 294)
    INSERT @Registros VALUES (2952, 45, 7, 3, CAST(N'2023-03-29' AS Date), CAST(1679.2500000000 AS Decimal(18, 10)), 6, 3, 4, N'4011209000', 5, 685881, CAST(268.6300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 6)
    INSERT @Registros VALUES (2953, 45, 7, 3, CAST(N'2023-03-29' AS Date), CAST(3833.7200000000 AS Decimal(18, 10)), 39, 3, 4, N'4011209000', 5, 685881, CAST(613.2700000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 39)
    INSERT @Registros VALUES (2954, 45, 7, 3, CAST(N'2023-03-29' AS Date), CAST(11208.1000000000 AS Decimal(18, 10)), 122, 3, 4, N'4011209000', 5, 685881, CAST(1792.9200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 122)
    INSERT @Registros VALUES (2955, 7, 12, 8, CAST(N'2023-03-29' AS Date), CAST(8196.1500000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 987419, CAST(1326.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 100)
    INSERT @Registros VALUES (2956, 7, 12, 8, CAST(N'2023-03-29' AS Date), CAST(77207.7300000000 AS Decimal(18, 10)), 942, 3, 4, N'4011209000', 5, 987419, CAST(12490.9200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 942)
    INSERT @Registros VALUES (2957, 23, 7, 3, CAST(N'2023-03-30' AS Date), CAST(13475.1000000000 AS Decimal(18, 10)), 40, 3, 4, N'4011209000', 5, 21689, CAST(2606.8000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 40)
    INSERT @Registros VALUES (2958, 23, 7, 3, CAST(N'2023-03-30' AS Date), CAST(14506.2800000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 21689, CAST(2713.2500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 50)
    INSERT @Registros VALUES (2959, 23, 7, 3, CAST(N'2023-03-30' AS Date), CAST(26950.2000000000 AS Decimal(18, 10)), 80, 3, 4, N'4011209000', 5, 21689, CAST(5213.6000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 80)
    INSERT @Registros VALUES (2960, 23, 7, 3, CAST(N'2023-03-30' AS Date), CAST(31077.6000000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 357276, CAST(14151.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 266)
    INSERT @Registros VALUES (2961, 47, 7, 3, CAST(N'2023-03-30' AS Date), CAST(10723.1000000000 AS Decimal(18, 10)), 108, 3, 4, N'4011209000', 5, 711715, CAST(1587.1000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 108)
    INSERT @Registros VALUES (2962, 22, 7, 3, CAST(N'2023-03-31' AS Date), CAST(24911.5200000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 263353, CAST(13320.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (2963, 8, 7, 3, CAST(N'2023-03-31' AS Date), CAST(1913.2200000000 AS Decimal(18, 10)), 17, 5, 6, N'4011209000', 5, 446560, CAST(581.9900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 17)
    INSERT @Registros VALUES (2964, 8, 7, 3, CAST(N'2023-03-31' AS Date), CAST(20293.4600000000 AS Decimal(18, 10)), 120, 5, 6, N'4011209000', 5, 460196, CAST(7298.1400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 120)
    INSERT @Registros VALUES (2965, 30, 7, 3, CAST(N'2023-03-31' AS Date), CAST(3629.6300000000 AS Decimal(18, 10)), 10, 10, 3, N'4011209000', 5, 634398, CAST(717.2200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 10)
    INSERT @Registros VALUES (2966, 14, 4, 2, CAST(N'2023-04-03' AS Date), CAST(5158.5800000000 AS Decimal(18, 10)), 52, 5, 6, N'4011209000', 5, 805204, CAST(2181.1700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 52)
    INSERT @Registros VALUES (2967, 51, 7, 3, CAST(N'2023-04-03' AS Date), CAST(16369.8100000000 AS Decimal(18, 10)), 133, 5, 6, N'4011209000', 5, 893914, CAST(5738.1500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 133)
    INSERT @Registros VALUES (2968, 56, 7, 3, CAST(N'2023-04-04' AS Date), CAST(50499.8600000000 AS Decimal(18, 10)), 570, 3, 4, N'4011209000', 5, 252656, CAST(10244.6100000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 570)
    INSERT @Registros VALUES (2969, 56, 7, 3, CAST(N'2023-04-04' AS Date), CAST(49221.2800000000 AS Decimal(18, 10)), 570, 3, 4, N'4011209000', 5, 336227, CAST(10282.8000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 570)
    INSERT @Registros VALUES (2970, 51, 7, 3, CAST(N'2023-04-04' AS Date), CAST(61371.8800000000 AS Decimal(18, 10)), 480, 5, 6, N'4011209000', 5, 342441, CAST(30495.5500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 480)
    INSERT @Registros VALUES (2971, 44, 7, 3, CAST(N'2023-04-04' AS Date), CAST(56785.0500000000 AS Decimal(18, 10)), 253, 3, 4, N'4011209000', 5, 629048, CAST(12563.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 253)
    INSERT @Registros VALUES (2972, 7, 12, 8, CAST(N'2023-04-04' AS Date), CAST(31459.4800000000 AS Decimal(18, 10)), 400, 3, 4, N'4011209000', 5, 893344, CAST(6250.1700000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 400)
    INSERT @Registros VALUES (2973, 7, 12, 8, CAST(N'2023-04-04' AS Date), CAST(30616.6300000000 AS Decimal(18, 10)), 350, 3, 4, N'4011209000', 5, 893344, CAST(6082.7200000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 350)
    INSERT @Registros VALUES (2974, 7, 12, 8, CAST(N'2023-04-10' AS Date), CAST(26242.8300000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 5, 257284, CAST(5238.3700000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 300)
    INSERT @Registros VALUES (2975, 7, 12, 8, CAST(N'2023-04-10' AS Date), CAST(15729.7400000000 AS Decimal(18, 10)), 200, 3, 4, N'4011209000', 5, 257284, CAST(3139.8400000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 200)
    INSERT @Registros VALUES (2976, 13, 5, 6, CAST(N'2023-04-10' AS Date), CAST(17023.8600000000 AS Decimal(18, 10)), 136, 5, 25, N'4011209000', 5, 369027, CAST(7312.8600000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 136)
    INSERT @Registros VALUES (2977, 23, 7, 3, CAST(N'2023-04-10' AS Date), CAST(32392.8100000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 628946, CAST(14009.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (2978, 61, 7, 3, CAST(N'2023-04-11' AS Date), CAST(23581.6600000000 AS Decimal(18, 10)), 201, 5, 6, N'4011209000', 5, 136392, CAST(8170.9100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 201)
    INSERT @Registros VALUES (2979, 45, 7, 3, CAST(N'2023-04-11' AS Date), CAST(43937.4200000000 AS Decimal(18, 10)), 408, 14, 15, N'4011209000', 5, 137057, CAST(7185.3700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 408)
    INSERT @Registros VALUES (2980, 47, 7, 3, CAST(N'2023-04-11' AS Date), CAST(13489.0700000000 AS Decimal(18, 10)), 120, 3, 4, N'4011209000', 5, 177635, CAST(1886.9000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 120)
    INSERT @Registros VALUES (2981, 45, 7, 3, CAST(N'2023-04-11' AS Date), CAST(2451.1700000000 AS Decimal(18, 10)), 8, 3, 4, N'4011209000', 5, 901534, CAST(373.6300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 8)
    INSERT @Registros VALUES (2982, 61, 7, 3, CAST(N'2023-04-11' AS Date), CAST(33580.8800000000 AS Decimal(18, 10)), 265, 5, 6, N'4011209000', 5, 952267, CAST(12186.5500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 265)
    INSERT @Registros VALUES (2983, 61, 7, 3, CAST(N'2023-04-12' AS Date), CAST(6489.9800000000 AS Decimal(18, 10)), 85, 5, 6, N'4011209000', 5, 242870, CAST(2071.9800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 85)
    INSERT @Registros VALUES (2984, 44, 7, 3, CAST(N'2023-04-12' AS Date), CAST(61561.9000000000 AS Decimal(18, 10)), 258, 3, 4, N'4011209000', 5, 479147, CAST(12589.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 258)
    INSERT @Registros VALUES (2985, 9, 9, 5, CAST(N'2023-04-12' AS Date), CAST(35894.0700000000 AS Decimal(18, 10)), 197, 5, 6, N'4011209000', 5, 746338, CAST(12630.7300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 197)
    INSERT @Registros VALUES (2986, 42, 7, 3, CAST(N'2023-04-13' AS Date), CAST(65391.1000000000 AS Decimal(18, 10)), 240, 3, 4, N'4011209000', 5, 320350, CAST(13545.6500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 240)
    INSERT @Registros VALUES (2987, 24, 12, 8, CAST(N'2023-04-13' AS Date), CAST(38451.0000000000 AS Decimal(18, 10)), 268, 5, 6, N'4011209000', 5, 950786, CAST(14450.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 268)
    INSERT @Registros VALUES (2988, 26, 7, 3, CAST(N'2023-04-13' AS Date), CAST(37124.9000000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 967628, CAST(15455.5200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (2989, 45, 7, 3, CAST(N'2023-04-18' AS Date), CAST(8366.0300000000 AS Decimal(18, 10)), 94, 16, 17, N'4011209000', 5, 45682, CAST(1293.7900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 94)
    INSERT @Registros VALUES (2990, 51, 7, 3, CAST(N'2023-04-18' AS Date), CAST(5846.8300000000 AS Decimal(18, 10)), 46, 6, 7, N'4011209000', 5, 110308, CAST(1198.3900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 46)
    INSERT @Registros VALUES (2991, 47, 7, 3, CAST(N'2023-04-18' AS Date), CAST(40486.5900000000 AS Decimal(18, 10)), 380, 3, 4, N'4011209000', 5, 272048, CAST(6239.8900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 380)
    INSERT @Registros VALUES (2992, 47, 7, 3, CAST(N'2023-04-18' AS Date), CAST(63705.0100000000 AS Decimal(18, 10)), 580, 3, 4, N'4011209000', 5, 276698, CAST(9743.8400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 580)
    INSERT @Registros VALUES (2993, 47, 7, 3, CAST(N'2023-04-18' AS Date), CAST(16732.0400000000 AS Decimal(18, 10)), 180, 3, 4, N'4011209000', 5, 422747, CAST(2460.1900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 180)
    INSERT @Registros VALUES (2994, 30, 7, 3, CAST(N'2023-04-18' AS Date), CAST(71469.0600000000 AS Decimal(18, 10)), 524, 5, 6, N'4011209000', 5, 475635, CAST(31412.6000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 524)
    INSERT @Registros VALUES (2995, 51, 7, 3, CAST(N'2023-04-18' AS Date), CAST(25270.0000000000 AS Decimal(18, 10)), 206, 5, 6, N'4011209000', 5, 518035, CAST(9257.7900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 206)
    INSERT @Registros VALUES (2996, 1, 11, 7, CAST(N'2023-04-19' AS Date), CAST(28654.4900000000 AS Decimal(18, 10)), 395, 5, 6, N'4011209000', 5, 55523, CAST(11837.5300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 395)
    INSERT @Registros VALUES (2997, 1, 11, 7, CAST(N'2023-04-19' AS Date), CAST(6108.7800000000 AS Decimal(18, 10)), 60, 5, 6, N'4011209000', 5, 55523, CAST(2523.6200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 60)
    INSERT @Registros VALUES (2998, 44, 7, 3, CAST(N'2023-04-19' AS Date), CAST(63636.1900000000 AS Decimal(18, 10)), 490, 5, 6, N'4011209000', 5, 326524, CAST(28434.3500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 490)
    INSERT @Registros VALUES (2999, 8, 7, 3, CAST(N'2023-04-19' AS Date), CAST(9580.1400000000 AS Decimal(18, 10)), 64, 5, 6, N'4011209000', 5, 476167, CAST(2795.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 64)
    INSERT @Registros VALUES (3000, 6, 7, 3, CAST(N'2023-04-19' AS Date), CAST(28681.1900000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 480110, CAST(13500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3001, 12, 1, 2, CAST(N'2023-04-20' AS Date), CAST(30211.4100000000 AS Decimal(18, 10)), 275, 5, 6, N'4011209000', 5, 52840, CAST(14560.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 275)
    INSERT @Registros VALUES (3002, 26, 7, 3, CAST(N'2023-04-20' AS Date), CAST(36814.5200000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 454612, CAST(15398.7200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3003, 51, 7, 3, CAST(N'2023-04-20' AS Date), CAST(59839.8800000000 AS Decimal(18, 10)), 477, 5, 6, N'4011209000', 5, 501069, CAST(29203.8800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 477)
    INSERT @Registros VALUES (3004, 2, 12, 8, CAST(N'2023-04-20' AS Date), CAST(33472.4500000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 819115, CAST(15100.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (3005, 22, 7, 3, CAST(N'2023-04-20' AS Date), CAST(28229.5800000000 AS Decimal(18, 10)), 258, 5, 6, N'4011209000', 5, 862896, CAST(14208.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 258)
    INSERT @Registros VALUES (3006, 22, 7, 3, CAST(N'2023-04-20' AS Date), CAST(15100.5600000000 AS Decimal(18, 10)), 114, 5, 6, N'4011209000', 5, 931643, CAST(5730.4500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 114)
    INSERT @Registros VALUES (3007, 22, 7, 3, CAST(N'2023-04-20' AS Date), CAST(25065.6500000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 937748, CAST(13500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (3008, 61, 7, 3, CAST(N'2023-04-21' AS Date), CAST(36181.7300000000 AS Decimal(18, 10)), 342, 5, 6, N'4011209000', 5, 656688, CAST(16030.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 342)
    INSERT @Registros VALUES (3009, 7, 12, 8, CAST(N'2023-04-21' AS Date), CAST(26242.8300000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 5, 685907, CAST(5212.8000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 300)
    INSERT @Registros VALUES (3010, 7, 12, 8, CAST(N'2023-04-21' AS Date), CAST(27527.0400000000 AS Decimal(18, 10)), 350, 3, 4, N'4011209000', 5, 685907, CAST(5467.9000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 350)
    INSERT @Registros VALUES (3011, 30, 7, 3, CAST(N'2023-04-24' AS Date), CAST(1277.2300000000 AS Decimal(18, 10)), 2, 13, 3, N'4011209000', 5, 100758, CAST(144.7800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 2)
    INSERT @Registros VALUES (3012, 63, 12, 8, CAST(N'2023-04-24' AS Date), CAST(22436.8300000000 AS Decimal(18, 10)), 224, 5, 6, N'4011209000', 5, 778469, CAST(10030.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 224)
    INSERT @Registros VALUES (3013, 61, 7, 3, CAST(N'2023-04-24' AS Date), CAST(37088.8700000000 AS Decimal(18, 10)), 292, 5, 6, N'4011209000', 5, 853677, CAST(13722.5500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 292)
    INSERT @Registros VALUES (3014, 45, 7, 3, CAST(N'2023-04-24' AS Date), CAST(61706.6200000000 AS Decimal(18, 10)), 350, 3, 4, N'4011209000', 5, 895708, CAST(17650.7000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 350)
    INSERT @Registros VALUES (3015, 59, 12, 8, CAST(N'2023-04-25' AS Date), CAST(42978.4100000000 AS Decimal(18, 10)), 373, 5, 6, N'4011209000', 5, 59011, CAST(17955.2600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 373)
    INSERT @Registros VALUES (3016, 45, 7, 3, CAST(N'2023-04-25' AS Date), CAST(9482.9600000000 AS Decimal(18, 10)), 91, 14, 15, N'4011209000', 5, 64309, CAST(1454.2600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 91)
    INSERT @Registros VALUES (3017, 37, 8, 4, CAST(N'2023-04-26' AS Date), CAST(43884.5000000000 AS Decimal(18, 10)), 258, 5, 6, N'4011209000', 5, 10723, CAST(14715.5400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 258)
    INSERT @Registros VALUES (3018, 30, 7, 3, CAST(N'2023-04-27' AS Date), CAST(3341.3500000000 AS Decimal(18, 10)), 40, 3, 4, N'4011209000', 5, 76784, CAST(435.2000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 40)
    INSERT @Registros VALUES (3019, 18, 7, 3, CAST(N'2023-04-27' AS Date), CAST(20369.4500000000 AS Decimal(18, 10)), 150, 5, 6, N'4011209000', 5, 129508, CAST(7591.7400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 150)
    INSERT @Registros VALUES (3020, 42, 7, 3, CAST(N'2023-04-27' AS Date), CAST(4761.2000000000 AS Decimal(18, 10)), 40, 2, 2, N'4011209000', 5, 155094, CAST(904.2800000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 40)
    INSERT @Registros VALUES (3021, 15, 7, 3, CAST(N'2023-04-27' AS Date), CAST(3245.6900000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 5, 185145, CAST(608.4700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 12)
    INSERT @Registros VALUES (3022, 30, 7, 3, CAST(N'2023-04-27' AS Date), CAST(88229.2200000000 AS Decimal(18, 10)), 273, 3, 4, N'4011209000', 5, 644948, CAST(16822.8700000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 273)
    INSERT @Registros VALUES (3023, 45, 7, 3, CAST(N'2023-04-27' AS Date), CAST(101519.4100000000 AS Decimal(18, 10)), 340, 3, 4, N'4011209000', 5, 909790, CAST(20556.8600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 340)
    INSERT @Registros VALUES (3024, 45, 7, 3, CAST(N'2023-04-28' AS Date), CAST(14288.6900000000 AS Decimal(18, 10)), 138, 3, 4, N'4011209000', 5, 563721, CAST(2269.1200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 138)
    INSERT @Registros VALUES (3025, 61, 7, 3, CAST(N'2023-04-28' AS Date), CAST(28492.6000000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 577110, CAST(13300.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (3026, 56, 7, 3, CAST(N'2023-04-28' AS Date), CAST(46199.2900000000 AS Decimal(18, 10)), 535, 3, 4, N'4011209000', 5, 582252, CAST(9651.4000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 535)
    INSERT @Registros VALUES (3027, 61, 7, 3, CAST(N'2023-04-28' AS Date), CAST(30233.1400000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 961266, CAST(13640.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3028, 47, 7, 3, CAST(N'2023-05-03' AS Date), CAST(32136.5500000000 AS Decimal(18, 10)), 270, 3, 4, N'4011209000', 5, 51620, CAST(4210.9200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 270)
    INSERT @Registros VALUES (3029, 10, 7, 3, CAST(N'2023-05-03' AS Date), CAST(10097.0800000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 5, 198763, CAST(1363.9700000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 60)
    INSERT @Registros VALUES (3030, 44, 7, 3, CAST(N'2023-05-03' AS Date), CAST(84185.2900000000 AS Decimal(18, 10)), 305, 3, 4, N'4011209000', 5, 990110, CAST(17966.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 305)
    INSERT @Registros VALUES (3031, 23, 7, 3, CAST(N'2023-05-04' AS Date), CAST(32674.9700000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 99957, CAST(14284.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (3032, 56, 7, 3, CAST(N'2023-05-04' AS Date), CAST(36501.6500000000 AS Decimal(18, 10)), 412, 3, 4, N'4011209000', 5, 856232, CAST(7421.3000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 412)
    INSERT @Registros VALUES (3033, 56, 7, 3, CAST(N'2023-05-04' AS Date), CAST(2936.0300000000 AS Decimal(18, 10)), 34, 3, 4, N'4011209000', 5, 856232, CAST(596.9400000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 34)
    INSERT @Registros VALUES (3034, 13, 5, 6, CAST(N'2023-05-05' AS Date), CAST(16716.7400000000 AS Decimal(18, 10)), 70, 12, 25, N'4011201000', 4, 181462, CAST(4896.3100000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 70)
    INSERT @Registros VALUES (3035, 13, 5, 6, CAST(N'2023-05-05' AS Date), CAST(13018.4800000000 AS Decimal(18, 10)), 104, 5, 25, N'4011209000', 5, 181462, CAST(5660.0000000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 104)
    INSERT @Registros VALUES (3036, 7, 12, 8, CAST(N'2023-05-05' AS Date), CAST(8196.1500000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 676473, CAST(1326.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 100)
    INSERT @Registros VALUES (3037, 7, 12, 8, CAST(N'2023-05-05' AS Date), CAST(71634.3500000000 AS Decimal(18, 10)), 874, 3, 4, N'4011209000', 5, 676473, CAST(11589.2400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 874)
    INSERT @Registros VALUES (3038, 7, 12, 8, CAST(N'2023-05-08' AS Date), CAST(39364.2400000000 AS Decimal(18, 10)), 450, 3, 4, N'4011209000', 5, 139847, CAST(7857.5500000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 450)
    INSERT @Registros VALUES (3039, 7, 12, 8, CAST(N'2023-05-08' AS Date), CAST(23594.6100000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 5, 139847, CAST(4709.7500000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 300)
    INSERT @Registros VALUES (3040, 22, 7, 3, CAST(N'2023-05-08' AS Date), CAST(24916.5400000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 493321, CAST(13500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3041, 22, 7, 3, CAST(N'2023-05-08' AS Date), CAST(24948.6400000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 653663, CAST(13360.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (3042, 30, 7, 3, CAST(N'2023-05-09' AS Date), CAST(1662.7900000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 5, 349091, CAST(217.6000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 20)
    INSERT @Registros VALUES (3043, 45, 7, 3, CAST(N'2023-05-09' AS Date), CAST(11379.3800000000 AS Decimal(18, 10)), 132, 16, 17, N'4011209000', 5, 966124, CAST(1627.3000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 132)
    INSERT @Registros VALUES (3044, 44, 7, 3, CAST(N'2023-05-10' AS Date), CAST(39010.1700000000 AS Decimal(18, 10)), 153, 3, 4, N'4011209000', 5, 84976, CAST(8206.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 153)
    INSERT @Registros VALUES (3045, 45, 7, 3, CAST(N'2023-05-10' AS Date), CAST(11609.2900000000 AS Decimal(18, 10)), 91, 3, 4, N'4011209000', 5, 348519, CAST(2016.2400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 91)
    INSERT @Registros VALUES (3046, 42, 7, 3, CAST(N'2023-05-10' AS Date), CAST(64238.8900000000 AS Decimal(18, 10)), 255, 3, 4, N'4011209000', 5, 459994, CAST(13172.6600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (3047, 27, 7, 3, CAST(N'2023-05-10' AS Date), CAST(2270.8400000000 AS Decimal(18, 10)), 17, 3, 4, N'4011209000', 5, 685785, CAST(309.9400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 17)
    INSERT @Registros VALUES (3048, 47, 7, 3, CAST(N'2023-05-10' AS Date), CAST(42708.8900000000 AS Decimal(18, 10)), 196, 3, 4, N'4011209000', 5, 725721, CAST(6920.2300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 196)
    INSERT @Registros VALUES (3049, 30, 7, 3, CAST(N'2023-05-10' AS Date), CAST(33299.5000000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 888872, CAST(14423.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 266)
    INSERT @Registros VALUES (3050, 19, 12, 8, CAST(N'2023-05-11' AS Date), CAST(32450.3000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 869, CAST(13940.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (3051, 1, 11, 7, CAST(N'2023-05-12' AS Date), CAST(35869.7500000000 AS Decimal(18, 10)), 276, 5, 6, N'4011209000', 5, 111916, CAST(14386.1200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 276)
    INSERT @Registros VALUES (3052, 1, 11, 7, CAST(N'2023-05-12' AS Date), CAST(6575.7500000000 AS Decimal(18, 10)), 60, 5, 6, N'4011209000', 5, 111916, CAST(2330.7400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 60)
    INSERT @Registros VALUES (3053, 1, 11, 7, CAST(N'2023-05-12' AS Date), CAST(2634.6200000000 AS Decimal(18, 10)), 40, 5, 6, N'4011209000', 5, 111916, CAST(933.8300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (3054, 49, 12, 8, CAST(N'2023-05-12' AS Date), CAST(18095.4500000000 AS Decimal(18, 10)), 244, 5, 6, N'4011209000', 5, 423400, CAST(14282.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 244)
    INSERT @Registros VALUES (3055, 7, 12, 8, CAST(N'2023-05-12' AS Date), CAST(23594.6100000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 5, 793291, CAST(4709.7500000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 300)
    INSERT @Registros VALUES (3056, 7, 12, 8, CAST(N'2023-05-12' AS Date), CAST(39364.2400000000 AS Decimal(18, 10)), 450, 3, 4, N'4011209000', 5, 793291, CAST(7857.5500000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 450)
    INSERT @Registros VALUES (3057, 24, 12, 8, CAST(N'2023-05-15' AS Date), CAST(38684.0100000000 AS Decimal(18, 10)), 268, 5, 6, N'4011209000', 5, 27540, CAST(14460.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 268)
    INSERT @Registros VALUES (3058, 59, 12, 8, CAST(N'2023-05-15' AS Date), CAST(22336.1700000000 AS Decimal(18, 10)), 664, 5, 6, N'4011209000', 5, 228210, CAST(9401.7300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 664)
    INSERT @Registros VALUES (3059, 13, 5, 6, CAST(N'2023-05-15' AS Date), CAST(15626.2600000000 AS Decimal(18, 10)), 122, 5, 25, N'4011209000', 5, 510315, CAST(6225.4900000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 122)
    INSERT @Registros VALUES (3060, 13, 5, 6, CAST(N'2023-05-15' AS Date), CAST(12984.4800000000 AS Decimal(18, 10)), 102, 5, 25, N'4011209000', 5, 510315, CAST(5551.1500000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 102)
    INSERT @Registros VALUES (3061, 42, 7, 3, CAST(N'2023-05-15' AS Date), CAST(38844.6300000000 AS Decimal(18, 10)), 312, 5, 6, N'4011209000', 5, 713241, CAST(15122.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 312)
    INSERT @Registros VALUES (3062, 2, 12, 8, CAST(N'2023-05-15' AS Date), CAST(39328.5300000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 868699, CAST(17020.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (3063, 8, 7, 3, CAST(N'2023-05-16' AS Date), CAST(31533.1700000000 AS Decimal(18, 10)), 186, 5, 6, N'4011209000', 5, 220394, CAST(11312.1200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 186)
    INSERT @Registros VALUES (3064, 40, 10, 2, CAST(N'2023-05-16' AS Date), CAST(69380.1200000000 AS Decimal(18, 10)), 424, 5, 6, N'4011209000', 5, 238724, CAST(26180.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 424)
    INSERT @Registros VALUES (3065, 2, 12, 8, CAST(N'2023-05-16' AS Date), CAST(29693.3400000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 579691, CAST(13740.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (3066, 63, 12, 8, CAST(N'2023-05-16' AS Date), CAST(25475.0100000000 AS Decimal(18, 10)), 225, 5, 6, N'4011209000', 5, 652549, CAST(12600.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 225)
    INSERT @Registros VALUES (3067, 51, 7, 3, CAST(N'2023-05-16' AS Date), CAST(26840.4700000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 818504, CAST(12733.8800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3068, 61, 7, 3, CAST(N'2023-05-16' AS Date), CAST(28550.6400000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 919483, CAST(13500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3069, 47, 7, 3, CAST(N'2023-05-18' AS Date), CAST(55130.1400000000 AS Decimal(18, 10)), 172, 3, 4, N'4011209000', 5, 33636, CAST(9156.6900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 172)
    INSERT @Registros VALUES (3070, 61, 7, 3, CAST(N'2023-05-18' AS Date), CAST(7557.2100000000 AS Decimal(18, 10)), 56, 5, 6, N'4011209000', 5, 524936, CAST(2895.4800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 56)
    INSERT @Registros VALUES (3071, 7, 12, 8, CAST(N'2023-05-18' AS Date), CAST(38974.5000000000 AS Decimal(18, 10)), 450, 3, 4, N'4011209000', 5, 707770, CAST(7857.5500000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 450)
    INSERT @Registros VALUES (3072, 7, 12, 8, CAST(N'2023-05-18' AS Date), CAST(23361.0000000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 5, 707770, CAST(4709.7500000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 300)
    INSERT @Registros VALUES (3073, 25, 7, 3, CAST(N'2023-05-18' AS Date), CAST(25358.3800000000 AS Decimal(18, 10)), 240, 5, 6, N'4011209000', 5, 736035, CAST(9600.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 240)
    INSERT @Registros VALUES (3074, 24, 12, 8, CAST(N'2023-05-19' AS Date), CAST(39941.0000000000 AS Decimal(18, 10)), 268, 5, 6, N'4011209000', 5, 168681, CAST(15150.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 268)
    INSERT @Registros VALUES (3075, 42, 7, 3, CAST(N'2023-05-23' AS Date), CAST(42499.4300000000 AS Decimal(18, 10)), 416, 5, 6, N'4011209000', 5, 114078, CAST(16169.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 416)
    INSERT @Registros VALUES (3076, 30, 7, 3, CAST(N'2023-05-23' AS Date), CAST(85228.1800000000 AS Decimal(18, 10)), 279, 3, 4, N'4011209000', 5, 630352, CAST(16435.9100000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 279)
    INSERT @Registros VALUES (3077, 30, 7, 3, CAST(N'2023-05-23' AS Date), CAST(7711.9400000000 AS Decimal(18, 10)), 20, 18, 3, N'4011209000', 5, 834254, CAST(731.7900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (3078, 30, 7, 3, CAST(N'2023-05-24' AS Date), CAST(3887.4100000000 AS Decimal(18, 10)), 44, 3, 4, N'4011209000', 5, 632979, CAST(566.1100000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 44)
    INSERT @Registros VALUES (3079, 23, 7, 3, CAST(N'2023-05-25' AS Date), CAST(15538.9400000000 AS Decimal(18, 10)), 130, 5, 6, N'4011209000', 5, 191131, CAST(6916.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 130)
    INSERT @Registros VALUES (3080, 2, 12, 8, CAST(N'2023-05-25' AS Date), CAST(33387.5500000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 214914, CAST(15160.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (3081, 7, 12, 8, CAST(N'2023-05-25' AS Date), CAST(82781.1100000000 AS Decimal(18, 10)), 1010, 3, 4, N'4011209000', 5, 371127, CAST(13392.6000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 1010)
    INSERT @Registros VALUES (3082, 7, 12, 8, CAST(N'2023-05-25' AS Date), CAST(8196.1500000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 371127, CAST(1326.0000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 100)
    INSERT @Registros VALUES (3083, 56, 7, 3, CAST(N'2023-05-25' AS Date), CAST(48789.9000000000 AS Decimal(18, 10)), 565, 3, 4, N'4011209000', 5, 802908, CAST(10192.6000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 565)
    INSERT @Registros VALUES (3084, 23, 7, 3, CAST(N'2023-05-25' AS Date), CAST(21172.9800000000 AS Decimal(18, 10)), 130, 5, 6, N'4011209000', 5, 938409, CAST(8060.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 130)
    INSERT @Registros VALUES (3085, 6, 7, 3, CAST(N'2023-05-26' AS Date), CAST(19834.8400000000 AS Decimal(18, 10)), 100, 5, 6, N'4011209000', 5, 34396, CAST(6132.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 100)
    INSERT @Registros VALUES (3086, 45, 7, 3, CAST(N'2023-05-26' AS Date), CAST(38313.5100000000 AS Decimal(18, 10)), 352, 3, 4, N'4011209000', 5, 347692, CAST(6602.7000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 352)
    INSERT @Registros VALUES (3087, 8, 7, 3, CAST(N'2023-05-26' AS Date), CAST(39012.6200000000 AS Decimal(18, 10)), 228, 5, 6, N'4011209000', 5, 407476, CAST(13866.4700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 228)
    INSERT @Registros VALUES (3088, 13, 5, 6, CAST(N'2023-05-26' AS Date), CAST(1941.3500000000 AS Decimal(18, 10)), 10, 12, 25, N'4011201000', 4, 515514, CAST(565.1700000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 10)
    INSERT @Registros VALUES (3089, 13, 5, 6, CAST(N'2023-05-26' AS Date), CAST(12185.4500000000 AS Decimal(18, 10)), 60, 12, 25, N'4011201000', 4, 515514, CAST(3508.5600000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 60)
    INSERT @Registros VALUES (3090, 13, 5, 6, CAST(N'2023-05-26' AS Date), CAST(36817.6800000000 AS Decimal(18, 10)), 294, 5, 25, N'4011209000', 5, 515514, CAST(15918.9100000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 294)
    INSERT @Registros VALUES (3091, 8, 7, 3, CAST(N'2023-05-26' AS Date), CAST(5368.8400000000 AS Decimal(18, 10)), 28, 5, 6, N'4011209000', 5, 573119, CAST(1581.1400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 28)
    INSERT @Registros VALUES (3092, 26, 7, 3, CAST(N'2023-05-29' AS Date), CAST(36921.2700000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 205928, CAST(15358.9600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3093, 56, 7, 3, CAST(N'2023-05-29' AS Date), CAST(34198.1500000000 AS Decimal(18, 10)), 386, 3, 4, N'4011209000', 5, 237309, CAST(6937.5800000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 386)
    INSERT @Registros VALUES (3094, 22, 7, 3, CAST(N'2023-05-29' AS Date), CAST(4519.7000000000 AS Decimal(18, 10)), 64, 5, 6, N'4011209000', 5, 343318, CAST(2012.6400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 64)
    INSERT @Registros VALUES (3095, 42, 7, 3, CAST(N'2023-05-29' AS Date), CAST(2785.4600000000 AS Decimal(18, 10)), 12, 9, 10, N'4011209000', 5, 561148, CAST(447.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 12)
    INSERT @Registros VALUES (3096, 42, 7, 3, CAST(N'2023-05-29' AS Date), CAST(31395.2900000000 AS Decimal(18, 10)), 203, 19, 10, N'4011209000', 5, 561148, CAST(5042.4400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 203)
    INSERT @Registros VALUES (3097, 45, 7, 3, CAST(N'2023-05-29' AS Date), CAST(3311.4700000000 AS Decimal(18, 10)), 26, 14, 15, N'4011209000', 5, 879237, CAST(492.6100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 26)
    INSERT @Registros VALUES (3098, 61, 7, 3, CAST(N'2023-05-30' AS Date), CAST(28550.6400000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 277926, CAST(13500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3099, 56, 7, 3, CAST(N'2023-05-31' AS Date), CAST(4317.6900000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 149590, CAST(902.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 50)
    INSERT @Registros VALUES (3100, 56, 7, 3, CAST(N'2023-05-31' AS Date), CAST(44558.5700000000 AS Decimal(18, 10)), 516, 3, 4, N'4011209000', 5, 149590, CAST(9308.6400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 516)
    INSERT @Registros VALUES (3101, 22, 7, 3, CAST(N'2023-05-31' AS Date), CAST(28892.5600000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 182047, CAST(14508.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (3102, 44, 7, 3, CAST(N'2023-05-31' AS Date), CAST(63956.4800000000 AS Decimal(18, 10)), 490, 5, 6, N'4011209000', 5, 370343, CAST(28434.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 490)
    INSERT @Registros VALUES (3103, 56, 7, 3, CAST(N'2023-05-31' AS Date), CAST(38859.2000000000 AS Decimal(18, 10)), 450, 3, 4, N'4011209000', 5, 391000, CAST(8118.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 450)
    INSERT @Registros VALUES (3104, 56, 7, 3, CAST(N'2023-05-31' AS Date), CAST(10362.4600000000 AS Decimal(18, 10)), 120, 3, 4, N'4011209000', 5, 391000, CAST(2164.8000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 120)
    INSERT @Registros VALUES (3105, 22, 7, 3, CAST(N'2023-05-31' AS Date), CAST(28401.0900000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 488255, CAST(14238.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (3106, 54, 12, 8, CAST(N'2023-05-31' AS Date), CAST(9360.7900000000 AS Decimal(18, 10)), 74, 5, 6, N'4011209000', 5, 617442, CAST(3768.4200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 74)
    INSERT @Registros VALUES (3107, 22, 7, 3, CAST(N'2023-05-31' AS Date), CAST(28816.3400000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 5, 675531, CAST(14435.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 254)
    INSERT @Registros VALUES (3108, 56, 7, 3, CAST(N'2023-05-31' AS Date), CAST(49183.2100000000 AS Decimal(18, 10)), 570, 3, 4, N'4011209000', 5, 930247, CAST(10282.8000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 570)
    INSERT @Registros VALUES (3109, 22, 7, 3, CAST(N'2023-05-31' AS Date), CAST(28982.8300000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 997393, CAST(14512.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (3110, 30, 7, 3, CAST(N'2023-06-01' AS Date), CAST(25322.4000000000 AS Decimal(18, 10)), 70, 10, 11, N'4011209000', 5, 7784, CAST(5020.5300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 70)
    INSERT @Registros VALUES (3111, 20, 7, 3, CAST(N'2023-06-01' AS Date), CAST(27370.3600000000 AS Decimal(18, 10)), 258, 5, 6, N'4011209000', 5, 97021, CAST(13640.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 258)
    INSERT @Registros VALUES (3112, 7, 12, 8, CAST(N'2023-06-01' AS Date), CAST(26242.8300000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 5, 164823, CAST(5261.3700000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 300)
    INSERT @Registros VALUES (3113, 7, 12, 8, CAST(N'2023-06-01' AS Date), CAST(8808.6500000000 AS Decimal(18, 10)), 112, 3, 4, N'4011209000', 5, 164823, CAST(1766.0300000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 112)
    INSERT @Registros VALUES (3114, 12, 1, 2, CAST(N'2023-06-01' AS Date), CAST(30959.5600000000 AS Decimal(18, 10)), 290, 5, 6, N'4011209000', 5, 201448, CAST(14920.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 290)
    INSERT @Registros VALUES (3115, 51, 7, 3, CAST(N'2023-06-01' AS Date), CAST(56814.1700000000 AS Decimal(18, 10)), 479, 5, 6, N'4011209000', 5, 485312, CAST(27993.6400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 479)
    INSERT @Registros VALUES (3116, 56, 7, 3, CAST(N'2023-06-01' AS Date), CAST(7530.6800000000 AS Decimal(18, 10)), 85, 3, 4, N'4011209000', 5, 486685, CAST(1563.4700000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 85)
    INSERT @Registros VALUES (3117, 56, 7, 3, CAST(N'2023-06-01' AS Date), CAST(27633.2200000000 AS Decimal(18, 10)), 320, 3, 4, N'4011209000', 5, 486685, CAST(5737.0400000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 320)
    INSERT @Registros VALUES (3118, 56, 7, 3, CAST(N'2023-06-01' AS Date), CAST(12953.0700000000 AS Decimal(18, 10)), 150, 3, 4, N'4011209000', 5, 607083, CAST(2706.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 150)
    INSERT @Registros VALUES (3119, 56, 7, 3, CAST(N'2023-06-01' AS Date), CAST(36268.6000000000 AS Decimal(18, 10)), 420, 3, 4, N'4011209000', 5, 607083, CAST(7576.8000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 420)
    INSERT @Registros VALUES (3120, 51, 7, 3, CAST(N'2023-06-01' AS Date), CAST(26528.6800000000 AS Decimal(18, 10)), 339, 5, 6, N'4011209000', 5, 633633, CAST(11049.0500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 339)
    INSERT @Registros VALUES (3121, 42, 7, 3, CAST(N'2023-06-01' AS Date), CAST(4872.6800000000 AS Decimal(18, 10)), 32, 2, 2, N'4011209000', 5, 635503, CAST(923.7400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 32)
    INSERT @Registros VALUES (3122, 2, 12, 8, CAST(N'2023-06-01' AS Date), CAST(30910.8400000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 757353, CAST(14960.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (3123, 23, 7, 3, CAST(N'2023-06-02' AS Date), CAST(6201.9800000000 AS Decimal(18, 10)), 16, 3, 4, N'4011209000', 5, 203699, CAST(1042.7200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 16)
    INSERT @Registros VALUES (3124, 23, 7, 3, CAST(N'2023-06-02' AS Date), CAST(10997.6800000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 5, 203699, CAST(2055.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 30)
    INSERT @Registros VALUES (3125, 23, 7, 3, CAST(N'2023-06-02' AS Date), CAST(50031.1800000000 AS Decimal(18, 10)), 150, 3, 4, N'4011209000', 5, 203699, CAST(9540.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 150)
    INSERT @Registros VALUES (3126, 23, 7, 3, CAST(N'2023-06-02' AS Date), CAST(13341.6500000000 AS Decimal(18, 10)), 40, 3, 4, N'4011209000', 5, 203699, CAST(2388.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (3127, 23, 7, 3, CAST(N'2023-06-02' AS Date), CAST(6137.1700000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 5, 203699, CAST(1125.9000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (3128, 4, 7, 3, CAST(N'2023-06-02' AS Date), CAST(5124.6300000000 AS Decimal(18, 10)), 80, 5, 6, N'4011209000', 5, 231033, CAST(1843.1900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 80)
    INSERT @Registros VALUES (3129, 27, 7, 3, CAST(N'2023-06-02' AS Date), CAST(2473.3300000000 AS Decimal(18, 10)), 19, 3, 4, N'4011209000', 5, 258077, CAST(337.3700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 19)
    INSERT @Registros VALUES (3130, 7, 12, 8, CAST(N'2023-06-02' AS Date), CAST(14785.9500000000 AS Decimal(18, 10)), 188, 3, 4, N'4011209000', 5, 356209, CAST(2885.8000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 188)
    INSERT @Registros VALUES (3131, 47, 7, 3, CAST(N'2023-06-05' AS Date), CAST(30182.5100000000 AS Decimal(18, 10)), 135, 3, 4, N'4011209000', 5, 570613, CAST(4631.3400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 135)
    INSERT @Registros VALUES (3132, 23, 7, 3, CAST(N'2023-06-05' AS Date), CAST(32222.1300000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 828827, CAST(14168.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (3133, 47, 7, 3, CAST(N'2023-06-06' AS Date), CAST(25573.1700000000 AS Decimal(18, 10)), 151, 3, 4, N'4011209000', 5, 124949, CAST(3976.6000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 151)
    INSERT @Registros VALUES (3134, 61, 7, 3, CAST(N'2023-06-06' AS Date), CAST(23322.9000000000 AS Decimal(18, 10)), 330, 5, 6, N'4011209000', 5, 529568, CAST(9416.8300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 330)
    INSERT @Registros VALUES (3135, 24, 12, 8, CAST(N'2023-06-06' AS Date), CAST(37430.0000000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 641416, CAST(14510.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (3136, 7, 12, 8, CAST(N'2023-06-07' AS Date), CAST(35969.1300000000 AS Decimal(18, 10)), 450, 3, 4, N'4011209000', 5, 248768, CAST(7046.3000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 450)
    INSERT @Registros VALUES (3137, 7, 12, 8, CAST(N'2023-06-07' AS Date), CAST(44450.1000000000 AS Decimal(18, 10)), 500, 3, 4, N'4011209000', 5, 248768, CAST(8707.7000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 500)
    INSERT @Registros VALUES (3138, 44, 7, 3, CAST(N'2023-06-07' AS Date), CAST(28519.0500000000 AS Decimal(18, 10)), 259, 5, 6, N'4011209000', 5, 583899, CAST(8186.7600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 259)
    INSERT @Registros VALUES (3139, 42, 7, 3, CAST(N'2023-06-07' AS Date), CAST(61511.7000000000 AS Decimal(18, 10)), 240, 3, 4, N'4011209000', 5, 893772, CAST(12642.7700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 240)
    INSERT @Registros VALUES (3140, 66, 12, 8, CAST(N'2023-06-08' AS Date), CAST(29634.2500000000 AS Decimal(18, 10)), 267, 5, 6, N'4011209000', 5, 170698, CAST(14600.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 267)
    INSERT @Registros VALUES (3141, 46, 7, 3, CAST(N'2023-06-08' AS Date), CAST(41423.9300000000 AS Decimal(18, 10)), 245, 5, 6, N'4011209000', 5, 223552, CAST(13880.4700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 245)
    INSERT @Registros VALUES (3142, 51, 7, 3, CAST(N'2023-06-08' AS Date), CAST(20060.3600000000 AS Decimal(18, 10)), 170, 5, 6, N'4011209000', 5, 612196, CAST(8060.2900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 170)
    INSERT @Registros VALUES (3143, 56, 7, 3, CAST(N'2023-06-09' AS Date), CAST(4429.8100000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 645179, CAST(920.9000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 50)
    INSERT @Registros VALUES (3144, 56, 7, 3, CAST(N'2023-06-09' AS Date), CAST(4341.2200000000 AS Decimal(18, 10)), 49, 3, 4, N'4011209000', 5, 645179, CAST(902.4900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 49)
    INSERT @Registros VALUES (3145, 56, 7, 3, CAST(N'2023-06-09' AS Date), CAST(4317.6900000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 645179, CAST(897.5900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 50)
    INSERT @Registros VALUES (3146, 56, 7, 3, CAST(N'2023-06-09' AS Date), CAST(38859.2100000000 AS Decimal(18, 10)), 450, 3, 4, N'4011209000', 5, 645179, CAST(8078.3500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 450)
    INSERT @Registros VALUES (3147, 12, 1, 2, CAST(N'2023-06-09' AS Date), CAST(27398.7000000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 5, 876685, CAST(11965.8000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 256)
    INSERT @Registros VALUES (3148, 8, 7, 3, CAST(N'2023-06-09' AS Date), CAST(5692.9100000000 AS Decimal(18, 10)), 40, 5, 6, N'4011209000', 5, 958869, CAST(1742.6400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (3149, 45, 7, 3, CAST(N'2023-06-12' AS Date), CAST(5919.0400000000 AS Decimal(18, 10)), 64, 16, 17, N'4011209000', 5, 474891, CAST(879.2700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 64)
    INSERT @Registros VALUES (3150, 44, 7, 3, CAST(N'2023-06-12' AS Date), CAST(51823.4900000000 AS Decimal(18, 10)), 226, 3, 4, N'4011209000', 5, 598454, CAST(10083.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 226)
    INSERT @Registros VALUES (3151, 45, 7, 3, CAST(N'2023-06-12' AS Date), CAST(19786.9500000000 AS Decimal(18, 10)), 103, 3, 4, N'4011209000', 5, 676947, CAST(3619.5200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 103)
    INSERT @Registros VALUES (3152, 51, 7, 3, CAST(N'2023-06-13' AS Date), CAST(16482.5400000000 AS Decimal(18, 10)), 190, 5, 6, N'4011209000', 5, 142713, CAST(6864.3400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 190)
    INSERT @Registros VALUES (3153, 30, 7, 3, CAST(N'2023-06-13' AS Date), CAST(79744.1400000000 AS Decimal(18, 10)), 240, 3, 4, N'4011209000', 5, 631905, CAST(15187.2000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 240)
    INSERT @Registros VALUES (3154, 51, 7, 3, CAST(N'2023-06-14' AS Date), CAST(58402.1500000000 AS Decimal(18, 10)), 530, 5, 6, N'4011209000', 5, 181526, CAST(28640.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 530)
    INSERT @Registros VALUES (3155, 45, 7, 3, CAST(N'2023-06-14' AS Date), CAST(23442.4400000000 AS Decimal(18, 10)), 224, 3, 4, N'4011209000', 5, 403548, CAST(3527.8300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 224)
    INSERT @Registros VALUES (3156, 45, 7, 3, CAST(N'2023-06-14' AS Date), CAST(65999.5800000000 AS Decimal(18, 10)), 350, 3, 4, N'4011209000', 5, 907645, CAST(17874.8000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 350)
    INSERT @Registros VALUES (3157, 49, 12, 8, CAST(N'2023-06-15' AS Date), CAST(18966.0100000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 159771, CAST(14518.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (3158, 56, 7, 3, CAST(N'2023-06-15' AS Date), CAST(57857.0500000000 AS Decimal(18, 10)), 670, 3, 4, N'4011209000', 5, 171344, CAST(12086.8000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 670)
    INSERT @Registros VALUES (3159, 51, 7, 3, CAST(N'2023-06-15' AS Date), CAST(122763.3200000000 AS Decimal(18, 10)), 1073, 5, 6, N'4011209000', 5, 385755, CAST(57620.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1073)
    INSERT @Registros VALUES (3160, 37, 8, 4, CAST(N'2023-06-15' AS Date), CAST(43786.5900000000 AS Decimal(18, 10)), 258, 5, 6, N'4011209000', 5, 824733, CAST(14466.7800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 258)
    INSERT @Registros VALUES (3161, 8, 7, 3, CAST(N'2023-06-15' AS Date), CAST(7879.7700000000 AS Decimal(18, 10)), 40, 5, 6, N'4011209000', 5, 969336, CAST(2448.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (3162, 2, 12, 8, CAST(N'2023-06-16' AS Date), CAST(60696.6700000000 AS Decimal(18, 10)), 520, 5, 6, N'4011209000', 5, 118995, CAST(28640.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 520)
    INSERT @Registros VALUES (3163, 56, 7, 3, CAST(N'2023-06-16' AS Date), CAST(17270.7700000000 AS Decimal(18, 10)), 200, 3, 4, N'4011209000', 5, 123248, CAST(3608.0000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 200)
    INSERT @Registros VALUES (3164, 58, 12, 8, CAST(N'2023-06-16' AS Date), CAST(20266.1200000000 AS Decimal(18, 10)), 190, 5, 6, N'4011209000', 5, 519914, CAST(11092.5900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 190)
    INSERT @Registros VALUES (3165, 7, 12, 8, CAST(N'2023-06-16' AS Date), CAST(34990.4400000000 AS Decimal(18, 10)), 400, 3, 4, N'4011209000', 5, 954184, CAST(6932.0000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 400)
    INSERT @Registros VALUES (3166, 7, 12, 8, CAST(N'2023-06-16' AS Date), CAST(23979.4200000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 5, 954184, CAST(4750.6000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 300)
    INSERT @Registros VALUES (3167, 6, 7, 3, CAST(N'2023-06-21' AS Date), CAST(35726.6400000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 5, 185907, CAST(14254.9600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (3168, 30, 7, 3, CAST(N'2023-06-21' AS Date), CAST(63802.7500000000 AS Decimal(18, 10)), 520, 5, 6, N'4011209000', 5, 231091, CAST(26998.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 520)
    INSERT @Registros VALUES (3169, 6, 7, 3, CAST(N'2023-06-21' AS Date), CAST(35255.6000000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 5, 405657, CAST(14037.3600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (3170, 30, 7, 3, CAST(N'2023-06-21' AS Date), CAST(36330.2300000000 AS Decimal(18, 10)), 287, 5, 6, N'4011209000', 5, 557080, CAST(15199.2600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 287)
    INSERT @Registros VALUES (3171, 9, 9, 5, CAST(N'2023-06-21' AS Date), CAST(39214.9800000000 AS Decimal(18, 10)), 232, 5, 6, N'4011209000', 5, 799537, CAST(14177.7300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 232)
    INSERT @Registros VALUES (3172, 9, 9, 5, CAST(N'2023-06-21' AS Date), CAST(63768.4900000000 AS Decimal(18, 10)), 389, 5, 6, N'4011209000', 5, 826564, CAST(26475.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 389)
    INSERT @Registros VALUES (3173, 12, 1, 2, CAST(N'2023-06-22' AS Date), CAST(31414.4500000000 AS Decimal(18, 10)), 288, 5, 6, N'4011209000', 5, 41419, CAST(14860.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 288)
    INSERT @Registros VALUES (3174, 9, 9, 5, CAST(N'2023-06-22' AS Date), CAST(48403.0600000000 AS Decimal(18, 10)), 218, 5, 6, N'4011209000', 5, 492272, CAST(17363.0000000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 218)
    INSERT @Registros VALUES (3175, 12, 1, 2, CAST(N'2023-06-22' AS Date), CAST(32550.7200000000 AS Decimal(18, 10)), 300, 5, 6, N'4011209000', 5, 651760, CAST(15150.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 300)
    INSERT @Registros VALUES (3176, 51, 7, 3, CAST(N'2023-06-22' AS Date), CAST(2086.0700000000 AS Decimal(18, 10)), 20, 5, 6, N'4011209000', 5, 852206, CAST(778.6300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (3177, 7, 12, 8, CAST(N'2023-06-23' AS Date), CAST(26670.0600000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 5, 26208, CAST(5308.2000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 300)
    INSERT @Registros VALUES (3178, 44, 7, 3, CAST(N'2023-06-23' AS Date), CAST(20244.2100000000 AS Decimal(18, 10)), 156, 5, 6, N'4011209000', 5, 257389, CAST(7696.5300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 156)
    INSERT @Registros VALUES (3179, 2, 12, 8, CAST(N'2023-06-23' AS Date), CAST(40057.4300000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 654769, CAST(16973.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (3180, 56, 7, 3, CAST(N'2023-06-23' AS Date), CAST(40586.2900000000 AS Decimal(18, 10)), 470, 3, 4, N'4011209000', 5, 883156, CAST(8478.8000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 470)
    INSERT @Registros VALUES (3181, 61, 7, 3, CAST(N'2023-06-23' AS Date), CAST(36918.6700000000 AS Decimal(18, 10)), 350, 5, 6, N'4011209000', 5, 926945, CAST(16310.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 350)
    INSERT @Registros VALUES (3182, 37, 8, 4, CAST(N'2023-06-26' AS Date), CAST(45326.8300000000 AS Decimal(18, 10)), 242, 5, 6, N'4011209000', 5, 431762, CAST(14872.0800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 242)
    INSERT @Registros VALUES (3183, 51, 7, 3, CAST(N'2023-06-26' AS Date), CAST(60344.1000000000 AS Decimal(18, 10)), 462, 5, 6, N'4011209000', 5, 557196, CAST(29829.0600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 462)
    INSERT @Registros VALUES (3184, 45, 7, 3, CAST(N'2023-06-27' AS Date), CAST(96462.3200000000 AS Decimal(18, 10)), 361, 3, 4, N'4011209000', 5, 41470, CAST(20887.1300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 361)
    INSERT @Registros VALUES (3185, 26, 7, 3, CAST(N'2023-06-27' AS Date), CAST(37761.9600000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 181457, CAST(15330.5600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3186, 2, 12, 8, CAST(N'2023-06-27' AS Date), CAST(39865.4400000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 5, 497784, CAST(15160.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (3187, 6, 7, 3, CAST(N'2023-06-27' AS Date), CAST(28952.8100000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 943761, CAST(13500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3188, 59, 12, 8, CAST(N'2023-06-28' AS Date), CAST(63227.0800000000 AS Decimal(18, 10)), 607, 5, 6, N'4011209000', 5, 796497, CAST(27482.3000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 607)
    INSERT @Registros VALUES (3189, 61, 7, 3, CAST(N'2023-06-28' AS Date), CAST(28900.6400000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 941881, CAST(13500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3190, 51, 7, 3, CAST(N'2023-06-29' AS Date), CAST(19634.0300000000 AS Decimal(18, 10)), 221, 5, 6, N'4011209000', 5, 212178, CAST(8260.0300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 221)
    INSERT @Registros VALUES (3191, 45, 7, 3, CAST(N'2023-06-29' AS Date), CAST(16967.0700000000 AS Decimal(18, 10)), 83, 20, 20, N'4011209000', 5, 913744, CAST(4491.9400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 83)
    INSERT @Registros VALUES (3192, 23, 7, 3, CAST(N'2023-06-30' AS Date), CAST(15538.9400000000 AS Decimal(18, 10)), 130, 5, 6, N'4011209000', 5, 205041, CAST(6916.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 130)
    INSERT @Registros VALUES (3193, 8, 7, 3, CAST(N'2023-06-30' AS Date), CAST(1116.3100000000 AS Decimal(18, 10)), 11, 5, 6, N'4011209000', 5, 342236, CAST(323.8400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 11)
    INSERT @Registros VALUES (3194, 22, 7, 3, CAST(N'2023-06-30' AS Date), CAST(35214.5700000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 5, 344321, CAST(15580.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (3195, 8, 7, 3, CAST(N'2023-06-30' AS Date), CAST(35984.7200000000 AS Decimal(18, 10)), 213, 5, 6, N'4011209000', 5, 815388, CAST(12954.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 213)
    INSERT @Registros VALUES (3196, 23, 7, 3, CAST(N'2023-06-30' AS Date), CAST(31399.2500000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 890699, CAST(5626.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 100)
    INSERT @Registros VALUES (3197, 61, 7, 3, CAST(N'2023-06-30' AS Date), CAST(11591.3200000000 AS Decimal(18, 10)), 173, 5, 6, N'4011209000', 5, 971923, CAST(3615.7500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 173)
    INSERT @Registros VALUES (3198, 13, 5, 6, CAST(N'2023-07-03' AS Date), CAST(12810.1100000000 AS Decimal(18, 10)), 140, 5, 25, N'4011209000', 5, 312820, CAST(5705.0000000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 140)
    INSERT @Registros VALUES (3199, 56, 7, 3, CAST(N'2023-07-03' AS Date), CAST(50499.8600000000 AS Decimal(18, 10)), 570, 3, 4, N'4011209000', 5, 578370, CAST(10244.6100000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 570)
    INSERT @Registros VALUES (3200, 61, 7, 3, CAST(N'2023-07-03' AS Date), CAST(30382.2900000000 AS Decimal(18, 10)), 332, 5, 6, N'4011209000', 5, 872189, CAST(12446.5900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 332)
    INSERT @Registros VALUES (3201, 7, 12, 8, CAST(N'2023-07-03' AS Date), CAST(8126.8000000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 903071, CAST(1326.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 100)
    INSERT @Registros VALUES (3202, 7, 12, 8, CAST(N'2023-07-03' AS Date), CAST(76554.4400000000 AS Decimal(18, 10)), 942, 3, 4, N'4011209000', 5, 903071, CAST(12490.9200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 942)
    INSERT @Registros VALUES (3203, 10, 7, 3, CAST(N'2023-07-04' AS Date), CAST(8809.4700000000 AS Decimal(18, 10)), 48, 3, 4, N'4011209000', 5, 257361, CAST(1110.9400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 48)
    INSERT @Registros VALUES (3204, 61, 7, 3, CAST(N'2023-07-04' AS Date), CAST(17500.5000000000 AS Decimal(18, 10)), 158, 5, 6, N'4011209000', 5, 487543, CAST(6751.5500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 158)
    INSERT @Registros VALUES (3205, 59, 12, 8, CAST(N'2023-07-05' AS Date), CAST(127486.9300000000 AS Decimal(18, 10)), 1140, 5, 6, N'4011209000', 5, 516374, CAST(59010.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1140)
    INSERT @Registros VALUES (3206, 9, 9, 5, CAST(N'2023-07-05' AS Date), CAST(32644.2100000000 AS Decimal(18, 10)), 1106, 5, 6, N'4011209000', 5, 861962, CAST(11465.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1106)
    INSERT @Registros VALUES (3207, 27, 7, 3, CAST(N'2023-07-05' AS Date), CAST(10530.7300000000 AS Decimal(18, 10)), 84, 3, 4, N'4011209000', 5, 991599, CAST(1296.2900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 84)
    INSERT @Registros VALUES (3208, 51, 7, 3, CAST(N'2023-07-06' AS Date), CAST(78170.4600000000 AS Decimal(18, 10)), 708, 5, 6, N'4011209000', 5, 52439, CAST(38120.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 708)
    INSERT @Registros VALUES (3209, 51, 7, 3, CAST(N'2023-07-06' AS Date), CAST(77633.3200000000 AS Decimal(18, 10)), 720, 5, 6, N'4011209000', 5, 158210, CAST(37640.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 720)
    INSERT @Registros VALUES (3210, 7, 12, 8, CAST(N'2023-07-06' AS Date), CAST(51955.4100000000 AS Decimal(18, 10)), 650, 3, 4, N'4011209000', 5, 576935, CAST(10100.7300000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 650)
    INSERT @Registros VALUES (3211, 7, 12, 8, CAST(N'2023-07-06' AS Date), CAST(26670.0600000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 5, 576935, CAST(5184.9700000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 300)
    INSERT @Registros VALUES (3212, 44, 7, 3, CAST(N'2023-07-10' AS Date), CAST(52564.4500000000 AS Decimal(18, 10)), 245, 3, 4, N'4011209000', 5, 303363, CAST(10880.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 245)
    INSERT @Registros VALUES (3213, 47, 7, 3, CAST(N'2023-07-10' AS Date), CAST(10422.8800000000 AS Decimal(18, 10)), 78, 3, 4, N'4011209000', 5, 749377, CAST(1728.1700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 78)
    INSERT @Registros VALUES (3214, 47, 7, 3, CAST(N'2023-07-10' AS Date), CAST(21742.1000000000 AS Decimal(18, 10)), 208, 3, 4, N'4011209000', 5, 749377, CAST(3093.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 208)
    INSERT @Registros VALUES (3215, 47, 7, 3, CAST(N'2023-07-10' AS Date), CAST(66095.5600000000 AS Decimal(18, 10)), 405, 3, 4, N'4011209000', 5, 749377, CAST(11075.0900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 405)
    INSERT @Registros VALUES (3216, 22, 7, 3, CAST(N'2023-07-11' AS Date), CAST(3917.2600000000 AS Decimal(18, 10)), 36, 5, 6, N'4011209000', 5, 838770, CAST(1791.2600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 36)
    INSERT @Registros VALUES (3217, 45, 7, 3, CAST(N'2023-07-11' AS Date), CAST(6374.3200000000 AS Decimal(18, 10)), 62, 14, 15, N'4011209000', 5, 883488, CAST(905.7000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 62)
    INSERT @Registros VALUES (3218, 2, 12, 8, CAST(N'2023-07-12' AS Date), CAST(31524.5200000000 AS Decimal(18, 10)), 285, 5, 6, N'4011209000', 5, 450835, CAST(13900.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 285)
    INSERT @Registros VALUES (3219, 61, 7, 3, CAST(N'2023-07-12' AS Date), CAST(40740.6300000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 5, 663455, CAST(14625.4300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (3220, 7, 12, 8, CAST(N'2023-07-13' AS Date), CAST(6154.7200000000 AS Decimal(18, 10)), 77, 3, 4, N'4011209000', 5, 950516, CAST(1198.8800000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 77)
    INSERT @Registros VALUES (3221, 7, 12, 8, CAST(N'2023-07-13' AS Date), CAST(31115.0700000000 AS Decimal(18, 10)), 350, 3, 4, N'4011209000', 5, 950516, CAST(6060.9400000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 350)
    INSERT @Registros VALUES (3222, 7, 12, 8, CAST(N'2023-07-13' AS Date), CAST(30054.2100000000 AS Decimal(18, 10)), 376, 3, 4, N'4011209000', 5, 950516, CAST(5854.2900000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 376)
    INSERT @Registros VALUES (3223, 7, 12, 8, CAST(N'2023-07-13' AS Date), CAST(6954.0300000000 AS Decimal(18, 10)), 87, 3, 4, N'4011209000', 5, 950516, CAST(1354.5800000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 87)
    INSERT @Registros VALUES (3224, 7, 12, 8, CAST(N'2023-07-13' AS Date), CAST(4795.8800000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 5, 950516, CAST(934.2000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 60)
    INSERT @Registros VALUES (3225, 61, 7, 3, CAST(N'2023-07-14' AS Date), CAST(29400.6400000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 433494, CAST(13500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3226, 56, 7, 3, CAST(N'2023-07-17' AS Date), CAST(48196.3600000000 AS Decimal(18, 10)), 544, 3, 4, N'4011209000', 5, 77580, CAST(9777.0000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 544)
    INSERT @Registros VALUES (3227, 1, 11, 7, CAST(N'2023-07-17' AS Date), CAST(14726.9100000000 AS Decimal(18, 10)), 121, 5, 6, N'4011209000', 5, 501110, CAST(5765.0700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 121)
    INSERT @Registros VALUES (3228, 1, 11, 7, CAST(N'2023-07-17' AS Date), CAST(3389.2600000000 AS Decimal(18, 10)), 20, 5, 6, N'4011209000', 5, 501110, CAST(1326.7800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (3229, 23, 7, 3, CAST(N'2023-07-19' AS Date), CAST(13577.7200000000 AS Decimal(18, 10)), 115, 5, 6, N'4011209000', 5, 69930, CAST(6118.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 115)
    INSERT @Registros VALUES (3230, 23, 7, 3, CAST(N'2023-07-19' AS Date), CAST(16126.0200000000 AS Decimal(18, 10)), 125, 5, 6, N'4011209000', 5, 231651, CAST(7131.2500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 125)
    INSERT @Registros VALUES (3231, 8, 7, 3, CAST(N'2023-07-19' AS Date), CAST(4282.0700000000 AS Decimal(18, 10)), 32, 5, 6, N'4011209000', 5, 484138, CAST(1337.0800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 32)
    INSERT @Registros VALUES (3232, 44, 7, 3, CAST(N'2023-07-20' AS Date), CAST(64811.2300000000 AS Decimal(18, 10)), 490, 5, 6, N'4011209000', 5, 13077, CAST(28420.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 490)
    INSERT @Registros VALUES (3233, 7, 12, 8, CAST(N'2023-07-20' AS Date), CAST(8126.6500000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 31227, CAST(1326.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 100)
    INSERT @Registros VALUES (3234, 7, 12, 8, CAST(N'2023-07-20' AS Date), CAST(76553.0900000000 AS Decimal(18, 10)), 942, 3, 4, N'4011209000', 5, 31227, CAST(12490.9200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 942)
    INSERT @Registros VALUES (3235, 29, 12, 8, CAST(N'2023-07-20' AS Date), CAST(26770.3300000000 AS Decimal(18, 10)), 236, 5, 6, N'4011209000', 5, 422430, CAST(13246.1100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 236)
    INSERT @Registros VALUES (3236, 13, 5, 6, CAST(N'2023-07-21' AS Date), CAST(11603.1900000000 AS Decimal(18, 10)), 58, 12, 25, N'4011201000', 4, 288524, CAST(3353.5600000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 58)
    INSERT @Registros VALUES (3237, 13, 5, 6, CAST(N'2023-07-21' AS Date), CAST(9587.0600000000 AS Decimal(18, 10)), 40, 12, 25, N'4011209000', 5, 288524, CAST(2893.8100000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 40)
    INSERT @Registros VALUES (3238, 13, 5, 6, CAST(N'2023-07-21' AS Date), CAST(9184.0000000000 AS Decimal(18, 10)), 72, 5, 25, N'4011209000', 5, 288524, CAST(3979.3600000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 72)
    INSERT @Registros VALUES (3239, 7, 12, 8, CAST(N'2023-07-24' AS Date), CAST(26670.0600000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 5, 323599, CAST(5308.2000000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 300)
    INSERT @Registros VALUES (3240, 7, 12, 8, CAST(N'2023-07-24' AS Date), CAST(53340.1200000000 AS Decimal(18, 10)), 600, 3, 4, N'4011209000', 5, 323599, CAST(10616.4000000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 600)
    INSERT @Registros VALUES (3241, 51, 7, 3, CAST(N'2023-07-24' AS Date), CAST(75085.1600000000 AS Decimal(18, 10)), 675, 5, 6, N'4011209000', 5, 414265, CAST(35939.4600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 675)
    INSERT @Registros VALUES (3242, 51, 7, 3, CAST(N'2023-07-24' AS Date), CAST(51619.9600000000 AS Decimal(18, 10)), 480, 5, 6, N'4011209000', 5, 577793, CAST(24790.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 480)
    INSERT @Registros VALUES (3243, 47, 7, 3, CAST(N'2023-07-24' AS Date), CAST(2511.7000000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 5, 631899, CAST(430.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (3244, 30, 7, 3, CAST(N'2023-07-25' AS Date), CAST(46297.5400000000 AS Decimal(18, 10)), 141, 3, 4, N'4011209000', 5, 39292, CAST(9084.1500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 141)
    INSERT @Registros VALUES (3245, 2, 12, 8, CAST(N'2023-07-26' AS Date), CAST(37720.1000000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 520321, CAST(15900.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (3246, 2, 12, 8, CAST(N'2023-07-26' AS Date), CAST(31624.7200000000 AS Decimal(18, 10)), 285, 5, 6, N'4011209000', 5, 687061, CAST(14300.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 285)
    INSERT @Registros VALUES (3247, 30, 7, 3, CAST(N'2023-07-27' AS Date), CAST(849.5200000000 AS Decimal(18, 10)), 2, 18, 3, N'4011209000', 5, 318428, CAST(84.3700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 2)
    INSERT @Registros VALUES (3248, 30, 7, 3, CAST(N'2023-07-27' AS Date), CAST(1276.4700000000 AS Decimal(18, 10)), 4, 10, 3, N'4011209000', 5, 318428, CAST(126.7700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 4)
    INSERT @Registros VALUES (3249, 8, 7, 3, CAST(N'2023-07-27' AS Date), CAST(6290.6600000000 AS Decimal(18, 10)), 66, 5, 6, N'4011209000', 5, 335621, CAST(1939.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 66)
    INSERT @Registros VALUES (3250, 25, 7, 3, CAST(N'2023-07-28' AS Date), CAST(5982.3200000000 AS Decimal(18, 10)), 40, 5, 6, N'4011209000', 5, 125261, CAST(2280.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (3251, 51, 7, 3, CAST(N'2023-07-28' AS Date), CAST(53027.7600000000 AS Decimal(18, 10)), 492, 5, 6, N'4011209000', 5, 398180, CAST(25300.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 492)
    INSERT @Registros VALUES (3252, 6, 7, 3, CAST(N'2023-07-31' AS Date), CAST(24502.9600000000 AS Decimal(18, 10)), 224, 5, 6, N'4011209000', 5, 29122, CAST(11402.5500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 224)
    INSERT @Registros VALUES (3253, 6, 7, 3, CAST(N'2023-07-31' AS Date), CAST(4722.0900000000 AS Decimal(18, 10)), 40, 5, 6, N'4011209000', 5, 29122, CAST(2197.4500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (3254, 59, 12, 8, CAST(N'2023-07-31' AS Date), CAST(131115.7100000000 AS Decimal(18, 10)), 1047, 5, 6, N'4011209000', 5, 51079, CAST(58970.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1047)
    INSERT @Registros VALUES (3255, 6, 7, 3, CAST(N'2023-07-31' AS Date), CAST(28904.9000000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 54315, CAST(13500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3256, 56, 7, 3, CAST(N'2023-07-31' AS Date), CAST(52714.7600000000 AS Decimal(18, 10)), 595, 3, 4, N'4011209000', 5, 239389, CAST(10693.9400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 595)
    INSERT @Registros VALUES (3257, 22, 7, 3, CAST(N'2023-07-31' AS Date), CAST(24947.0100000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 374244, CAST(13530.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3258, 64, 7, 3, CAST(N'2023-07-31' AS Date), CAST(36632.1600000000 AS Decimal(18, 10)), 258, 5, 6, N'4011209000', 5, 595149, CAST(15060.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 258)
    INSERT @Registros VALUES (3259, 22, 7, 3, CAST(N'2023-07-31' AS Date), CAST(24866.7700000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 5, 897466, CAST(13470.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (3260, 65, 12, 8, CAST(N'2023-08-01' AS Date), CAST(31773.4200000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 63772, CAST(13941.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (3261, 23, 7, 3, CAST(N'2023-08-01' AS Date), CAST(35751.1700000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 141638, CAST(14919.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (3262, 42, 7, 3, CAST(N'2023-08-02' AS Date), CAST(64630.0200000000 AS Decimal(18, 10)), 305, 3, 4, N'4011209000', 5, 733131, CAST(12872.5100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 305)
    INSERT @Registros VALUES (3263, 2, 12, 8, CAST(N'2023-08-03' AS Date), CAST(38687.7200000000 AS Decimal(18, 10)), 350, 5, 6, N'4011209000', 5, 241334, CAST(16294.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 350)
    INSERT @Registros VALUES (3264, 13, 5, 6, CAST(N'2023-08-03' AS Date), CAST(7647.9200000000 AS Decimal(18, 10)), 60, 5, 25, N'4011209000', 5, 438663, CAST(3195.8400000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 60)
    INSERT @Registros VALUES (3265, 13, 5, 6, CAST(N'2023-08-03' AS Date), CAST(7830.4700000000 AS Decimal(18, 10)), 60, 5, 25, N'4011209000', 5, 438663, CAST(3315.2800000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 60)
    INSERT @Registros VALUES (3266, 7, 12, 8, CAST(N'2023-08-03' AS Date), CAST(11797.3000000000 AS Decimal(18, 10)), 150, 3, 4, N'4011209000', 5, 591773, CAST(2271.0200000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 150)
    INSERT @Registros VALUES (3267, 7, 12, 8, CAST(N'2023-08-03' AS Date), CAST(67941.6900000000 AS Decimal(18, 10)), 850, 3, 4, N'4011209000', 5, 591773, CAST(13078.9800000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 850)
    INSERT @Registros VALUES (3268, 47, 7, 3, CAST(N'2023-08-04' AS Date), CAST(18159.5800000000 AS Decimal(18, 10)), 150, 3, 4, N'4011209000', 5, 423332, CAST(2828.3300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 150)
    INSERT @Registros VALUES (3269, 51, 7, 3, CAST(N'2023-08-07' AS Date), CAST(26140.8000000000 AS Decimal(18, 10)), 277, 5, 6, N'4011209000', 5, 746118, CAST(10506.7700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 277)
    INSERT @Registros VALUES (3270, 23, 7, 3, CAST(N'2023-08-08' AS Date), CAST(77208.0400000000 AS Decimal(18, 10)), 214, 3, 4, N'4011209000', 5, 917767, CAST(14162.8900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 214)
    INSERT @Registros VALUES (3271, 47, 7, 3, CAST(N'2023-08-09' AS Date), CAST(37172.2400000000 AS Decimal(18, 10)), 360, 3, 4, N'4011209000', 5, 174259, CAST(6107.7400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 360)
    INSERT @Registros VALUES (3272, 42, 7, 3, CAST(N'2023-08-09' AS Date), CAST(3030.6200000000 AS Decimal(18, 10)), 23, 2, 2, N'4011209000', 5, 589084, CAST(580.3600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 23)
    INSERT @Registros VALUES (3273, 23, 7, 3, CAST(N'2023-08-09' AS Date), CAST(33394.4300000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 996103, CAST(14291.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (3274, 46, 7, 3, CAST(N'2023-08-10' AS Date), CAST(5936.7600000000 AS Decimal(18, 10)), 34, 5, 6, N'4011209000', 5, 217133, CAST(1665.7700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 34)
    INSERT @Registros VALUES (3275, 26, 7, 3, CAST(N'2023-08-11' AS Date), CAST(33639.5800000000 AS Decimal(18, 10)), 230, 5, 6, N'4011209000', 5, 433656, CAST(13549.0900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 230)
    INSERT @Registros VALUES (3276, 56, 7, 3, CAST(N'2023-08-14' AS Date), CAST(6044.7800000000 AS Decimal(18, 10)), 70, 3, 4, N'4011209000', 5, 309576, CAST(1261.7200000000 AS Decimal(18, 10)), NULL, 0, 6, 1, 70)
    INSERT @Registros VALUES (3277, 64, 7, 3, CAST(N'2023-08-14' AS Date), CAST(38703.5400000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 326943, CAST(14720.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (3278, 12, 1, 2, CAST(N'2023-08-14' AS Date), CAST(61881.6300000000 AS Decimal(18, 10)), 556, 5, 6, N'4011209000', 5, 345127, CAST(29380.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 556)
    INSERT @Registros VALUES (3279, 56, 7, 3, CAST(N'2023-08-14' AS Date), CAST(3100.8900000000 AS Decimal(18, 10)), 35, 3, 4, N'4011209000', 5, 587275, CAST(629.0500000000 AS Decimal(18, 10)), NULL, 0, 6, 1, 35)
    INSERT @Registros VALUES (3280, 56, 7, 3, CAST(N'2023-08-14' AS Date), CAST(2158.8500000000 AS Decimal(18, 10)), 25, 3, 4, N'4011209000', 5, 746991, CAST(451.0000000000 AS Decimal(18, 10)), NULL, 0, 6, 1, 25)
    INSERT @Registros VALUES (3281, 56, 7, 3, CAST(N'2023-08-14' AS Date), CAST(17270.8000000000 AS Decimal(18, 10)), 200, 3, 4, N'4011209000', 5, 834602, CAST(3605.1000000000 AS Decimal(18, 10)), NULL, 0, 6, 1, 200)
    INSERT @Registros VALUES (3282, 24, 12, 8, CAST(N'2023-08-14' AS Date), CAST(41881.3200000000 AS Decimal(18, 10)), 271, 5, 6, N'4011209000', 5, 919616, CAST(15990.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 271)
    INSERT @Registros VALUES (3283, 45, 7, 3, CAST(N'2023-08-15' AS Date), CAST(21298.1400000000 AS Decimal(18, 10)), 230, 16, 17, N'4011209000', 5, 934645, CAST(3197.0500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 230)
    INSERT @Registros VALUES (3284, 38, 12, 8, CAST(N'2023-08-16' AS Date), CAST(4280.5400000000 AS Decimal(18, 10)), 54, 5, 6, N'4011209000', 5, 10287, CAST(2292.1600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 54)
    INSERT @Registros VALUES (3285, 64, 7, 3, CAST(N'2023-08-16' AS Date), CAST(43138.9300000000 AS Decimal(18, 10)), 560, 5, 6, N'4011209000', 5, 106046, CAST(16680.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 560)
    INSERT @Registros VALUES (3286, 45, 7, 3, CAST(N'2023-08-16' AS Date), CAST(30273.8300000000 AS Decimal(18, 10)), 286, 5, 6, N'4011209000', 5, 441747, CAST(14900.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 286)
    INSERT @Registros VALUES (3287, 8, 7, 3, CAST(N'2023-08-16' AS Date), CAST(9215.6200000000 AS Decimal(18, 10)), 56, 5, 6, N'4011209000', 5, 777405, CAST(2706.2600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 56)
    INSERT @Registros VALUES (3288, 51, 7, 3, CAST(N'2023-08-16' AS Date), CAST(58979.3400000000 AS Decimal(18, 10)), 540, 5, 6, N'4011209000', 5, 781899, CAST(27940.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 540)
    INSERT @Registros VALUES (3289, 14, 4, 2, CAST(N'2023-08-16' AS Date), CAST(27604.8000000000 AS Decimal(18, 10)), 282, 5, 6, N'4011209000', 5, 845319, CAST(12762.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 282)
    INSERT @Registros VALUES (3290, 24, 12, 8, CAST(N'2023-08-17' AS Date), CAST(38479.0000000000 AS Decimal(18, 10)), 265, 5, 6, N'4011209000', 5, 760791, CAST(14260.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 265)
    INSERT @Registros VALUES (3291, 61, 7, 3, CAST(N'2023-08-17' AS Date), CAST(33888.0900000000 AS Decimal(18, 10)), 343, 5, 6, N'4011209000', 5, 873594, CAST(13842.0200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 343)
    INSERT @Registros VALUES (3292, 37, 8, 4, CAST(N'2023-08-17' AS Date), CAST(44178.1400000000 AS Decimal(18, 10)), 246, 5, 6, N'4011209000', 5, 877217, CAST(14225.6800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 246)
    INSERT @Registros VALUES (3293, 22, 7, 3, CAST(N'2023-08-18' AS Date), CAST(25740.5200000000 AS Decimal(18, 10)), 270, 5, 6, N'4011209000', 5, 73131, CAST(14838.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 270)
    INSERT @Registros VALUES (3294, 26, 7, 3, CAST(N'2023-08-18' AS Date), CAST(77048.8600000000 AS Decimal(18, 10)), 528, 5, 6, N'4011209000', 5, 500199, CAST(31021.1400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 528)
    INSERT @Registros VALUES (3295, 22, 7, 3, CAST(N'2023-08-18' AS Date), CAST(24711.2700000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 510816, CAST(14678.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (3296, 7, 12, 8, CAST(N'2023-08-18' AS Date), CAST(21869.0200000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 5, 587158, CAST(4311.1600000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 250)
    INSERT @Registros VALUES (3297, 7, 12, 8, CAST(N'2023-08-18' AS Date), CAST(26670.0600000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 5, 587158, CAST(5257.6100000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 300)
    INSERT @Registros VALUES (3298, 7, 12, 8, CAST(N'2023-08-18' AS Date), CAST(31972.5600000000 AS Decimal(18, 10)), 400, 3, 4, N'4011209000', 5, 587158, CAST(6302.9300000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 400)
    INSERT @Registros VALUES (3299, 22, 7, 3, CAST(N'2023-08-18' AS Date), CAST(24649.2600000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 978026, CAST(14675.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (3300, 26, 7, 3, CAST(N'2023-08-21' AS Date), CAST(44744.9400000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 212354, CAST(13720.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 280)
    INSERT @Registros VALUES (3301, 26, 7, 3, CAST(N'2023-08-21' AS Date), CAST(44744.9400000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 212354, CAST(13720.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 280)
    INSERT @Registros VALUES (3302, 12, 1, 2, CAST(N'2023-08-21' AS Date), CAST(47808.5800000000 AS Decimal(18, 10)), 478, 5, 6, N'4011209000', 5, 246470, CAST(20693.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 478)
    INSERT @Registros VALUES (3303, 59, 12, 8, CAST(N'2023-08-21' AS Date), CAST(62776.2100000000 AS Decimal(18, 10)), 540, 5, 6, N'4011209000', 5, 300838, CAST(29080.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 540)
    INSERT @Registros VALUES (3304, 26, 7, 3, CAST(N'2023-08-21' AS Date), CAST(12728.1200000000 AS Decimal(18, 10)), 80, 5, 6, N'4011209000', 5, 389852, CAST(3913.9100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 80)
    INSERT @Registros VALUES (3305, 14, 4, 2, CAST(N'2023-08-21' AS Date), CAST(22466.1400000000 AS Decimal(18, 10)), 228, 5, 6, N'4011209000', 5, 550130, CAST(9371.1000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 228)
    INSERT @Registros VALUES (3306, 2, 12, 8, CAST(N'2023-08-21' AS Date), CAST(40406.4400000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 879592, CAST(16972.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (3307, 23, 7, 3, CAST(N'2023-08-21' AS Date), CAST(17254.7600000000 AS Decimal(18, 10)), 145, 5, 6, N'4011209000', 5, 883368, CAST(7714.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 145)
    INSERT @Registros VALUES (3308, 13, 5, 6, CAST(N'2023-08-24' AS Date), CAST(3251.4100000000 AS Decimal(18, 10)), 18, 12, 25, N'4011209000', 5, 586862, CAST(984.7300000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 18)
    INSERT @Registros VALUES (3309, 13, 5, 6, CAST(N'2023-08-24' AS Date), CAST(39283.8800000000 AS Decimal(18, 10)), 310, 5, 25, N'4011209000', 5, 586862, CAST(16697.8200000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 310)
    INSERT @Registros VALUES (3310, 7, 12, 8, CAST(N'2023-08-24' AS Date), CAST(55951.9700000000 AS Decimal(18, 10)), 700, 3, 4, N'4011209000', 5, 656026, CAST(10872.2700000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 700)
    INSERT @Registros VALUES (3311, 7, 12, 8, CAST(N'2023-08-24' AS Date), CAST(15024.1300000000 AS Decimal(18, 10)), 169, 3, 4, N'4011209000', 5, 656026, CAST(2919.4000000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 169)
    INSERT @Registros VALUES (3312, 7, 12, 8, CAST(N'2023-08-24' AS Date), CAST(7085.5600000000 AS Decimal(18, 10)), 81, 3, 4, N'4011209000', 5, 656026, CAST(1376.8300000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 81)
    INSERT @Registros VALUES (3313, 61, 7, 3, CAST(N'2023-08-24' AS Date), CAST(5697.7800000000 AS Decimal(18, 10)), 53, 5, 6, N'4011209000', 5, 673383, CAST(1798.5800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 53)
    INSERT @Registros VALUES (3314, 51, 7, 3, CAST(N'2023-08-28' AS Date), CAST(15384.9400000000 AS Decimal(18, 10)), 113, 5, 6, N'4011209000', 5, 52007, CAST(5496.6700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 113)
    INSERT @Registros VALUES (3315, 15, 7, 3, CAST(N'2023-08-28' AS Date), CAST(22642.7900000000 AS Decimal(18, 10)), 80, 3, 4, N'4011209000', 5, 473618, CAST(4871.4300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 80)
    INSERT @Registros VALUES (3316, 51, 7, 3, CAST(N'2023-08-28' AS Date), CAST(32136.9900000000 AS Decimal(18, 10)), 329, 5, 6, N'4011209000', 5, 474775, CAST(11287.9300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 329)
    INSERT @Registros VALUES (3317, 51, 7, 3, CAST(N'2023-08-28' AS Date), CAST(88351.7200000000 AS Decimal(18, 10)), 810, 5, 6, N'4011209000', 5, 948830, CAST(41850.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 810)
    INSERT @Registros VALUES (3318, 51, 7, 3, CAST(N'2023-08-28' AS Date), CAST(676.9000000000 AS Decimal(18, 10)), 6, 5, 6, N'4011209000', 5, 964201, CAST(225.9700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 6)
    INSERT @Registros VALUES (3319, 30, 7, 3, CAST(N'2023-08-29' AS Date), CAST(25394.2200000000 AS Decimal(18, 10)), 71, 10, 3, N'4011209000', 5, 453412, CAST(5092.2600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 71)
    INSERT @Registros VALUES (3320, 27, 7, 3, CAST(N'2023-08-31' AS Date), CAST(6397.5400000000 AS Decimal(18, 10)), 48, 3, 4, N'4011209000', 5, 92198, CAST(854.0900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 48)
    INSERT @Registros VALUES (3321, 59, 12, 8, CAST(N'2023-08-31' AS Date), CAST(107840.3500000000 AS Decimal(18, 10)), 910, 5, 6, N'4011209000', 5, 534191, CAST(49080.4400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 910)
    INSERT @Registros VALUES (3322, 45, 7, 3, CAST(N'2023-08-31' AS Date), CAST(61622.7400000000 AS Decimal(18, 10)), 320, 3, 4, N'4011209000', 5, 567981, CAST(16473.7700000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 320)
    INSERT @Registros VALUES (3323, 45, 7, 3, CAST(N'2023-08-31' AS Date), CAST(66118.6600000000 AS Decimal(18, 10)), 330, 3, 4, N'4011209000', 5, 728386, CAST(17596.7800000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 330)
    INSERT @Registros VALUES (3324, 12, 1, 2, CAST(N'2023-08-31' AS Date), CAST(622.0800000000 AS Decimal(18, 10)), 4, 14, 15, N'4011209000', 5, 928656, CAST(105.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 4)
    INSERT @Registros VALUES (3325, 64, 7, 3, CAST(N'2023-10-02' AS Date), CAST(37219.4000000000 AS Decimal(18, 10)), 258, 5, 6, N'4011209000', 5, 476469, CAST(15150.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 258)
    INSERT @Registros VALUES (3326, 23, 7, 3, CAST(N'2023-10-02' AS Date), CAST(103643.3000000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 5, 686049, CAST(19133.6000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 300)
    INSERT @Registros VALUES (3327, 61, 7, 3, CAST(N'2023-10-03' AS Date), CAST(30351.1000000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 5, 963324, CAST(13270.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (3328, 51, 7, 3, CAST(N'2023-10-03' AS Date), CAST(523.4500000000 AS Decimal(18, 10)), 4, 6, 7, N'4011209000', 5, 974038, CAST(103.9400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 4)
    INSERT @Registros VALUES (3329, 12, 1, 2, CAST(N'2023-10-04' AS Date), CAST(25376.8200000000 AS Decimal(18, 10)), 220, 5, 6, N'4011209000', 5, 125023, CAST(12780.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (3330, 11, 3, 2, CAST(N'2023-10-04' AS Date), CAST(13885.9200000000 AS Decimal(18, 10)), 108, 3, 4, N'4011209000', 5, 439810, CAST(1768.9400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 108)
    INSERT @Registros VALUES (3331, 23, 7, 3, CAST(N'2023-10-04' AS Date), CAST(13296.7600000000 AS Decimal(18, 10)), 110, 5, 6, N'4011209000', 5, 720437, CAST(5865.5600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 110)
    INSERT @Registros VALUES (3332, 23, 7, 3, CAST(N'2023-10-04' AS Date), CAST(21172.9800000000 AS Decimal(18, 10)), 130, 5, 6, N'4011209000', 5, 800829, CAST(8060.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 130)
    INSERT @Registros VALUES (3333, 13, 5, 6, CAST(N'2023-10-05' AS Date), CAST(20578.4700000000 AS Decimal(18, 10)), 164, 5, 25, N'4011209000', 5, 200937, CAST(8867.5400000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 164)
    INSERT @Registros VALUES (3334, 27, 7, 3, CAST(N'2023-10-05' AS Date), CAST(5135.8700000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 508900, CAST(689.5200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 50)
    INSERT @Registros VALUES (3335, 47, 7, 3, CAST(N'2023-10-05' AS Date), CAST(3725.0400000000 AS Decimal(18, 10)), 32, 3, 4, N'4011209000', 5, 899315, CAST(588.7000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 32)
    INSERT @Registros VALUES (3336, 61, 7, 3, CAST(N'2023-10-05' AS Date), CAST(31289.4000000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 5, 998458, CAST(13540.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 254)
    INSERT @Registros VALUES (3337, 26, 7, 3, CAST(N'2023-10-06' AS Date), CAST(38630.2100000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 182242, CAST(15536.8700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3338, 42, 7, 3, CAST(N'2023-10-09' AS Date), CAST(20981.3000000000 AS Decimal(18, 10)), 77, 2, 2, N'4011209000', 5, 109990, CAST(4319.7100000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 77)
    INSERT @Registros VALUES (3339, 45, 7, 3, CAST(N'2023-10-09' AS Date), CAST(69200.1200000000 AS Decimal(18, 10)), 348, 3, 4, N'4011209000', 5, 587757, CAST(18501.2400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 348)
    INSERT @Registros VALUES (3340, 7, 12, 8, CAST(N'2023-10-10' AS Date), CAST(22461.3900000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 5, 219433, CAST(4709.7600000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 300)
    INSERT @Registros VALUES (3341, 7, 12, 8, CAST(N'2023-10-10' AS Date), CAST(37473.5200000000 AS Decimal(18, 10)), 450, 3, 4, N'4011209000', 5, 219433, CAST(7857.5400000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 450)
    INSERT @Registros VALUES (3342, 61, 7, 3, CAST(N'2023-10-10' AS Date), CAST(34038.9400000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 5, 382811, CAST(13772.0100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 256)
    INSERT @Registros VALUES (3343, 14, 4, 2, CAST(N'2023-10-11' AS Date), CAST(10528.4400000000 AS Decimal(18, 10)), 92, 5, 6, N'4011209000', 5, 37516, CAST(3651.7300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 92)
    INSERT @Registros VALUES (3344, 42, 7, 3, CAST(N'2023-10-11' AS Date), CAST(37097.4500000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 5, 52351, CAST(15524.2800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (3345, 42, 7, 3, CAST(N'2023-10-11' AS Date), CAST(37100.4600000000 AS Decimal(18, 10)), 248, 5, 6, N'4011209000', 5, 602311, CAST(15524.2800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 248)
    INSERT @Registros VALUES (3346, 30, 7, 3, CAST(N'2023-10-12' AS Date), CAST(38163.6000000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 743, CAST(16478.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (3347, 6, 7, 3, CAST(N'2023-10-12' AS Date), CAST(21319.1000000000 AS Decimal(18, 10)), 203, 5, 6, N'4011209000', 5, 452454, CAST(7671.7700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 203)
    INSERT @Registros VALUES (3348, 44, 7, 3, CAST(N'2023-10-13' AS Date), CAST(33644.9600000000 AS Decimal(18, 10)), 245, 5, 6, N'4011209000', 5, 296354, CAST(14230.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 245)
    INSERT @Registros VALUES (3349, 1, 11, 7, CAST(N'2023-10-13' AS Date), CAST(29369.0700000000 AS Decimal(18, 10)), 242, 5, 6, N'4011209000', 5, 541833, CAST(11716.5400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 242)
    INSERT @Registros VALUES (3350, 51, 7, 3, CAST(N'2023-10-13' AS Date), CAST(1862.6000000000 AS Decimal(18, 10)), 10, 5, 6, N'4011209000', 5, 592779, CAST(633.0100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 10)
    INSERT @Registros VALUES (3351, 45, 7, 3, CAST(N'2023-10-13' AS Date), CAST(58141.6100000000 AS Decimal(18, 10)), 530, 5, 6, N'4011209000', 5, 630282, CAST(28450.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 530)
    INSERT @Registros VALUES (3352, 23, 7, 3, CAST(N'2023-10-13' AS Date), CAST(32692.4200000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 662835, CAST(14184.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 266)
    INSERT @Registros VALUES (3353, 64, 7, 3, CAST(N'2023-10-17' AS Date), CAST(38888.0600000000 AS Decimal(18, 10)), 410, 5, 6, N'4011209000', 5, 222619, CAST(15440.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 410)
    INSERT @Registros VALUES (3354, 7, 12, 8, CAST(N'2023-10-17' AS Date), CAST(48666.3400000000 AS Decimal(18, 10)), 650, 3, 4, N'4011209000', 5, 288815, CAST(10030.5400000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 650)
    INSERT @Registros VALUES (3355, 7, 12, 8, CAST(N'2023-10-17' AS Date), CAST(8327.4500000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 288815, CAST(1716.3600000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 100)
    INSERT @Registros VALUES (3356, 6, 7, 3, CAST(N'2023-10-17' AS Date), CAST(18696.9300000000 AS Decimal(18, 10)), 184, 5, 6, N'4011209000', 5, 320970, CAST(6750.8700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 184)
    INSERT @Registros VALUES (3357, 37, 8, 4, CAST(N'2023-10-17' AS Date), CAST(45174.0500000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 554726, CAST(14646.7400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (3358, 30, 7, 3, CAST(N'2023-10-17' AS Date), CAST(1507.4800000000 AS Decimal(18, 10)), 17, 3, 4, N'4011209000', 5, 589478, CAST(235.9600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 17)
    INSERT @Registros VALUES (3359, 30, 7, 3, CAST(N'2023-10-17' AS Date), CAST(90009.5800000000 AS Decimal(18, 10)), 273, 3, 4, N'4011209000', 5, 597939, CAST(17489.8700000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 273)
    INSERT @Registros VALUES (3360, 44, 7, 3, CAST(N'2023-10-17' AS Date), CAST(57141.9700000000 AS Decimal(18, 10)), 252, 3, 4, N'4011209000', 5, 835330, CAST(13092.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 252)
    INSERT @Registros VALUES (3361, 51, 7, 3, CAST(N'2023-10-18' AS Date), CAST(27754.2200000000 AS Decimal(18, 10)), 232, 5, 6, N'4011209000', 5, 80460, CAST(13233.5200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 232)
    INSERT @Registros VALUES (3362, 23, 7, 3, CAST(N'2023-10-18' AS Date), CAST(16126.0200000000 AS Decimal(18, 10)), 125, 5, 6, N'4011209000', 5, 147401, CAST(7131.2500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 125)
    INSERT @Registros VALUES (3363, 23, 7, 3, CAST(N'2023-10-18' AS Date), CAST(33741.6900000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 273602, CAST(14291.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (3364, 23, 7, 3, CAST(N'2023-10-18' AS Date), CAST(34644.1400000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 5, 333047, CAST(15205.6800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (3365, 23, 7, 3, CAST(N'2023-10-18' AS Date), CAST(16824.2100000000 AS Decimal(18, 10)), 126, 5, 6, N'4011209000', 5, 469293, CAST(7602.8400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 126)
    INSERT @Registros VALUES (3366, 23, 7, 3, CAST(N'2023-10-18' AS Date), CAST(3868.1300000000 AS Decimal(18, 10)), 32, 5, 6, N'4011209000', 5, 489177, CAST(1706.3500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 32)
    INSERT @Registros VALUES (3367, 23, 7, 3, CAST(N'2023-10-18' AS Date), CAST(43518.8300000000 AS Decimal(18, 10)), 150, 3, 4, N'4011209000', 5, 743263, CAST(8139.7500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 150)
    INSERT @Registros VALUES (3368, 23, 7, 3, CAST(N'2023-10-18' AS Date), CAST(34601.5000000000 AS Decimal(18, 10)), 114, 3, 4, N'4011209000', 5, 743263, CAST(6555.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 114)
    INSERT @Registros VALUES (3369, 23, 7, 3, CAST(N'2023-10-18' AS Date), CAST(8165.1300000000 AS Decimal(18, 10)), 24, 3, 4, N'4011209000', 5, 743263, CAST(1432.8000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 24)
    INSERT @Registros VALUES (3370, 23, 7, 3, CAST(N'2023-10-18' AS Date), CAST(4328.4900000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 5, 743263, CAST(794.6000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 12)
    INSERT @Registros VALUES (3371, 52, 7, 3, CAST(N'2023-10-19' AS Date), CAST(14564.8000000000 AS Decimal(18, 10)), 120, 5, 6, N'4011209000', 5, 463143, CAST(5887.2900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 120)
    INSERT @Registros VALUES (3372, 7, 12, 8, CAST(N'2023-10-20' AS Date), CAST(14974.2600000000 AS Decimal(18, 10)), 200, 3, 4, N'4011209000', 5, 151856, CAST(3154.1800000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 200)
    INSERT @Registros VALUES (3373, 7, 12, 8, CAST(N'2023-10-20' AS Date), CAST(45800.9700000000 AS Decimal(18, 10)), 550, 3, 4, N'4011209000', 5, 151856, CAST(9647.5200000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 550)
    INSERT @Registros VALUES (3374, 61, 7, 3, CAST(N'2023-10-20' AS Date), CAST(30100.6400000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 436917, CAST(13500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3375, 56, 7, 3, CAST(N'2023-10-20' AS Date), CAST(50502.4000000000 AS Decimal(18, 10)), 570, 3, 4, N'4011209000', 5, 655722, CAST(10244.6100000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 570)
    INSERT @Registros VALUES (3376, 12, 1, 2, CAST(N'2023-10-23' AS Date), CAST(77427.2200000000 AS Decimal(18, 10)), 780, 5, 6, N'4011209000', 5, 694414, CAST(38250.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 780)
    INSERT @Registros VALUES (3377, 45, 7, 3, CAST(N'2023-10-23' AS Date), CAST(12799.9600000000 AS Decimal(18, 10)), 114, 14, 15, N'4011209000', 5, 977646, CAST(2440.1100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 114)
    INSERT @Registros VALUES (3378, 64, 7, 3, CAST(N'2023-10-24' AS Date), CAST(37179.4300000000 AS Decimal(18, 10)), 258, 5, 6, N'4011209000', 5, 865717, CAST(15150.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 258)
    INSERT @Registros VALUES (3379, 26, 7, 3, CAST(N'2023-10-24' AS Date), CAST(39080.9800000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 982278, CAST(15642.9600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3380, 42, 7, 3, CAST(N'2023-10-25' AS Date), CAST(66167.6400000000 AS Decimal(18, 10)), 282, 3, 4, N'4011209000', 5, 243981, CAST(13294.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 282)
    INSERT @Registros VALUES (3381, 13, 5, 6, CAST(N'2023-10-25' AS Date), CAST(70022.8500000000 AS Decimal(18, 10)), 610, 5, 6, N'4011209000', 5, 464031, CAST(29142.1000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 610)
    INSERT @Registros VALUES (3382, 35, 12, 8, CAST(N'2023-10-25' AS Date), CAST(17753.7100000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 802536, CAST(14700.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3383, 45, 7, 3, CAST(N'2023-10-25' AS Date), CAST(49634.3100000000 AS Decimal(18, 10)), 218, 20, 20, N'4011209000', 5, 972254, CAST(13307.9200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 218)
    INSERT @Registros VALUES (3384, 6, 7, 3, CAST(N'2023-10-26' AS Date), CAST(29605.3600000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 204545, CAST(13270.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3385, 56, 7, 3, CAST(N'2023-10-26' AS Date), CAST(50499.8600000000 AS Decimal(18, 10)), 570, 3, 4, N'4011209000', 5, 567743, CAST(10244.6100000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 570)
    INSERT @Registros VALUES (3386, 63, 12, 8, CAST(N'2023-10-26' AS Date), CAST(29196.9800000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 5, 602496, CAST(13540.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 254)
    INSERT @Registros VALUES (3387, 7, 12, 8, CAST(N'2023-10-27' AS Date), CAST(8126.8600000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 752327, CAST(1326.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 100)
    INSERT @Registros VALUES (3388, 7, 12, 8, CAST(N'2023-10-27' AS Date), CAST(76555.0500000000 AS Decimal(18, 10)), 942, 3, 4, N'4011209000', 5, 752327, CAST(12490.9200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 942)
    INSERT @Registros VALUES (3389, 7, 12, 8, CAST(N'2023-10-30' AS Date), CAST(41179.2100000000 AS Decimal(18, 10)), 550, 3, 4, N'4011209000', 5, 187574, CAST(8530.9600000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 550)
    INSERT @Registros VALUES (3390, 7, 12, 8, CAST(N'2023-10-30' AS Date), CAST(16654.9000000000 AS Decimal(18, 10)), 200, 3, 4, N'4011209000', 5, 187574, CAST(3450.3400000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 200)
    INSERT @Registros VALUES (3391, 54, 12, 8, CAST(N'2023-10-30' AS Date), CAST(12196.6600000000 AS Decimal(18, 10)), 210, 5, 6, N'4011209000', 5, 225261, CAST(9916.2300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 210)
    INSERT @Registros VALUES (3392, 8, 7, 3, CAST(N'2023-10-30' AS Date), CAST(936.1500000000 AS Decimal(18, 10)), 4, 5, 6, N'4011209000', 5, 540261, CAST(285.6000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 4)
    INSERT @Registros VALUES (3393, 24, 12, 8, CAST(N'2023-10-31' AS Date), CAST(35426.0000000000 AS Decimal(18, 10)), 268, 5, 6, N'4011209000', 5, 87028, CAST(13936.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 268)
    INSERT @Registros VALUES (3394, 30, 7, 3, CAST(N'2023-10-31' AS Date), CAST(38275.3600000000 AS Decimal(18, 10)), 253, 5, 6, N'4011209000', 5, 186934, CAST(16370.9600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 253)
    INSERT @Registros VALUES (3395, 59, 12, 8, CAST(N'2023-10-31' AS Date), CAST(63136.2300000000 AS Decimal(18, 10)), 598, 5, 6, N'4011209000', 5, 219308, CAST(27150.3000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 598)
    INSERT @Registros VALUES (3396, 59, 12, 8, CAST(N'2023-10-31' AS Date), CAST(36391.3400000000 AS Decimal(18, 10)), 365, 5, 6, N'4011209000', 5, 365254, CAST(14999.4900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 365)
    INSERT @Registros VALUES (3397, 26, 7, 3, CAST(N'2023-10-31' AS Date), CAST(36910.6400000000 AS Decimal(18, 10)), 271, 5, 6, N'4011209000', 5, 835836, CAST(14833.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 271)
    INSERT @Registros VALUES (3398, 45, 7, 3, CAST(N'2023-10-31' AS Date), CAST(28914.4600000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 890087, CAST(14100.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3399, 45, 7, 3, CAST(N'2023-10-31' AS Date), CAST(95280.0400000000 AS Decimal(18, 10)), 368, 3, 4, N'4011209000', 5, 911014, CAST(20461.2800000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 368)
    INSERT @Registros VALUES (3400, 51, 7, 3, CAST(N'2023-11-01' AS Date), CAST(82235.7900000000 AS Decimal(18, 10)), 750, 5, 6, N'4011209000', 5, 199514, CAST(42531.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 750)
    INSERT @Registros VALUES (3401, 44, 7, 3, CAST(N'2023-11-01' AS Date), CAST(36728.3400000000 AS Decimal(18, 10)), 136, 3, 4, N'4011209000', 5, 264091, CAST(7816.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 136)
    INSERT @Registros VALUES (3402, 46, 7, 3, CAST(N'2023-11-01' AS Date), CAST(24308.2000000000 AS Decimal(18, 10)), 216, 5, 6, N'4011209000', 5, 771089, CAST(9790.2200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 216)
    INSERT @Registros VALUES (3403, 12, 1, 2, CAST(N'2023-11-03' AS Date), CAST(54700.2900000000 AS Decimal(18, 10)), 558, 5, 6, N'4011209000', 5, 16899, CAST(23515.4700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 558)
    INSERT @Registros VALUES (3404, 56, 7, 3, CAST(N'2023-11-03' AS Date), CAST(50499.8600000000 AS Decimal(18, 10)), 570, 3, 4, N'4011209000', 5, 769325, CAST(10244.6100000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 570)
    INSERT @Registros VALUES (3405, 7, 12, 8, CAST(N'2023-11-03' AS Date), CAST(14974.2600000000 AS Decimal(18, 10)), 200, 3, 4, N'4011209000', 5, 969028, CAST(3154.1800000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 200)
    INSERT @Registros VALUES (3406, 7, 12, 8, CAST(N'2023-11-03' AS Date), CAST(45800.9700000000 AS Decimal(18, 10)), 550, 3, 4, N'4011209000', 5, 969028, CAST(9647.5200000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 550)
    INSERT @Registros VALUES (3407, 51, 7, 3, CAST(N'2023-11-06' AS Date), CAST(24672.7400000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 662615, CAST(11820.9000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (3408, 47, 7, 3, CAST(N'2023-11-07' AS Date), CAST(11044.3300000000 AS Decimal(18, 10)), 120, 3, 4, N'4011209000', 5, 339228, CAST(1589.6700000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 120)
    INSERT @Registros VALUES (3409, 30, 7, 3, CAST(N'2023-11-07' AS Date), CAST(31340.6700000000 AS Decimal(18, 10)), 99, 3, 4, N'4011209000', 5, 651305, CAST(6056.6400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 99)
    INSERT @Registros VALUES (3410, 27, 7, 3, CAST(N'2023-11-07' AS Date), CAST(1509.4400000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 5, 686797, CAST(195.0500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 12)
    INSERT @Registros VALUES (3411, 61, 7, 3, CAST(N'2023-11-08' AS Date), CAST(23581.9200000000 AS Decimal(18, 10)), 240, 5, 6, N'4011209000', 5, 298792, CAST(9272.2200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 240)
    INSERT @Registros VALUES (3412, 2, 12, 8, CAST(N'2023-11-08' AS Date), CAST(35967.8500000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 609581, CAST(15191.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (3413, 2, 12, 8, CAST(N'2023-11-08' AS Date), CAST(82862.9400000000 AS Decimal(18, 10)), 802, 5, 6, N'4011209000', 5, 695697, CAST(42640.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 802)
    INSERT @Registros VALUES (3414, 35, 12, 8, CAST(N'2023-11-08' AS Date), CAST(14530.9600000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 826717, CAST(11662.4200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (3415, 59, 12, 8, CAST(N'2023-11-09' AS Date), CAST(72251.3700000000 AS Decimal(18, 10)), 694, 5, 6, N'4011209000', 5, 296242, CAST(31617.9200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 694)
    INSERT @Registros VALUES (3416, 56, 7, 3, CAST(N'2023-11-09' AS Date), CAST(50502.4000000000 AS Decimal(18, 10)), 570, 3, 4, N'4011209000', 5, 481502, CAST(10244.6100000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 570)
    INSERT @Registros VALUES (3417, 51, 7, 3, CAST(N'2023-11-09' AS Date), CAST(53748.5800000000 AS Decimal(18, 10)), 516, 5, 6, N'4011209000', 5, 791655, CAST(26662.1700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 516)
    INSERT @Registros VALUES (3418, 61, 7, 3, CAST(N'2023-11-09' AS Date), CAST(36453.5100000000 AS Decimal(18, 10)), 332, 5, 6, N'4011209000', 5, 921801, CAST(16640.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 332)
    INSERT @Registros VALUES (3419, 60, 12, 8, CAST(N'2023-11-10' AS Date), CAST(23508.3400000000 AS Decimal(18, 10)), 214, 5, 6, N'4011209000', 5, 406243, CAST(9355.9400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 214)
    INSERT @Registros VALUES (3420, 2, 12, 8, CAST(N'2023-11-10' AS Date), CAST(38135.1300000000 AS Decimal(18, 10)), 340, 5, 6, N'4011209000', 5, 661047, CAST(16180.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 340)
    INSERT @Registros VALUES (3421, 51, 7, 3, CAST(N'2023-11-10' AS Date), CAST(12157.8000000000 AS Decimal(18, 10)), 100, 5, 6, N'4011209000', 5, 771495, CAST(4642.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 100)
    INSERT @Registros VALUES (3422, 61, 7, 3, CAST(N'2023-11-10' AS Date), CAST(8493.8800000000 AS Decimal(18, 10)), 61, 5, 6, N'4011209000', 5, 785203, CAST(3155.7000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 61)
    INSERT @Registros VALUES (3423, 42, 7, 3, CAST(N'2023-11-14' AS Date), CAST(2057.2000000000 AS Decimal(18, 10)), 20, 2, 2, N'4011209000', 5, 613845, CAST(449.5900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 20)
    INSERT @Registros VALUES (3424, 22, 7, 3, CAST(N'2023-11-15' AS Date), CAST(23656.0600000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 125373, CAST(13400.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (3425, 22, 7, 3, CAST(N'2023-11-15' AS Date), CAST(23814.5400000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 600194, CAST(13410.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (3426, 22, 7, 3, CAST(N'2023-11-15' AS Date), CAST(23672.1100000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 961261, CAST(13400.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (3427, 45, 7, 3, CAST(N'2023-11-16' AS Date), CAST(7769.1400000000 AS Decimal(18, 10)), 90, 3, 4, N'4011209000', 5, 369880, CAST(1446.7100000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 90)
    INSERT @Registros VALUES (3428, 56, 7, 3, CAST(N'2023-11-16' AS Date), CAST(50499.8600000000 AS Decimal(18, 10)), 570, 3, 4, N'4011209000', 5, 834946, CAST(10244.6100000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 570)
    INSERT @Registros VALUES (3429, 30, 7, 3, CAST(N'2023-11-17' AS Date), CAST(92131.6300000000 AS Decimal(18, 10)), 291, 3, 4, N'4011209000', 5, 54829, CAST(17518.0700000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 291)
    INSERT @Registros VALUES (3430, 45, 7, 3, CAST(N'2023-11-17' AS Date), CAST(51248.0000000000 AS Decimal(18, 10)), 600, 3, 4, N'4011209000', 5, 877641, CAST(8751.7900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 600)
    INSERT @Registros VALUES (3431, 8, 7, 3, CAST(N'2023-11-20' AS Date), CAST(5525.8800000000 AS Decimal(18, 10)), 40, 5, 6, N'4011209000', 5, 448576, CAST(1601.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (3432, 7, 12, 8, CAST(N'2023-11-20' AS Date), CAST(41179.2100000000 AS Decimal(18, 10)), 550, 3, 4, N'4011209000', 5, 870220, CAST(8530.9600000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 550)
    INSERT @Registros VALUES (3433, 7, 12, 8, CAST(N'2023-11-20' AS Date), CAST(16654.9000000000 AS Decimal(18, 10)), 200, 3, 4, N'4011209000', 5, 870220, CAST(3450.3400000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 200)
    INSERT @Registros VALUES (3434, 44, 7, 3, CAST(N'2023-11-20' AS Date), CAST(55983.3900000000 AS Decimal(18, 10)), 239, 3, 4, N'4011209000', 5, 917219, CAST(12888.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 239)
    INSERT @Registros VALUES (3435, 51, 7, 3, CAST(N'2023-11-21' AS Date), CAST(83705.7500000000 AS Decimal(18, 10)), 804, 5, 6, N'4011209000', 5, 335703, CAST(41930.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 804)
    INSERT @Registros VALUES (3436, 51, 7, 3, CAST(N'2023-11-22' AS Date), CAST(26368.7700000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 142243, CAST(12860.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (3437, 45, 7, 3, CAST(N'2023-11-22' AS Date), CAST(10501.9900000000 AS Decimal(18, 10)), 90, 14, 15, N'4011209000', 5, 148703, CAST(1970.5400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 90)
    INSERT @Registros VALUES (3438, 12, 1, 2, CAST(N'2023-11-22' AS Date), CAST(53494.8200000000 AS Decimal(18, 10)), 536, 5, 6, N'4011209000', 5, 199181, CAST(23563.0900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 536)
    INSERT @Registros VALUES (3439, 47, 7, 3, CAST(N'2023-11-22' AS Date), CAST(6782.2800000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 464116, CAST(895.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (3440, 12, 1, 2, CAST(N'2023-11-22' AS Date), CAST(51342.0000000000 AS Decimal(18, 10)), 489, 5, 6, N'4011209000', 5, 649579, CAST(25970.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 489)
    INSERT @Registros VALUES (3441, 13, 5, 6, CAST(N'2023-11-22' AS Date), CAST(33586.5200000000 AS Decimal(18, 10)), 274, 5, 6, N'4011209000', 5, 708082, CAST(14290.8000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 274)
    INSERT @Registros VALUES (3442, 2, 12, 8, CAST(N'2023-11-22' AS Date), CAST(37564.8000000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 800521, CAST(15920.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (3443, 51, 7, 3, CAST(N'2023-11-23' AS Date), CAST(48327.7600000000 AS Decimal(18, 10)), 476, 5, 6, N'4011209000', 5, 348499, CAST(24076.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 476)
    INSERT @Registros VALUES (3444, 47, 7, 3, CAST(N'2023-11-23' AS Date), CAST(13968.9100000000 AS Decimal(18, 10)), 120, 3, 4, N'4011209000', 5, 402814, CAST(2238.6000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 120)
    INSERT @Registros VALUES (3445, 13, 5, 6, CAST(N'2023-11-23' AS Date), CAST(67356.0200000000 AS Decimal(18, 10)), 524, 5, 6, N'4011209000', 5, 940952, CAST(28930.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 524)
    INSERT @Registros VALUES (3446, 7, 12, 8, CAST(N'2023-11-24' AS Date), CAST(41179.2100000000 AS Decimal(18, 10)), 550, 3, 4, N'4011209000', 5, 874351, CAST(8530.9600000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 550)
    INSERT @Registros VALUES (3447, 7, 12, 8, CAST(N'2023-11-24' AS Date), CAST(16654.9000000000 AS Decimal(18, 10)), 200, 3, 4, N'4011209000', 5, 874351, CAST(3450.3400000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 200)
    INSERT @Registros VALUES (3448, 59, 12, 8, CAST(N'2023-11-27' AS Date), CAST(1738.3500000000 AS Decimal(18, 10)), 60, 5, 6, N'4011209000', 5, 28392, CAST(612.9600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 60)
    INSERT @Registros VALUES (3449, 7, 12, 8, CAST(N'2023-11-27' AS Date), CAST(8126.8600000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 559985, CAST(1326.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 100)
    INSERT @Registros VALUES (3450, 7, 12, 8, CAST(N'2023-11-27' AS Date), CAST(76555.0500000000 AS Decimal(18, 10)), 942, 3, 4, N'4011209000', 5, 559985, CAST(12490.9200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 942)
    INSERT @Registros VALUES (3451, 45, 7, 3, CAST(N'2023-11-27' AS Date), CAST(85851.5900000000 AS Decimal(18, 10)), 792, 5, 6, N'4011209000', 5, 714489, CAST(42300.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 792)
    INSERT @Registros VALUES (3452, 30, 7, 3, CAST(N'2023-11-28' AS Date), CAST(7257.6500000000 AS Decimal(18, 10)), 19, 10, 3, N'4011209000', 5, 138527, CAST(1362.7100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 19)
    INSERT @Registros VALUES (3453, 2, 12, 8, CAST(N'2023-11-28' AS Date), CAST(39916.8500000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 938525, CAST(16960.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (3454, 45, 7, 3, CAST(N'2023-11-29' AS Date), CAST(4210.7800000000 AS Decimal(18, 10)), 48, 3, 4, N'4011209000', 5, 328465, CAST(756.1400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 48)
    INSERT @Registros VALUES (3455, 45, 7, 3, CAST(N'2023-11-29' AS Date), CAST(11345.7100000000 AS Decimal(18, 10)), 137, 3, 4, N'4011209000', 5, 328465, CAST(2037.3600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 137)
    INSERT @Registros VALUES (3456, 45, 7, 3, CAST(N'2023-11-29' AS Date), CAST(13142.3800000000 AS Decimal(18, 10)), 77, 3, 4, N'4011209000', 5, 328465, CAST(2359.9900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 77)
    INSERT @Registros VALUES (3457, 6, 7, 3, CAST(N'2023-11-29' AS Date), CAST(7001.8800000000 AS Decimal(18, 10)), 64, 5, 6, N'4011209000', 5, 993044, CAST(3272.7300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 64)
    INSERT @Registros VALUES (3458, 6, 7, 3, CAST(N'2023-11-29' AS Date), CAST(29354.4800000000 AS Decimal(18, 10)), 148, 5, 6, N'4011209000', 5, 993044, CAST(9075.3600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 148)
    INSERT @Registros VALUES (3459, 6, 7, 3, CAST(N'2023-11-29' AS Date), CAST(6969.9800000000 AS Decimal(18, 10)), 64, 5, 6, N'4011209000', 5, 993044, CAST(3272.7300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 64)
    INSERT @Registros VALUES (3460, 65, 12, 8, CAST(N'2023-11-30' AS Date), CAST(30806.5000000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 5, 220463, CAST(13674.0600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 256)
    INSERT @Registros VALUES (3461, 56, 7, 3, CAST(N'2023-11-30' AS Date), CAST(50322.6700000000 AS Decimal(18, 10)), 568, 3, 4, N'4011209000', 5, 240294, CAST(10208.6600000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 568)
    INSERT @Registros VALUES (3462, 45, 7, 3, CAST(N'2023-11-30' AS Date), CAST(57594.7600000000 AS Decimal(18, 10)), 528, 5, 6, N'4011209000', 5, 281189, CAST(28200.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 528)
    INSERT @Registros VALUES (3463, 26, 7, 3, CAST(N'2023-11-30' AS Date), CAST(37620.5200000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 320825, CAST(15398.7200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3464, 56, 7, 3, CAST(N'2023-11-30' AS Date), CAST(50056.8800000000 AS Decimal(18, 10)), 565, 3, 4, N'4011209000', 5, 461888, CAST(10154.7500000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 565)
    INSERT @Registros VALUES (3465, 55, 12, 8, CAST(N'2023-11-30' AS Date), CAST(40025.1900000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 5, 505847, CAST(14830.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (3466, 8, 7, 3, CAST(N'2023-11-30' AS Date), CAST(1717.9400000000 AS Decimal(18, 10)), 16, 5, 6, N'4011209000', 5, 678314, CAST(527.9600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 16)
    INSERT @Registros VALUES (3467, 39, 12, 8, CAST(N'2023-11-30' AS Date), CAST(2052.3600000000 AS Decimal(18, 10)), 8, 3, 4, N'4011209000', 5, 733296, CAST(488.4800000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 8)
    INSERT @Registros VALUES (3468, 45, 7, 3, CAST(N'2023-11-30' AS Date), CAST(4065.0400000000 AS Decimal(18, 10)), 60, 16, 17, N'4011209000', 5, 837175, CAST(712.5500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 60)
    INSERT @Registros VALUES (3469, 30, 7, 3, CAST(N'2023-11-30' AS Date), CAST(2720.2200000000 AS Decimal(18, 10)), 4, 8, 9, N'4011209000', 5, 981999, CAST(414.9400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 4)
    INSERT @Registros VALUES (3470, 10, 7, 3, CAST(N'2023-12-01' AS Date), CAST(880.6200000000 AS Decimal(18, 10)), 8, 3, 4, N'4011209000', 5, 460642, CAST(109.5400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 8)
    INSERT @Registros VALUES (3471, 45, 7, 3, CAST(N'2023-12-04' AS Date), CAST(2410.5200000000 AS Decimal(18, 10)), 34, 16, 17, N'4011209000', 5, 667092, CAST(382.5300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 34)
    INSERT @Registros VALUES (3472, 25, 7, 3, CAST(N'2023-12-04' AS Date), CAST(23896.9600000000 AS Decimal(18, 10)), 296, 5, 6, N'4011209000', 5, 845019, CAST(12852.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 296)
    INSERT @Registros VALUES (3473, 39, 12, 8, CAST(N'2023-12-05' AS Date), CAST(3038.7600000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 5, 53370, CAST(756.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 12)
    INSERT @Registros VALUES (3474, 9, 9, 5, CAST(N'2023-12-05' AS Date), CAST(21226.6700000000 AS Decimal(18, 10)), 124, 5, 6, N'4011209000', 5, 510398, CAST(7906.8000000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 124)
    INSERT @Registros VALUES (3475, 51, 7, 3, CAST(N'2023-12-06' AS Date), CAST(128264.4400000000 AS Decimal(18, 10)), 1294, 5, 6, N'4011209000', 5, 609688, CAST(63053.1300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 1294)
    INSERT @Registros VALUES (3476, 27, 7, 3, CAST(N'2023-12-07' AS Date), CAST(7199.5800000000 AS Decimal(18, 10)), 58, 3, 4, N'4011209000', 5, 879461, CAST(907.0500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 58)
    INSERT @Registros VALUES (3477, 13, 5, 6, CAST(N'2023-12-07' AS Date), CAST(17740.5200000000 AS Decimal(18, 10)), 90, 12, 25, N'4011209000', 5, 952523, CAST(5614.8200000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 90)
    INSERT @Registros VALUES (3478, 13, 5, 6, CAST(N'2023-12-07' AS Date), CAST(7595.9600000000 AS Decimal(18, 10)), 60, 5, 25, N'4011209000', 5, 952523, CAST(3219.2300000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 60)
    INSERT @Registros VALUES (3479, 8, 7, 3, CAST(N'2023-12-08' AS Date), CAST(1040.1200000000 AS Decimal(18, 10)), 12, 5, 6, N'4011209000', 5, 226440, CAST(337.9000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 12)
    INSERT @Registros VALUES (3480, 47, 7, 3, CAST(N'2023-12-08' AS Date), CAST(21791.4900000000 AS Decimal(18, 10)), 180, 3, 4, N'4011209000', 5, 251639, CAST(3249.9000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 180)
    INSERT @Registros VALUES (3481, 22, 7, 3, CAST(N'2023-12-08' AS Date), CAST(27520.6200000000 AS Decimal(18, 10)), 246, 5, 6, N'4011209000', 5, 685006, CAST(14879.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 246)
    INSERT @Registros VALUES (3482, 42, 7, 3, CAST(N'2023-12-12' AS Date), CAST(3222.9600000000 AS Decimal(18, 10)), 12, 2, 2, N'4011209000', 5, 425701, CAST(721.2000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 12)
    INSERT @Registros VALUES (3483, 44, 7, 3, CAST(N'2023-12-12' AS Date), CAST(56040.6300000000 AS Decimal(18, 10)), 233, 3, 4, N'4011209000', 5, 730422, CAST(12676.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 233)
    INSERT @Registros VALUES (3484, 7, 12, 8, CAST(N'2023-12-12' AS Date), CAST(11230.6900000000 AS Decimal(18, 10)), 150, 3, 4, N'4011209000', 5, 906881, CAST(2361.2200000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 150)
    INSERT @Registros VALUES (3485, 7, 12, 8, CAST(N'2023-12-12' AS Date), CAST(11829.6700000000 AS Decimal(18, 10)), 158, 3, 4, N'4011209000', 5, 906881, CAST(2487.1500000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 158)
    INSERT @Registros VALUES (3486, 7, 12, 8, CAST(N'2023-12-12' AS Date), CAST(49964.7000000000 AS Decimal(18, 10)), 600, 3, 4, N'4011209000', 5, 906881, CAST(10504.9300000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 600)
    INSERT @Registros VALUES (3487, 7, 12, 8, CAST(N'2023-12-12' AS Date), CAST(4080.4500000000 AS Decimal(18, 10)), 49, 3, 4, N'4011209000', 5, 906881, CAST(857.9100000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 49)
    INSERT @Registros VALUES (3488, 6, 7, 3, CAST(N'2023-12-13' AS Date), CAST(5681.6200000000 AS Decimal(18, 10)), 112, 5, 6, N'4011209000', 5, 426066, CAST(1868.9200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 112)
    INSERT @Registros VALUES (3489, 6, 7, 3, CAST(N'2023-12-13' AS Date), CAST(7101.2100000000 AS Decimal(18, 10)), 50, 5, 6, N'4011209000', 5, 426066, CAST(2783.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 50)
    INSERT @Registros VALUES (3490, 61, 7, 3, CAST(N'2023-12-13' AS Date), CAST(34317.2800000000 AS Decimal(18, 10)), 317, 5, 6, N'4011209000', 5, 465993, CAST(11979.5200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 317)
    INSERT @Registros VALUES (3491, 30, 7, 3, CAST(N'2023-12-14' AS Date), CAST(68638.4000000000 AS Decimal(18, 10)), 520, 5, 6, N'4011209000', 5, 62642, CAST(30887.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 520)
    INSERT @Registros VALUES (3492, 9, 9, 5, CAST(N'2023-12-14' AS Date), CAST(20894.0200000000 AS Decimal(18, 10)), 120, 5, 6, N'4011209000', 5, 813030, CAST(7875.0000000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 120)
    INSERT @Registros VALUES (3493, 7, 12, 8, CAST(N'2023-12-15' AS Date), CAST(8126.8600000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 253460, CAST(1326.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 100)
    INSERT @Registros VALUES (3494, 7, 12, 8, CAST(N'2023-12-15' AS Date), CAST(76555.0500000000 AS Decimal(18, 10)), 942, 3, 4, N'4011209000', 5, 253460, CAST(12490.9200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 942)
    INSERT @Registros VALUES (3495, 30, 7, 3, CAST(N'2023-12-15' AS Date), CAST(4512.4600000000 AS Decimal(18, 10)), 52, 3, 4, N'4011209000', 5, 451540, CAST(606.4900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 52)
    INSERT @Registros VALUES (3496, 7, 12, 8, CAST(N'2023-12-15' AS Date), CAST(18717.8200000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 5, 923942, CAST(3933.8200000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 250)
    INSERT @Registros VALUES (3497, 7, 12, 8, CAST(N'2023-12-15' AS Date), CAST(41637.2500000000 AS Decimal(18, 10)), 500, 3, 4, N'4011209000', 5, 923942, CAST(8750.6800000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 500)
    INSERT @Registros VALUES (3498, 47, 7, 3, CAST(N'2023-12-18' AS Date), CAST(7481.7800000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 5, 301556, CAST(981.6600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 60)
    INSERT @Registros VALUES (3499, 27, 7, 3, CAST(N'2023-12-18' AS Date), CAST(9517.1000000000 AS Decimal(18, 10)), 74, 3, 4, N'4011209000', 5, 787840, CAST(1169.7800000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 74)
    INSERT @Registros VALUES (3500, 2, 12, 8, CAST(N'2023-12-20' AS Date), CAST(38369.1100000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 337159, CAST(16360.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (3501, 42, 7, 3, CAST(N'2023-12-20' AS Date), CAST(55882.2000000000 AS Decimal(18, 10)), 182, 3, 4, N'4011209000', 5, 654311, CAST(11629.5700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 182)
    INSERT @Registros VALUES (3502, 51, 7, 3, CAST(N'2023-12-20' AS Date), CAST(23377.9700000000 AS Decimal(18, 10)), 221, 5, 6, N'4011209000', 5, 791308, CAST(11171.9400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 221)
    INSERT @Registros VALUES (3503, 26, 7, 3, CAST(N'2023-12-22' AS Date), CAST(38666.6500000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 180928, CAST(15455.5200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3504, 60, 12, 8, CAST(N'2023-12-22' AS Date), CAST(22881.5700000000 AS Decimal(18, 10)), 298, 5, 6, N'4011209000', 1, 367310, CAST(8874.4500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 298)
    INSERT @Registros VALUES (3505, 10, 7, 3, CAST(N'2023-12-22' AS Date), CAST(4079.2800000000 AS Decimal(18, 10)), 28, 3, 4, N'4011209000', 5, 451966, CAST(515.0500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 28)
    INSERT @Registros VALUES (3506, 51, 7, 3, CAST(N'2023-12-22' AS Date), CAST(111637.1900000000 AS Decimal(18, 10)), 962, 5, 6, N'4011209000', 5, 476267, CAST(46386.2200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 962)
    INSERT @Registros VALUES (3507, 59, 12, 8, CAST(N'2023-12-22' AS Date), CAST(33584.6500000000 AS Decimal(18, 10)), 350, 5, 6, N'4011209000', 5, 828900, CAST(13926.3100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 350)
    INSERT @Registros VALUES (3508, 61, 7, 3, CAST(N'2023-12-27' AS Date), CAST(29975.3000000000 AS Decimal(18, 10)), 256, 5, 6, N'4011209000', 5, 44625, CAST(13640.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 256)
    INSERT @Registros VALUES (3509, 47, 7, 3, CAST(N'2023-12-27' AS Date), CAST(46740.1500000000 AS Decimal(18, 10)), 388, 3, 4, N'4011209000', 5, 321644, CAST(7083.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 388)
    INSERT @Registros VALUES (3510, 23, 7, 3, CAST(N'2023-12-27' AS Date), CAST(35963.3400000000 AS Decimal(18, 10)), 290, 5, 6, N'4011209000', 5, 460787, CAST(14258.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 290)
    INSERT @Registros VALUES (3511, 27, 7, 3, CAST(N'2023-12-27' AS Date), CAST(2558.0500000000 AS Decimal(18, 10)), 24, 3, 4, N'4011209000', 5, 863588, CAST(348.6400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 24)
    INSERT @Registros VALUES (3512, 30, 7, 3, CAST(N'2023-12-28' AS Date), CAST(90423.9700000000 AS Decimal(18, 10)), 274, 3, 4, N'4011209000', 1, 89219, CAST(17485.4700000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 274)
    INSERT @Registros VALUES (3513, 13, 5, 6, CAST(N'2023-12-28' AS Date), CAST(21561.8000000000 AS Decimal(18, 10)), 160, 5, 25, N'4011209000', 5, 147846, CAST(8194.5700000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 160)
    INSERT @Registros VALUES (3514, 13, 5, 6, CAST(N'2023-12-28' AS Date), CAST(7098.7000000000 AS Decimal(18, 10)), 64, 5, 25, N'4011209000', 5, 147846, CAST(2981.0500000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 64)
    INSERT @Registros VALUES (3515, 45, 7, 3, CAST(N'2023-12-28' AS Date), CAST(90592.3600000000 AS Decimal(18, 10)), 350, 3, 4, N'4011209000', 5, 245040, CAST(21321.8900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 350)
    INSERT @Registros VALUES (3516, 22, 7, 3, CAST(N'2023-12-29' AS Date), CAST(34316.3000000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 5, 512421, CAST(15335.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (3517, 23, 7, 3, CAST(N'2023-12-29' AS Date), CAST(36420.2200000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 1, 555888, CAST(14919.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (3518, 23, 7, 3, CAST(N'2023-12-29' AS Date), CAST(33812.4200000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 1, 650627, CAST(14291.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (3519, 8, 7, 3, CAST(N'2023-12-29' AS Date), CAST(3777.9700000000 AS Decimal(18, 10)), 20, 5, 6, N'4011209000', 5, 695576, CAST(1269.7600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (3520, 66, 12, 8, CAST(N'2023-12-29' AS Date), CAST(28848.4700000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 755182, CAST(15871.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (3521, 56, 7, 3, CAST(N'2022-09-01' AS Date), CAST(34368.8200000000 AS Decimal(18, 10)), 398, 3, 4, N'4011209000', 5, 391418, CAST(7179.9200000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 398)
    INSERT @Registros VALUES (3522, 20, 7, 3, CAST(N'2022-09-01' AS Date), CAST(36241.1000000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 444252, CAST(13950.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (3523, 7, 12, 8, CAST(N'2022-09-01' AS Date), CAST(59921.1200000000 AS Decimal(18, 10)), 685, 3, 4, N'4011209000', 5, 497675, CAST(12120.3900000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 685)
    INSERT @Registros VALUES (3524, 56, 7, 3, CAST(N'2022-09-01' AS Date), CAST(47667.3000000000 AS Decimal(18, 10)), 552, 3, 4, N'4011209000', 5, 736488, CAST(9958.0800000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 552)
    INSERT @Registros VALUES (3525, 7, 12, 8, CAST(N'2023-09-01' AS Date), CAST(8126.6500000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 138391, CAST(1326.0100000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 100)
    INSERT @Registros VALUES (3526, 7, 12, 8, CAST(N'2023-09-01' AS Date), CAST(76552.7900000000 AS Decimal(18, 10)), 942, 3, 4, N'4011209000', 5, 138391, CAST(12490.9200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 942)
    INSERT @Registros VALUES (3527, 7, 12, 8, CAST(N'2023-09-01' AS Date), CAST(48895.1100000000 AS Decimal(18, 10)), 550, 3, 4, N'4011209000', 5, 237057, CAST(9607.2700000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 550)
    INSERT @Registros VALUES (3528, 7, 12, 8, CAST(N'2023-09-01' AS Date), CAST(27975.9900000000 AS Decimal(18, 10)), 350, 3, 4, N'4011209000', 5, 237057, CAST(5496.9300000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 350)
    INSERT @Registros VALUES (3529, 12, 1, 2, CAST(N'2023-09-01' AS Date), CAST(28246.6500000000 AS Decimal(18, 10)), 231, 5, 6, N'4011209000', 5, 414550, CAST(13640.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 231)
    INSERT @Registros VALUES (3530, 40, 10, 2, CAST(N'2023-09-01' AS Date), CAST(139198.3800000000 AS Decimal(18, 10)), 842, 5, 6, N'4011209000', 5, 843351, CAST(52520.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 842)
    INSERT @Registros VALUES (3531, 61, 7, 3, CAST(N'2019-09-02' AS Date), CAST(32908.5600000000 AS Decimal(18, 10)), 251, 5, 6, N'4011209000', 713, 151088, CAST(14440.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 251)
    INSERT @Registros VALUES (3532, 8, 7, 3, CAST(N'2020-09-02' AS Date), CAST(28642.0600000000 AS Decimal(18, 10)), 192, 5, 6, N'4011209000', 64, 135662, CAST(12282.8400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 192)
    INSERT @Registros VALUES (3533, 30, 7, 3, CAST(N'2021-09-02' AS Date), CAST(1640.1100000000 AS Decimal(18, 10)), 24, 3, 4, N'4011209000', 5, 289550, CAST(313.4400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 24)
    INSERT @Registros VALUES (3534, 44, 7, 3, CAST(N'2022-09-02' AS Date), CAST(74122.7200000000 AS Decimal(18, 10)), 255, 3, 4, N'4011209000', 5, 221941, CAST(14475.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 255)
    INSERT @Registros VALUES (3535, 27, 7, 3, CAST(N'2019-09-03' AS Date), CAST(2002.7000000000 AS Decimal(18, 10)), 24, 3, 4, N'4011209000', 661, 151498, CAST(335.8400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 24)
    INSERT @Registros VALUES (3536, 61, 7, 3, CAST(N'2019-09-03' AS Date), CAST(5781.0400000000 AS Decimal(18, 10)), 91, 5, 6, N'4011209000', 741, 151648, CAST(1977.5400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 91)
    INSERT @Registros VALUES (3537, 8, 7, 3, CAST(N'2019-09-03' AS Date), CAST(25953.0700000000 AS Decimal(18, 10)), 150, 5, 6, N'4011209000', 44, 151721, CAST(10317.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 150)
    INSERT @Registros VALUES (3538, 23, 7, 3, CAST(N'2019-09-03' AS Date), CAST(102676.2600000000 AS Decimal(18, 10)), 765, 5, 6, N'4011209000', 313, 151980, CAST(42323.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 765)
    INSERT @Registros VALUES (3539, 26, 7, 3, CAST(N'2019-09-03' AS Date), CAST(36938.0500000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 9, 152220, CAST(15352.5000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (3540, 9, 9, 5, CAST(N'2019-09-03' AS Date), CAST(66528.0000000000 AS Decimal(18, 10)), 500, 5, 6, N'4011209000', 100, 152351, CAST(29751.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 500)
    INSERT @Registros VALUES (3541, 12, 1, 2, CAST(N'2020-09-03' AS Date), CAST(27021.6400000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 430, 136441, CAST(14012.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (3542, 24, 12, 8, CAST(N'2020-09-03' AS Date), CAST(30230.0000000000 AS Decimal(18, 10)), 276, 5, 6, N'4011209000', 154, 136876, CAST(14540.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 276)
    INSERT @Registros VALUES (3543, 22, 7, 3, CAST(N'2020-09-03' AS Date), CAST(24453.1500000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 145, 136888, CAST(14156.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (3544, 23, 7, 3, CAST(N'2021-09-03' AS Date), CAST(64919.7900000000 AS Decimal(18, 10)), 288, 3, 4, N'4011209000', 5, 188497, CAST(17091.4200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 288)
    INSERT @Registros VALUES (3545, 45, 7, 3, CAST(N'2021-09-03' AS Date), CAST(2487.6000000000 AS Decimal(18, 10)), 34, 3, 4, N'4011209000', 5, 830323, CAST(492.3900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 34)
    INSERT @Registros VALUES (3546, 31, 7, 3, CAST(N'2019-09-04' AS Date), CAST(944.1500000000 AS Decimal(18, 10)), 10, 5, 6, N'4011209000', 221, 152779, CAST(284.4300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 10)
    INSERT @Registros VALUES (3547, 30, 7, 3, CAST(N'2019-09-04' AS Date), CAST(16245.5700000000 AS Decimal(18, 10)), 83, 3, 4, N'4011209000', 825, 153093, CAST(4109.8500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 83)
    INSERT @Registros VALUES (3548, 30, 7, 3, CAST(N'2020-09-04' AS Date), CAST(55013.2100000000 AS Decimal(18, 10)), 217, 3, 4, N'4011209000', 777, 137108, CAST(12475.9700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 217)
    INSERT @Registros VALUES (3549, 30, 7, 3, CAST(N'2020-09-04' AS Date), CAST(241.3200000000 AS Decimal(18, 10)), 3, 3, 4, N'4011209000', 802, 137108, CAST(44.6800000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 3)
    INSERT @Registros VALUES (3550, 22, 7, 3, CAST(N'2023-09-04' AS Date), CAST(75669.5900000000 AS Decimal(18, 10)), 228, 3, 4, N'4011209000', 5, 71911, CAST(13798.7200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 228)
    INSERT @Registros VALUES (3551, 61, 7, 3, CAST(N'2023-09-04' AS Date), CAST(28887.8900000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 327433, CAST(9726.5500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (3552, 51, 7, 3, CAST(N'2023-09-04' AS Date), CAST(27952.4100000000 AS Decimal(18, 10)), 239, 5, 6, N'4011209000', 5, 622661, CAST(13217.5700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 239)
    INSERT @Registros VALUES (3553, 25, 7, 3, CAST(N'2019-09-05' AS Date), CAST(24704.8200000000 AS Decimal(18, 10)), 202, 5, 6, N'4011209000', 100, 153728, CAST(11420.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 202)
    INSERT @Registros VALUES (3554, 2, 12, 8, CAST(N'2022-09-05' AS Date), CAST(41737.6200000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 291803, CAST(15100.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 280)
    INSERT @Registros VALUES (3555, 61, 7, 3, CAST(N'2022-09-05' AS Date), CAST(40797.5000000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 714913, CAST(14284.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (3556, 20, 7, 3, CAST(N'2023-09-05' AS Date), CAST(33340.6400000000 AS Decimal(18, 10)), 410, 5, 6, N'4011209000', 5, 233793, CAST(17205.9500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 410)
    INSERT @Registros VALUES (3557, 20, 7, 3, CAST(N'2023-09-05' AS Date), CAST(25582.6100000000 AS Decimal(18, 10)), 336, 5, 6, N'4011209000', 5, 233793, CAST(13202.3000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 336)
    INSERT @Registros VALUES (3558, 10, 7, 3, CAST(N'2023-09-05' AS Date), CAST(13440.0000000000 AS Decimal(18, 10)), 82, 3, 4, N'4011209000', 5, 941799, CAST(1663.6900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 82)
    INSERT @Registros VALUES (3559, 30, 7, 3, CAST(N'2021-09-06' AS Date), CAST(35697.5700000000 AS Decimal(18, 10)), 136, 3, 4, N'4011209000', 5, 6398, CAST(8246.7700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 136)
    INSERT @Registros VALUES (3560, 23, 7, 3, CAST(N'2021-09-06' AS Date), CAST(42537.0700000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 319022, CAST(14200.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 266)
    INSERT @Registros VALUES (3561, 23, 7, 3, CAST(N'2021-09-06' AS Date), CAST(42537.0700000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 353571, CAST(14190.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 266)
    INSERT @Registros VALUES (3562, 12, 1, 2, CAST(N'2021-09-06' AS Date), CAST(77568.6600000000 AS Decimal(18, 10)), 534, 5, 6, N'4011209000', 5, 441801, CAST(29680.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 534)
    INSERT @Registros VALUES (3563, 22, 7, 3, CAST(N'2021-09-06' AS Date), CAST(32975.8200000000 AS Decimal(18, 10)), 266, 5, 6, N'4011209000', 5, 520589, CAST(14400.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 266)
    INSERT @Registros VALUES (3564, 7, 12, 8, CAST(N'2021-09-06' AS Date), CAST(3626.0900000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 676956, CAST(620.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 50)
    INSERT @Registros VALUES (3565, 7, 12, 8, CAST(N'2021-09-06' AS Date), CAST(64544.4000000000 AS Decimal(18, 10)), 890, 3, 4, N'4011209000', 5, 676956, CAST(11044.9000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 890)
    INSERT @Registros VALUES (3566, 7, 12, 8, CAST(N'2021-09-06' AS Date), CAST(3626.0900000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 5, 676956, CAST(620.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 50)
    INSERT @Registros VALUES (3567, 7, 12, 8, CAST(N'2021-09-06' AS Date), CAST(64544.4000000000 AS Decimal(18, 10)), 890, 3, 4, N'4011209000', 5, 676956, CAST(11044.9000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 890)
    INSERT @Registros VALUES (3568, 26, 7, 3, CAST(N'2022-09-06' AS Date), CAST(46573.4900000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 827651, CAST(15782.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3569, 23, 7, 3, CAST(N'2020-09-07' AS Date), CAST(54126.4900000000 AS Decimal(18, 10)), 228, 3, 4, N'4011209000', 100, 137862, CAST(14951.5400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 228)
    INSERT @Registros VALUES (3570, 42, 7, 3, CAST(N'2020-09-07' AS Date), CAST(50464.3600000000 AS Decimal(18, 10)), 224, 3, 4, N'4011209000', 127, 137915, CAST(13953.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 224)
    INSERT @Registros VALUES (3571, 2, 12, 8, CAST(N'2020-09-07' AS Date), CAST(26855.9300000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 468, 138388, CAST(14160.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (3572, 51, 7, 3, CAST(N'2021-09-07' AS Date), CAST(8430.7600000000 AS Decimal(18, 10)), 54, 5, 6, N'4011209000', 5, 411091, CAST(2484.9200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 54)
    INSERT @Registros VALUES (3573, 23, 7, 3, CAST(N'2021-09-07' AS Date), CAST(40294.7300000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 5, 936874, CAST(13826.2000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 255)
    INSERT @Registros VALUES (3574, 45, 7, 3, CAST(N'2022-09-07' AS Date), CAST(6694.7100000000 AS Decimal(18, 10)), 59, 3, 4, N'4011209000', 5, 31148, CAST(1151.0600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 59)
    INSERT @Registros VALUES (3575, 45, 7, 3, CAST(N'2022-09-07' AS Date), CAST(3951.0000000000 AS Decimal(18, 10)), 34, 3, 4, N'4011209000', 5, 31148, CAST(679.3200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 34)
    INSERT @Registros VALUES (3576, 45, 7, 3, CAST(N'2022-09-07' AS Date), CAST(14614.1100000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 5, 31148, CAST(2512.6900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 60)
    INSERT @Registros VALUES (3577, 51, 7, 3, CAST(N'2022-09-07' AS Date), CAST(74294.3400000000 AS Decimal(18, 10)), 473, 5, 6, N'4011209000', 5, 589298, CAST(29370.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 473)
    INSERT @Registros VALUES (3578, 56, 7, 3, CAST(N'2022-09-07' AS Date), CAST(4069.2200000000 AS Decimal(18, 10)), 47, 3, 4, N'4011209000', 5, 627403, CAST(847.8800000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 47)
    INSERT @Registros VALUES (3579, 61, 7, 3, CAST(N'2022-09-07' AS Date), CAST(42932.7000000000 AS Decimal(18, 10)), 340, 5, 6, N'4011209000', 5, 842807, CAST(13851.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 340)
    INSERT @Registros VALUES (3580, 45, 7, 3, CAST(N'2022-09-07' AS Date), CAST(19804.0100000000 AS Decimal(18, 10)), 78, 3, 4, N'4011209000', 5, 890173, CAST(4248.8000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 78)
    INSERT @Registros VALUES (3581, 45, 7, 3, CAST(N'2022-09-07' AS Date), CAST(88593.4200000000 AS Decimal(18, 10)), 272, 3, 4, N'4011209000', 5, 890173, CAST(19007.0200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 272)
    INSERT @Registros VALUES (3582, 9, 9, 5, CAST(N'2022-09-07' AS Date), CAST(52059.2600000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 942176, CAST(15735.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3583, 6, 7, 3, CAST(N'2023-09-07' AS Date), CAST(21728.1600000000 AS Decimal(18, 10)), 200, 5, 6, N'4011209000', 5, 406306, CAST(10227.2700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 200)
    INSERT @Registros VALUES (3584, 6, 7, 3, CAST(N'2023-09-07' AS Date), CAST(7532.8700000000 AS Decimal(18, 10)), 64, 5, 6, N'4011209000', 5, 566639, CAST(3411.6500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 64)
    INSERT @Registros VALUES (3585, 47, 7, 3, CAST(N'2020-09-08' AS Date), CAST(39882.7600000000 AS Decimal(18, 10)), 432, 3, 4, N'4011209000', 395, 139637, CAST(9424.9400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 432)
    INSERT @Registros VALUES (3586, 47, 7, 3, CAST(N'2020-09-08' AS Date), CAST(37607.0800000000 AS Decimal(18, 10)), 362, 3, 4, N'4011209000', 395, 139637, CAST(7701.9000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 362)
    INSERT @Registros VALUES (3587, 47, 7, 3, CAST(N'2020-09-08' AS Date), CAST(1806.4600000000 AS Decimal(18, 10)), 21, 3, 4, N'4011209000', 395, 139637, CAST(359.7500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 21)
    INSERT @Registros VALUES (3588, 47, 7, 3, CAST(N'2020-09-08' AS Date), CAST(383.5800000000 AS Decimal(18, 10)), 3, 3, 4, N'4011209000', 395, 139637, CAST(64.6400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 3)
    INSERT @Registros VALUES (3589, 47, 7, 3, CAST(N'2021-09-08' AS Date), CAST(8320.2000000000 AS Decimal(18, 10)), 91, 3, 4, N'4011209000', 5, 437442, CAST(1665.1700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 91)
    INSERT @Registros VALUES (3590, 45, 7, 3, CAST(N'2021-09-08' AS Date), CAST(7184.7700000000 AS Decimal(18, 10)), 81, 3, 4, N'4011209000', 5, 841027, CAST(1377.5300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 81)
    INSERT @Registros VALUES (3591, 45, 7, 3, CAST(N'2021-09-08' AS Date), CAST(1647.6500000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 5, 892402, CAST(307.1400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 20)
    INSERT @Registros VALUES (3592, 45, 7, 3, CAST(N'2021-09-08' AS Date), CAST(9095.4700000000 AS Decimal(18, 10)), 108, 3, 4, N'4011209000', 5, 892402, CAST(1695.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 108)
    INSERT @Registros VALUES (3593, 44, 7, 3, CAST(N'2022-09-08' AS Date), CAST(36396.5500000000 AS Decimal(18, 10)), 152, 3, 4, N'4011209000', 5, 78452, CAST(6803.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 152)
    INSERT @Registros VALUES (3594, 7, 12, 8, CAST(N'2022-09-08' AS Date), CAST(19347.5800000000 AS Decimal(18, 10)), 246, 3, 4, N'4011209000', 5, 84359, CAST(3776.1000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 246)
    INSERT @Registros VALUES (3595, 7, 12, 8, CAST(N'2022-09-08' AS Date), CAST(8179.4600000000 AS Decimal(18, 10)), 104, 3, 4, N'4011209000', 5, 84359, CAST(1596.4000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 104)
    INSERT @Registros VALUES (3596, 44, 7, 3, CAST(N'2022-09-08' AS Date), CAST(9457.0300000000 AS Decimal(18, 10)), 58, 3, 4, N'4011209000', 5, 615404, CAST(1512.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 58)
    INSERT @Registros VALUES (3597, 7, 12, 8, CAST(N'2022-09-08' AS Date), CAST(33240.9200000000 AS Decimal(18, 10)), 380, 3, 4, N'4011209000', 5, 765791, CAST(6723.7200000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 380)
    INSERT @Registros VALUES (3598, 7, 12, 8, CAST(N'2022-09-08' AS Date), CAST(26330.3000000000 AS Decimal(18, 10)), 301, 3, 4, N'4011209000', 5, 765791, CAST(5325.8900000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 301)
    INSERT @Registros VALUES (3599, 44, 7, 3, CAST(N'2023-09-08' AS Date), CAST(43887.7600000000 AS Decimal(18, 10)), 211, 3, 4, N'4011209000', 5, 83715, CAST(10007.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 211)
    INSERT @Registros VALUES (3600, 15, 7, 3, CAST(N'2019-09-09' AS Date), CAST(2980.0600000000 AS Decimal(18, 10)), 42, 14, 15, N'4011209000', 256, 155492, CAST(833.2800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 42)
    INSERT @Registros VALUES (3601, 15, 7, 3, CAST(N'2019-09-09' AS Date), CAST(1387.2900000000 AS Decimal(18, 10)), 8, 14, 15, N'4011209000', 268, 155492, CAST(271.8700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 8)
    INSERT @Registros VALUES (3602, 15, 7, 3, CAST(N'2019-09-09' AS Date), CAST(9488.5800000000 AS Decimal(18, 10)), 87, 14, 15, N'4011209000', 258, 155492, CAST(2653.1600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 87)
    INSERT @Registros VALUES (3603, 12, 1, 2, CAST(N'2019-09-09' AS Date), CAST(23552.4000000000 AS Decimal(18, 10)), 120, 14, 15, N'4011209000', 414, 155561, CAST(7240.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 120)
    INSERT @Registros VALUES (3604, 61, 7, 3, CAST(N'2020-09-09' AS Date), CAST(27791.2400000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 680, 139905, CAST(13886.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (3605, 45, 7, 3, CAST(N'2020-09-09' AS Date), CAST(15617.6000000000 AS Decimal(18, 10)), 88, 3, 4, N'4011209000', 622, 140028, CAST(3280.2200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 88)
    INSERT @Registros VALUES (3606, 45, 7, 3, CAST(N'2020-09-09' AS Date), CAST(1933.4000000000 AS Decimal(18, 10)), 8, 3, 4, N'4011209000', 620, 140028, CAST(406.0800000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 8)
    INSERT @Registros VALUES (3607, 45, 7, 3, CAST(N'2020-09-09' AS Date), CAST(4931.4100000000 AS Decimal(18, 10)), 62, 3, 4, N'4011209000', 465, 140028, CAST(1035.7700000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 62)
    INSERT @Registros VALUES (3608, 45, 7, 3, CAST(N'2020-09-09' AS Date), CAST(1854.2300000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 610, 140028, CAST(389.4500000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 20)
    INSERT @Registros VALUES (3609, 30, 7, 3, CAST(N'2021-09-09' AS Date), CAST(27120.0700000000 AS Decimal(18, 10)), 143, 3, 4, N'4011209000', 5, 147149, CAST(7047.6300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 143)
    INSERT @Registros VALUES (3610, 42, 7, 3, CAST(N'2021-09-09' AS Date), CAST(27337.0000000000 AS Decimal(18, 10)), 120, 2, 2, N'4011209000', 5, 228247, CAST(6981.8300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 120)
    INSERT @Registros VALUES (3611, 48, 12, 8, CAST(N'2021-09-09' AS Date), CAST(42519.0300000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 422037, CAST(13953.6000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 260)
    INSERT @Registros VALUES (3612, 61, 7, 3, CAST(N'2022-09-09' AS Date), CAST(45864.8400000000 AS Decimal(18, 10)), 427, 5, 6, N'4011209000', 5, 125027, CAST(14610.6300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 427)
    INSERT @Registros VALUES (3613, 30, 7, 3, CAST(N'2022-09-09' AS Date), CAST(4294.0100000000 AS Decimal(18, 10)), 11, 18, 3, N'4011209000', 5, 590445, CAST(773.7200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 11)
    INSERT @Registros VALUES (3614, 30, 7, 3, CAST(N'2022-09-09' AS Date), CAST(6779.5000000000 AS Decimal(18, 10)), 20, 10, 3, N'4011209000', 5, 590445, CAST(1442.6200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (3615, 47, 7, 3, CAST(N'2019-09-10' AS Date), CAST(1684.2200000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 468, 156562, CAST(384.9000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (3616, 45, 7, 3, CAST(N'2019-09-10' AS Date), CAST(3319.6200000000 AS Decimal(18, 10)), 42, 16, 17, N'4011209000', 409, 156706, CAST(604.2200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 42)
    INSERT @Registros VALUES (3617, 45, 7, 3, CAST(N'2019-09-10' AS Date), CAST(5163.2900000000 AS Decimal(18, 10)), 80, 16, 17, N'4011209000', 410, 156706, CAST(939.7900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 80)
    INSERT @Registros VALUES (3618, 61, 7, 3, CAST(N'2020-09-10' AS Date), CAST(31016.4000000000 AS Decimal(18, 10)), 330, 5, 6, N'4011209000', 696, 140672, CAST(15380.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 330)
    INSERT @Registros VALUES (3619, 26, 7, 3, CAST(N'2021-09-10' AS Date), CAST(90952.3900000000 AS Decimal(18, 10)), 518, 5, 6, N'4011209000', 5, 28251, CAST(30047.9200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 518)
    INSERT @Registros VALUES (3620, 25, 7, 3, CAST(N'2021-09-10' AS Date), CAST(40766.5400000000 AS Decimal(18, 10)), 302, 5, 6, N'4011209000', 5, 834428, CAST(14780.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 302)
    INSERT @Registros VALUES (3621, 45, 7, 3, CAST(N'2019-09-11' AS Date), CAST(17744.9900000000 AS Decimal(18, 10)), 65, 3, 4, N'4011209000', 481, 157031, CAST(5708.3000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 65)
    INSERT @Registros VALUES (3622, 61, 7, 3, CAST(N'2019-09-11' AS Date), CAST(3915.4400000000 AS Decimal(18, 10)), 44, 5, 6, N'4011209000', 753, 157066, CAST(1337.8800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 44)
    INSERT @Registros VALUES (3623, 8, 7, 3, CAST(N'2019-09-11' AS Date), CAST(33627.5700000000 AS Decimal(18, 10)), 204, 5, 6, N'4011209000', 37, 157150, CAST(13126.3200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 204)
    INSERT @Registros VALUES (3624, 23, 7, 3, CAST(N'2019-09-11' AS Date), CAST(33770.8200000000 AS Decimal(18, 10)), 255, 5, 6, N'4011209000', 100, 157495, CAST(13667.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 255)
    INSERT @Registros VALUES (3625, 45, 7, 3, CAST(N'2019-09-11' AS Date), CAST(2656.3000000000 AS Decimal(18, 10)), 34, 14, 15, N'4011209000', 476, 157681, CAST(556.7000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 34)
    INSERT @Registros VALUES (3626, 45, 7, 3, CAST(N'2019-09-11' AS Date), CAST(10388.8600000000 AS Decimal(18, 10)), 94, 14, 15, N'4011209000', 483, 157681, CAST(2177.2600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 94)
    INSERT @Registros VALUES (3627, 45, 7, 3, CAST(N'2020-09-11' AS Date), CAST(53255.5600000000 AS Decimal(18, 10)), 512, 5, 6, N'4011209000', 464, 142062, CAST(29980.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 512)
    INSERT @Registros VALUES (3628, 30, 7, 3, CAST(N'2023-09-11' AS Date), CAST(638.8800000000 AS Decimal(18, 10)), 7, 3, 4, N'4011209000', 5, 476932, CAST(104.6000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 7)
    INSERT @Registros VALUES (3629, 30, 7, 3, CAST(N'2023-09-11' AS Date), CAST(73135.0900000000 AS Decimal(18, 10)), 228, 3, 4, N'4011209000', 5, 728906, CAST(14246.0400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 228)
    INSERT @Registros VALUES (3630, 12, 1, 2, CAST(N'2019-09-12' AS Date), CAST(21615.0900000000 AS Decimal(18, 10)), 188, 5, 6, N'4011209000', 415, 158300, CAST(10030.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 188)
    INSERT @Registros VALUES (3631, 45, 7, 3, CAST(N'2019-09-12' AS Date), CAST(1545.9500000000 AS Decimal(18, 10)), 18, 3, 4, N'4011209000', 547, 158385, CAST(127.6400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 18)
    INSERT @Registros VALUES (3632, 45, 7, 3, CAST(N'2019-09-12' AS Date), CAST(786.5800000000 AS Decimal(18, 10)), 8, 3, 4, N'4011209000', 589, 158385, CAST(398.9600000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 8)
    INSERT @Registros VALUES (3633, 45, 7, 3, CAST(N'2019-09-12' AS Date), CAST(21338.1400000000 AS Decimal(18, 10)), 80, 3, 4, N'4011209000', 590, 158385, CAST(2356.7400000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 80)
    INSERT @Registros VALUES (3634, 59, 12, 8, CAST(N'2022-09-12' AS Date), CAST(118892.9700000000 AS Decimal(18, 10)), 871, 5, 6, N'4011209000', 5, 254537, CAST(44660.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 871)
    INSERT @Registros VALUES (3635, 22, 7, 3, CAST(N'2022-09-12' AS Date), CAST(34862.8800000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 5, 648992, CAST(13487.9400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (3636, 40, 10, 2, CAST(N'2022-09-12' AS Date), CAST(44825.1600000000 AS Decimal(18, 10)), 340, 5, 6, N'4011209000', 5, 777553, CAST(15320.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 340)
    INSERT @Registros VALUES (3637, 47, 7, 3, CAST(N'2023-09-12' AS Date), CAST(42770.9300000000 AS Decimal(18, 10)), 303, 3, 4, N'4011209000', 5, 580447, CAST(6647.0900000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 303)
    INSERT @Registros VALUES (3638, 23, 7, 3, CAST(N'2023-09-12' AS Date), CAST(4194.3000000000 AS Decimal(18, 10)), 28, 3, 4, N'4011209000', 5, 927078, CAST(750.6600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 28)
    INSERT @Registros VALUES (3639, 42, 7, 3, CAST(N'2019-09-13' AS Date), CAST(45724.2000000000 AS Decimal(18, 10)), 220, 3, 4, N'4011209000', 120, 158766, CAST(13437.5600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (3640, 47, 7, 3, CAST(N'2022-09-13' AS Date), CAST(30774.1900000000 AS Decimal(18, 10)), 270, 3, 4, N'4011209000', 5, 311848, CAST(4114.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 270)
    INSERT @Registros VALUES (3641, 47, 7, 3, CAST(N'2022-09-13' AS Date), CAST(33165.1300000000 AS Decimal(18, 10)), 273, 3, 4, N'4011209000', 5, 311848, CAST(4572.6100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 273)
    INSERT @Registros VALUES (3642, 47, 7, 3, CAST(N'2022-09-13' AS Date), CAST(19784.4200000000 AS Decimal(18, 10)), 160, 3, 4, N'4011209000', 5, 311848, CAST(2902.6500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 160)
    INSERT @Registros VALUES (3643, 51, 7, 3, CAST(N'2023-09-13' AS Date), CAST(7701.3400000000 AS Decimal(18, 10)), 74, 5, 6, N'4011209000', 5, 162356, CAST(2848.6300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 74)
    INSERT @Registros VALUES (3644, 45, 7, 3, CAST(N'2023-09-13' AS Date), CAST(5532.1600000000 AS Decimal(18, 10)), 74, 16, 17, N'4011209000', 5, 467154, CAST(827.7500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 74)
    INSERT @Registros VALUES (3645, 45, 7, 3, CAST(N'2023-09-13' AS Date), CAST(9875.5700000000 AS Decimal(18, 10)), 86, 14, 15, N'4011209000', 5, 881923, CAST(1569.0100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 86)
    INSERT @Registros VALUES (3646, 45, 7, 3, CAST(N'2020-09-14' AS Date), CAST(84856.2000000000 AS Decimal(18, 10)), 318, 3, 4, N'4011209000', 615, 142689, CAST(20702.8200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 318)
    INSERT @Registros VALUES (3647, 45, 7, 3, CAST(N'2020-09-14' AS Date), CAST(4432.4100000000 AS Decimal(18, 10)), 56, 3, 4, N'4011209000', 619, 142689, CAST(1081.4000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 56)
    INSERT @Registros VALUES (3648, 47, 7, 3, CAST(N'2021-09-14' AS Date), CAST(5090.1200000000 AS Decimal(18, 10)), 70, 3, 4, N'4011209000', 5, 189145, CAST(1117.1300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 70)
    INSERT @Registros VALUES (3649, 42, 7, 3, CAST(N'2021-09-14' AS Date), CAST(51160.5200000000 AS Decimal(18, 10)), 228, 2, 2, N'4011209000', 5, 972682, CAST(13084.0100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 228)
    INSERT @Registros VALUES (3650, 42, 7, 3, CAST(N'2022-09-14' AS Date), CAST(64271.1000000000 AS Decimal(18, 10)), 250, 3, 4, N'4011209000', 5, 170464, CAST(13271.7700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (3651, 61, 7, 3, CAST(N'2022-09-14' AS Date), CAST(26321.1000000000 AS Decimal(18, 10)), 153, 5, 6, N'4011209000', 5, 943504, CAST(7142.8200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 153)
    INSERT @Registros VALUES (3652, 7, 12, 8, CAST(N'2023-09-14' AS Date), CAST(23979.4200000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 5, 412816, CAST(4709.8400000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 300)
    INSERT @Registros VALUES (3653, 7, 12, 8, CAST(N'2023-09-14' AS Date), CAST(40005.0900000000 AS Decimal(18, 10)), 450, 3, 4, N'4011209000', 5, 412816, CAST(7857.4600000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 450)
    INSERT @Registros VALUES (3654, 45, 7, 3, CAST(N'2023-09-14' AS Date), CAST(10147.4800000000 AS Decimal(18, 10)), 96, 3, 4, N'4011209000', 5, 773021, CAST(1866.7400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 96)
    INSERT @Registros VALUES (3655, 45, 7, 3, CAST(N'2023-09-14' AS Date), CAST(2982.5100000000 AS Decimal(18, 10)), 32, 3, 4, N'4011209000', 5, 773021, CAST(548.6700000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 32)
    INSERT @Registros VALUES (3656, 45, 7, 3, CAST(N'2023-09-14' AS Date), CAST(37024.4300000000 AS Decimal(18, 10)), 230, 3, 4, N'4011209000', 5, 773021, CAST(6811.0500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 230)
    INSERT @Registros VALUES (3657, 24, 12, 8, CAST(N'2023-09-14' AS Date), CAST(45420.0000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 792539, CAST(16030.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (3658, 41, 7, 3, CAST(N'2020-09-15' AS Date), CAST(3941.8900000000 AS Decimal(18, 10)), 20, 5, 18, N'4011209000', 100, 143528, CAST(947.6800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 20)
    INSERT @Registros VALUES (3659, 44, 7, 3, CAST(N'2022-09-15' AS Date), CAST(89898.2100000000 AS Decimal(18, 10)), 538, 5, 6, N'4011209000', 5, 84220, CAST(29640.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 538)
    INSERT @Registros VALUES (3660, 24, 12, 8, CAST(N'2022-09-15' AS Date), CAST(44116.2400000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 5, 553674, CAST(13728.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3661, 22, 7, 3, CAST(N'2022-09-15' AS Date), CAST(42476.5500000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 5, 736847, CAST(15280.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (3662, 57, 12, 8, CAST(N'2022-09-15' AS Date), CAST(34655.0800000000 AS Decimal(18, 10)), 766, 5, 6, N'4011209000', 5, 772810, CAST(12991.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 766)
    INSERT @Registros VALUES (3663, 45, 7, 3, CAST(N'2022-09-15' AS Date), CAST(3861.5800000000 AS Decimal(18, 10)), 40, 3, 4, N'4011209000', 5, 827015, CAST(648.9800000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 40)
    INSERT @Registros VALUES (3664, 45, 7, 3, CAST(N'2022-09-15' AS Date), CAST(6456.6600000000 AS Decimal(18, 10)), 81, 3, 4, N'4011209000', 5, 827015, CAST(1085.1200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 81)
    INSERT @Registros VALUES (3665, 64, 7, 3, CAST(N'2023-09-15' AS Date), CAST(37219.1500000000 AS Decimal(18, 10)), 258, 5, 6, N'4011209000', 5, 539012, CAST(15080.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 258)
    INSERT @Registros VALUES (3666, 47, 7, 3, CAST(N'2019-09-16' AS Date), CAST(2162.2900000000 AS Decimal(18, 10)), 24, 22, 22, N'4011209000', 319, 160190, CAST(676.0300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 24)
    INSERT @Registros VALUES (3667, 35, 12, 8, CAST(N'2021-09-16' AS Date), CAST(19025.6700000000 AS Decimal(18, 10)), 206, 5, 6, N'4011209000', 5, 553541, CAST(10842.5500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 206)
    INSERT @Registros VALUES (3668, 45, 7, 3, CAST(N'2022-09-16' AS Date), CAST(13248.7300000000 AS Decimal(18, 10)), 40, 3, 4, N'4011209000', 5, 170360, CAST(2274.8400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 40)
    INSERT @Registros VALUES (3669, 7, 12, 8, CAST(N'2022-09-16' AS Date), CAST(59921.1200000000 AS Decimal(18, 10)), 685, 3, 4, N'4011209000', 5, 538169, CAST(12120.3900000000 AS Decimal(18, 10)), NULL, 0, 4, 1, 685)
    INSERT @Registros VALUES (3670, 23, 7, 3, CAST(N'2022-09-16' AS Date), CAST(16235.5500000000 AS Decimal(18, 10)), 120, 5, 6, N'4011209000', 5, 678162, CAST(6034.8000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 120)
    INSERT @Registros VALUES (3671, 29, 12, 8, CAST(N'2019-09-17' AS Date), CAST(32172.4800000000 AS Decimal(18, 10)), 247, 5, 6, N'4011209000', 838, 160473, CAST(14916.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 247)
    INSERT @Registros VALUES (3672, 44, 7, 3, CAST(N'2019-09-17' AS Date), CAST(47335.9600000000 AS Decimal(18, 10)), 342, 3, 4, N'4011209000', 378, 160538, CAST(9796.2000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 342)
    INSERT @Registros VALUES (3673, 42, 7, 3, CAST(N'2019-09-17' AS Date), CAST(24549.6500000000 AS Decimal(18, 10)), 290, 8, 9, N'4011201000', 475, 160686, CAST(6601.9300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 290)
    INSERT @Registros VALUES (3674, 12, 1, 2, CAST(N'2020-09-17' AS Date), CAST(26332.9700000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 430, 145414, CAST(13886.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (3675, 12, 1, 2, CAST(N'2020-09-17' AS Date), CAST(25583.5400000000 AS Decimal(18, 10)), 276, 5, 6, N'4011209000', 437, 145416, CAST(14520.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 276)
    INSERT @Registros VALUES (3676, 45, 7, 3, CAST(N'2020-09-17' AS Date), CAST(7396.4300000000 AS Decimal(18, 10)), 73, 14, 15, N'4011209000', 654, 145524, CAST(1230.0400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 73)
    INSERT @Registros VALUES (3677, 47, 7, 3, CAST(N'2020-09-17' AS Date), CAST(2239.8200000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 468, 145669, CAST(533.0700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 30)
    INSERT @Registros VALUES (3678, 7, 12, 8, CAST(N'2021-09-17' AS Date), CAST(7544.4600000000 AS Decimal(18, 10)), 161, 3, 4, N'4011209000', 5, 76978, CAST(2489.2700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 161)
    INSERT @Registros VALUES (3679, 7, 12, 8, CAST(N'2021-09-17' AS Date), CAST(6254.4000000000 AS Decimal(18, 10)), 120, 3, 4, N'4011209000', 5, 76978, CAST(2063.6200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 120)
    INSERT @Registros VALUES (3680, 7, 12, 8, CAST(N'2021-09-17' AS Date), CAST(17572.5000000000 AS Decimal(18, 10)), 375, 3, 4, N'4011209000', 5, 76978, CAST(5797.9900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 375)
    INSERT @Registros VALUES (3681, 64, 7, 3, CAST(N'2021-09-17' AS Date), CAST(45393.3800000000 AS Decimal(18, 10)), 276, 5, 6, N'4011209000', 5, 609077, CAST(14490.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 276)
    INSERT @Registros VALUES (3682, 23, 7, 3, CAST(N'2019-09-18' AS Date), CAST(30384.8800000000 AS Decimal(18, 10)), 234, 5, 6, N'4011209000', 100, 161381, CAST(12972.9600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 234)
    INSERT @Registros VALUES (3683, 23, 7, 3, CAST(N'2019-09-18' AS Date), CAST(33590.4700000000 AS Decimal(18, 10)), 274, 5, 6, N'4011209000', 100, 161381, CAST(13982.2200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 274)
    INSERT @Registros VALUES (3684, 51, 7, 3, CAST(N'2019-09-18' AS Date), CAST(25220.7000000000 AS Decimal(18, 10)), 220, 5, 6, N'4011209000', 117, 161418, CAST(12780.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 220)
    INSERT @Registros VALUES (3685, 61, 7, 3, CAST(N'2019-09-18' AS Date), CAST(1375.8100000000 AS Decimal(18, 10)), 24, 5, 6, N'4011209000', 676, 162164, CAST(473.2200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 24)
    INSERT @Registros VALUES (3686, 13, 5, 6, CAST(N'2023-09-18' AS Date), CAST(28153.3100000000 AS Decimal(18, 10)), 224, 5, 25, N'4011209000', 5, 359181, CAST(12159.9100000000 AS Decimal(18, 10)), NULL, 0, 1, 1, 224)
    INSERT @Registros VALUES (3687, 42, 7, 3, CAST(N'2019-09-19' AS Date), CAST(50048.8400000000 AS Decimal(18, 10)), 302, 2, 2, N'4011209000', 508, 162760, CAST(13879.0900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 302)
    INSERT @Registros VALUES (3688, 15, 7, 3, CAST(N'2022-09-19' AS Date), CAST(8016.3400000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 5, 295601, CAST(1831.8000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 30)
    INSERT @Registros VALUES (3689, 45, 7, 3, CAST(N'2022-09-19' AS Date), CAST(112664.0900000000 AS Decimal(18, 10)), 529, 20, 20, N'4011209000', 5, 439334, CAST(33644.6200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 529)
    INSERT @Registros VALUES (3690, 51, 7, 3, CAST(N'2022-09-19' AS Date), CAST(100478.1200000000 AS Decimal(18, 10)), 677, 5, 6, N'4011209000', 5, 848145, CAST(36786.1900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 677)
    INSERT @Registros VALUES (3691, 2, 12, 8, CAST(N'2021-09-20' AS Date), CAST(80813.9700000000 AS Decimal(18, 10)), 560, 5, 6, N'4011209000', 5, 98343, CAST(29860.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 560)
    INSERT @Registros VALUES (3692, 45, 7, 3, CAST(N'2021-09-20' AS Date), CAST(7934.4500000000 AS Decimal(18, 10)), 91, 14, 15, N'4011209000', 5, 109421, CAST(1548.2100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 91)
    INSERT @Registros VALUES (3693, 15, 7, 3, CAST(N'2021-09-20' AS Date), CAST(13340.9400000000 AS Decimal(18, 10)), 62, 3, 4, N'4011209000', 5, 390195, CAST(3425.0600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 62)
    INSERT @Registros VALUES (3694, 42, 7, 3, CAST(N'2021-09-20' AS Date), CAST(56060.4200000000 AS Decimal(18, 10)), 270, 3, 4, N'4011209000', 5, 480271, CAST(14290.6600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 270)
    INSERT @Registros VALUES (3695, 59, 12, 8, CAST(N'2021-09-20' AS Date), CAST(78523.7300000000 AS Decimal(18, 10)), 504, 5, 6, N'4011209000', 5, 925618, CAST(29120.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 504)
    INSERT @Registros VALUES (3696, 12, 1, 2, CAST(N'2021-09-20' AS Date), CAST(79584.3900000000 AS Decimal(18, 10)), 599, 5, 6, N'4011209000', 5, 944341, CAST(27849.5900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 599)
    INSERT @Registros VALUES (3697, 45, 7, 3, CAST(N'2022-09-20' AS Date), CAST(10801.7800000000 AS Decimal(18, 10)), 142, 3, 4, N'4011209000', 5, 111790, CAST(1791.9100000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 142)
    INSERT @Registros VALUES (3698, 45, 7, 3, CAST(N'2022-09-20' AS Date), CAST(7657.5800000000 AS Decimal(18, 10)), 101, 3, 4, N'4011209000', 5, 111790, CAST(1270.3200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 101)
    INSERT @Registros VALUES (3699, 30, 7, 3, CAST(N'2022-09-20' AS Date), CAST(7305.1200000000 AS Decimal(18, 10)), 85, 3, 4, N'4011209000', 5, 462579, CAST(1105.6400000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 85)
    INSERT @Registros VALUES (3700, 44, 7, 3, CAST(N'2022-09-20' AS Date), CAST(29298.1100000000 AS Decimal(18, 10)), 165, 3, 4, N'4011209000', 5, 488975, CAST(4668.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 165)
    INSERT @Registros VALUES (3701, 7, 12, 8, CAST(N'2022-09-20' AS Date), CAST(59921.1200000000 AS Decimal(18, 10)), 685, 3, 4, N'4011209000', 5, 553258, CAST(12120.3900000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 685)
    INSERT @Registros VALUES (3702, 44, 7, 3, CAST(N'2022-09-20' AS Date), CAST(28984.5500000000 AS Decimal(18, 10)), 103, 3, 4, N'4011209000', 5, 737658, CAST(5322.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 103)
    INSERT @Registros VALUES (3703, 27, 7, 3, CAST(N'2022-09-20' AS Date), CAST(8359.5200000000 AS Decimal(18, 10)), 165, 3, 4, N'4011209000', 5, 886419, CAST(1074.7700000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 165)
    INSERT @Registros VALUES (3704, 45, 7, 3, CAST(N'2023-09-20' AS Date), CAST(94329.1700000000 AS Decimal(18, 10)), 316, 3, 4, N'4011209000', 5, 60437, CAST(19443.0500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 316)
    INSERT @Registros VALUES (3705, 63, 12, 8, CAST(N'2023-09-20' AS Date), CAST(12170.9900000000 AS Decimal(18, 10)), 103, 5, 6, N'4011209000', 5, 77295, CAST(5168.6300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 103)
    INSERT @Registros VALUES (3706, 51, 7, 3, CAST(N'2023-09-20' AS Date), CAST(18438.0600000000 AS Decimal(18, 10)), 228, 5, 6, N'4011209000', 5, 565625, CAST(6158.2400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 228)
    INSERT @Registros VALUES (3707, 2, 12, 8, CAST(N'2020-09-21' AS Date), CAST(26759.3500000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 468, 146810, CAST(14160.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (3708, 7, 12, 8, CAST(N'2021-09-21' AS Date), CAST(20587.9400000000 AS Decimal(18, 10)), 435, 3, 4, N'4011209000', 5, 232903, CAST(6769.1300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 435)
    INSERT @Registros VALUES (3709, 7, 12, 8, CAST(N'2021-09-21' AS Date), CAST(12528.6000000000 AS Decimal(18, 10)), 238, 3, 4, N'4011209000', 5, 232903, CAST(4119.2900000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 238)
    INSERT @Registros VALUES (3710, 44, 7, 3, CAST(N'2021-09-21' AS Date), CAST(60318.6700000000 AS Decimal(18, 10)), 356, 5, 6, N'4011209000', 5, 242084, CAST(19510.7700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 356)
    INSERT @Registros VALUES (3711, 51, 7, 3, CAST(N'2021-09-21' AS Date), CAST(8288.7800000000 AS Decimal(18, 10)), 60, 6, 7, N'4011209000', 5, 461238, CAST(1550.5000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 60)
    INSERT @Registros VALUES (3712, 7, 12, 8, CAST(N'2021-09-21' AS Date), CAST(11264.2000000000 AS Decimal(18, 10)), 238, 3, 4, N'4011209000', 5, 689565, CAST(3742.3600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 238)
    INSERT @Registros VALUES (3713, 7, 12, 8, CAST(N'2021-09-21' AS Date), CAST(22898.9200000000 AS Decimal(18, 10)), 435, 3, 4, N'4011209000', 5, 689565, CAST(7607.8300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 435)
    INSERT @Registros VALUES (3714, 56, 7, 3, CAST(N'2022-09-21' AS Date), CAST(50499.8600000000 AS Decimal(18, 10)), 570, 3, 4, N'4011209000', 5, 216366, CAST(10244.6100000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 570)
    INSERT @Registros VALUES (3715, 56, 7, 3, CAST(N'2022-09-21' AS Date), CAST(50499.8600000000 AS Decimal(18, 10)), 570, 3, 4, N'4011209000', 5, 433431, CAST(10244.6100000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 570)
    INSERT @Registros VALUES (3716, 42, 7, 3, CAST(N'2022-09-21' AS Date), CAST(7681.4400000000 AS Decimal(18, 10)), 26, 2, 2, N'4011209000', 5, 884199, CAST(1436.0300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 26)
    INSERT @Registros VALUES (3717, 7, 12, 8, CAST(N'2022-09-21' AS Date), CAST(9184.9900000000 AS Decimal(18, 10)), 105, 3, 4, N'4011209000', 5, 985806, CAST(1857.8700000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 105)
    INSERT @Registros VALUES (3718, 7, 12, 8, CAST(N'2022-09-21' AS Date), CAST(50736.1300000000 AS Decimal(18, 10)), 580, 3, 4, N'4011209000', 5, 985806, CAST(10262.5200000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 580)
    INSERT @Registros VALUES (3719, 44, 7, 3, CAST(N'2023-09-21' AS Date), CAST(64460.9700000000 AS Decimal(18, 10)), 479, 5, 6, N'4011209000', 5, 125249, CAST(25067.1000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 479)
    INSERT @Registros VALUES (3720, 6, 7, 3, CAST(N'2023-09-21' AS Date), CAST(22363.2700000000 AS Decimal(18, 10)), 190, 5, 6, N'4011209000', 5, 136430, CAST(10128.3500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 190)
    INSERT @Registros VALUES (3721, 28, 7, 3, CAST(N'2020-09-22' AS Date), CAST(3270.4400000000 AS Decimal(18, 10)), 16, 3, 4, N'4011209000', 170, 147653, CAST(601.8800000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 16)
    INSERT @Registros VALUES (3722, 28, 7, 3, CAST(N'2020-09-22' AS Date), CAST(915.3400000000 AS Decimal(18, 10)), 2, 22, 4, N'4011209000', 170, 147653, CAST(168.4600000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 2)
    INSERT @Registros VALUES (3723, 28, 7, 3, CAST(N'2020-09-22' AS Date), CAST(4025.4500000000 AS Decimal(18, 10)), 10, 3, 4, N'4011209000', 170, 147653, CAST(704.4100000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 10)
    INSERT @Registros VALUES (3724, 25, 7, 3, CAST(N'2020-09-22' AS Date), CAST(493.7800000000 AS Decimal(18, 10)), 8, 5, 6, N'4011209000', 100, 148381, CAST(327.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 8)
    INSERT @Registros VALUES (3725, 25, 7, 3, CAST(N'2020-09-22' AS Date), CAST(27649.0200000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 100, 148381, CAST(14953.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 280)
    INSERT @Registros VALUES (3726, 47, 7, 3, CAST(N'2021-09-22' AS Date), CAST(30371.4800000000 AS Decimal(18, 10)), 253, 3, 4, N'4011209000', 5, 170641, CAST(7110.7600000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 253)
    INSERT @Registros VALUES (3727, 44, 7, 3, CAST(N'2022-09-22' AS Date), CAST(85357.7900000000 AS Decimal(18, 10)), 500, 5, 6, N'4011209000', 5, 585973, CAST(29000.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 500)
    INSERT @Registros VALUES (3728, 58, 12, 8, CAST(N'2023-09-22' AS Date), CAST(1395.0800000000 AS Decimal(18, 10)), 10, 5, 6, N'4011201000', 4, 723739, CAST(489.7000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 10)
    INSERT @Registros VALUES (3729, 22, 7, 3, CAST(N'2020-09-23' AS Date), CAST(24667.3000000000 AS Decimal(18, 10)), 239, 5, 6, N'4011209000', 323, 149180, CAST(13885.9000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 239)
    INSERT @Registros VALUES (3730, 22, 7, 3, CAST(N'2020-09-23' AS Date), CAST(24981.0500000000 AS Decimal(18, 10)), 242, 5, 6, N'4011209000', 324, 149180, CAST(14062.5200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 242)
    INSERT @Registros VALUES (3731, 22, 7, 3, CAST(N'2020-09-23' AS Date), CAST(24192.0000000000 AS Decimal(18, 10)), 291, 5, 6, N'4011209000', 341, 149182, CAST(13751.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 291)
    INSERT @Registros VALUES (3732, 51, 7, 3, CAST(N'2020-09-23' AS Date), CAST(67563.9200000000 AS Decimal(18, 10)), 573, 5, 6, N'4011209000', 209, 149234, CAST(31295.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 573)
    INSERT @Registros VALUES (3733, 51, 7, 3, CAST(N'2021-09-23' AS Date), CAST(36592.3700000000 AS Decimal(18, 10)), 221, 5, 6, N'4011209000', 5, 771321, CAST(11897.2300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 221)
    INSERT @Registros VALUES (3734, 45, 7, 3, CAST(N'2022-09-23' AS Date), CAST(74301.8200000000 AS Decimal(18, 10)), 528, 5, 6, N'4011209000', 5, 279388, CAST(29000.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 528)
    INSERT @Registros VALUES (3735, 44, 7, 3, CAST(N'2022-09-23' AS Date), CAST(37115.5500000000 AS Decimal(18, 10)), 312, 5, 6, N'4011209000', 5, 353767, CAST(9568.8500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 312)
    INSERT @Registros VALUES (3736, 12, 1, 2, CAST(N'2022-09-23' AS Date), CAST(44378.4000000000 AS Decimal(18, 10)), 368, 5, 6, N'4011209000', 5, 389418, CAST(14210.0700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 368)
    INSERT @Registros VALUES (3737, 51, 7, 3, CAST(N'2022-09-23' AS Date), CAST(6853.9900000000 AS Decimal(18, 10)), 40, 5, 6, N'4011209000', 5, 407820, CAST(1893.0100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (3738, 47, 7, 3, CAST(N'2022-09-23' AS Date), CAST(6517.9800000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 5, 622279, CAST(1111.4600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 60)
    INSERT @Registros VALUES (3739, 44, 7, 3, CAST(N'2022-09-23' AS Date), CAST(29374.8600000000 AS Decimal(18, 10)), 179, 5, 6, N'4011209000', 5, 685607, CAST(7344.7200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 179)
    INSERT @Registros VALUES (3740, 51, 7, 3, CAST(N'2022-09-23' AS Date), CAST(59202.2100000000 AS Decimal(18, 10)), 404, 5, 6, N'4011209000', 5, 941597, CAST(22474.3800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 404)
    INSERT @Registros VALUES (3741, 30, 7, 3, CAST(N'2019-09-24' AS Date), CAST(3447.9600000000 AS Decimal(18, 10)), 50, 3, 4, N'4011209000', 814, 165138, CAST(653.0000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 50)
    INSERT @Registros VALUES (3742, 61, 7, 3, CAST(N'2019-09-24' AS Date), CAST(31510.6700000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 678, 165208, CAST(14480.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (3743, 30, 7, 3, CAST(N'2019-09-24' AS Date), CAST(49017.1100000000 AS Decimal(18, 10)), 170, 3, 4, N'4011209000', 769, 165475, CAST(10598.7900000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 170)
    INSERT @Registros VALUES (3744, 61, 7, 3, CAST(N'2019-09-24' AS Date), CAST(15215.8300000000 AS Decimal(18, 10)), 206, 5, 6, N'4011209000', 750, 165647, CAST(5214.6800000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 206)
    INSERT @Registros VALUES (3745, 51, 7, 3, CAST(N'2020-09-24' AS Date), CAST(29699.7700000000 AS Decimal(18, 10)), 264, 5, 6, N'4011209000', 191, 149600, CAST(12823.8700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 264)
    INSERT @Registros VALUES (3746, 44, 7, 3, CAST(N'2020-09-24' AS Date), CAST(31703.9300000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 361, 149747, CAST(13998.7000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (3747, 30, 7, 3, CAST(N'2020-09-24' AS Date), CAST(2453.4900000000 AS Decimal(18, 10)), 33, 3, 4, N'4011209000', 812, 150012, CAST(480.9100000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 33)
    INSERT @Registros VALUES (3748, 45, 7, 3, CAST(N'2021-09-24' AS Date), CAST(1609.8300000000 AS Decimal(18, 10)), 12, 3, 4, N'4011209000', 5, 552985, CAST(303.2800000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 12)
    INSERT @Registros VALUES (3749, 45, 7, 3, CAST(N'2021-09-24' AS Date), CAST(11246.8200000000 AS Decimal(18, 10)), 133, 3, 4, N'4011209000', 5, 552985, CAST(2118.8200000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 133)
    INSERT @Registros VALUES (3750, 47, 7, 3, CAST(N'2021-09-24' AS Date), CAST(10341.5900000000 AS Decimal(18, 10)), 108, 3, 4, N'4011209000', 5, 838694, CAST(1978.9100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 108)
    INSERT @Registros VALUES (3751, 47, 7, 3, CAST(N'2021-09-24' AS Date), CAST(9946.9600000000 AS Decimal(18, 10)), 119, 3, 4, N'4011209000', 5, 913445, CAST(1951.0700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 119)
    INSERT @Registros VALUES (3752, 61, 7, 3, CAST(N'2019-09-25' AS Date), CAST(34183.5300000000 AS Decimal(18, 10)), 304, 5, 6, N'4011209000', 725, 166254, CAST(15380.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 304)
    INSERT @Registros VALUES (3753, 8, 7, 3, CAST(N'2019-09-25' AS Date), CAST(1456.7500000000 AS Decimal(18, 10)), 8, 5, 6, N'4011209000', 68, 166308, CAST(503.7600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 8)
    INSERT @Registros VALUES (3754, 47, 7, 3, CAST(N'2019-09-25' AS Date), CAST(561.8900000000 AS Decimal(18, 10)), 6, 22, 22, N'4011209000', 395, 166521, CAST(177.9600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 6)
    INSERT @Registros VALUES (3755, 12, 1, 2, CAST(N'2023-09-25' AS Date), CAST(9662.3500000000 AS Decimal(18, 10)), 124, 20, 20, N'4011209000', 5, 226259, CAST(1930.5400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 124)
    INSERT @Registros VALUES (3756, 44, 7, 3, CAST(N'2023-09-25' AS Date), CAST(32538.1300000000 AS Decimal(18, 10)), 309, 5, 6, N'4011209000', 5, 456335, CAST(9107.0400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 309)
    INSERT @Registros VALUES (3757, 56, 7, 3, CAST(N'2023-09-25' AS Date), CAST(1193.2800000000 AS Decimal(18, 10)), 10, 3, 4, N'4011209000', 5, 601615, CAST(169.4000000000 AS Decimal(18, 10)), NULL, 0, 6, 1, 10)
    INSERT @Registros VALUES (3758, 56, 7, 3, CAST(N'2023-09-25' AS Date), CAST(3579.8400000000 AS Decimal(18, 10)), 30, 3, 4, N'4011209000', 5, 601615, CAST(508.2000000000 AS Decimal(18, 10)), NULL, 0, 6, 1, 30)
    INSERT @Registros VALUES (3759, 42, 7, 3, CAST(N'2023-09-25' AS Date), CAST(46294.7600000000 AS Decimal(18, 10)), 510, 5, 6, N'4011209000', 5, 780502, CAST(17120.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 510)
    INSERT @Registros VALUES (3760, 22, 7, 3, CAST(N'2023-09-25' AS Date), CAST(36160.8500000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 5, 782000, CAST(15620.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (3761, 12, 1, 2, CAST(N'2019-09-26' AS Date), CAST(30354.4400000000 AS Decimal(18, 10)), 262, 5, 6, N'4011209000', 431, 167105, CAST(13886.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 262)
    INSERT @Registros VALUES (3762, 7, 12, 8, CAST(N'2022-09-26' AS Date), CAST(3069.1700000000 AS Decimal(18, 10)), 40, 3, 4, N'4011209000', 5, 104679, CAST(496.4000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 40)
    INSERT @Registros VALUES (3763, 7, 12, 8, CAST(N'2022-09-26' AS Date), CAST(69056.4200000000 AS Decimal(18, 10)), 900, 3, 4, N'4011209000', 5, 104679, CAST(11169.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 900)
    INSERT @Registros VALUES (3764, 56, 7, 3, CAST(N'2022-09-26' AS Date), CAST(49221.6600000000 AS Decimal(18, 10)), 570, 3, 4, N'4011209000', 5, 115996, CAST(10282.8000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 570)
    INSERT @Registros VALUES (3765, 56, 7, 3, CAST(N'2022-09-26' AS Date), CAST(177.1900000000 AS Decimal(18, 10)), 2, 3, 4, N'4011209000', 5, 306181, CAST(37.0100000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 2)
    INSERT @Registros VALUES (3766, 56, 7, 3, CAST(N'2022-09-26' AS Date), CAST(49048.9600000000 AS Decimal(18, 10)), 568, 3, 4, N'4011209000', 5, 306181, CAST(10245.6600000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 568)
    INSERT @Registros VALUES (3767, 42, 7, 3, CAST(N'2022-09-26' AS Date), CAST(108242.5800000000 AS Decimal(18, 10)), 794, 5, 6, N'4011209000', 5, 578013, CAST(32731.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 794)
    INSERT @Registros VALUES (3768, 45, 7, 3, CAST(N'2022-09-26' AS Date), CAST(10976.4300000000 AS Decimal(18, 10)), 148, 16, 17, N'4011209000', 5, 665424, CAST(1808.7600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 148)
    INSERT @Registros VALUES (3769, 37, 8, 4, CAST(N'2022-09-26' AS Date), CAST(101270.0200000000 AS Decimal(18, 10)), 520, 5, 6, N'4011209000', 5, 911129, CAST(29678.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 520)
    INSERT @Registros VALUES (3770, 2, 12, 8, CAST(N'2023-09-26' AS Date), CAST(37822.7600000000 AS Decimal(18, 10)), 268, 5, 6, N'4011209000', 5, 67369, CAST(15977.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 268)
    INSERT @Registros VALUES (3771, 23, 7, 3, CAST(N'2023-09-26' AS Date), CAST(14989.0600000000 AS Decimal(18, 10)), 124, 5, 6, N'4011209000', 5, 195545, CAST(6612.0900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 124)
    INSERT @Registros VALUES (3772, 23, 7, 3, CAST(N'2023-09-26' AS Date), CAST(16824.2100000000 AS Decimal(18, 10)), 126, 5, 6, N'4011209000', 5, 210537, CAST(7602.8400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 126)
    INSERT @Registros VALUES (3773, 23, 7, 3, CAST(N'2023-09-26' AS Date), CAST(33554.4300000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 308995, CAST(14291.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (3774, 2, 12, 8, CAST(N'2023-09-26' AS Date), CAST(37883.5200000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 361658, CAST(15973.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (3775, 44, 7, 3, CAST(N'2021-09-27' AS Date), CAST(18697.3200000000 AS Decimal(18, 10)), 103, 3, 4, N'4011209000', 5, 204452, CAST(4531.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 103)
    INSERT @Registros VALUES (3776, 44, 7, 3, CAST(N'2021-09-27' AS Date), CAST(18624.6800000000 AS Decimal(18, 10)), 93, 3, 4, N'4011209000', 5, 204452, CAST(3913.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 93)
    INSERT @Registros VALUES (3777, 59, 12, 8, CAST(N'2021-09-27' AS Date), CAST(155961.4300000000 AS Decimal(18, 10)), 1090, 5, 6, N'4011209000', 5, 207107, CAST(59170.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 1090)
    INSERT @Registros VALUES (3778, 30, 7, 3, CAST(N'2021-09-27' AS Date), CAST(57362.9200000000 AS Decimal(18, 10)), 256, 3, 4, N'4011209000', 5, 342868, CAST(13660.9700000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 256)
    INSERT @Registros VALUES (3779, 30, 7, 3, CAST(N'2022-09-27' AS Date), CAST(92753.0900000000 AS Decimal(18, 10)), 275, 3, 4, N'4011209000', 5, 70055, CAST(17887.5100000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 275)
    INSERT @Registros VALUES (3780, 7, 12, 8, CAST(N'2022-09-27' AS Date), CAST(6560.7100000000 AS Decimal(18, 10)), 75, 3, 4, N'4011209000', 5, 200902, CAST(1307.1000000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 75)
    INSERT @Registros VALUES (3781, 7, 12, 8, CAST(N'2022-09-27' AS Date), CAST(21081.7400000000 AS Decimal(18, 10)), 241, 3, 4, N'4011209000', 5, 200902, CAST(4200.1400000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 241)
    INSERT @Registros VALUES (3782, 7, 12, 8, CAST(N'2022-09-27' AS Date), CAST(314.5900000000 AS Decimal(18, 10)), 4, 3, 4, N'4011209000', 5, 200902, CAST(62.6800000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 4)
    INSERT @Registros VALUES (3783, 7, 12, 8, CAST(N'2022-09-27' AS Date), CAST(9097.5100000000 AS Decimal(18, 10)), 104, 3, 4, N'4011209000', 5, 200902, CAST(1812.5100000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 104)
    INSERT @Registros VALUES (3784, 7, 12, 8, CAST(N'2022-09-27' AS Date), CAST(27212.4500000000 AS Decimal(18, 10)), 346, 3, 4, N'4011209000', 5, 200902, CAST(5421.5600000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 346)
    INSERT @Registros VALUES (3785, 47, 7, 3, CAST(N'2022-09-27' AS Date), CAST(2085.2500000000 AS Decimal(18, 10)), 20, 3, 4, N'4011209000', 5, 406241, CAST(304.7200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 20)
    INSERT @Registros VALUES (3786, 7, 12, 8, CAST(N'2023-09-27' AS Date), CAST(8126.8600000000 AS Decimal(18, 10)), 100, 3, 4, N'4011209000', 5, 98188, CAST(1326.0000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 100)
    INSERT @Registros VALUES (3787, 7, 12, 8, CAST(N'2023-09-27' AS Date), CAST(76555.0500000000 AS Decimal(18, 10)), 942, 3, 4, N'4011209000', 5, 98188, CAST(12490.9200000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 942)
    INSERT @Registros VALUES (3788, 42, 7, 3, CAST(N'2023-09-27' AS Date), CAST(3696.4000000000 AS Decimal(18, 10)), 25, 2, 2, N'4011209000', 5, 957643, CAST(738.2000000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 25)
    INSERT @Registros VALUES (3789, 61, 7, 3, CAST(N'2023-09-27' AS Date), CAST(31294.4000000000 AS Decimal(18, 10)), 254, 5, 6, N'4011209000', 5, 987988, CAST(13540.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 254)
    INSERT @Registros VALUES (3790, 44, 7, 3, CAST(N'2020-09-28' AS Date), CAST(31958.1600000000 AS Decimal(18, 10)), 148, 3, 4, N'4011209000', 352, 152352, CAST(6573.8200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 148)
    INSERT @Registros VALUES (3791, 44, 7, 3, CAST(N'2020-09-28' AS Date), CAST(16341.7900000000 AS Decimal(18, 10)), 85, 3, 4, N'4011209000', 388, 152352, CAST(4309.9800000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 85)
    INSERT @Registros VALUES (3792, 7, 12, 8, CAST(N'2021-09-28' AS Date), CAST(7614.7800000000 AS Decimal(18, 10)), 105, 3, 4, N'4011209000', 5, 173163, CAST(1303.0500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 105)
    INSERT @Registros VALUES (3793, 7, 12, 8, CAST(N'2021-09-28' AS Date), CAST(60555.7100000000 AS Decimal(18, 10)), 835, 3, 4, N'4011209000', 5, 173163, CAST(10362.3500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 835)
    INSERT @Registros VALUES (3794, 7, 12, 8, CAST(N'2021-09-28' AS Date), CAST(7614.7800000000 AS Decimal(18, 10)), 105, 3, 4, N'4011209000', 5, 173163, CAST(1303.0500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 105)
    INSERT @Registros VALUES (3795, 7, 12, 8, CAST(N'2021-09-28' AS Date), CAST(60555.7100000000 AS Decimal(18, 10)), 835, 3, 4, N'4011209000', 5, 173163, CAST(10362.3500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 835)
    INSERT @Registros VALUES (3796, 47, 7, 3, CAST(N'2022-09-28' AS Date), CAST(7018.0900000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 5, 229093, CAST(980.2300000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 60)
    INSERT @Registros VALUES (3797, 26, 7, 3, CAST(N'2022-09-28' AS Date), CAST(12728.1100000000 AS Decimal(18, 10)), 80, 5, 6, N'4011209000', 5, 248840, CAST(3913.9100000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 80)
    INSERT @Registros VALUES (3798, 26, 7, 3, CAST(N'2022-09-28' AS Date), CAST(724.3900000000 AS Decimal(18, 10)), 12, 5, 6, N'4011209000', 5, 318000, CAST(222.7500000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 12)
    INSERT @Registros VALUES (3799, 26, 7, 3, CAST(N'2022-09-28' AS Date), CAST(396.7100000000 AS Decimal(18, 10)), 8, 5, 6, N'4011209000', 5, 318000, CAST(121.9900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 8)
    INSERT @Registros VALUES (3800, 26, 7, 3, CAST(N'2022-09-28' AS Date), CAST(1445.8800000000 AS Decimal(18, 10)), 24, 5, 6, N'4011209000', 5, 318000, CAST(444.6100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 24)
    INSERT @Registros VALUES (3801, 26, 7, 3, CAST(N'2022-09-28' AS Date), CAST(14740.8700000000 AS Decimal(18, 10)), 75, 5, 6, N'4011209000', 5, 318000, CAST(4532.8400000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 75)
    INSERT @Registros VALUES (3802, 26, 7, 3, CAST(N'2022-09-28' AS Date), CAST(13699.2200000000 AS Decimal(18, 10)), 73, 5, 6, N'4011209000', 5, 318000, CAST(4212.5300000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 73)
    INSERT @Registros VALUES (3803, 26, 7, 3, CAST(N'2022-09-28' AS Date), CAST(549.9400000000 AS Decimal(18, 10)), 9, 5, 6, N'4011209000', 5, 318000, CAST(169.1100000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 9)
    INSERT @Registros VALUES (3804, 26, 7, 3, CAST(N'2022-09-28' AS Date), CAST(517.7200000000 AS Decimal(18, 10)), 8, 5, 6, N'4011209000', 5, 318000, CAST(159.2000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 8)
    INSERT @Registros VALUES (3805, 26, 7, 3, CAST(N'2022-09-28' AS Date), CAST(539.7100000000 AS Decimal(18, 10)), 15, 5, 6, N'4011209000', 5, 318000, CAST(165.9600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 15)
    INSERT @Registros VALUES (3806, 26, 7, 3, CAST(N'2022-09-28' AS Date), CAST(44744.9400000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 919265, CAST(13720.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 280)
    INSERT @Registros VALUES (3807, 26, 7, 3, CAST(N'2022-09-28' AS Date), CAST(44744.9400000000 AS Decimal(18, 10)), 280, 5, 6, N'4011209000', 5, 919265, CAST(13720.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 280)
    INSERT @Registros VALUES (3808, 61, 7, 3, CAST(N'2023-09-28' AS Date), CAST(30524.7800000000 AS Decimal(18, 10)), 260, 5, 6, N'4011209000', 5, 117109, CAST(13570.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 260)
    INSERT @Registros VALUES (3809, 45, 7, 3, CAST(N'2023-09-28' AS Date), CAST(21342.5200000000 AS Decimal(18, 10)), 96, 20, 20, N'4011209000', 5, 211825, CAST(5756.1600000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 96)
    INSERT @Registros VALUES (3810, 44, 7, 3, CAST(N'2021-09-29' AS Date), CAST(65903.4000000000 AS Decimal(18, 10)), 300, 3, 4, N'4011209000', 5, 248550, CAST(15691.0000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 300)
    INSERT @Registros VALUES (3811, 42, 7, 3, CAST(N'2021-09-29' AS Date), CAST(13210.6000000000 AS Decimal(18, 10)), 70, 2, 2, N'4011209000', 5, 847827, CAST(3461.4300000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 70)
    INSERT @Registros VALUES (3812, 42, 7, 3, CAST(N'2021-09-29' AS Date), CAST(28725.0100000000 AS Decimal(18, 10)), 403, 16, 17, N'4011209000', 5, 867251, CAST(5495.1000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 403)
    INSERT @Registros VALUES (3813, 1, 11, 7, CAST(N'2022-09-29' AS Date), CAST(40513.9200000000 AS Decimal(18, 10)), 252, 5, 6, N'4011209000', 5, 190862, CAST(13252.1200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 252)
    INSERT @Registros VALUES (3814, 1, 11, 7, CAST(N'2022-09-29' AS Date), CAST(1500.8100000000 AS Decimal(18, 10)), 18, 5, 6, N'4011209000', 5, 190862, CAST(490.9200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 18)
    INSERT @Registros VALUES (3815, 45, 7, 3, CAST(N'2022-09-29' AS Date), CAST(97014.8800000000 AS Decimal(18, 10)), 350, 3, 4, N'4011209000', 5, 534850, CAST(22294.6500000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 350)
    INSERT @Registros VALUES (3816, 1, 11, 7, CAST(N'2023-09-29' AS Date), CAST(22332.7100000000 AS Decimal(18, 10)), 184, 5, 6, N'4011209000', 5, 36046, CAST(8410.3200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 184)
    INSERT @Registros VALUES (3817, 45, 7, 3, CAST(N'2023-09-29' AS Date), CAST(67867.5000000000 AS Decimal(18, 10)), 350, 3, 4, N'4011209000', 5, 80663, CAST(18714.4600000000 AS Decimal(18, 10)), NULL, 0, 3, 1, 350)
    INSERT @Registros VALUES (3818, 59, 12, 8, CAST(N'2023-09-29' AS Date), CAST(64585.2700000000 AS Decimal(18, 10)), 574, 5, 6, N'4011209000', 5, 262076, CAST(27348.6700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 574)
    INSERT @Registros VALUES (3819, 14, 4, 2, CAST(N'2023-09-29' AS Date), CAST(7487.1300000000 AS Decimal(18, 10)), 82, 5, 6, N'4011209000', 5, 267189, CAST(3562.1900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 82)
    INSERT @Registros VALUES (3820, 45, 7, 3, CAST(N'2023-09-29' AS Date), CAST(12946.7500000000 AS Decimal(18, 10)), 119, 14, 15, N'4011209000', 5, 496773, CAST(1984.6700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 119)
    INSERT @Registros VALUES (3821, 7, 12, 8, CAST(N'2023-09-29' AS Date), CAST(41179.2100000000 AS Decimal(18, 10)), 550, 3, 4, N'4011209000', 5, 837897, CAST(8530.9600000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 550)
    INSERT @Registros VALUES (3822, 7, 12, 8, CAST(N'2023-09-29' AS Date), CAST(16654.9000000000 AS Decimal(18, 10)), 200, 3, 4, N'4011209000', 5, 837897, CAST(3450.3400000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 200)
    INSERT @Registros VALUES (3823, 23, 7, 3, CAST(N'2019-09-30' AS Date), CAST(55564.7400000000 AS Decimal(18, 10)), 228, 3, 4, N'4011209000', 100, 168724, CAST(14266.3200000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 228)
    INSERT @Registros VALUES (3824, 45, 7, 3, CAST(N'2020-09-30' AS Date), CAST(7529.5800000000 AS Decimal(18, 10)), 60, 3, 4, N'4011209000', 649, 153960, CAST(1536.2200000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 60)
    INSERT @Registros VALUES (3825, 45, 7, 3, CAST(N'2020-09-30' AS Date), CAST(1484.7300000000 AS Decimal(18, 10)), 16, 3, 4, N'4011209000', 489, 153960, CAST(302.4800000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 16)
    INSERT @Registros VALUES (3826, 45, 7, 3, CAST(N'2020-09-30' AS Date), CAST(9836.3400000000 AS Decimal(18, 10)), 115, 3, 4, N'4011209000', 626, 153960, CAST(2003.9000000000 AS Decimal(18, 10)), NULL, 4, 3, 1, 115)
    INSERT @Registros VALUES (3827, 45, 7, 3, CAST(N'2021-09-30' AS Date), CAST(10798.7500000000 AS Decimal(18, 10)), 158, 3, 4, N'4011209000', 5, 244064, CAST(2190.2500000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 158)
    INSERT @Registros VALUES (3828, 45, 7, 3, CAST(N'2021-09-30' AS Date), CAST(105877.8200000000 AS Decimal(18, 10)), 687, 20, 20, N'4011209000', 5, 441485, CAST(39763.0400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 687)
    INSERT @Registros VALUES (3829, 27, 7, 3, CAST(N'2021-09-30' AS Date), CAST(1576.2000000000 AS Decimal(18, 10)), 14, 3, 4, N'4011209000', 5, 500003, CAST(293.5400000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 14)
    INSERT @Registros VALUES (3830, 45, 7, 3, CAST(N'2021-09-30' AS Date), CAST(31437.9400000000 AS Decimal(18, 10)), 423, 3, 4, N'4011209000', 5, 537162, CAST(6036.6000000000 AS Decimal(18, 10)), NULL, 0, 7, 1, 423)
    INSERT @Registros VALUES (3831, 49, 12, 8, CAST(N'2022-09-30' AS Date), CAST(26913.3000000000 AS Decimal(18, 10)), 250, 5, 6, N'4011209000', 5, 324539, CAST(14500.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 250)
    INSERT @Registros VALUES (3832, 12, 1, 2, CAST(N'2022-09-30' AS Date), CAST(40930.6000000000 AS Decimal(18, 10)), 302, 5, 6, N'4011209000', 5, 608980, CAST(14860.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 302)
    INSERT @Registros VALUES (3833, 25, 7, 3, CAST(N'2022-09-30' AS Date), CAST(32584.3000000000 AS Decimal(18, 10)), 232, 5, 6, N'4011209000', 5, 796751, CAST(11142.0000000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 232)
    INSERT @Registros VALUES (3834, 8, 7, 3, CAST(N'2022-09-30' AS Date), CAST(23451.8200000000 AS Decimal(18, 10)), 102, 5, 6, N'4011209000', 5, 889057, CAST(6668.3700000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 102)
    INSERT @Registros VALUES (3835, 45, 7, 3, CAST(N'2022-09-30' AS Date), CAST(15118.8100000000 AS Decimal(18, 10)), 158, 14, 15, N'4011209000', 5, 915466, CAST(2400.0900000000 AS Decimal(18, 10)), NULL, 0, 2, 1, 158)
    INSERT @Registros VALUES (3836, 7, 12, 8, CAST(N'2022-09-30' AS Date), CAST(38402.0100000000 AS Decimal(18, 10)), 439, 3, 4, N'4011209000', 5, 987816, CAST(7742.9700000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 439)
    INSERT @Registros VALUES (3837, 7, 12, 8, CAST(N'2022-09-30' AS Date), CAST(16882.8900000000 AS Decimal(18, 10)), 193, 3, 4, N'4011209000', 5, 987816, CAST(3404.0900000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 193)
    INSERT @Registros VALUES (3838, 7, 12, 8, CAST(N'2022-09-30' AS Date), CAST(5505.4100000000 AS Decimal(18, 10)), 70, 3, 4, N'4011209000', 5, 987816, CAST(1110.0500000000 AS Decimal(18, 10)), NULL, 0, 5, 1, 70)

    ALTER TABLE [03.Entrega].[dbo].[Registros] ADD CONSTRAINT [FK_Registos_Empresas] FOREIGN KEY ([EmpresaID]) REFERENCES [dbo].[Empresas] ([EmpresaID]);
    ALTER TABLE [03.Entrega].[dbo].[Registros] ADD CONSTRAINT	[FK_Registos_Ciudades] FOREIGN KEY ([CiudadID]) REFERENCES [dbo].[Ciudades] ([CiudadID]);
	ALTER TABLE [03.Entrega].[dbo].[Registros] ADD CONSTRAINT	[FK_Registos_Departamentos] FOREIGN KEY ([DepartamentoID]) REFERENCES [dbo].[Departamentos] ([DepartamentoID]);
	ALTER TABLE [03.Entrega].[dbo].[Registros] ADD CONSTRAINT [FK_Registos_PaisesOrigen] FOREIGN KEY ([PaisOrigenID]) REFERENCES [dbo].[PaisesOrigen] ([PaisOrigenID]);
	ALTER TABLE [03.Entrega].[dbo].[Registros] ADD CONSTRAINT [FK_Registos_PaisesProcedencia] FOREIGN KEY ([PaisProcedenciaID]) REFERENCES [dbo].[PaisesProcedencia] ([PaisProcedenciaID]);
	ALTER TABLE [03.Entrega].[dbo].[Registros] ADD CONSTRAINT	[FK_Registros_DescripcionesComerciales] FOREIGN KEY ([DescripcionComercialID]) REFERENCES [dbo].[DescripcionesComerciales] ([DescripcionComercialID]);
	ALTER TABLE [03.Entrega].[dbo].[Registros] ADD CONSTRAINT [FK_Registros_Regimenes] FOREIGN KEY ([RegimenID]) REFERENCES [dbo].[Regimenes] ([RegimenID]);
	ALTER TABLE [03.Entrega].[dbo].[Registros] ADD CONSTRAINT [FK_Registos_UnidadesFisicas] FOREIGN KEY ([UnidadFisicaID]) REFERENCES [dbo].[UnidadesFisicas] ([UnidadFisicaID]);

    SET IDENTITY_INSERT [03.Entrega].[dbo].[Registros] ON;

    MERGE INTO [03.Entrega].[dbo].[Registros] AS [TARGET]
    USING @Registros AS [SOURCE]
    ON [TARGET].[RegistroID] = [SOURCE].[RegistroID]
    WHEN MATCHED THEN
        UPDATE SET 
            [TARGET].[EmpresaID] = [SOURCE].[EmpresaID]
            ,[TARGET].[CiudadID] = [SOURCE].[CiudadID]				
            ,[TARGET].[DepartamentoID] = [SOURCE].[DepartamentoID]		
            ,[TARGET].[FechaNumeracion] = [SOURCE].[FechaNumeracion]		
            ,[TARGET].[Cif_Valor_Aduana] = [SOURCE].[Cif_Valor_Aduana] 	
            ,[TARGET].[CantidadUnidadComercial] = [SOURCE].[CantidadUnidadComercial]
            ,[TARGET].[PaisOrigenID] = [SOURCE].[PaisOrigenID]			
            ,[TARGET].[PaisProcedenciaID] = [SOURCE].[PaisProcedenciaID]	
            ,[TARGET].[NCM] = [SOURCE].[NCM]					
            ,[TARGET].[DescripcionComercialID] = [SOURCE].[DescripcionComercialID]
            ,[TARGET].[DUA] = [SOURCE].[DUA]					
            ,[TARGET].[PesoNeto] = [SOURCE].[PesoNeto]				
            ,[TARGET].[MedioTransporte] = [SOURCE].[MedioTransporte]		
            ,[TARGET].[TipoDespacho] = [SOURCE].[TipoDespacho]			
            ,[TARGET].[RegimenID] = [SOURCE].[RegimenID]			
            ,[TARGET].[UnidadFisicaID] = [SOURCE].[UnidadFisicaID]		
	        ,[TARGET].[TotalUnidadesFisicas] = [SOURCE].[TotalUnidadesFisicas]
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (
            [RegistroID]
            ,[EmpresaID]
            ,[CiudadID]
            ,[DepartamentoID]
            ,[FechaNumeracion]
            ,[Cif_Valor_Aduana]
            ,[CantidadUnidadComercial]
            ,[PaisOrigenID]
            ,[PaisProcedenciaID]
            ,[NCM]
            ,[DescripcionComercialID]
            ,[DUA]
            ,[PesoNeto]
            ,[MedioTransporte]
            ,[TipoDespacho]
            ,[RegimenID]
            ,[UnidadFisicaID]
            ,[TotalUnidadesFisicas]
        )
        VALUES (
            [SOURCE].[RegistroID]
            ,[SOURCE].[EmpresaID]
            ,[SOURCE].[CiudadID]
            ,[SOURCE].[DepartamentoID]
            ,[SOURCE].[FechaNumeracion]
            ,[SOURCE].[Cif_Valor_Aduana]
            ,[SOURCE].[CantidadUnidadComercial]
            ,[SOURCE].[PaisOrigenID]
            ,[SOURCE].[PaisProcedenciaID]
            ,[SOURCE].[NCM]
            ,[SOURCE].[DescripcionComercialID]
            ,[SOURCE].[DUA]
            ,[SOURCE].[PesoNeto]
            ,[SOURCE].[MedioTransporte]
            ,[SOURCE].[TipoDespacho]
            ,[SOURCE].[RegimenID]
            ,[SOURCE].[UnidadFisicaID]
            ,[SOURCE].[TotalUnidadesFisicas]
        );

    SET IDENTITY_INSERT [03.Entrega].[dbo].[PaisesProcedencia] OFF;
END;
GO