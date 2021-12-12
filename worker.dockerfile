FROM python:3.9.0b4-alpine3.12

COPY ./app/worker /app/worker

RUN chmod 755 /app/worker/script.sh /app/worker/entry.sh
RUN /usr/bin/crontab /app/worker/crontab

CMD ["/app/worker/entry.sh"]