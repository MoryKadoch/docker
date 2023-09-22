FROM php:8.2-apache

RUN apt-get update \
    && apt-get install -y git unzip \
    && docker-php-ext-install mysqli pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN git clone https://github.com/MoryKadoch/todo_php.git /var/www/todo_php

WORKDIR /var/www/todo_php/server
RUN composer install
RUN cp /var/www/todo_php/server/.env_example /var/www/todo_php/server/.env
RUN echo "DB_HOST=localhost\nDB_NAME=todo_db\nDB_USER=username123\nDB_PASS=password123" > /var/www/todo_php/server/.env

RUN a2enmod rewrite
RUN chown -R www-data:www-data /var/www

RUN sed -i 's!/var/www/html!/var/www/todo_php/server!g' /etc/apache2/sites-available/000-default.conf

CMD ["apache2-foreground"]