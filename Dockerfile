# syntax=docker/dockerfile:1

FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt requirements.txt
RUN apt-get update
RUN apt-get -y install gcc
RUN pip3 install -r requirements.txt
RUN pip3 install email_validator
COPY . .
ENV FLASK_APP=hello.py
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]