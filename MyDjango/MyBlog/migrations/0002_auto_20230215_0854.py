# Generated by Django 2.2.12 on 2023-02-15 08:54

from django.db import migrations
import mdeditor.fields


class Migration(migrations.Migration):

    dependencies = [
        ('MyBlog', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='blog',
            name='content',
            field=mdeditor.fields.MDTextField(verbose_name='内容'),
        ),
    ]
