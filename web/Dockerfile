FROM php:5.6.30-apache
COPY php.ini /usr/local/etc/php/
RUN apt-get update && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev libmcrypt-dev openssl zip unzip git nodejs npm vim nano && docker-php-ext-install pdo_mysql mysqli mbstring gd iconv mcrypt
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN a2enmod rewrite && service apache2 restart
