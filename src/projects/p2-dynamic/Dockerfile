FROM php:7.2

RUN pecl install redis-4.0.1 \
    && docker-php-ext-enable redis

WORKDIR /src
COPY . /src

CMD ["php", "bin/console", "server:run", "*:8001"]
