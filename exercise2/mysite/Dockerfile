FROM python:3.12-slim-bookworm
ENV PYTHONUNBUFFERED=1
RUN apt-get update \
    && apt-get install -y make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /mysite
COPY . /mysite
WORKDIR /mysite
RUN python3 -m venv .
RUN python3 -m pip install pip==25.3
RUN python3 -m pip install setuptools==80.9.0
RUN python3 -m pip install --no-cache-dir -r requirements.txt
RUN python3 manage.py collectstatic --no-input
EXPOSE 8000
CMD ["sh", "-c", "python3 manage.py migrate ; gunicorn --bind :8000 mysite.wsgi:application"]
