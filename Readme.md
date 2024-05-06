# Flask y Gunicorn 

## Entorno virtual

Crea un entorno virtual

```
python -m venv entorno
```

Actívalo
```
source ./entorno/bin/activate
```

## Aplicación

Define los requisitos de la aplicación en el fichero: requirements.txt

```

Flask
Gunicorn

```
Crea la aplicación Hola Mundo en el fichero app.py

```python

from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello World!'


```

Instala los requisitos:

```
pip install -r requirements.txt
```

Ejecuta la aplicación en el servidor por defecto de Flask:

```
flask --app app run --port 8080 --debug
# Ctrl+C para deterner
```

Ejecuta la aplicación en el servidor Gunicorn:
```
gunicorn app:app -b 0.0.0.0:8080
```

## Contenerización

Para contenerizar la aplicación crea el fichero Dockerfile:

```

FROM python:3.10-slim

COPY requirements.txt /

RUN pip install -r /requirements.txt

WORKDIR /app

COPY ./app.py .

EXPOSE 8080

CMD ["gunicorn", "app:app", "-b 0.0.0.0:8080"]

```

Construye la imagen:

```
docker build -t hello-flask:1.0.0 .
```

Ejecútala en un contenedor:

```
docker run -d --name flaskapp -p 8080:8080 hello-flask:1.0.0
```
