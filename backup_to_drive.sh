#!/bin/bash

BACKUP_DIR="./odoo_backups"
LOG_FILE="$HOME/rclone_backup.log"
REMOTE_NAME="googledrive"
REMOTE_DIR="backup_odoo"

echo "Sincronizando backups con Google Drive..."

rclone sync "$BACKUP_DIR" "$REMOTE_NAME:$REMOTE_DIR" --log-level INFO --log-file "$LOG_FILE"

if [ $? -eq 0 ]; then
  echo "Sincronización completada correctamente."
else
  echo "Error durante la sincronización con Google Drive."
fi