#!/bin/bash
ln -s /etc/nginx/sites-available/php-sample /etc/nginx/sites-enabled/laravel && \
rm -rf /etc/nginx/sites-enabled/default && \
echo -e "xdebug.remote_enable=1\nxdebug.remote_autostart=1\nxdebug.remote_host=host.docker.internal" >> $(find /etc/php/*/mods-available/ -name "xdebug.ini")
