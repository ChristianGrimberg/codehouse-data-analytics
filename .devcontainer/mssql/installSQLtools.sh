#!/bin/bash
echo "Installing mssql-tools"
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | (OUT=$(apt-key add - 2>&1) || echo $OUT)
DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
CODENAME=$(lsb_release -cs)

# Mantenemos tu cambio de arquitectura [arch=amd64,arm64]
echo "deb [arch=amd64,arm64] https://packages.microsoft.com/repos/microsoft-${DISTRO}-${CODENAME}-prod ${CODENAME} main" > /etc/apt/sources.list.d/microsoft.list

apt-get update
# Cambiamos a versión 18 (necesaria para Debian 12 arm64)
ACCEPT_EULA=Y apt-get -y install unixodbc-dev msodbcsql18 mssql-tools18

# Creamos un acceso directo para que la ruta /opt/mssql-tools/ siga funcionando
ln -sfn /opt/mssql-tools18 /opt/mssql-tools

echo "Installing sqlpackage"
curl -sSL -o sqlpackage.zip "https://aka.ms/sqlpackage-linux"
mkdir -p /opt/sqlpackage
# Agregamos -o para que no pregunte al sobrescribir
unzip -o sqlpackage.zip -d /opt/sqlpackage 
rm sqlpackage.zip
chmod a+x /opt/sqlpackage/sqlpackage
