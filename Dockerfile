FROM ubuntu:latest

RUN apt-get update && apt-get -y install cron
RUN apt-get install python3

RUN mkdir /scripts
RUN chmod 777 /scripts
COPY elastic-cron /etc/cron.d/elastic-cron
COPY changefields.py /scripts

RUN chmod 0644 /etc/cron.d/elastic-cron
RUN chmod 0744 /scripts/changefields.py

RUN touch /var/log/cron.log
RUN crontab /etc/cron.d/elastic-cron

CMD cron && tail -f /var/log/cron.log


