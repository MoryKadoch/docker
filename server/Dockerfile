FROM ubuntu:latest

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y apache2 openssh-server
ADD ./script.sh /root/script.sh
RUN mkdir /root/.ssh
ADD ./authorized_keys /root/.ssh/authorized_keys
RUN sed 's/#PermitRootLogin prohibit-password/PermitRootLogin prohibit-password/' -i /etc/ssh/sshd_config
WORKDIR /var/www/html

EXPOSE 22
EXPOSE 80

CMD ["bash", "/root/script.sh"]

