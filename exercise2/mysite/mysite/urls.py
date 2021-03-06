"""mysite URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""

__author__      = "alvertogit"
__copyright__   = "Copyright 2018-2021"

from django.conf.urls import include, url
from django.contrib import admin
from django.conf import settings
from django.views.generic.base import RedirectView

urlpatterns = [
    url('admin/', admin.site.urls),
    url('products/', include('products.urls')),
    url('favicon.ico', RedirectView.as_view(url=settings.STATIC_URL + 'rest_framework/docs/img/favicon.ico')),
]
