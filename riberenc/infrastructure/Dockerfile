FROM python:3.11-slim-bullseye

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# psycopg2 dependencies
RUN apt-get update \
    && apt-get install -y postgresql postgresql-contrib gcc python3 musl

COPY requirements.txt /app/
RUN pip install -r requirements.txt

COPY ./../../ /app/