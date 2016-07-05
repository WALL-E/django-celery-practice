#!/bin/bash

/usr/lib/rabbitmq/bin/rabbitmq-plugins enable rabbitmq_management
rabbitmq-server -detached

rm -f /apps/cuckoo/db.sqlite3
python2.7 /apps/cuckoo/manage.py migrate
python2.7 /apps/cuckoo/manage.py createsuperuser

cat /etc/passwd|grep celery || adduser celery
chown celery:celery -R /apps/cuckoo 

killall -9 uwsgi
uwsgi --ini uwsgi.ini --static-map /static=/usr/local/lib/python2.7/site-packages/django/contrib/admin/static --mimefile /etc/mime.types

echo ""
echo "you need run commands:"
echo "cat celery.conf >> /etc/supervisord.conf"
echo "and"
echo "./start.sh"
echo ""
echo "celery-admin port:10060"
echo "celery-flwoer port:10070"
