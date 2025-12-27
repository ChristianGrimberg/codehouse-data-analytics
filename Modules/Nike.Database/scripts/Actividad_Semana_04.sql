                                  /*  PRACTICA SEMANA 4 */


------                     RELACIONALES

-- 📌 Filtrar por igualdad (=)
/* 🎯 Mostrar un producto de un Id específico (por ejemplo, ID de producto = 5) */
SELECT id_Color, Price_per_Unit
FROM ventas_nike
WHERE id_Color = 5;


-- 📌 Filtrar por diferencia (!=) 
/* 🎯 Mostrar los producto que sean diferente a un Id (por ejemplo, ID de producto = 5) */




-- 📌 Filtrar por valor mayor que ( > )
/* 🎯 Mostrar productos cuyo margen operativo sea mayor a 50 */



------                           LOGICOS

--📌 Uso de AND 
/* 🎯 Mostrar productos caros con alto margen operativo */



-- 📌 Uso de OR 
/* 🎯 Mostrar productos con talle M o L */




-- 📌 Uso de NOT 
/* 🎯 Excluir productos con talle S */


--                                 LIKE


-- 📌 Uso de LIKE con comodines % y _
/* 💡 Filtra todos los Productos que empiezan con “L” */



/* 💡 Filtrar los talles con 3 caracteres, el segundo  no se  sabe cual es, 
el primero es 2 y el tercero es L */




/* 💡 Filtra Productos que tienen “Mid” en alguna parte */





/* 💡 Filtrar Productos que empiezan 
y se encuentran entre las letras entre S y X (inclusive) */



-- 📌 Uso de IN
/* 🎯 Filtra estos talles específicos = 'XS', 'M', 'L' */



-- 📌 Uso de BETWEEN
/* 🎯 Selecciona productos con margen operativo entre 0.40 y 0.80 (inclusive) */


------                                Aritméticos


-- ➕ Suma (+)
/* 🎯 Sumar precio unitario + margen operativo */




-- ➗ División (/) con NULLIF
/* 🎯 Dividir precio por unidades vendidas, evitando división por cero */



------                                Formateo numérico

-- 🔢 ROUND(valor, 2)
/* 🎯 Precio promedio redondeado a 2 decimales  */



-- 🔁 CAST(valor AS INT)
/* 🎯 Convierte el precio a entero */



-- ✨ FORMAT(valor, 'N2')
/*  Muestra el precio con separador de miles y dos decimales */

------                                 Funciones de redondeo


-- 💡 CEILING
/* Redondea precios hacia arriba */


-- 💡 FLOOR
/* 🎯 Redondea precios hacia abajo */


------                              DISTINCT - WHERE - AS


-- 🔹 DISTINCT
/* 🎯  Muestra los tamaños de producto sin repetir */



--🔹 WHERE
/* 🎯 Filtra talles con más de 900 unidades vendidas */



-- 🔹 AS (alias de columna)
/* 🎯 Renombra las columnas con alias para mejor lectura */



------                              ORDER BY - TOP - GROUP BY - HAVING

-- 🔷 ORDER BY
/* 🎯 Ordena los talles por unidades vendidas, de mayor a menor */




-- 🟧 TOP
/* 🎯 Muestra los 5 tallas con mayor precio unitario */



-- 🟩 GROUP BY
/* 🎯 Agrupa por talle y calcula la cantidad total de unidades vendidas por talle */



-- 🟥 HAVING
/* 🎯 Muestra solo los talles donde se vendieron más de 800 unidades */





------                                       Funciones Escalares


--            🧵 Funciones de Cadenas

-- 🔤 LEN
/* 🎯 Muestra la cantidad de caracteres de tu tabla descripción */




-- 🔠 UPPER(columna)
/* 🎯 Convierte las categorías a mayúscula */



-- 🔡 LOWER(columna)
/* 🎯 Convierte el talle a minúsculas */



-- 📝 REPLACE
/* 🎯 Reemplaza la talla 'XL' por 'ExtaLarge' */



--                 📅 Funciones de Fecha

-- 🕒 GETDATE()
/* 📅 Fecha actual del sistema */



-- 🕒 YEAR(), MONTH(), DAY()
/* 📅 Extrae el año, mes y día de la fecha de factura */





-- 🕒 DATEDIFF
/* 📅 Días desde la venta hasta hoy */








         

































