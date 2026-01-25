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

IF OBJECT_ID(N'[Entrega.Final].[dbo].[Departamentos]', N'U') IS NOT NULL
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

    SET IDENTITY_INSERT [Entrega.Final].[dbo].[Departamentos] ON;

    MERGE INTO [Entrega.Final].[dbo].[Departamentos] AS [TARGET]
    USING @Departamentos AS [SOURCE]
    ON [TARGET].[DepartamentoID] = [SOURCE].[DepartamentoID]
    WHEN MATCHED THEN
        UPDATE SET
            [TARGET].[Nombre] = [SOURCE].[Nombre]
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([DepartamentoID], [Nombre])
        VALUES ([SOURCE].[DepartamentoID], [SOURCE].[Nombre]);

    SET IDENTITY_INSERT [Entrega.Final].[dbo].[Departamentos] OFF;
END;

IF OBJECT_ID(N'[Entrega.Final].[dbo].[DescripcionesComerciales]', N'U') IS NOT NULL
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

    SET IDENTITY_INSERT [Entrega.Final].[dbo].[DescripcionesComerciales] ON;

    MERGE INTO [Entrega.Final].[dbo].[DescripcionesComerciales] AS [TARGET]
    USING @DescripcionesComerciales AS [SOURCE]
    ON [TARGET].[DescripcionComercialID] = [SOURCE].[DescripcionComercialID]
    WHEN MATCHED THEN
        UPDATE SET 
            [TARGET].[Nombre] = [SOURCE].[Nombre]
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([DescripcionComercialID], [Nombre])
        VALUES ([SOURCE].[DescripcionComercialID], [SOURCE].[Nombre]);

    SET IDENTITY_INSERT [Entrega.Final].[dbo].[DescripcionesComerciales] OFF;
END;

IF OBJECT_ID('Entrega.Final.dbo.Empresas', 'U') IS NOT NULL
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
    INSERT @Empresas VALUES (15, N'DURAGOM SOCIEDAD ANONIMA');
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
    INSERT @Empresas VALUES (40, N'NEUMATICOS DEL LAGO LTDA');
    INSERT @Empresas VALUES (41, N'ORILLA DEL MAR S.A.');
    INSERT @Empresas VALUES (42, N'PANAM NEUMATICOS S A');
    INSERT @Empresas VALUES (43, N'PEREZ BENTANCOR JORGE SILVIO');
    INSERT @Empresas VALUES (44, N'PETIN S.A.');
    INSERT @Empresas VALUES (45, N'RA S A');
    INSERT @Empresas VALUES (46, N'RAMON C ALVAREZ S A');
    INSERT @Empresas VALUES (47, N'RAYDORAT S A');
    INSERT @Empresas VALUES (48, N'RC REPRESENTACIONES SRL');
    INSERT @Empresas VALUES (49, N'RODRIGUEZ ROSAS PABLO ANTONIO');
    INSERT @Empresas VALUES (50, N'ROGOVIAL S.R.L.');
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

    SET IDENTITY_INSERT [Entrega.Final].[dbo].[Empresas] ON;

    MERGE INTO [Entrega.Final].[dbo].[Empresas] AS [TARGET]
    USING @Empresas AS [SOURCE]
    ON [TARGET].[EmpresaID] = [SOURCE].[EmpresaID]
    WHEN MATCHED THEN
        UPDATE SET 
            [TARGET].[Nombre] = [SOURCE].[Nombre]
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([EmpresaID], [Nombre])
        VALUES ([SOURCE].[EmpresaID], [SOURCE].[Nombre]);

    SET IDENTITY_INSERT [Entrega.Final].[dbo].[Empresas] OFF;
END;

IF OBJECT_ID('Entrega.Final.dbo.PaisesOrigen', 'U') IS NOT NULL
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

    SET IDENTITY_INSERT [Entrega.Final].[dbo].[PaisesOrigen] ON;

    MERGE INTO [Entrega.Final].[dbo].[PaisesOrigen] AS [TARGET]
    USING @PaisesOrigen AS [SOURCE]
    ON [TARGET].[PaisOrigenID] = [SOURCE].[PaisOrigenID]
    WHEN MATCHED THEN
        UPDATE SET 
            [TARGET].[Nombre] = [SOURCE].[Nombre]
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([PaisOrigenID], [Nombre])
        VALUES ([SOURCE].[PaisOrigenID], [SOURCE].[Nombre]);

    SET IDENTITY_INSERT [Entrega.Final].[dbo].[PaisesOrigen] OFF;
END;

IF OBJECT_ID('Entrega.Final.dbo.PaisesProcedencia', 'U') IS NOT NULL
BEGIN
    DECLARE @PaisesProcedencia TABLE (
        [PaisProcedenciaID] [INT]		NOT NULL
        ,[Nombre] [NVARCHAR](MAX)	NULL
    );

    INSERT @PaisesProcedencia VALUES (1, N'ALEMANIA');
    INSERT @PaisesProcedencia VALUES (2, N'ARGENTINA');
    INSERT @PaisesProcedencia VALUES (3, N'BELGICA, LUXEMBURGO');
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

    SET IDENTITY_INSERT [Entrega.Final].[dbo].[PaisesProcedencia] ON;

    MERGE INTO [Entrega.Final].[dbo].[PaisesProcedencia] AS [TARGET]
    USING @PaisesProcedencia AS [SOURCE]
    ON [TARGET].[PaisProcedenciaID] = [SOURCE].[PaisProcedenciaID]
    WHEN MATCHED THEN
        UPDATE SET 
            [TARGET].[Nombre] = [SOURCE].[Nombre]
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([PaisProcedenciaID], [Nombre])
        VALUES ([SOURCE].[PaisProcedenciaID], [SOURCE].[Nombre]);

    SET IDENTITY_INSERT [Entrega.Final].[dbo].[PaisesProcedencia] OFF;
END;

IF OBJECT_ID('Entrega.Final.dbo.Regimenes', 'U') IS NOT NULL
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

    SET IDENTITY_INSERT [Entrega.Final].[dbo].[Regimenes] ON;

    MERGE INTO [Entrega.Final].[dbo].[Regimenes] AS [TARGET]
    USING @Regimenes AS [SOURCE]
    ON [TARGET].[RegimenID] = [SOURCE].[RegimenID]
    WHEN MATCHED THEN
        UPDATE SET 
            [TARGET].[Nombre] = [SOURCE].[Nombre]
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([RegimenID], [Nombre])
        VALUES ([SOURCE].[RegimenID], [SOURCE].[Nombre]);

    SET IDENTITY_INSERT [Entrega.Final].[dbo].[Regimenes] OFF;
END;

IF OBJECT_ID('Entrega.Final.dbo.UnidadesFisicas', 'U') IS NOT NULL
BEGIN
    DECLARE @UnidadesFisicas TABLE (
        [UnidadFisicaID] [INT]		NOT NULL
        ,[Nombre] [NVARCHAR](MAX)	NULL
    );

    INSERT @UnidadesFisicas VALUES (1, N'NUMERO');

    SET IDENTITY_INSERT [Entrega.Final].[dbo].[UnidadesFisicas] ON;

    MERGE INTO [Entrega.Final].[dbo].[UnidadesFisicas] AS [TARGET]
    USING @UnidadesFisicas AS [SOURCE]
    ON [TARGET].[UnidadFisicaID] = [SOURCE].[UnidadFisicaID]
    WHEN MATCHED THEN
        UPDATE SET 
            [TARGET].[Nombre] = [SOURCE].[Nombre]
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([UnidadFisicaID], [Nombre])
        VALUES ([SOURCE].[UnidadFisicaID], [SOURCE].[Nombre]);

    SET IDENTITY_INSERT [Entrega.Final].[dbo].[UnidadesFisicas] OFF;
END;