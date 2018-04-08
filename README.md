# CODE TEST

This repository stores a code test compose of two exercises to demonstrate skills mainly with Python, Django and Postgresql.

## DEPENDENCIES
The code has been tested using:

* Python (2.7.14)
* Django (1.11.12)
* PostgreSQL (9.5.12)
* Conda (4.4.11) virtual environment (<env_name>=codetest27)

Virtual environment can be generated with **codetest27.yaml**, **requirements.txt** files found in main folder.

```bash
$ conda env create -f path/to/codetest27.yaml
```

```bash
$ virtualenv <env_name>
$ source <env_name>/bin/activate
(<env_name>)$ pip install -r path/to/requirements.txt
```

# EXERCISE 1: PYTHON

## REQUIREMENTS

Write a small app that takes an integer and return a string representation of that integer with commas separating
groups of 3 digits. For example:

```python
print translate (1234)
u"1,234"
print translate (123456789)
u"123,456,789"
```

## NOTES
• Use Python as programming language.

• Input/output methods doesn’t matter.

## HOW TO RUN EXERCISE 1

The way to to run exercise 1 is simple. Just go to Exercise1 folder and execute:

```bash
~/codetest/Exercise1$ python main.py
```

A fast and easy way to play with the **translate** function is through a Jupyter notebook. One is stored in the same **Exercise1** folder, to run it use the command shown below:

```bash
~/codetest/Exercise1$ jupyter notebook Exercise1.ipynb
```

![Jupyter notebook translate function](jupyter_notebook_translate_function.png)

# EXERCISE 2: DATA & API TEST

## REQUIREMENTS

Write a small app that publish an API Rest with these endpoints:

• Give me 20 products ordered by price.

• Give me 20 products ordered by discount (price - custom_label_0).

• Give me the most discounted 20 products.

• Give me all products under the “Comedy” product type.

## NOTES
• Use Python as programming language (Django framework preferred).

• Don’t waste time in how consume the API or in the authentication. If it can be tested with Curl or Requests, is totally valid.

## HOW TO RUN EXERCISE 2

As first step to be able to run exercise 2 is mandatory to create in postgresql an user called *'codetest'* with password *'codetest'* and a database *'codetest'*.

In **psql** it can be done using the following commands:

```bash
postgres=# ALTER USER codetest PASSWORD 'codetest';
...
postgres=# CREATE DATABASE codetest WITH OWNER codetest;
```

To check the creation of both it is possible to use the following commands:

```bash
postgres=# \du
...
postgres=# \l
```

The next step consists in execute the following commands to prepare the Django app **products**.

```bash
~/codetest/Exercise2/mysite$ python manage.py migrate
...
~/codetest/Exercise2/mysite$ python manage.py makemigrations products
...
~/codetest/Exercise2/mysite$ python manage.py sqlmigrate products 0001
BEGIN;
--
-- Create model Product
--
CREATE TABLE "products_product" ("id" serial NOT NULL PRIMARY KEY, "product_id" varchar(10) NOT NULL, "title" varchar(100) NOT NULL, "product_type" varchar(100) NOT NULL, "price" numeric(6, 2) NOT NULL, "custom_label_0" numeric(6, 2) NOT NULL);
COMMIT;
```

Once the table **products_product** has been created with the previous command it is possible to run the importer to insert data from **test.xml** file to postgresql table.

```bash
~/codetest/Exercise2/mysite$ cd ..
~/codetest/Exercise2/$ cd importer_xml_postgresql
~/codetest/Exercise2/importer_xml_postgresql$ python importer.py
```

```bash
~/codetest/Exercise2/mysite$ python manage.py runserver
```

There are different ways to check that the server is running properly. One is opening a web browser such as Chrome or Mozilla and paste the following URL:

```
http://127.0.0.1:8000/products/
```

In the web browser should show something similar to:

```
HTTP 200 OK
Allow: GET, HEAD, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "price": "http://127.0.0.1:8000/products/price/",
    "discount": "http://127.0.0.1:8000/products/discount/",
    "mostdiscounted": "http://127.0.0.1:8000/products/mostdiscounted/",
    "typecomedy": "http://127.0.0.1:8000/products/typecomedy/"
}
```

The description of the URLs that are above:

* "price" URL: Gets 20 products ordered by price.

* "discount" URL: Gets 20 products ordered by discount (price - custom_label_0).

* "mostdiscounted" URL: Gets the most discounted 20 products.

* "typecomedy" URL: Gets all products under “Comedy” product type.
