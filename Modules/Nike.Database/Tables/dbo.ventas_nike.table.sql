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

    CONSTRAINT FK_Categoria FOREIGN KEY (id_Category) REFERENCES Categorias (id_Category),
    CONSTRAINT FK_Ciudad FOREIGN KEY (id_City) REFERENCES Ciudad (id_City),
    CONSTRAINT FK_Descripcion FOREIGN KEY (id_DESCRIPTION) REFERENCES Descripcion (id_DESCRIPTION),
    CONSTRAINT FK_Estado FOREIGN KEY (id_State) REFERENCES Estado (id_State),
    CONSTRAINT FK_Producto FOREIGN KEY (id_PRODUCT_NAME) REFERENCES Nombre_Producto (id_PRODUCT_NAME)
);
GO