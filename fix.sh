#!/usr/bin/env bash

if ! command -v sudo &> /dev/null
then
    chmod -R 777 storage bootstrap/cache
else
    sudo chmod -R 777 storage bootstrap/cache
fi

php artisan cache:clear
php artisan route:clear
php artisan config:clear
php artisan view:clear

if ! command -v sudo &> /dev/null
then
    composer du -o
else
    sudo /usr/local/bin/composer du -n -o
fi
