FROM debian

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y haproxy

ADD ./cert.pem /usr/local/etc/haproxy/cert.pem
ADD ./haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
ADD ./script.sh /root/script.sh

EXPOSE 443
EXPOSE 80
EXPOSE 8404

CMD ["bash", "/root/script.sh"]

