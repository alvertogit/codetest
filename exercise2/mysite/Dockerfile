FROM python:3.12-slim-bookworm
ENV PYTHONUNBUFFERED 1
RUN apt-get update \
    && apt-get install -y make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /mysite
COPY . /mysite
WORKDIR /mysite
RUN python3 -m venv .
RUN python3 -m pip install pip==24.2
RUN python3 -m pip install setuptools==72.2.0
RUN python3 -m pip install --no-cache-dir -r requirements.txt
RUN export $(grep -v '^#' .env | xargs -d '\n') && python manage.py collectstatic --no-input
EXPOSE 8000
CMD ["gunicorn", "--bind", ":8000", "mysite.wsgi:application"]
