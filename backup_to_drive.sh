#!/bin/bash

CONTAINER_NAME="odoo-project-management-education-odoo-1"
SOURCE_PATH="/var/lib/odoo/.local/share/Odoo/backups/ies_delgado_hernandez"
DEST_PATH="$HOME/odoo_backups/ies_delgado_hernandez"
LOG_FILE="$HOME/rclone_backup.log"
REMOTE_NAME="googledrive"
REMOTE_DIR="backup_odoo/ies_delgado_hernandez"

echo "Copiando backups desde el contenedor $CONTAINER_NAME ..."
docker cp "$CONTAINER_NAME:$SOURCE_PATH" "$DEST_PATH"

if [ $? -ne 0 ]; then
  echo "Error copiando backups desde el contenedor."
  exit 1
fi

echo "☁️ Subiendo backups a Google Drive..."
rclone sync "$DEST_PATH" "$REMOTE_NAME:$REMOTE_DIR" --log-level INFO --log-file "$LOG_FILE"

if [ $? -eq 0 ]; then
  echo "Sincronización completada correctamente."
else
  echo "Error durante la sincronización con Google Drive."
fi

