#!/bin/bash

# Crear carpeta de backups si no existe.
mkdir -p ./backups

# Nombre de la BDD a respaldar.
DB_NAME=postgres

# Credenciales y configuración.
DB_USER=odoo
DB_CONTAINER=odoo-project-management-education-db-1
BACKUP_DIR=./backups
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
FILE_NAME="${DB_NAME}_${DATE}.sql"

# Comando pg_dump ejecutado dentro del contenedor.
docker exec -t $DB_CONTAINER pg_dump -U $DB_USER $DB_NAME > $BACKUP_DIR/$FILE_NAME

if [ -f "$FILE_PATH" ]; then
    SIZE=$(ls -lh "$FILE_PATH" | awk '{print $5}')
    echo "Backup guardado en $BACKUP_DIR/$FILE_NAME (tamaño: $SIZE)"
else
    echo "Error: no se pudo crear el backup."
fi