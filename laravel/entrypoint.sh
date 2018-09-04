#!/bin/ash

eval $(aws-env) && \
  envsubst '$$DB_HOST $$DB_PORT $$DB_DATABASE $$DB_USERNAME $$DB_PASSWORD' < /var/www/laravel/.env.template > /var/www/laravel/.env && \
  php artisan migrate --force && \
  docker-php-entrypoint $@