#!/bin/bash
dacpac="false"
sqlfiles="false"
dacpath=$1
sqlpath=$2

# Load SA_PASSWORD from .env file
export $(grep -v '^#' .devcontainer/.env | xargs)
SApassword=$MSSQL_SA_PASSWORD
echo "Using SA password: $SApassword"

echo "SELECT * FROM SYS.DATABASES" | dd of=testsqlconnection.sql
for i in {1..60};
do
    # Agregamos -C para confiar en el certificado del servidor
    /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SApassword -C -d master -i testsqlconnection.sql > /dev/null
    if [ $? -eq 0 ]
    then
        echo "SQL server ready"
        break
    else
        echo "Not ready yet..."
        sleep 1
    fi
done
rm testsqlconnection.sql

for f in $dacpath/*
do
    if [ $f == $dacpath/*".dacpac" ]
    then
        dacpac="true"
        echo "Found dacpac $f"
    fi
done

for f in $sqlpath/*
do
    if [ $f == $sqlpath/*".sql" ]
    then
        sqlfiles="true"
        echo "Found SQL file $f"
    fi
done

if [ $sqlfiles == "true" ]
then
    for f in $sqlpath/*
    do
        if [ $f == $sqlpath/*".sql" ]
        then
            echo "Executing $f"
            # Agregamos -C para la ejecución de los scripts SQL (como setup.sql)
            /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SApassword -C -d master -i $f
        fi
    done
fi

if [ $dacpac == "true" ] 
then
    for f in $dacpath/*
    do
        if [ $f == $dacpath/*".dacpac" ]
        then
            dbname=$(basename $f ".dacpac")
            echo "Deploying dacpac $f"
            # sqlpackage ya tenía el parámetro /TargetTrustServerCertificate:True
            /opt/sqlpackage/sqlpackage /Action:Publish /SourceFile:$f /TargetTrustServerCertificate:True /TargetServerName:db /TargetDatabaseName:$dbname /TargetUser:sa /TargetPassword:$SApassword
        fi
    done
fi