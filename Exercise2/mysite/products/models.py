# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.

class Product(models.Model):
    product_id = models.CharField(max_length=10)
    title = models.CharField(max_length=100)
    product_type = models.CharField(max_length=100)
    price = models.DecimalField(max_digits=6, decimal_places=2)
    custom_label_0 = models.DecimalField(max_digits=6, decimal_places=2)
    def __str__(self):
        return self.title
