#!/usr/bin/env bash

cd /var/www/html
php artisan serve --host `hostname`
