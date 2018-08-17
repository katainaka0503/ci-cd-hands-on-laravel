FROM php:7.1-fpm-alpine

RUN apk update \
    && apk add --no-cache mysql-client php7-mysqlnd gettext openssl git \
    && docker-php-ext-install mysqli pdo pdo_mysql mbstring

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
  && php -r "unlink('composer-setup.php');"

WORKDIR /var/www/laravel

COPY . /var/www/laravel
COPY ./.prod.env.template .env.template

RUN chown -R www-data:www-data /var/www

ENTRYPOINT  ["/bin/sh", "-c", "envsubst '$$DB_HOST $$DB_PORT $$DB_DATABASE $$DB_USERNAME $$DB_PASSWORD' < /var/www/laravel/.env.template > /var/www/laravel/.env && php artisan migrate --force && docker-php-entrypoint php-fpm"]