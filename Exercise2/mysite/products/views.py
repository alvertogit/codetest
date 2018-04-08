# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render

from .models import Product
from rest_framework import viewsets
from products.serializers import ProductSerializer

# Create your views here.
class ProductViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows products to be viewed or edited.
    """
    queryset = Product.objects.all().order_by('-price')[:20]
    serializer_class = ProductSerializer
    #lookup_url_kwarg = "uid"
    #filter_backends = [DjangoFilterBackend]
    #filter_fields = ['order', 'category']

class ProductByDiscount(viewsets.ModelViewSet):
    """
    API endpoint that allows products to be ordered by discount.
    """
    queryset = Product.objects.extra(select={'discount':'price - custom_label_0'},order_by=('-discount',))[:20]
    serializer_class = ProductSerializer

class ProductMostDiscounted(viewsets.ModelViewSet):
    """
    API endpoint that allows products to be ordered by discount.
    """
    queryset = Product.objects.extra(select={'percentage_discount':'(price - custom_label_0)*100/price'},order_by=('-percentage_discount',))[:20]
    serializer_class = ProductSerializer

class ProductByTypeComedy(viewsets.ModelViewSet):
    """
    API endpoint that allows products to be ordered by discount.
    """
    queryset = Product.objects.filter(product_type__contains='Comedy')
    serializer_class = ProductSerializer