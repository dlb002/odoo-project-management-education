#!/bin/bash

# Crear carpeta de backups si no existe.
mkdir -p ./backups

# Nombre de la base de datos a respaldar.
DB_NAME=ies_delgado_hernandez

# Contenedor de Odoo.
ODOO_CONTAINER=odoo-project-management-education-odoo-1

# Directorio local donde guardar el backup.
BACKUP_DIR=./backups

# Fecha para el archivo.
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

# Nombre del archivo backup zip.
FILE_NAME="${DB_NAME}_${DATE}.zip"
FILE_PATH="$BACKUP_DIR/$FILE_NAME"

# Ruta temporal dentro del contenedor para guardar el backup.
TMP_PATH="/tmp/$FILE_NAME"

# Ejecutar backup con CLI de Odoo dentro del contenedor.
docker exec -t $ODOO_CONTAINER odoo --backup --database=$DB_NAME --zip --file=$TMP_PATH

# Copiar el backup desde el contenedor al host local.
docker cp $ODOO_CONTAINER:$TMP_PATH $FILE_PATH

# Eliminar el archivo temporal dentro del contenedor.
docker exec -t $ODOO_CONTAINER rm -f $TMP_PATH

# Comprobar que el archivo backup existe y mostrar tamaño.
if [ -f "$FILE_PATH" ]; then
    SIZE=$(ls -lh "$FILE_PATH" | awk '{print $5}')
    echo "Backup ZIP guardado en $FILE_PATH (tamaño: $SIZE)"
else
    echo "Error: no se pudo crear el backup ZIP."
fi
