FROM php:8.5-alpine

RUN apk add --no-cache \
    libpng-dev \
    libzip-dev

RUN docker-php-ext-install \
    exif \
    gd \
    pcntl \
    zip

COPY --from=composer/composer:latest-bin /composer /usr/bin/composer
