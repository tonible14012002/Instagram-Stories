# Generated by Django 4.2.5 on 2023-10-11 18:15

import core_apps.accounts.managers
from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ("accounts", "0003_profile"),
    ]

    operations = [
        migrations.AlterModelManagers(
            name="myuser",
            managers=[
                ("objects", core_apps.accounts.managers.UserManager()),
            ],
        ),
    ]
