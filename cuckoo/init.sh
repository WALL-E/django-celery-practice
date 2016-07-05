#!/bin/bash

/usr/lib/rabbitmq/bin/rabbitmq-plugins enable rabbitmq_management
rabbitmq-server -detached

cat /etc/passwd|grep celery || adduser celery
chown celery -R /apps/cuckoo

