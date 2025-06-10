#!/bin/bash

# Crear carpeta de backups si no existe.
mkdir -p ./backups

# Variables
DB_NAME=ies_delgado_hernandez
DB_CONTAINER=odoo-project-management-education-db-1
ODOO_VOLUME=odoo-data
BACKUP_DIR=./backups
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
TMP_DIR="./tmp_backup_$DATE"
FILE_NAME="${DB_NAME}_backup_${DATE}.zip"
FILE_PATH="$BACKUP_DIR/$FILE_NAME"

# Crear directorio temporal local
mkdir -p $TMP_DIR

# 1. Dump de la base de datos.
echo "Generando dump de la base de datos..."
docker exec -t $DB_CONTAINER pg_dump -U odoo $DB_NAME > $TMP_DIR/dump.sql
if [ $? -ne 0 ]; then
  echo "Error: no se pudo crear el dump de la base de datos."
  rm -rf $TMP_DIR
  exit 1
fi

# 2. Copiar filestore desde volumen Docker.
echo "Copiando filestore desde volumen Docker (odoo-data)..."
docker run --rm -v $ODOO_VOLUME:/data -v $(pwd)/$TMP_DIR:/backup busybox sh -c "cp -r /data/filestore /backup/"
if [ $? -ne 0 ]; then
  echo "Error: no se pudo copiar el filestore desde el volumen."
  rm -rf $TMP_DIR
  exit 1
fi

# 3. Crear manifest.json básico.
echo "Creando manifest.json..."
cat > $TMP_DIR/manifest.json << EOF
{
  "database": "$DB_NAME",
  "backup_date": "$DATE",
  "info": "Backup automático generado por script"
}
EOF

# 4. Empaquetar todo en un ZIP.
echo "Creando archivo ZIP de backup..."
cd $TMP_DIR
zip -r $FILE_PATH dump.sql filestore manifest.json > /dev/null
cd -

# 5. Limpiar archivos temporales.
rm -rf $TMP_DIR

# 6. Mostrar resultado.
if [ -f "$FILE_PATH" ]; then
    SIZE=$(ls -lh "$FILE_PATH" | awk '{print $5}')
    echo "Backup ZIP guardado en $FILE_PATH (tamaño: $SIZE)"
else
    echo "Error: no se pudo crear el archivo ZIP de backup."
fi
