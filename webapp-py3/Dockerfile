FROM alpine
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
RUN python -m pip install Django
RUN mkdir /app
WORKDIR /app
# RUN django-admin startproject mysite
COPY . /app
WORKDIR /app/webapp_py3

EXPOSE 8000
ENTRYPOINT ["python", "manage.py"]
CMD ["runserver", "0.0.0.0:8000"]