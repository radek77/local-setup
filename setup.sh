#!/usr/bin/env bash

# if ! command -v sudo &> /dev/null
# then
#     cp .env.example .env
# else
#     sudo cp .env.example .env
# fi

ENV_FILE=.env

function getProperty {
   PROP_KEY=$1
   PROP_VALUE=$(cat $ENV_FILE | grep "$PROP_KEY" | cut -d'=' -f2)
   echo "$PROP_VALUE"
}

DB_HOST=$(getProperty "DB_HOST")
DB_PORT=$(getProperty "DB_PORT")
DB_DATABASE=$(getProperty "DB_DATABASE")
DB_USERNAME=$(getProperty "DB_USERNAME")
DB_PASSWORD=$(getProperty "DB_PASSWORD")

mysql -u "${DB_USERNAME}" -p"${DB_PASSWORD}" -h "${DB_HOST}" -P "${DB_PORT}" -e "CREATE DATABASE IF NOT EXISTS ${DB_DATABASE};" >/dev/null 2>&1

php artisan migrate:fresh --seed

if ! command -v sudo &> /dev/null
then
    php artisan key:generate
    php artisan storage:link
else
   sudo php artisan key:generate
   sudo php artisan storage:link
fi

./fix.sh
