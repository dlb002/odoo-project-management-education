#!/bin/bash

# Ruta local donde se guardan los backups.
LOCAL_BACKUP_DIR="/home/odoo/odoo-project-management-education/odoo_backups"

# Nombre del remoto de rclone
REMOTE_NAME="googledrive"

# Ruta en Google Drive donde quieres guardar los backups
REMOTE_DIR="$REMOTE_NAME:/odoo_backups"

# Ejecutar sincronización
echo "Sincronizando backups con Google Drive..."
rclone sync "$LOCAL_BACKUP_DIR" "$REMOTE_DIR" --progress --log-file="/var/log/rclone_backup.log"

if [ $? -eq 0 ]; then
    echo "Sincronización completada correctamente."
else
    echo "Error durante la sincronización con Google Drive."
fi