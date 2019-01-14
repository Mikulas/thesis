FROM php:7.2

RUN pecl install redis-4.0.1 \
    && docker-php-ext-enable redis \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-enable pdo_mysql \
    && apt-get update \
    && apt-get install -yq git unzip \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --filename=composer --install-dir=/usr/bin \
    && rm composer-setup.php

WORKDIR /src
COPY . /src
RUN composer install \
    && chmod ugo+x /src/entrypoint.sh

ENTRYPOINT ["/src/entrypoint.sh"]
