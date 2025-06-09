from odoo import models, fields, api
from datetime import date, timedelta

class ProjectTask(models.Model):
    _inherit = 'project.task'

    # @api.model_create_multi
    # def create(self, vals_list):
    #     tasks = super().create(vals_list)
    #     template = self.env.ref('custom-ies-delgado-hernandez.mail_template_task_created')
    #     for task in tasks:
    #         for user in task.user_ids:
    #             if user.email:
    #                 template.with_context(email_to=user.email).send_mail(task.id, force_send=True)
    #     return tasks
    #
    # def write(self, vals):
    #     res = super().write(vals)
    #     template = self.env.ref('custom-ies-delgado-hernandez.mail_template_task_updated')
    #     for task in self:
    #         if any(k in vals for k in ['name', 'user_ids', 'date_deadline']):
    #             for user in task.user_ids:
    #                 if user.email:
    #                     template.with_context(email_to=user.email).send_mail(task.id, force_send=True)
    #     return res
    #
    # @api.model
    # def cron_check_deadlines(self):
    #     tomorrow = date.today() + timedelta(days=1)
    #     stage_hecho = self.env['project.task.type'].search([('name', 'ilike', 'hecho')], limit=1)
    #     domain = [
    #         ('date_deadline', '=', tomorrow.strftime('%Y-%m-%d')),
    #         ('user_ids', '!=', False),
    #     ]
    #     if stage_hecho:
    #         domain.append(('stage_id', '!=', stage_hecho.id))
    #
    #     tasks = self.search(domain)
    #     template = self.env.ref('custom-ies-delgado-hernandez.mail_template_task_deadline')
    #
    #     for task in tasks:
    #         for user in task.user_ids:
    #             if user.email:
    #                 template.with_context(email_to=user.email).send_mail(task.id, force_send=True)