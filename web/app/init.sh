#!/bin/sh
mysql -h mysql -u root -pYueXinShiDai<yuexin.sql
cd /var/www
php artisan migrate
php artisan queue:work --queue=yx &