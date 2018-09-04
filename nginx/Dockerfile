FROM nginx:stable-alpine
COPY ./default.conf.template /etc/nginx/conf.d/default.conf.template

RUN wget https://github.com/Droplr/aws-env/raw/master/bin/aws-env-linux-amd64 -O /bin/aws-env && \
  chmod +x /bin/aws-env

ENTRYPOINT ["/bin/sh", "-c", "eval $(aws-env) && envsubst '$$APP_SERVER_HOST $$APP_SERVER_PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]