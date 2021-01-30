#!/bin/bash
export DB_HOST_ADDR=$(getent hosts $DB_HOST | awk '{ print $1 }' | head -n 1)
export EMAIL_HANDLER_ADDR=$(getent hosts $EMAIL_HANDLER | awk '{ print $1 }' | head -n 1)

sed -i "s/email-db/$DB_HOST_ADDR/g" /etc/postfix/pgsql-relay-domains.cf
sed -i "s/email-db/$DB_HOST_ADDR/g" /etc/postfix/pgsql-transport-maps.cf
sed -i "s/emailhandler/$EMAIL_HANDLER_ADDR/g" /etc/postfix/pgsql-transport-maps.cf

supervisord