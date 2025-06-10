#!/bin/bash

# Crear carpeta de backups si no existe.
mkdir -p ./backups

# Nombre de la BDD a respaldar.
DB_NAME=ies_delgado_hernandez

# Credenciales y configuración.
DB_USER=odoo
DB_CONTAINER=odoo-project-management-education-db-1
BACKUP_DIR=./backups
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
FILE_NAME="${DB_NAME}_${DATE}.sql"
FILE_PATH="$BACKUP_DIR/$FILE_NAME"

# Comando pg_dump ejecutado dentro del contenedor.
docker exec -t $DB_CONTAINER pg_dump -U $DB_USER $DB_NAME > $FILE_PATH

if [ -f "$FILE_PATH" ]; then
    SIZE=$(ls -lh "$FILE_PATH" | awk '{print $5}')
    echo "Backup guardado en $FILE_PATH (tamaño: $SIZE)"
else
    echo "Error: no se pudo crear el backup."
fi
