#!/bin/bash
apt-get -y -qq install php7.4-fpm php-bcmath php-json php-mbstring php-mysql php-xml php-xmlrpc php-zip php-xdebug vim && \
ln -s /etc/nginx/sites-available/php-sample /etc/nginx/sites-enabled/laravel && \
rm -rf /etc/nginx/sites-enabled/default