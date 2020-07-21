#!/bin/bash
ln -s /etc/nginx/sites-available/php-sample /etc/nginx/sites-enabled/laravel && \
rm -rf /etc/nginx/sites-enabled/default && \
echo "xdebug.remote_enable=1\nxdebug.remote_autostart=1\nxdebug.remote_host=docker.host.internal" >> $(find /etc/php/*/mods-available/ -name "xdebug.ini")
