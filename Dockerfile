FROM alpine:edge

RUN apt-get update -y
RUN apt-get install -y squid
RUN apt-get install -y apache2-utils
RUN apt-get clean

COPY entry.sh /
COPY squid.conf /etc/squid/squid.conf
RUN chmod a+x /entry.sh

EXPOSE 3128/tcp

ENTRYPOINT ["/entry.sh"]
