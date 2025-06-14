# Copyright (C) 2025 Daniel López Bermúdez
# License AGPL-3.0 (https://www.gnu.org/licenses/agpl-3.0.html)

{
    'name': 'Custom IES Delgado Hernandez',
    'version': '1.0',
    'summary': ' Custom module for IES Delgado Hernandez',
    'description': ' This module adds custom functionality for the IES Delgado Hernandez project management system.',
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
    'license': 'AGPL-3',
}
