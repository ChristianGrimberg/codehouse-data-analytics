CREATE TABLE [dbo].[ventas_nike] (
    INVOICE DATE,
    id_Region INT,
    id_State INT,
    id_City INT,
    id_Department INT,
    id_Category INT,
    id_SubCategory INT,
    id_PRODUCT_NAME INT,
    id_DESCRIPTION INT,
    id_PRODUCT_TYPE INT,
    PRODUCT_SIZE NVARCHAR(50) NULL,
    id_Color INT,
    id_BRAND INT,
    id_AVAILABILITY INT,
    [Price per Unit] DECIMAL(10, 2),
    [Units Sold] INT,
    [Costo Unitario] DECIMAL(10, 2),
    [Operating Margin] DECIMAL(10, 2)
);

INSERT INTO [dbo].[ventas_nike] (
    INVOICE,
    id_Region,
    id_State,
    id_City,
    id_Department,
    id_Category,
    id_SubCategory,
    id_PRODUCT_NAME,
    id_DESCRIPTION,
    id_PRODUCT_TYPE,
    PRODUCT_SIZE,
    id_Color,
    id_BRAND,
    id_AVAILABILITY,
    [Price per Unit],
    [Units Sold],
    [Costo Unitario],
    [Operating Margin]
)
VALUES
(
    ''
);