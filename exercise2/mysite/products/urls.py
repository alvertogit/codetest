__author__      = "alvertogit"
__copyright__   = "Copyright 2018-2022"

from django.urls import include, re_path
from rest_framework import routers
from . import views

router = routers.DefaultRouter()
router.register(r'price', views.ProductViewSet, 'price')
router.register(r'discount', views.ProductByDiscount, 'discount')
router.register(r'mostdiscounted', views.ProductMostDiscounted, 'mostdiscounted')
router.register(r'typecomedy', views.ProductByTypeComedy,'typecomedy')

urlpatterns = [
    re_path(r'^', include(router.urls)),
]
