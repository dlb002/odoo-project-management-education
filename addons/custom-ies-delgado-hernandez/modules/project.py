from odoo import models, api


class ProjectInherit(models.Model):
    _inherit = ['project.project']

    # @api.model_create_multi
    # def create(self, vals_list):
    #     projects = super().create(vals_list)
    #     template = self.env.ref('custom-ies-delgado-hernandez.mail_template_project_created')
    #     for project in projects:
    #         if project.user_id and template:
    #             template.send_mail(project.id, force_send=True)
    #     return projects
    #
    # def write(self, vals):
    #     notify_fields = {
    #         'user_id',
    #         'stage_id',
    #         'date_deadline',
    #         'name',
    #         'active'
    #     }
    #     trigger_notification = any(field in vals for field in notify_fields)
    #
    #     result = super().write(vals)
    #
    #     if trigger_notification:
    #         template = self.env.ref('custom-ies-delgado-hernandez.mail_template_project_updated')
    #         for record in self:
    #             if record.user_id and template:
    #                 template.send_mail(record.id, force_send=True)
    #
    #     return result
