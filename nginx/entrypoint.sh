#! /bin/ash

eval $(aws-env) && \
  envsubst '$$APP_SERVER_HOST $$APP_SERVER_PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
  eval $@