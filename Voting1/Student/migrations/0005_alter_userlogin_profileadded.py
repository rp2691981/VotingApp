# Generated by Django 3.2.9 on 2021-12-02 06:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Student', '0004_userlogin_profileadded'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userlogin',
            name='ProfileAdded',
            field=models.CharField(default='Admin', max_length=100),
        ),
    ]