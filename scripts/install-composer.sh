cd ~ && \
curl -sS https://getcomposer.org/installer -o composer-setup.php && \
php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
php -r "unlink('composer-setup.php');"