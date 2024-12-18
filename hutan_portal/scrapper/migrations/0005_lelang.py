# Generated by Django 5.1.1 on 2024-10-24 07:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('scrapper', '0004_alter_article_link'),
    ]

    operations = [
        migrations.CreateModel(
            name='Lelang',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('kode_lelang', models.CharField(max_length=255)),
                ('nama_paket', models.CharField(max_length=255)),
                ('link', models.URLField()),
                ('instansi', models.CharField(max_length=255)),
                ('tahapan', models.CharField(max_length=255)),
                ('hps', models.CharField(max_length=255)),
            ],
            options={
                'verbose_name': 'Lelang',
                'verbose_name_plural': 'Lelang',
            },
        ),
    ]
