FROM python:3.9.0b4-alpine3.12

COPY ./app/worker /app/worker

COPY /app/worker/crontab /etc/crontabs/crontab

RUN chmod +x /app/worker/test.py

CMD crond -l 2 -f