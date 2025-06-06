from odoo import models, fields

class ProjectInherit(models.Model):
    _inherit = ['project.project']

