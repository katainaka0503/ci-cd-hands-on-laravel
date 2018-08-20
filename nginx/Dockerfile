FROM nginx:stable-alpine
COPY ./default.conf.template /etc/nginx/conf.d/default.conf.template

ENTRYPOINT ["/bin/sh", "-c", "envsubst '$$APP_SERVER_HOST $$APP_SERVER_PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]