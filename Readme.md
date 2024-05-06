# Flask y Gunicorn 

## Entorno virtual

python -m venv entorno

source ./entorno/bin/activate


## Aplicación

Fichero: requirements.txt

```

Flask
Gunicorn

```
Aplicación: app.py

```python

from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello World!'


```


pip install -r requirements.txt

flask --app app run --port 8080 --debug

gunicorn app:app -b 0.0.0.0:8080


## Contenerización

```

FROM python:3.10-slim

COPY requirements.txt /

RUN pip install -r /requirements.txt

WORKDIR /app

COPY ./app.py .

EXPOSE 8080

CMD ["gunicorn", "app:app", "-b 0.0.0.0:8080"]

```


docker build -t hello-flask:1.0.0 .


docker run -d --rm -p 8080:8080 hello-flask:1.0.0