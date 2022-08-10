from django.db import models

# Create your models here.

class BookCategory(models.Model):
    id_category = models.AutoField(primary_key=True)
    name_category = models.CharField(max_length=255)

class Book(models.Model):
    id_sach = models.AutoField(primary_key=True)
    id_category = models.ForeignKey(BookCategory, to_field='id_category', on_delete=models.CASCADE)
    namebook = models.CharField(max_length=500)
    author = models.CharField(max_length=225)
    categorybook = models.TextField()
    pricebook = models.BigIntegerField(max_length=11)
    status = models.TextField()
    create_date = models.DateTimeField(auto_now_add=True)
    update_date = models.DateTimeField(auto_now=True)
    delete_date = models.DateTimeField(auto_now=True)