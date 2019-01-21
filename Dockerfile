FROM ubuntu:bionic
LABEL maintainer = "Gustav Kauman <kaumanmedia.com>"

EXPOSE 80
WORKDIR /var/www
COPY . /var/www

# update the system
RUN apt-get update

###
# nginx install
###

# intall nginx
RUN apt-get -y install nginx

# Copy nginx config
COPY ./config/nginx.conf /etc/nginx/nginx.conf

# run nginx
RUN service nginx start

###
# Install php packages
###

RUN apt-get -y install openssl php php-bcmath php-fpm php-json php-mbstring php-mysql php-xml php-xmlrpc php-zip curl

# reload nginx
RUN nginx -s reload