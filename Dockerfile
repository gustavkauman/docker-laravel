FROM ubuntu:latest
LABEL maintainer = "Gustav Kauman <kaumanmedia.com>"

EXPOSE 80
EXPOSE 9000
WORKDIR /var/www

RUN mkdir -p /var/tmp
COPY scripts/* /var/tmp/
COPY php-sample /etc/nginx/sites-available/php-sample
COPY config/xdebug.ini /var/tmp/xdebug.ini
RUN apt-get update -y -qq && apt-get -y -qq upgrade&& apt-get install -y -qq apt-utils
RUN apt-get install -y -qq nginx
RUN bash /var/tmp/install.sh
COPY config/xdebug.ini /etc/php/7.2/mods-available/xdebug.ini
RUN bash /var/tmp/cleanup.sh

CMD service php7.2-fpm start && \
    nginx -g 'daemon off;'