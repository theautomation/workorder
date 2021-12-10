FROM python:3.10

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/hello-cron
ADD script.sh /code/script.sh
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/hello-cron /code/script.sh

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Install Cron
RUN apt-get update
RUN apt-get -y install cron

# Run the command on container startup
CMD ["crond","-f"]

# WORKDIR /code

# COPY ./crontab /code/crontab
# COPY ./script.sh /code/script.sh
# COPY ./entrypoint.sh /code/entrypoint.sh
# COPY ./requirements.txt /code/requirements.txt

# RUN chmod 755 ./script.sh ./entrypoint.sh

# RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# COPY ./app /code/app

# # install google chrome
# RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
# RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
# RUN apt-get -y update
# RUN apt-get install -y google-chrome-stable

# # install chromedriver
# RUN apt-get install -yqq unzip
# RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
# RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

# RUN apt-get -y update
# RUN apt-get install -y cron

# # set display port to avoid crash
# ENV DISPLAY=:99

# # Unbuffer python log messages
# ENV PYTHONUNBUFFERED=1

# ENTRYPOINT ["./entrypoint.sh"]