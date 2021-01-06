FROM ubuntu:latest

RUN apt-get update && apt-get -y install cron
RUN apt-get -y install python3

RUN chmod 777 /var/run
RUN mkdir /scripts
RUN chmod 777 /scripts
RUN chmod 4755 /usr/sbin/cron

COPY elastic-cron /etc/cron.d/elastic-cron
COPY changefields.py /scripts

RUN chmod 0644 /etc/cron.d/elastic-cron
RUN chmod 0744 /scripts/changefields.py

RUN touch /tmp/cron.log
RUN crontab /etc/cron.d/elastic-cron

CMD cron && tail -f /tmp/cron.log


