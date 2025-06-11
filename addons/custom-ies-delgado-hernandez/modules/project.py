from odoo import models, api

class ProjectInherit(models.Model):
    _inherit = ['project.project']
