FROM php:8.5-alpine

RUN apk add --no-cache \
    icu-dev \
    libpng-dev \
    libzip-dev

RUN docker-php-ext-install \
    exif \
    gd \
    intl \
    pcntl \
    zip

COPY --from=composer/composer:latest-bin /composer /usr/bin/composer
