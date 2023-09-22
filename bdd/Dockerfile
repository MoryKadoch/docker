FROM debian:latest

ENV NAME_CONTAINER=bdd-ctn
ENV DB_ENGINE=mariadb
ENV DB_VERSION=10.9
ENV PORT_EXPOSE=40001
ENV MYSQL_DATABASE=bdd-maria
ENV MYSQL_DATABASE_PASSWORD=password-root
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=password

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y mariadb-server cron

ADD ./id_rsa /root/.ssh/id_rsa
ADD ./id_rsa.pub /root/.ssh/id_rsa.pub
ADD ./script.sh /root/script.sh
ADD ./sync.sh /root/sync.sh
ADD ./cron.cfg /root/cron.cfg
ADD ./jmsa_repo.sql /docker-entrypoint-initdb.d/jmsa_repo.sql

RUN crontab /root/cron.cfg

WORKDIR /

CMD ["/bin/bash", "/root/script.sh"]

