USE [Nike_Sabado];
GO

TRUNCATE TABLE [dbo].[Categorias];
GO

INSERT INTO [dbo].[Categorias] ([CATEGORY])
VALUES
    ('Accessories and Equipment')
    ,('Clothing')
    ,('Shoes');
GO