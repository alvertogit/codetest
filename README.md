# CODE TEST <!-- omit in toc -->

This repository stores a code test compose of two exercises to demonstrate skills mainly with [Python], [Django], [Gunicorn], [NGINX], [PostgreSQL], [Docker], [Jupyter Notebook], [microservices] and [REST API].

- [DEPENDENCIES](#dependencies)
- [CODE TEST CONTENT](#code-test-content)
- [EXERCISE 1: PYTHON](#exercise-1-python)
  - [EXERCISE 1 REQUIREMENTS](#exercise-1-requirements)
  - [EXERCISE 1 NOTES](#exercise-1-notes)
  - [EXERCISE 1 FOLDER CONTENT](#exercise-1-folder-content)
  - [HOW TO RUN EXERCISE 1](#how-to-run-exercise-1)
- [EXERCISE 2: DATA \& API TEST](#exercise-2-data--api-test)
  - [EXERCISE 2 REQUIREMENTS](#exercise-2-requirements)
  - [EXERCISE 2 NOTES](#exercise-2-notes)
  - [BONUS](#bonus)
  - [EXERCISE 2 FOLDER CONTENT](#exercise-2-folder-content)
  - [EXERCISE 2 ARCHITECTURE](#exercise-2-architecture)
  - [HOW TO RUN EXERCISE 2 **WITH DOCKER COMPOSE**](#how-to-run-exercise-2-with-docker-compose)
    - [TESTS](#tests)
- [CREDITS](#credits)

## DEPENDENCIES

The code has been tested using:

- [Python] (3.12): an interpreted high-level programming language for general-purpose programming.
- [Jupyter Lab] (4.3): a web-based interactive development environment for [Jupyter Notebooks], code and data.
- [Django] (5.1): a high-level [Python] Web framework that encourages rapid development and clean, pragmatic design.
- [Gunicorn] (23.0): a [Python] [WSGI] HTTP Server for UNIX.
- [NGINX] (1.27): a free, open-source, high-performance HTTP server, reverse proxy, and IMAP/POP3 proxy server.
- [PostgreSQL] (17): an object-relational database management system (ORDBMS) with an emphasis on extensibility and standards compliance.
- [Docker] (27.3): an open platform for developers and sysadmins to build, ship, and run distributed applications, whether on laptops, data center VMs, or the cloud.
- [Docker Compose] (2.29): a tool for defining and running multi-container [Docker] applications.

Virtual environment (<env_name>=**.venv**) can be generated with **requirements.txt** file found in codetest main folder.

Command to configure virtual environment with [venv]:

```bash
~/codetest$ python3 -m venv .venv
~/codetest$ source .venv/bin/activate
(.venv)~/codetest$ python3 -m pip install pip==24.3.1
(.venv)~/codetest$ python3 -m pip install setuptools==75.3.0
(.venv)~/codetest$ python3 -m pip install -r requirements.txt
(.venv)~/codetest$ pre-commit install
```

## CODE TEST CONTENT

Codetest main folder contains two folders for Exercise 1 and Exercise 2.

```bash
codetest
├── .gitignore
├── .pre-commit-config.yaml
├── exercise1
├── exercise2
├── README.md
└── requirements.txt
```

## EXERCISE 1: PYTHON

### EXERCISE 1 REQUIREMENTS

Write a small app that takes an integer and return a string representation of that integer with commas separating
groups of 3 digits. For example:

```python
print(translate(1234))
'1,234'
print(translate(123456789))
'123,456,789'
```

### EXERCISE 1 NOTES

• Use [Python] as programming language.

• Input/output methods doesn’t matter.

### EXERCISE 1 FOLDER CONTENT

The **exercise1** folder contains three files:

- **function.py**: It contents translate functions code for Exercise 1 including one solution with regular expression.

- **main.py**: It is used to test translate functions.

- **Exercise1.ipynb**: [Jupyter Notebook] to test translate functions.

```bash
exercise1
├── docs
├── Exercise1.ipynb
├── function.py
└── main.py
```

### HOW TO RUN EXERCISE 1

The way to run Exercise 1 is simple. Just go to **exercise1** folder and execute:

```bash
(.venv)~/codetest/exercise1$ python3 main.py
```

A good way to play with the **translate** and **translate_regex** functions is through a [Jupyter Lab]. One notebook is stored in the same **exercise1** folder, to run it use the command shown below:

```bash
(.venv)~/codetest/exercise1$ jupyter lab Exercise1.ipynb
```

![Jupyter notebook translate function](exercise1/docs/jupyter_notebook_translate_function.png)

## EXERCISE 2: DATA & API TEST

### EXERCISE 2 REQUIREMENTS

Write a small app that publish an [REST API] with these endpoints using data from **test.xml**:

• Give me 20 products ordered by price.

• Give me 20 products ordered by discount (price - custom_label_0).

• Give me the most discounted 20 products.

• Give me all products under the “Comedy” product type.

### EXERCISE 2 NOTES

• Use [Python] as programming language ([Django] framework preferred).

• Don’t waste time in how consume the API or in the authentication. If it can be tested with Curl or Requests, is totally valid.

### BONUS

• Use [Docker Compose] to setup and run the [Django]/[PostgreSQL] app.

### EXERCISE 2 FOLDER CONTENT

The **exercise2** folder contains:

```bash
exercise2
├── docker-compose.yml
├── docs
├── mysite
│   ├── .env.example
│   ├── Dockerfile
│   ├── manage.py
│   ├── mysite
│   │   ├── __init__.py
│   │   ├── settings.py
│   │   ├── urls.py
│   │   ├── wsgi.py
│   ├── products
│   │   ├── admin.py
│   │   ├── apps.py
│   │   ├── __init__.py
│   │   ├── models.py
│   │   ├── serializers.py
│   │   ├── tests.py
│   │   ├── urls.py
│   │   ├── views.py
│   └── requirements.txt
├── nginx
│   └── conf.d
│       └── local.conf
└── postgresql
    ├── codetest.sql
    ├── Dockerfile
    ├── importer.py
    └── test.xml
```

- **docker-compose.yml**: creates the [Django] and [PostgreSQL] [Docker] containers in which the applications shall run.

- **docs**: It stores Exercise 2 documentation.

- **mysite**: It stores [Django]'s **products** app code.

- **nginx**: It stores [NGINX]'s configuration.

- **postgresql**: It stores the **test.xml** with data to be inserted into [PostgreSQL] and the **importer** app to do this process.

### EXERCISE 2 ARCHITECTURE

The architecture created with [Docker Compose] uses three different [Docker] containers for:

- [NGINX].
- [Django] and [Gunicorn].
- [PostgreSQL].

The following diagram illustrates the architecture in blocks:

```mermaid
flowchart LR;
   Client<-->NGINX;
   NGINX<--brigde-->Gunicorn;
   subgraph web;
   Gunicorn<-->Django;
   end;
   Django<--brigde-->id1[(PostgreSQL)]
```

### HOW TO RUN EXERCISE 2 **WITH DOCKER COMPOSE**

The steps and commands to run Exercise 2 with [Docker Compose] are described below.

First create environment **.env** file using **.env.example** file as template inside **mysite** folder. Exercise 2 should run fine with default template settings.

Then [Docker Compose] can be executed to build services.

```bash
~/codetest/exercise2$ docker compose build
```

Next step consists in executing [Docker Compose] up command.

```bash
~/codetest/exercise2$ docker compose up
```

It is possible that for the first time the command keeps stopped at one point as shown below:

```bash
...
postgres_db_1_81cb47c30feg | 2018-12-11 09:59:15.676 UTC [42] ERROR:  role "postgres" does not exist
postgres_db_1_81cb47c30feg | 2018-12-11 09:59:15.676 UTC [42] STATEMENT:  REVOKE ALL ON SCHEMA public FROM postgres;
exercise2_postgres_db_1_81cb47c30feg exited with code 3
```

If this happens simply press 'Control+C', wait patiently to return to shell and repeat again the same command. If everything goes fine at the end it should appear something similar to:

```bash
...
postgres_db_1_81cb47c30feg | 2018-12-11 09:59:27.670 UTC [1] LOG:  database system is ready to accept connections
```

There are different ways to check that the server is running properly. One is opening a web browser such as Chrome or Firefox and paste the following URL:

```bash
http://127.0.0.1/products/
```

The web browser should show something similar to:

```bash
HTTP 200 OK
Allow: GET, HEAD, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "price": "http://127.0.0.1/products/price/",
    "discount": "http://127.0.0.1/products/discount/",
    "mostdiscounted": "http://127.0.0.1/products/mostdiscounted/",
    "typecomedy": "http://127.0.0.1/products/typecomedy/"
}
```

The description of the URLs that are above:

- "price" URL: Gets 20 products ordered by price.

```bash
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

- "discount" URL: Gets 20 products ordered by discount (price - custom_label_0).

```bash
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

- "mostdiscounted" URL: Gets the most discounted 20 products.

```bash
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

- "typecomedy" URL: Gets all products under “Comedy” product type.

```bash
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

#### TESTS

To run tests execute inside web container the command to launch tests:

```bash
~/codetest/exercise2$ docker compose exec web bash
root@8800eecc88:/mysite# python manage.py test
Found 6 test(s).
Creating test database for alias 'default'...
System check identified no issues (0 silenced).
......
----------------------------------------------------------------------
Ran 6 tests in 0.056s

OK
Destroying test database for alias 'default'...

```

## CREDITS

author: alvertogit
copyright: 2018-2024

[Python]: https://www.python.org/
[Django]: https://www.djangoproject.com/
[Gunicorn]: https://gunicorn.org/
[WSGI]: https://en.wikipedia.org/wiki/Web_Server_Gateway_Interface
[NGINX]: https://www.nginx.com/
[PostgreSQL]: https://www.postgresql.org/
[Docker]: https://www.docker.com/
[microservices]: https://en.wikipedia.org/wiki/Microservices
[REST API]: https://en.wikipedia.org/wiki/Representational_state_transfer
[Docker Compose]: https://github.com/docker/compose
[venv]: https://docs.python.org/3/library/venv.html
[Jupyter Lab]: https://jupyter.org/
[Jupyter Notebook]: https://jupyter.org/
[Jupyter Notebooks]: https://jupyter.org/
