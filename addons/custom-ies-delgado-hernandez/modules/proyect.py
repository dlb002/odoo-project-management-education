from odoo import models, fields

class ProjectInherit(models.Model):
    _inherit = 'project.project'

    custom_field = fields.Char(string='Campo Personalizado')
    priority_level = fields.Selection([
        ('low', 'Baja'),
        ('medium', 'Media'),
        ('high', 'Alta'),
    ], string='Nivel de Prioridad', default='medium')