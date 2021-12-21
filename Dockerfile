FROM debian:latest

RUN apt update && apt install -y postfix postfix-pgsql supervisor rsyslog
RUN mkdir /var/run/supervisor/

COPY etc/*.conf /etc/
COPY etc/rsyslog.d/* /etc/rsyslog.d
COPY etc/supervisord.d/*.ini /etc/supervisord.d/
COPY etc/postfix/pgsql-relay-domains.cf etc/postfix/pgsql-transport-maps.cf /etc/postfix/
COPY wrapper.sh /bin
RUN newaliases

EXPOSE 25
ENV DB_HOST=email-db
ENV EMAIL_HANDLER=email-emailhandler
ENV DOMAIN=tedyst.ro


CMD [ "timeout", "12h", "bash", "/bin/wrapper.sh" ]