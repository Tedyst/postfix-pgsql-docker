FROM debian:latest
MAINTAINER Stoica Tedy stoicatedy@gmail.com

RUN apt update && apt install -y postfix postfix-pgsql supervisor rsyslog
RUN mkdir /var/run/supervisor/

COPY etc/*.conf /etc/
COPY etc/rsyslog.d/* /etc/rsyslog.d
COPY etc/supervisord.d/*.ini /etc/supervisord.d/
RUN newaliases

EXPOSE 25

CMD [ "supervisord" ]