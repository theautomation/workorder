FROM python:3.10

ENV PYTHONUNBUFFERED=1

RUN mkdir -p /app/db /app/log

WORKDIR /app/api

COPY ./app/api .

COPY /app/logging.ini .

RUN pip install --no-cache-dir --upgrade -r requirements.txt

CMD ["python", "api_main.py"]