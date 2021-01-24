__author__      = "alvertogit"
__copyright__   = "Copyright 2018-2021"

from rest_framework import serializers
from .models import Product


class ProductSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Product
        fields = ('product_id', 'title', 'product_type', 'price', 'custom_label_0')