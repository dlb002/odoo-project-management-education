#!/bin/bash

# Realiza git pull para obtener los cambios más recientes
cd /opt/odoo
git pull origin main  # Asegúrate de que 'main' es la rama correcta

# Ahora inicia Odoo
exec /entrypoint.sh odoo
