FROM debian:latest

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y openssh-client cron

ADD ./id_rsa /root/.ssh/id_rsa
ADD ./id_rsa.pub /root/.ssh/id_rsa.pub
ADD ./script.sh /root/script.sh
ADD ./sync.sh /root/sync.sh
ADD ./cron.cfg /root/cron.cfg

RUN crontab /root/cron.cfg

WORKDIR /

CMD ["/bin/bash", "/root/script.sh"]

