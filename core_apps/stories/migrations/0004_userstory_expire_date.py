# Generated by Django 4.2.5 on 2023-09-30 14:09

import core_apps.stories.models
from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("stories", "0003_remove_userstory_expired_userstory_status"),
    ]

    operations = [
        migrations.AddField(
            model_name="userstory",
            name="expire_date",
            field=models.DateTimeField(
                null=True
            ),
        ),
    ]
