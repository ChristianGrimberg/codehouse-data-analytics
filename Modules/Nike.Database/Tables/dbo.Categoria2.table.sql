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
ALTER TABLE [dbo].[Categorias2] (
    ADD COLUMN [cantidad] INT
);
GO

-- 📌 Eliminar una columna
ALTER TABLE [dbo].[Categorias2] (
    DROP COLUMN [cantidad] INT
);
GO

-- 📌 Ingresar registros

-- 📌 Modificar registros

-- 📌 Eliminar registros