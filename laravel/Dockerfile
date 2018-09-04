FROM php:7.1-fpm-alpine

RUN apk update \
    && apk add --no-cache mysql-client php7-mysqlnd gettext openssl ca-certificates git zlib-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql mbstring zip

RUN wget https://github.com/Droplr/aws-env/raw/master/bin/aws-env-linux-amd64 -O /bin/aws-env && \
  chmod +x /bin/aws-env

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
  && php -r "unlink('composer-setup.php');"

WORKDIR /var/www/laravel

COPY --chown=www-data:www-data . /var/www/laravel

COPY --chown=www-data:www-data ./.env.dev .env

RUN composer install

COPY --chown=www-data:www-data ./.env.prod.template .env.template

RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

CMD ["php-fpm"]