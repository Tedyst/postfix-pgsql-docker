FROM debian:latest

RUN sudo apt update && apt install postfix postfix-pgsql
