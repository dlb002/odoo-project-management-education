# Copyright (C) 2025 Daniel López Bermúdez
# License AGPL-3.0 (https://www.gnu.org/licenses/agpl-3.0.html)

from odoo import models, api

class ProjectInherit(models.Model):
    _inherit = ['project.project']
