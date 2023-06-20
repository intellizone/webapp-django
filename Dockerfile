# FROM alpine
# RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
# RUN python3 -m ensurepip
# RUN apk add --no-cache libpq-dev python3-dev build-base
# RUN pip3 install --no-cache --upgrade pip setuptools
# RUN python -m pip install Django gunicorn psycopg2
# RUN mkdir /app
# WORKDIR /app/
# # RUN django-admin startproject mysite
# COPY . /app
# WORKDIR /app/webapp_py3

# EXPOSE 8000
# CMD ["gunicorn", "--bind", ":8000", "--workers", "3", "webapp_py3.wsgi"]

FROM ubuntu:20.04
RUN apt-get update && apt-get install -y tzdata && apt install -y python3.8 python3-pip
RUN apt install python3-dev libpq-dev nginx -y
RUN pip install django gunicorn psycopg2
ADD . /app
WORKDIR /app/webapp_py3
EXPOSE 8000
CMD ["gunicorn", "--bind", ":8000", "--workers", "3", "webapp_py3.wsgi"]