FROM alpine
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN apk add --no-cache libpq-dev
RUN pip3 install --no-cache --upgrade pip setuptools
RUN python -m pip install Django gunicorn psycopg2
RUN mkdir /app
WORKDIR /app
# RUN django-admin startproject mysite
COPY . /app
WORKDIR /app

EXPOSE 8000
CMD ["gunicorn", "--bind", ":8000", "--workers", "3", "webapp_py3.wsgi"]