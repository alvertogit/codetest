FROM python:3.8.11-slim-buster
ENV PYTHONUNBUFFERED 1
RUN apt-get update \
    && apt-get install -y make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /mysite
COPY . /mysite
WORKDIR /mysite
RUN python3 -m venv .
RUN python3 -m pip install pip==21.2.4
RUN python3 -m pip install setuptools==57.4.0
RUN python3 -m pip install --no-cache-dir -r requirements.txt
RUN export $(grep -v '^#' .env | xargs -d '\n') && python manage.py collectstatic --no-input
EXPOSE 8000
CMD ["gunicorn", "--bind", ":8000", "mysite.wsgi:application"]
