#!/bin/bash

/usr/lib/rabbitmq/bin/rabbitmq-plugins enable rabbitmq_management
rabbitmq-server -detached

supervisord -c /etc/supervisord.conf
