#!/bin/bash

# Nombre de la BDD a respaldar.
DB_NAME=postgres

# Credenciales y configuración.
DB_USER=odoo
DB_CONTAINER=db
BACKUP_DIR=./backups
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
FILE_NAME="${DB_NAME}_${DATE}.sql"

# Comando pg_dump ejecutado dentro del contenedor.
docker exec -t $DB_CONTAINER pg_dump -U $DB_USER $DB_NAME > $BACKUP_DIR/$FILE_NAME

echo "Backup guardado en $BACKUP_DIR/$FILE_NAME"
