FROM mcr.microsoft.com/devcontainers/dotnet:1-10.0

# Rutas de herramientas .NET
ENV PATH $PATH:/home/vscode/.dotnet:/home/vscode/.dotnet/tools:/root/.dotnet/tools

# Limpiar repositorios viejos y preparar el sistema
RUN rm -f /etc/apt/sources.list.d/yarn.list \
    && apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    lsb-release ca-certificates curl gnupg2 unzip \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Instalar herramientas de SQL
COPY mssql/installSQLtools.sh /tmp/installSQLtools.sh
RUN bash /tmp/installSQLtools.sh \
     && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/installSQLtools.sh

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends software-properties-common