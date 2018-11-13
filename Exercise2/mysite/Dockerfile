FROM python:2.7.15-slim-stretch
 ENV PYTHONUNBUFFERED 1
 RUN mkdir /mysite
 WORKDIR /mysite
 ADD ./requirements.txt /
 RUN pip install -r /requirements.txt
 ADD . /mysite
