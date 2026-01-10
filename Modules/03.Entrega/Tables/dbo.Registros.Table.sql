CREATE TABLE [dbo].[Registros](
	[RegistroID]				[INT] 				NOT NULL	IDENTITY(1,1)	PRIMARY KEY
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

	-- Claves foráneas
    CONSTRAINT	[FK_Registos_Empresas]					FOREIGN KEY ([EmpresaID])				REFERENCES [dbo].[Empresas] ([EmpresaID])
	,CONSTRAINT	[FK_Registos_Ciudades]					FOREIGN KEY ([CiudadID])				REFERENCES [dbo].[Ciudades] ([CiudadID])
	,CONSTRAINT	[FK_Registos_Departamentos]				FOREIGN KEY ([DepartamentoID])			REFERENCES [dbo].[Departamentos] ([DepartamentoID])
	,CONSTRAINT [FK_Registos_PaisesOrigen]				FOREIGN KEY ([PaisOrigenID])			REFERENCES [dbo].[PaisesOrigen] ([PaisOrigenID])
	,CONSTRAINT [FK_Registos_PaisesProcedencia]			FOREIGN KEY ([PaisProcedenciaID])		REFERENCES [dbo].[PaisesProcedencia] ([PaisProcedenciaID])
	,CONSTRAINT	[FK_Registros_DescripcionesComerciales]	FOREIGN KEY ([DescripcionComercialID])	REFERENCES [dbo].[DescripcionesComerciales] ([DescripcionComercialID])
	,CONSTRAINT [FK_Registros_Regimenes]				FOREIGN KEY ([RegimenID])				REFERENCES [dbo].[Regimenes] ([RegimenID])
	,CONSTRAINT [FK_Registos_UnidadesFisicas]			FOREIGN KEY ([UnidadFisicaID])			REFERENCES [dbo].[UnidadesFisicas] ([UnidadFisicaID])
);
GO