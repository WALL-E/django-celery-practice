# django-celery-practice

## start rabbitmq
/usr/lib/rabbitmq/bin/rabbitmq-plugins enable rabbitmq_management
sudo rabbitmq-server -detached

## start work
celery -A proj worker

## start beat
celery -A proj beat

## start django-celery
python2.7 manage.py runserver 0.0.0.0:8000

## start cam
python2.7 manage.py celerycam

## start flower
celery flower -A proj --address=0.0.0.0 --port=8000
