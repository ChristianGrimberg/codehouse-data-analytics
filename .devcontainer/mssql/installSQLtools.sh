#!/bin/bash
set -e

# Detectar Arquitectura
ARCH=$(uname -m)
echo "Arquitectura detectada: $ARCH"

echo "Installing mssql-tools"
# Importar la llave GPG de Microsoft
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg

# Detectar distribución (Ubuntu Noble 24.04 detectada en el log)
DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
CODENAME=$(lsb_release -cs)

echo "Detectada distro: $DISTRO $CODENAME"

# Configurar el repositorio de Microsoft de forma dinámica
echo "deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/microsoft-prod.gpg] https://packages.microsoft.com/repos/microsoft-${DISTRO}-${CODENAME}-prod ${CODENAME} main" > /etc/apt/sources.list.d/microsoft.list

apt-get update
# Cambiamos a version 18 (necesaria para Debian 12 / Ubuntu 24.04 arm64)
ACCEPT_EULA=Y apt-get -y install unixodbc-dev msodbcsql18 mssql-tools18

# Creamos un acceso directo para que la ruta /opt/mssql-tools/ siga funcionando
ln -sfn /opt/mssql-tools18 /opt/mssql-tools

echo "Installing sqlpackage"
# Añadimos -k para evitar problemas de certificados SSL en el download
curl -sSLk -o sqlpackage.zip "https://aka.ms/sqlpackage-linux"
mkdir -p /opt/sqlpackage
# Agregamos -o para que no pregunte al sobrescribir
unzip -o sqlpackage.zip -d /opt/sqlpackage 
rm sqlpackage.zip
chmod a+x /opt/sqlpackage/sqlpackage

echo "SQL Tools installation finished successfully"