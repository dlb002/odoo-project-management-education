#!/bin/bash

LOCAL_PATH="$HOME/odoo_backups/ies_delgado_hernandez"
LOG_FILE="$HOME/rclone_backup.log"
REMOTE_NAME="googledrive"
REMOTE_DIR="backup_odoo/ies_delgado_hernandez"

# Verificamos si la carpeta existe.
if [ ! -d "$LOCAL_PATH" ]; then
  echo "❌ La carpeta local '$LOCAL_PATH' no existe. Abortando."
  exit 1
fi

echo "☁️ Subiendo backups desde $LOCAL_PATH a Google Drive..."
rclone sync "$LOCAL_PATH" "$REMOTE_NAME:$REMOTE_DIR" --log-level INFO --log-file "$LOG_FILE" --delete-during

if [ $? -eq 0 ]; then
  echo "✅ Sincronización completada correctamente."

  # Borrar archivos remotos con más de 30 días
  echo "🧼 Eliminando archivos remotos con más de 30 días..."
  rclone delete --min-age 30d "$REMOTE_NAME:$REMOTE_DIR"
else
  echo "❌ Error durante la sincronización con Google Drive."
  exit 1
fi
