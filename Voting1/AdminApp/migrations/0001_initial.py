# Generated by Django 3.2.9 on 2021-12-02 06:04

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Ad_DirectComplain',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ComplainFrom_UserId', models.CharField(max_length=150)),
                ('UserEmail', models.EmailField(default='User@example.com', max_length=200)),
                ('ComplainFor', models.CharField(max_length=200)),
                ('Subject', models.CharField(default='Empty', max_length=300)),
                ('Description', models.CharField(max_length=850)),
                ('ComplainTime', models.DateTimeField(auto_now=True)),
            ],
        ),
    ]