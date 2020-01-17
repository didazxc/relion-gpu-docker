#!/bin/sh

supervisord
supervisorctl reread
supervisorctl update
supervisorctl start laravel-worker:*
sleep 1s
cd /var/www
exec "$@"