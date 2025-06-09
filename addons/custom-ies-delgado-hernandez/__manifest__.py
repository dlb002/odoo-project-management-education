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
        'views/project_views.xml',
        'views/project_task_views.xml',
    ],
    'installable': True,
    'application': False,
    'auto_install': False,
}
