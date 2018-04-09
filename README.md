# CODE TEST

This repository stores a code test compose of two exercises to demonstrate skills mainly with Python, Django, Postgresql and Docker.

## DEPENDENCIES
The code has been tested using:

* Python (2.7.14)
* Django (1.11.12)
* PostgreSQL (9.5.12)
* Docker (18.03.0-ce)
* Docker-Compose (1.8)
* Conda (4.4.11) virtual environment (<env_name>=codetest27)

Virtual environment can be generated with **codetest27.yaml**, **requirements.txt** files found in main folder.

```bash
~/codetest$ conda env create -f codetest27.yaml
```

```bash
~/codetest$ virtualenv codetest27
~/codetest$ source codetest27/bin/activate
(codetest27)~/codetest$ pip install -r requirements.txt
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

## EXERCISE 1 FOLDER CONTENT

The exercise 1 folder contains three files:
* **function.py**: It contents translate functions code for Exercise 1 including one solution with regular expression.

* **main.py**: It is used to test translate functions.

* **Exercise1.ipynb**: Jupyter nootebook to test translate function.

## HOW TO RUN EXERCISE 1

The way to to run exercise 1 is simple. Just go to Exercise1 folder and execute:

```bash
~/codetest/Exercise1$ python main.py
```

A fast and easy way to play with the **translate** and **translate_regex** functions is through a Jupyter notebook. One notebook is stored in the same **Exercise1** folder, to run it use the command shown below:

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

## EXERCISE 2 FOLDER CONTENT

The exercise 2 folder contains two folders:
* **mysite**: It stores Django's **products** app code.

* **postgresql**: It stores the **test.xml** with data to be inserted into postgresql and the **importer** app to do this process.

## HOW TO RUN EXERCISE 2 **WITHOUT DOCKER COMPOSE**

As first step to be able to run exercise 2 is mandatory to create in postgresql an user called *'codetest'* with password *'codetest'* and a database *'codetest'*.

The user and the databa can be created with the following commands from shell.

 ```bash
$ sudo -u postgres bash -c "psql -c \"CREATE USER codetest WITH PASSWORD 'codetest';\""
$ sudo -u postgres bash -c "psql -c \"ALTER USER codetest WITH SUPERUSER;\""
$ sudo -u postgres bash -c "psql -c \"CREATE DATABASE codetest WITH OWNER codetest;\""
```

The next step consists in executing the following commands to prepare the Django's **products** app.

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

To import the database **codetest.sql** file containing the table **products_product** with all products to postgresql it is necessary to execute:

```bash
~/codetest/Exercise2/postgresql$ cp codetest.sql /tmp
~/codetest/Exercise2/postgresql$ sudo -u postgres psql codetest < '/tmp/codetest.sql'
```

The **codetest.sql** file was created after running the importer to insert data from **test.xml** file to postgresql **products_product** table.

```bash
~/codetest/Exercise2/postgresql$ python importer.py
~/codetest/Exercise2/postgresql$ pg_dump -U postgres codetest > /tmp/codetest.sql
~/codetest/Exercise2/postgresql$ cp /tmp/codetest.sql codetest.sql
```

Now it is possible to launch the server with Django's **products** app.

```bash
~/codetest/Exercise2/mysite$ python manage.py runserver 8000
```

There are different ways to check that the server is running properly. One is opening a web browser such as Chrome or Mozilla and paste the following URL:

```
http://127.0.0.1:8000/products/
```

The web browser should show something similar to:

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

```
HTTP 200 OK
Allow: GET, POST, HEAD, OPTIONS
Content-Type: application/json
Vary: Accept

[
    {
        "product_id": "AF5TW2",
        "title": "Maxi-Cosi - AxissFix Autostol (61-105 cm)",
        "product_type": "Car Seats > Child car seats > Child benefit",
        "price": "3299.00",
        "custom_label_0": "3135.00"
    },
    {
        "product_id": "AN3WT9",
        "title": "Maxi-Cosi - AxissFix Autostol (61-105 cm)",
        "product_type": "Car Seats > Child car seats > Child benefit",
        "price": "3299.00",
        "custom_label_0": "3135.00"
    },
    ...
    ...
    ...
    {
        "product_id": "AG286U",
        "title": "Maxi-Cosi - Citi Autostol (0-13 kg)",
        "product_type": "Car Seats > Child car seats > Child benefit",
        "price": "890.00",
        "custom_label_0": "846.00"
    }
]
```

* "discount" URL: Gets 20 products ordered by discount (price - custom_label_0).

```
HTTP 200 OK
Allow: GET, POST, HEAD, OPTIONS
Content-Type: application/json
Vary: Accept

[
    {
        "product_id": "AF84CU",
        "title": "Sisley - Daily Line Reducer 30 ml",
        "product_type": "Skincare > Face > Oils & Serums",
        "price": "2399.00",
        "custom_label_0": "2199.00"
    },
    {
        "product_id": "AD529V",
        "title": "Maxi-Cosi - AxissFix Autostol (61-105 cm)",
        "product_type": "Car Seats > Child car seats > Child benefit",
        "price": "3299.00",
        "custom_label_0": "3135.00"
    },
    ...
    ...
    ...
    {
        "product_id": "AJ79SB",
        "title": "Escentric Molecules - Escentric 04 EDT 100 ml",
        "product_type": "Perfume > Eau de Toilette",
        "price": "679.00",
        "custom_label_0": "612.00"
    }
]
```

* "mostdiscounted" URL: Gets the most discounted 20 products.

```
HTTP 200 OK
Allow: GET, POST, HEAD, OPTIONS
Content-Type: application/json
Vary: Accept

[
    {
        "product_id": "AJ43CN",
        "title": "Grusomme mig 2 - DVD",
        "product_type": "Movies > DVD > Standard > Adventure > 7",
        "price": "69.00",
        "custom_label_0": "29.00"
    },
    {
        "product_id": "AF75JP",
        "title": "Marley & Me - DVD",
        "product_type": "Movies > DVD > Standard > Comedy > Owen Wilson > 7",
        "price": "69.00",
        "custom_label_0": "29.00"
    },
    ...
    ...
    ...
    {
        "product_id": "AC8M7R",
        "title": "Melton - Numbers Rib Drenge Boxershorts 2 pk",
        "product_type": "Apparel & Accessories > Clothing",
        "price": "99.00",
        "custom_label_0": "59.00"
    }
]
```

* "typecomedy" URL: Gets all products under “Comedy” product type.

```
HTTP 200 OK
Allow: GET, POST, HEAD, OPTIONS
Content-Type: application/json
Vary: Accept

[
    {
        "product_id": "AK628C",
        "title": "Men in Black 3 (3D Blu-Ray)",
        "product_type": "Movies > 3D Blu-Ray > Standard > Comedy > Will Smith",
        "price": "109.00",
        "custom_label_0": "79.00"
    },
    {
        "product_id": "AC39B4",
        "title": "Men in Black 3 (4K Blu-Ray)",
        "product_type": "Movies > 4K Blu-Ray > Standard > Comedy > Will Smith",
        "price": "269.00",
        "custom_label_0": "229.00"
    },
    ...
    ...
    ...
    {
        "product_id": "AF52KX",
        "title": "Glee: Hele Sæson 5 (6-disc) - DVD",
        "product_type": "TV Series > DVD > Complete Edition > Comedy > Lea Michele > 15",
        "price": "109.00",
        "custom_label_0": "69.00"
    }
]
```

## HOW TO RUN EXERCISE 2 **WITH DOCKER COMPOSE**

The steps and commands to run exercise 2 with **docker-compose** are described below.

First **settings.py** file has to be modified. **HOST** value of **DATABASE** must be changed to **'postgres_db'**:

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'codetest',
        'USER': 'codetest',
        'PASSWORD': 'codetest',
        'HOST': 'postgres_db',
        'PORT': '5432',
    }
}
```

Before executing docker-compose commands local postgresql database service must be stopped.

```bash
~/codetest2/Exercise2$ sudo service postgresql stop
```

Then docker-compose can be execute to build services.

```bash
~/codetest2/Exercise2$ sudo docker-compose build
```

Next step consists in executing docker-compose up command.

```bash
~/codetest2/Exercise2$ sudo docker-compose up
```

It is possible that for the first time the command keeps stopped at one point as shown below: 

```bash
...
...
postgres_db_1  | LOG:  database system was shut down at 2018-04-09 18:57:18 UTC
postgres_db_1  | LOG:  MultiXact member wraparound protections are now enabled
postgres_db_1  | LOG:  database system is ready to accept connections
postgres_db_1  | LOG:  autovacuum launcher started
```

If this happens simply press 'Control+C', wait patienly to return to shell and repeat again the same command. If everything goes fine at the end it should appear something similar to:

```bash
...
...
web_1          | Performing system checks...
web_1          | 
web_1          | System check identified no issues (0 silenced).
web_1          | April 09, 2018 - 18:57:36
web_1          | Django version 1.11.12, using settings 'mysite.settings'
web_1          | Starting development server at http://0.0.0.0:8000/
web_1          | Quit the server with CONTROL-C.

```

Now it is possible to open a web browser and paste the URL as described in the previous paragraph to check that the server is running fine.

```
http://127.0.0.1:8000/products/
```

