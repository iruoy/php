FROM php:8.5-alpine

RUN apk add --no-cache \
    autoconf \
    g++ \
    make \
    icu-dev \
    libpng-dev \
    libzip-dev

RUN pecl install \
    redis

RUN docker-php-ext-enable \
    redis

RUN docker-php-ext-install \
    exif \
    gd \
    intl \
    pcntl \
    zip

COPY --from=composer/composer:latest-bin /composer /usr/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER=1
