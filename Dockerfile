FROM ubuntu:latest
LABEL maintainer = "Gustav Kauman <kaumanmedia.com>"

EXPOSE 80
WORKDIR /var/www

RUN mkdir -p /var/tmp
COPY scripts/ /var/tmp/
COPY php-sample /etc/nginx/sites-available/php-sample
RUN apt-get update -y -qq && apt-get -y -qq upgrade
RUN apt-get install -y -qq nginx
RUN sh /var/tmp/install.sh
RUN sh /var/tmp/cleanup.sh

CMD service php7.2-fpm start && \
    nginx -g 'daemon off;'