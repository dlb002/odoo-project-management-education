import xmlrpc.client
import base64
import datetime

# Configuración.
ODOO_URL = "http://172.16.201.135:8069"
DB_NAME = "ies_delgado_hernandez"
ADMIN_USER = "odooiesdelgadohernandez@gmail.com"
ADMIN_PASS = "OdooPassword00ñ"

def odoo_backup():
    try:
        # Conectar con el servidor común para autenticación.
        common = xmlrpc.client.ServerProxy(f"{ODOO_URL}/xmlrpc/2/common")
        uid = common.authenticate(DB_NAME, ADMIN_USER, ADMIN_PASS, {})
        if not uid:
            print("Error: Autenticación fallida. Verifica usuario y contraseña.")
            return

        # Conectar al modelo para ejecutar la acción de backup.
        models = xmlrpc.client.ServerProxy(f"{ODOO_URL}/xmlrpc/2/object")

        print(f"Solicitando backup de la base de datos '{DB_NAME}'...")
        backup_data = models.execute_kw(
            DB_NAME, uid, ADMIN_PASS,
            'db.backup', 'backup',
            [],  # no args.
            {'backup_format': 'zip'}  # kwargs: formato zip con filestore.
        )

        # backup_data es un base64 bytestring.
        backup_bytes = base64.b64decode(backup_data['data'])

        # Nombre de archivo con fecha y hora.
        timestamp = datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
        backup_filename = f"{DB_NAME}_backup_{timestamp}.zip"

        with open(backup_filename, "wb") as f:
            f.write(backup_bytes)

        print(f"Backup generado con éxito: {backup_filename}")

    except Exception as e:
        print(f"Error al crear el backup: {e}")


if __name__ == "__main__":
    odoo_backup()
