# Generated by Django 3.1.5 on 2021-01-26 21:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0002_auto_20210126_1723'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='phone_no',
            field=models.CharField(default='', max_length=20),
        ),
        migrations.AlterField(
            model_name='moviescreentime',
            name='available_seats',
            field=models.IntegerField(),
        ),
    ]
