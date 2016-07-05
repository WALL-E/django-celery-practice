#!/bin/bash

/usr/lib/rabbitmq/bin/rabbitmq-plugins enable rabbitmq_management
rabbitmq-server -detached

cat /etc/passwd|grep celery || adduser celery
chown /app/cuckoo -R celery


