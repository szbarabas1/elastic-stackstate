FROM ubuntu:latest

RUN apt-get update && apt-get -y install cron python3 curl sudo

RUN mkdir /scripts

COPY elastic-cron /etc/cron.d/elastic-cron
COPY changefields.py /scripts
RUN touch /tmp/cron.log

RUN chmod 0644 /etc/cron.d/elastic-cron
RUN chmod 0744 /scripts/changefields.py

RUN crontab /etc/cron.d/elastic-cron

CMD CMD cron && tail -f /tmp/cron.log
