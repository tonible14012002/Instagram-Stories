# Generated by Django 4.2.5 on 2023-10-01 05:28

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ("profiles", "0005_alter_profile_followers"),
    ]

    operations = [
        migrations.RemoveField(
            model_name="profile",
            name="followers",
        ),
    ]