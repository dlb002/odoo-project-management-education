# Copyright (C) 2025 Daniel López Bermúdez
# License AGPL-3.0 (https://www.gnu.org/licenses/agpl-3.0.html)

FROM odoo:17

USER root

RUN pip install --no-cache-dir pysftp

USER odoo
