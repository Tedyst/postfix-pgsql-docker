FROM debian:latest

RUN apt update && apt install -y postfix postfix-pgsql

CMD [ "postfix" ]