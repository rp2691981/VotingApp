# Generated by Django 3.2.9 on 2021-12-03 15:29

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('CandidateApp', '0003_remove_candidateprofile_profile'),
    ]

    operations = [
        migrations.CreateModel(
            name='CandidatePost',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Title', models.CharField(max_length=200)),
                ('Description', models.CharField(max_length=900)),
                ('Image_File', models.FileField(default=None, max_length=600, upload_to='Post/')),
                ('CandidateUserId', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='CandidateApp.candidatelogin')),
            ],
        ),
    ]
