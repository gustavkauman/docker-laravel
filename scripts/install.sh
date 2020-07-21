#!/bin/bash
apt-get -y -qq install curl php7.4-fpm php-curl php-bcmath php-json php-mbstring php-mysql php-xml php-xmlrpc php-zip php-xdebug vim && \
bash /var/tmp/install-composer.sh