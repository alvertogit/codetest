# -*- coding: utf-8 -*-
__author__      = "alvertogit"
__copyright__   = "Copyright 2018-2023"

from django.db import models

# Create your models here.

class Product(models.Model):
    # Only the most relevant fields from test.xml have been chosen
    id = models.AutoField(primary_key=True)
    product_id = models.CharField(max_length=10)
    title = models.CharField(max_length=100)
    product_type = models.CharField(max_length=100)
    price = models.DecimalField(max_digits=6, decimal_places=2)
    custom_label_0 = models.DecimalField(max_digits=6, decimal_places=2)
    def __str__(self):
        return self.title
