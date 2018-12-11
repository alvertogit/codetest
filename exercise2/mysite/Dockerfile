FROM python:3.6.7-slim-stretch
ENV PYTHONUNBUFFERED 1
RUN mkdir -p /mysite
COPY . /mysite
WORKDIR /mysite
RUN pip install -r requirements.txt
RUN export $(grep -v '^#' .env | xargs -d '\n') && python manage.py collectstatic --no-input
EXPOSE 8000
CMD ["gunicorn", "--bind", ":8000", "mysite.wsgi:application"]
