# 🎓 Odoo Project Management for Educational Centers

**Repositorio oficial del Proyecto de Desarrollo de Aplicaciones Multiplataforma, en el I.E.S. Delgado Hernández.**  
Este sistema está diseñado para facilitar la gestión de proyectos educativos a través de una instancia personalizada de Odoo 17.0 Community Edition desplegada en contenedores Docker y alojada en un servidor Proxmox del centro.

---

## 🛠️ Características del Proyecto

- Despliegue de Odoo 17.0 en una máquina virtual Ubuntu 22.04 LTS.
- Contenedores Docker para Odoo y PostgreSQL.
- Parametrización del módulo "Proyectos" con roles, permisos y vistas personalizadas.
- Notificaciones automáticas a responsables vía correo electrónico.
- Gestión de proyectos, tareas, subtareas, categorías, etiquetas, adjuntos...
- Informes en modo Kanban, calendario, gráficos, exportaciones...
- Automatización de copias de seguridad locales y en Google Drive.
- Interfaz simplificada para usuarios no técnicos.
- Manual de usuario para perfiles administradores y generales.

---

## 📦 Estructura del Proyecto

.

├── config/ # Archivo odoo.conf personalizado.

├── custom-addons/ # Módulos desarrollados a medida (roles, reglas, vistas...).

├── odoo_backups/ # Carpeta de backups locales.

├── docker-compose.yml # Orquestación de contenedores Odoo + PostgreSQL.

├── Dockerfile # Instalación de dependencias adicionales. 

├── backup_to_drive.sh # Script de subida automática de backups a Google Drive.

└── README.md # Este archivo.

---

## 🚀 Despliegue Local

### 1. Requisitos previos

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/)
- Git

### 2. Clonar el repositorio

```bash
git clone https://github.com/dlb002/odoo-project-management-education.git
cd odoo-project-management-education 
```

### 3. Iniciar el entorno
```bash
docker compose up -d
```

### 4. Acceder a la aplicación
Visita: http://localhost:8069

Credenciales por defecto configurables desde odoo.conf.

## 🧪 Automatización de Copias de Seguridad
Módulo instalado: database_auto_backup de OCA.

Backup diario en local (./odoo_backups) a las 05:00 AM en la instancia de Odoo desplegada.

Sincronización automática con Google Drive mediante rclone en la MV de Proxmox.

Script: backup_to_drive.sh

Cron configurado para ejecutarse a las 06:00 AM en la MV de Proxmox.

## 📧 Notificaciones Automáticas
SMTP configurado con Gmail.

Notificaciones por creación/asignación de tareas o proyectos, cambios de etapa o estado.

## 👤 Roles y Permisos
| Rol             | Acceso                                |
|-----------------|---------------------------------------|
| Director        | Vista completa de proyectos y tareas  |
| Usuario General | Solo ve/modifica sus tareas asignadas |


Todos los permisos y reglas de registro están definidas en ./addons/custom-ies-delgado-hernandez/security.

## 📊 Informes y Vistas
Tareas por usuario, proyecto, estado, etiqueta...

Vista Kanban, calendario, lista y búsqueda avanzada.

Gráficos de barras, líneas y circulares.

Exportación a Excel directamente desde la interfaz.

## 📚 Documentación
📘 Manuales de usuario (perfil general).

🔐 Manuales de administrador.

📄 Desarrollo de las distintas fases del proyecto.

## 🧠 Autor
Daniel López Bermúdez (🇪🇸)

Proyecto desarrollado como parte del módulo de Proyecto de Desarrollo de Aplicaciones Multiplataforma (0491) del Ciclo de Formativo de Grado Superior en Desarrollo de Aplicaciones Multiplataforma.

- Tutor: Jesús Rodríguez Abreu
- Centro: I.E.S. Delgado Hernández
- Curso: 2024/2025

## 📜 Licencia
Este proyecto se publica bajo la licencia GNU APGLv3.