FROM odoo:17

USER root

RUN pip install --no-cache-dir pysftp

USER odoo
