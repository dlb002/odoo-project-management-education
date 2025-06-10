#!/bin/bash

mkdir -p ./backups

DB_NAME=ies_delgado_hernandez
DB_CONTAINER=odoo-project-management-education-db-1
ODOO_CONTAINER=odoo-project-management-education-odoo-1
BACKUP_DIR=./backups
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
TMP_DIR="./tmp_backup_$DATE"
FILE_NAME="${DB_NAME}_${DATE}.zip"
FILE_PATH="$BACKUP_DIR/$FILE_NAME"

# Crear estructura de directorios con la carpeta raíz igual al nombre de la base.
mkdir -p $TMP_DIR/$DB_NAME

echo "Generando dump de la base de datos..."
docker exec -t $DB_CONTAINER pg_dump -U odoo $DB_NAME > $TMP_DIR/$DB_NAME/dump.sql
if [ $? -ne 0 ]; then
  echo "Error: no se pudo crear el dump de la base de datos."
  rm -rf $TMP_DIR
  exit 1
fi

echo "Copiando filestore desde contenedor Odoo..."
docker cp $ODOO_CONTAINER:/var/lib/odoo/filestore/$DB_NAME $TMP_DIR/$DB_NAME/filestore
if [ $? -ne 0 ]; then
  echo "Error: no se pudo copiar el filestore."
  rm -rf $TMP_DIR
  exit 1
fi

echo "Creando manifest.json..."
cat > $TMP_DIR/$DB_NAME/manifest.json << EOF
{
  "database": "$DB_NAME",
  "backup_date": "$DATE",
  "info": "Backup generado automáticamente para restauración web"
}
EOF

echo "Creando archivo ZIP compatible con restauración web..."
cd $TMP_DIR
zip -r $FILE_PATH $DB_NAME > /dev/null
cd -

rm -rf $TMP_DIR

if [ -f "$FILE_PATH" ]; then
    SIZE=$(ls -lh "$FILE_PATH" | awk '{print $5}')
    echo "Backup ZIP compatible guardado en $FILE_PATH (tamaño: $SIZE)"
else
    echo "Error: no se pudo crear el archivo ZIP compatible."
fi

