USE [Nike_Sabado];
GO

CREATE TABLE [dbo].[Categorias] (
    [id_Category] INT PRIMARY KEY IDENTITY(1,1),
    [CATEGORY] NVARCHAR(MAX) NULL
);
GO

INSERT INTO [dbo].[Categorias] ([CATEGORY])
VALUES
    ('Accessories and Equipment')
    ,('Clothing')
    ,('Shoes');
GO