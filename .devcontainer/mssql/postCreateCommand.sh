#!/bin/bash
dacpac="false"
sqlfiles="false"
dacpath=$1
sqlpath=$2

# Cargar password
if [ -f .devcontainer/.env ]; then
    export $(grep -v '^#' .devcontainer/.env | xargs)
fi
MSSQL_SA_PASSWORD=$MSSQL_SA_PASSWORD
MSSQL_SERVER=$MSSQL_SERVER
MSSQL_DATABASE=$MSSQL_DATABASE
MSSQL_USER=$MSSQL_USER

echo "Esperando a SQL Server en localhost..."
echo "SELECT 1" > testsqlconnection.sql

for i in {1..60}; do
    # Usamos la ruta de herramientas versión 18 instalada
    /opt/mssql-tools18/bin/sqlcmd -S "$MSSQL_SERVER" -U "$MSSQL_USER" -P "$MSSQL_SA_PASSWORD" -C -i testsqlconnection.sql > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "¡SQL Server está listo!"
        break
    else
        echo "Servidor no disponible (reintento $i)..."
        sleep 2
    fi
done
rm testsqlconnection.sql

# Ejecutar Scripts SQL
if ls "$sqlpath"/*.sql >/dev/null 2>&1; then
    for f in "$sqlpath"/*.sql; do
        echo "Ejecutando: $f"
        /opt/mssql-tools18/bin/sqlcmd -S "$MSSQL_SERVER" -U "$MSSQL_USER" -P "$MSSQL_SA_PASSWORD" -C -d "$MSSQL_DATABASE" -i "$f"
    done
fi

# Publicar DACPACs (Usando la ruta simplificada)
if ls "$dacpath"/*.dacpac >/dev/null 2>&1; then
    for f in "$dacpath"/*.dacpac; do
        echo "Publicando DACPAC: $f"
        sqlpackage /a:Publish /tsn:"$MSSQL_SERVER" /tu:"$MSSQL_USER" /tp:"$MSSQL_SA_PASSWORD" /sf:"$f" /tdn:"$MSSQL_DATABASE" /tcsc:"True"
    done
fi