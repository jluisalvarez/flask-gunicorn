FROM python:3.10-slim

COPY requirements.txt /

RUN pip install -r /requirements.txt

WORKDIR /app

COPY ./app.py .

EXPOSE 8080

CMD ["gunicorn", "app:app", "-b 0.0.0.0:8080"]