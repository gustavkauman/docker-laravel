FROM ubuntu:latest
LABEL maintainer = "Gustav Utke Kauman <gustavkauman.com>"

EXPOSE 80
EXPOSE 9000
WORKDIR /var/www

RUN mkdir -p /var/tmp
COPY scripts/* /var/tmp/
COPY php-sample /etc/nginx/sites-available/php-sample
RUN apt-get update -y -qq && apt-get -y -qq upgrade && apt-get install -y -qq apt-utils
RUN apt-get install -y -qq nginx
RUN bash /var/tmp/install.sh
RUN bash /var/tmp/configure.sh
RUN bash /var/tmp/cleanup.sh

CMD service php7.4-fpm start && \
    nginx -g 'daemon off;'