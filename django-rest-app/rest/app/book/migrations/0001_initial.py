# Generated by Django 3.2.15 on 2022-08-09 06:55

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='BookCategory',
            fields=[
                ('id_category', models.BigIntegerField(max_length=11, primary_key=True, serialize=False)),
                ('name_category', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='Book',
            fields=[
                ('id_sach', models.BigIntegerField(max_length=11, primary_key=True, serialize=False)),
                ('namebook', models.CharField(max_length=500)),
                ('author', models.CharField(max_length=225)),
                ('categorybook', models.TextField()),
                ('pricebook', models.BigIntegerField(max_length=11)),
                ('status', models.TextField()),
                ('create_date', models.DateTimeField(auto_now_add=True)),
                ('update_date', models.DateTimeField(auto_now=True)),
                ('delete_date', models.DateTimeField(auto_now=True)),
                ('id_category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='book.bookcategory')),
            ],
        ),
    ]