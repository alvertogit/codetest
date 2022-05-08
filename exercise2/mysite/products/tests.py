# -*- coding: utf-8 -*-
__author__      = "alvertogit"
__copyright__   = "Copyright 2018-2022"

from http import HTTPStatus
from django.test import TestCase
from rest_framework.test import APIClient, APIRequestFactory
from .models import Product

class ProductModelTests(TestCase):
    def test_create_product(self):
        Product.objects.create(product_id="1994BR",
            title="Ace Ventura, Pet Detective (Blu-Ray)",
            product_type="Movies > 3D Blu-Ray > Standard > Comedy > Jim Carrey",
            price="19.90",
            custom_label_0="17.90"
        )
        product = Product.objects.get(product_id="1994BR")
        self.assertEqual(product.title, "Ace Ventura, Pet Detective (Blu-Ray)")

class EndpointsTests(TestCase):
    def setUp(self):
        self.client = APIClient()
        Product.objects.create(product_id="1994BR",
            title="Ace Ventura, Pet Detective (Blu-Ray)",
            product_type="Movies > 3D Blu-Ray > Standard > Comedy > Jim Carrey",
            price="19.90",
            custom_label_0="17.90"
        )

        Product.objects.create(product_id="1994",
            title="Ace Ventura, Pet Detective",
            product_type="Movies > DVD > Standard > Comedy > Jim Carrey",
            price="14.90",
            custom_label_0="7.90"
        )

    def test_products_endpoint(self):
        response = self.client.get("/products/")
        self.assertEqual(response.status_code, HTTPStatus.OK)
        self.assertJSONEqual(
            str(response.content, encoding='utf8'),
            {
                "price":"http://testserver/products/price/",
                "discount":"http://testserver/products/discount/",
                "mostdiscounted":"http://testserver/products/mostdiscounted/",
                "typecomedy":"http://testserver/products/typecomedy/"
            }
        )

    def test_price_endpoint(self):
        response = self.client.get("/products/price/")
        self.assertEqual(response.status_code, HTTPStatus.OK)
        self.assertJSONEqual(
            str(response.content, encoding='utf8'),
            [
                {
                    'custom_label_0': '17.90',
                    'price': '19.90',
                    'product_id': '1994BR',
                    'product_type': 'Movies > 3D Blu-Ray > Standard > Comedy > Jim Carrey',
                    'title': 'Ace Ventura, Pet Detective (Blu-Ray)'
                },
                {
                    'custom_label_0': '7.90',
                    'price': '14.90',
                    'product_id': '1994',
                    'product_type': 'Movies > DVD > Standard > Comedy > Jim Carrey',
                    'title': 'Ace Ventura, Pet Detective'
                }
            ]
        )

    def test_discount_endpoint(self):
        response = self.client.get("/products/discount/")
        self.assertEqual(response.status_code, HTTPStatus.OK)
        self.assertJSONEqual(
            str(response.content, encoding='utf8'),
            [
                {
                    'custom_label_0': '7.90',
                    'price': '14.90',
                    'product_id': '1994',
                    'product_type': 'Movies > DVD > Standard > Comedy > Jim Carrey',
                    'title': 'Ace Ventura, Pet Detective'
                },
                {
                    'custom_label_0': '17.90',
                    'price': '19.90',
                    'product_id': '1994BR',
                    'product_type': 'Movies > 3D Blu-Ray > Standard > Comedy > Jim Carrey',
                    'title': 'Ace Ventura, Pet Detective (Blu-Ray)'
                }
            ]
        )

    def test_mostdiscounted_endpoint(self):
        response = self.client.get("/products/mostdiscounted/")
        self.assertEqual(response.status_code, HTTPStatus.OK)
        self.assertJSONEqual(
            str(response.content, encoding='utf8'),
            [
                {
                    'custom_label_0': '7.90',
                    'price': '14.90',
                    'product_id': '1994',
                    'product_type': 'Movies > DVD > Standard > Comedy > Jim Carrey',
                    'title': 'Ace Ventura, Pet Detective'
                },
                {
                    'custom_label_0': '17.90',
                    'price': '19.90',
                    'product_id': '1994BR',
                    'product_type': 'Movies > 3D Blu-Ray > Standard > Comedy > Jim Carrey',
                    'title': 'Ace Ventura, Pet Detective (Blu-Ray)'
                }
            ]
        )

    def test_typecomedy_endpoint(self):
        response = self.client.get("/products/typecomedy/")
        self.assertEqual(response.status_code, HTTPStatus.OK)
        self.assertJSONEqual(
            str(response.content, encoding='utf8'),
            [
                {
                    'custom_label_0': '17.90',
                    'price': '19.90',
                    'product_id': '1994BR',
                    'product_type': 'Movies > 3D Blu-Ray > Standard > Comedy > Jim Carrey',
                    'title': 'Ace Ventura, Pet Detective (Blu-Ray)'
                },
                {
                    'custom_label_0': '7.90',
                    'price': '14.90',
                    'product_id': '1994',
                    'product_type': 'Movies > DVD > Standard > Comedy > Jim Carrey',
                    'title': 'Ace Ventura, Pet Detective'
                }
            ]
        )
