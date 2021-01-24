# -*- coding: utf-8 -*-
__author__      = "alvertogit"
__copyright__   = "Copyright 2018-2021"

from __future__ import unicode_literals

from django.shortcuts import render

from .models import Product
from rest_framework import viewsets
from products.serializers import ProductSerializer

# Create your views here.
class ProductViewSet(viewsets.ModelViewSet):
    """
    API endpoint that gets 20 products ordered by price.
    """
    queryset = Product.objects.all().order_by('-price')[:20]
    serializer_class = ProductSerializer

class ProductByDiscount(viewsets.ModelViewSet):
    """
    API endpoint that gets 20 products ordered by discount (price - custom_label_0).
    """
    queryset = Product.objects.extra(select={'discount':'price - custom_label_0'},order_by=('-discount',))[:20]
    serializer_class = ProductSerializer

class ProductMostDiscounted(viewsets.ModelViewSet):
    """
    API endpoint that gets the most discounted 20 products in percentage.
    """
    queryset = Product.objects.extra(select={'percentage_discount':'(price - custom_label_0)*100/price'},order_by=('-percentage_discount',))[:20]
    serializer_class = ProductSerializer

class ProductByTypeComedy(viewsets.ModelViewSet):
    """
    API endpoint that gets all products under “Comedy” product type.
    """
    queryset = Product.objects.filter(product_type__contains='Comedy')
    serializer_class = ProductSerializer