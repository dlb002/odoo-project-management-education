{
    'name': 'Custom IES Delgado Hernandez',
    'version': '1.0',
    'summary': 'Personalizaciones para la gestión de proyectos',
    'description': 'Este módulo extiende la funcionalidad de Odoo para la gestión de proyectos, adaptándolo a las necesidades del centro.',
    'author': 'Daniel López Bermúdez',
    'category': 'Project',
    'depends': ['project'],
    'data': [
        'security/groups.xml',
        'security/ir.model.access.csv',
        'security/rules.xml',
        #'data/mail_template_proyect.xml',
        #'data/mail_template_task.xml',
        #'data/ir_cron.xml'
    ],
    'installable': True,
    'application': False,
    'auto_install': False,
}
