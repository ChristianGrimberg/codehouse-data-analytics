CREATE DATABASE [Nike_Sabado];
GO

-- Permitir conexiones remotas
EXEC sp_configure 'remote access', 1;
RECONFIGURE;

-- Verificar configuración de red
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'network packet size', 8192;
RECONFIGURE;
