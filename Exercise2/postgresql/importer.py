#!/usr/bin/env python

'''
importer.py: It imports data from test.xml file to postgresql.
'''

__author__      = "alvertogit"
__copyright__   = "Copyright 2018"

import xml.etree.ElementTree as ET
import psycopg2
import sys
from decimal import Decimal

def connect():
    """Function that connects with postgresql db.

    Returns:
        conn: Connection to postgresql db.

    Raises:
        Error: If unable to connect with db.

    """

    try:
        conn = psycopg2.connect(
        host='127.0.0.1', port=5432, database='codetest',
        user='codetest', password='codetest')
    except psycopg2.Error as e:
        print('Unable to connect\n{0}').format(e)
        sys.exit(1)
    else:
        return conn


if __name__ == '__main__':
    # Connect to an existing database
    conn = connect()

    # Open a cursor to perform database operations
    cur = conn.cursor()

    # Create products_product table
    #cur.execute("CREATE TABLE products_product (id serial NOT NULL PRIMARY KEY, product_id varchar(10) NOT NULL, title varchar(100) NOT NULL, product_type varchar(100) NOT NULL, price numeric(6, 2) NOT NULL, custom_label_0 numeric(6, 2) NOT NULL);")

    ns={'base' : 'http://base.google.com/ns/1.0'}

    tree = ET.parse('test.xml')
    root = tree.getroot()

    # loop over all items - products
    for element in root.iter('item'):
        # get product id
        product_id=element.find('base:id',ns).text
        # get title
        title=element.find('title').text
        # get product type
        product_type=element.find('base:product_type',ns).text
        # get price
        price=element.find('base:price',ns).text
        # removing end part ' DKK' from price
        price=price[:-4]
        # get custom_label_0
        custom_label_0 = price
        # if custom_label_0 exists its value is used instead of price value
        if element.find('base:custom_label_0',ns) is not None:
            custom_label_0 = element.find('base:custom_label_0',ns).text

        # insert product data into db
        try:
            cur.execute("INSERT INTO products_product (product_id, title, product_type, price, custom_label_0) VALUES (%s, %s, %s, %s, %s)",(product_id, title, product_type, price, custom_label_0))
        except psycopg2.Error as e:
            print('Unable to execute insert into\n{0}').format(e)
            sys.exit(1)

    # Make the changes to the database persistent
    conn.commit()

    # Close communication with the database
    cur.close()
    conn.close()
