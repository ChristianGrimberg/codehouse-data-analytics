# **Análisis de tendencias y predicción de la demanda en la importación de neumáticos**

## *Autor: Christian Grimberg*

## *Comisión: 79120*

## *Curso: Data Analytics*

# **Primera Entrega**

## **1\. Objetivos del Proyecto (Metodología SMART)**

Para cumplir con la consigna de la primera entrega, planteo mis objetivos siguiendo la metodología SMART:

* **S (Específico):** Mi idea es analizar el mercado de importación de neumáticos en Argentina de los últimos 5 años (2019-2023). Quiero identificar los factores más importantes (como el país de origen, la estacionalidad o la empresa) que mueven el volumen de importación. El objetivo es intentar desarrollar un modelo predictivo que estime la demanda en el corto plazo.  
* **M (Medible):** Voy a medir el análisis descriptivo viendo si puedo identificar las 5 empresas que más importan y los 3 principales países de origen.  
* **A (Alcanzable):** Creo que es un objetivo alcanzable porque el dataset que nos dieron tiene 5 años de historia y varias dimensiones (Empresa, País, etc.) que tienen la información necesaria para hacer tanto el análisis como el modelo.  
* **R (Relevante):** Este análisis me parece relevante porque ayuda a entender cómo optimizar inventario o anticipar problemas de suministro. Además, para el curso, creo que cumple perfecto con los requisitos de analizar tendencias y aplicar IA.  
* **T (Definido en el Tiempo):** El análisis va a cubrir el período completo de 2019 a 2023\. Y la idea es tener el modelo predictivo terminado para las fechas de entrega final del curso.

## **2\. Hipótesis de Análisis**

Mi hipótesis principal para orientar el análisis es la siguiente:

"La importación de neumáticos en Argentina no pasa por casualidad, sino que debe tener **patrones estacionales** claros (quizás picos antes de las vacaciones o después de la cosecha) y también debe estar **muy influenciada por el país de origen** (como China o Brasil). Por eso, creo que se puede armar un **modelo de IA (serie temporal) que prediga la demanda** futura mejor que un simple promedio."

## **3\. Aplicación de Inteligencia Artificial (IA)**

Esta es la parte donde explico cómo podría usar IA. La idea es aplicarlo para hacer un **análisis predictivo**. Como tenemos datos de 5 años (más de los 3 períodos que pide la consigna), el dataset es ideal para entrenar un **modelo de pronóstico de series temporales** (Time Series Forecasting).

De esta manera, el objetivo de la IA no solo va a mirar el pasado, sino que intentará **proyectar el volumen de importación (en unidades) para los próximos trimestres**. Esto serviría para demostrar cómo se puede usar la IA para tomar mejores decisiones de stock, que podría estar cumpliendo con el espíritu de la consigna.

# **Segunda Entrega**

## **4\. Alcance del proyecto**

En esta sección se define el alcance del análisis de los datos a realizar basado en el archivo de Excel:

* Es un análisis enfocado en las importaciones de neumáticos nuevos que entraron al país entre 2019 y 2023\.  
* Se analiza el dinero invertido (**Valor en Aduana**) y cuántos neumáticos entraron (**Cantidad de Unidades**) para entender el tamaño del mercado.  
* Se requiere efectuar una sanitización sobre los datos.

## **5\. Usuario final y nivel de aplicación**

Se propone como hipótesis presentar los indicadores de análisis a estos tres tipos de personas:

* **Nivel estratégico (Dueños o Directores):**  
  * **¿Para qué les sirve?** Para ver los datos más significativos, como por ejemplo, qué países tenemos mayor dependencia al importar y cómo vienen subiendo los costos año a año.  
  * **Decisión:** Pueden hacer un uso de proyecciones para armar el presupuesto del año siguiente.  
* **Nivel táctico (Gerentes de Compras):**  
  * **¿Para qué les sirve?** Para entender la estacionalidad, como por ejemplo, necesitan saber en qué meses del año suele haber picos de importación.  
  * **Decisión:** Pueden prever de mejor manera en qué meses se deben hacer los pedidos a los proveedores para no quedarse sin mercadería.  
* **Nivel operativo (Analistas de Stock):**  
  * **¿Para qué les sirve?** Para el control diario, como por ejemplo, que les permita buscar operaciones puntuales por número de registro o por empresa.  
  * **Decisión:** Pueden revisar que los precios y cantidades ingresadas sean correctos y no hayan errores de carga.

## **6\. Modelo de datos (Tipos de tablas y relaciones)**

Se estructuran los datos usando un modelo de una tabla principal en el centro como tabla de hechos, junto a otras tablas alrededor que brindan una dimensión medible de los detalles, persiguiendo un modelo de relación de tipo de **"Esquema de Estrella"**.

![][image1]

### **Definiciones de las tablas:**

Estas son las tablasa utilizar y cómo se relacionan entre sí:

#### **Tabla “Registro” (Principal)**

Es la tabla de hechos, que comprende toda la historia de las operaciones.

* **Nro\_Registro (Clave Principal \- PK):** Es el código único de cada operación. No se repite.  
* **ID\_Empresa (Clave Foránea \- FK):** Es la relación que me permite traer la información de la tabla de empresas.  
* **ID\_Ciudad (Clave Foránea \- FK):** Es la relación que me permite traer la información de la tabla de ciudades.						  
* **ID\_Departamento (Clave Foránea \- FK):** Es la relación que me permite traer la información de la tabla de departamentos.  
* **Fecha\_Numeracion (Clave Foránea \- FK):** Es la fecha de la operación que se va conectar como calendario en PowerBI.  
* **CIF\_Valor\_Aduana:** Es el costo en dólares de la importación.  
* **ID\_Pais\_Origen (Clave Foránea \- FK):** Es la relación que me permite traer la información de la tabla de los países de origen.  
* **ID\_Pais\_Procedencia (Clave Foránea \- FK):** Es la relación que me permite traer la información de la tabla de los países de procedencia.  
* **NCM**: Es el código de Nomenclatura Común del Mercosur del producto comercializado.  
* **ID\_Descripcion\_Comercial (Clave Foránea \- FK):** Es la relación que me permite traer la información de la tabla de la denominación de los productos comercializados.  
* **Cantidades:** Son las cantidades de productos en sus distintas variantes. También se puede sumar para ver los volúmenes.  
* **Peso\_Neto:** Es el peso de la mercadería, sin incluir el envasado o embalaje.  
* **Tipo\_Despacho:** Clasificación del tipo de operación aduanera (ej. definitivo, temporal).

#### **Tabla “Empresa” (Dimensión)**

Aquí se encuentran los nombres reales de las empresas.

* **ID\_Empresa (PK):** El código de la empresa. No se repite.  
* **Empresa:** El nombre (Razón Social).

#### **Tabla “País de origen” (Dimensión)**

Aquí se encuentran los nombres de los países de donde viene la mercadería.

* **ID\_Pais (PK):** El código del país. No se repite.  
* **Pais:** El nombre del país (ej. China, Brasil).

#### **Tabla “País de procedencia” (Dimensión)**

A veces el país de donde viene la mercadería no es el mismo que el que fabrica. Esta tabla me permite ver esa diferencia.

* **ID\_Pais (PK):** El código del país. No se repite.  
* **Pais:** El nombre del país (ej. China, Brasil).

#### **Tabla “Descripción comercial” (Dimensión)**

Es la tabla con la denominación de los productos que se importaron.

* **ID\_Descripcion\_Comercial (PK):** El código del producto. No se repite.  
* **Descripcion\_Comercial:** Es la descripción del producto.

#### **Tabla “Ciudad” (Dimensión)**

Permite conocer en qué ciudad está radicada la empresa importadora.

* **ID\_Ciudad (PK):** El código de la ciudad. No se repite.  
* **Ciudad:** Es el nombre de la ciudad (ej. Montevideo, Salto).

#### **Tabla “Departamento” (Dimensión)**

Agrupa las ciudades por departamento, siendo útil para hacer mapas por regiones más grandes.

* **ID\_Departamento (PK):** El código del departamento. No se repite.  
* **Ciudad:** Es el nombre del departamento (ej. Canelones, Artigas).

#### **Tabla “Régimen” (Dimensión)**

Explica bajo qué modalidad legal entró la mercadería (ej. si fue una importación definitiva o temporal).

* **ID\_Régimen (PK):** El código del régimen. No se repite.  
* **Régimen:** Es la descripción del tipo de operación.

#### **Tabla “Unidad Física” (Dimensión)**

Especifica en qué unidad se mide la cantidad (generalmente "Unidades" o "Número").

* **ID\_Unidad\_Fisica (PK):** Es el código de la unidad. No se repite.  
* **Unidad Física:** Es la descripción de la unidad.

#### **Tabla “Calendario” (Dimensión)**

Es una tabla a crear dentro de PowerBI para poder analizar los datos, por ejemplo, por Año, Trimestre y/o Mes.

# **Tercera Entrega**

## **7\. Base de datos de SQL Server**

Para esta nueva entrega se migran los datos del archivo Excel a SQL Server dentro de una base de datos denominada \[03.Entrega\]. Para realizar la migración, se copia cada hoja del archivo Excel a un archivo CSV de texto plano para poder ser importado desde SQL Server Management Studio:

![][image2]

## **8\. Repositorio del proyecto de SQL Server alojado en GitHub**

Una vez importadas todas las tablas y sus registros, se crea un repositorio en GitHub con el código de cada objeto de la base de datos con todos sus registros. Se deja el link público a continuación: [ChristianGrimberg/codehouse-data-analytics](https://github.com/ChristianGrimberg/codehouse-data-analytics)

Dentro del directorio “Modules” se encuentra el directorio “03.Entrega” con la configuración del proyecto de SQL Server que incluye todos los objetos de la base de datos y sus registros:

![][image3]

## **9\. Archivo de Power BI conectado a SQL Server**

Se realiza la carga del archivo de Power BI conectado a las tablas importadas en SQL Server, dentro del motor de “(localdb)\\MSSQLLocalDB” y a la base de datos “03.Entrega”:

![][image4]

### **Tabla \[Ciudades\] en Power BI**

La tabla \[Ciudades\] se encuentra conectada y configurada de la siguiente manera:

![][image5]

### **Tabla \[Departamentos\] en Power BI**

La tabla \[Departamentos\] se encuentra conectada y configurada de la siguiente manera:  
![][image6]

### **Tabla \[DescripcionesComerciales\] en Power BI**

La tabla \[DescripcionesComerciales\] se encuentra conectada y configurada de la siguiente manera:

![][image7]

### **Tabla \[Empresas\] en Power BI**

La tabla \[Empresas\] se encuentra conectada y configurada de la siguiente manera:

![][image8]

### **Tabla \[PaisesOrigen\] en Power BI**

La tabla \[PaisesOrigen\] se encuentra conectada y configurada de la siguiente manera:

![][image9]

### **Tabla \[PaisesProcedencia\] en Power BI**

La tabla \[PaisesProcedencia\] se encuentra conectada y configurada de la siguiente manera:

![][image10]

### **Tabla \[Regimenes\] en Power BI**

La tabla \[Regimenes\] se encuentra conectada y configurada de la siguiente manera:

![][image11]

### **Tabla \[Registros\] en Power BI**

La tabla \[Registros\] se encuentra conectada y configurada de la siguiente manera:

![][image12]

### **Tabla \[UnidadesFisicas\] en Power BI**

La tabla \[UnidadesFisicas\] se encuentra conectada y configurada de la siguiente manera:

![][image13]

### **Creación de la Tabla \[Calendario\] en Power BI**

Desde la sección de “Vista de tablas” en Power BI se crea la tabla \[Calendario\] basada en el campo \[FechaNumeracion\] de la tabla \[Registros\]:

![][image14]  
 

### **Relaciones y cardinalidad de las tablas de SQL Server en Power BI**

A continuación se puede observar las relaciones y la cardinalidad de las tablas de SQL Server conectadas desde Power BI:

![][image15]

### **Tablero inicial en Power BI**

Para esta tercera entrega, se carga una visualización de Matriz con los campos de “Año” y “Trimestre” como “Filas” y la medida “Total CIF/Valor Aduana” como “Valores”:

![][image16]

# **Entrega Final**

## **10. Tablero de Control en Power BI**

Como cierre del proyecto, se construyó un **Dashboard de Control** interactivo en Power BI que materializa el análisis planteado. Este tablero permite navegar desde los datos generales hasta el detalle operativo, integrando visualizaciones dinámicas y facilitando la toma de decisiones.

A continuación se detalla la estructura del reporte según las imágenes del resultado final:

### **Portada (Solapa 1)**

Se diseñó una interfaz de bienvenida clara y funcional. Incluye el título del proyecto, la fecha de última actualización (para garantizar la vigencia del dato) y botones de navegación que permiten acceder directamente al Glosario o a los distintos niveles de análisis.

![][image17]

### **Glosario (Solapa 2)**

Para asegurar que cualquier usuario pueda interpretar el tablero, se incorporó un Glosario interactivo. Esta sección explica los términos técnicos del negocio (como "Valor CIF", "Régimen", "NCM") y las métricas utilizadas, democratizando el acceso a la información.

![][image18]

### **Análisis General (Solapa 3)**

Esta vista ofrece un panorama estratégico ("Big Picture") de las importaciones.
*   **KPIs:** Tarjetas con los valores totales de Importación (USD), Cantidad de Unidades y Peso Neto.
*   **Tendencias:** Gráficos de evolución temporal para identificar estacionalidades o picos de demanda.
*   **Visión de Mercado:** Distribución por los principales Países de Origen y Empresas, permitiendo entender rápidamente la composición del mercado.

![][image19]

### **Análisis Detallado e IA (Solapa 4)**

Esta sección profundiza en la granularidad de los datos y aplica las hipótesis de inteligencia artificial.
*   Permite un análisis exhaustivo abriendo la información por distintas dimensiones (Ciudad, Tipo de Despacho, Descripción del Producto).
*   Visualización de matrices detalladas para auditoría.
*   Incorporación de elementos de análisis avanzado para validar las predicciones de demanda y explicar el comportamiento de las importaciones.

![][image20]


[image1]: img/image1.png

[image2]: img/image2.png

[image3]: img/image3.png

[image4]: img/image4.png

[image5]: img/image5.png

[image6]: img/image6.png

[image7]: img/image7.png

[image8]: img/image8.png

[image9]: img/image9.png

[image10]: img/image10.png

[image11]: img/image11.png

[image12]: img/image12.png

[image13]: img/image13.png

[image14]: img/image14.png

[image15]: img/image15.png

[image16]: img/image16.png

[image17]: img/image17.png

[image18]: img/image18.png

[image19]: img/image19.png

[image20]: img/image20.png