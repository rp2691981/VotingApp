# Generated by Django 3.2.9 on 2021-12-04 14:46

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('AdminApp', '0005_voting'),
    ]

    operations = [
        migrations.AlterField(
            model_name='voting',
            name='position',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='AdminApp.electionpostion'),
        ),
    ]
