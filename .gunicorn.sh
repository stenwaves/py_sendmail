#! /usr/bin/env bash

DJANGO_DIR = /home/neokyzen/myproject/DjangoBlog
USER = neokyzen
GROUP = admin
NUM_WORKERS = 3
NAME = "DjangoBlog"
WORK_CLASS = "gevent"
DJANGO_SETTINGS_MODULE = DjangoBlog.settings
DJANGO_WSGI_MODULE = DjangoBlog.wsgi



cd $DJANGO_DIR
source /home/neokyzen/.virtualenvs/myblog/bin/activate
export DJANGO_SETTINGS_MODULE = $DJANGO_SETTINGS_MODULE

exec /home/neokyzen/.virtualenvs/myblog/bin/gunicorn $DJANGO_SETTINGS_MODULE:application \
--name $NAME \
--workers $NUM_WORKERS \
--worker-class $WORK_CLASS \
--user=$USER --group=$GROUP \
--log-level=debug \
--log-file=-
