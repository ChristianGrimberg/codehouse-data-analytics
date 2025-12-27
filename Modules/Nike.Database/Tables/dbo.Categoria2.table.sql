USE [Nike_Sabado];
GO

-- 📌 Crear una tabla
-- Identificar Tipo de Datos y Constraints
CREATE TABLE [dbo].[Categoria2] (
    [categoria_id] INT PRIMARY KEY IDENTITY(1,1)
    ,[nombre_categoria] NVARCHAR(50) NULL
    ,[descripcion] NVARCHAR(50) NULL
);
GO

-- 📌 Agregar una columna
ALTER TABLE [dbo].[Categoria2]
    ADD [cantidad] INT;
GO

-- 📌 Eliminar una columna
ALTER TABLE [dbo].[Categoria2]
    DROP COLUMN [cantidad];
GO

-- 📌 Ingresar registros

-- 📌 Modificar registros

-- 📌 Eliminar registros