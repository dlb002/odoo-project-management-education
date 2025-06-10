#!/bin/bash

BACKUP_DIR="/var/lib/odoo/.local/share/Odoo/backups/ies_delgado_hernandez"
LOG_FILE="$HOME/rclone_backup.log"
REMOTE_NAME="googledrive"
REMOTE_DIR="backup_odoo/ies_delgado_hernandez"

echo "Sincronizando backups con Google Drive desde $BACKUP_DIR ..."

rclone sync "$BACKUP_DIR" "$REMOTE_NAME:$REMOTE_DIR" --log-level DEBUG --log-file "$LOG_FILE"

if [ $? -eq 0 ]; then
  echo "Sincronización completada correctamente."
else
  echo "Error durante la sincronización con Google Drive."
fi
