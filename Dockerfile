FROM php:7.4-apache
RUN apt update -y && apt install zip -y && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer  
RUN composer require symfony/translation && composer require doctrine/annotations && composer require symfony/orm-pack && composer require nelmio/cors-bundle
RUN apt-get update && apt-get install -y build-essential libssl-dev zlib1g-dev libpng-dev libjpeg-dev libfreetype6-dev
RUN docker-php-ext-configure gd && docker-php-ext-install gd
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN php bin/console cach:clear
