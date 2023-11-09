FROM php:8.2-cli

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER 1 

RUN apt-get update && apt-get install -y --no-install-recommends git curl zip unzip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /var/cache/apk/* /usr/share/man /tmp/*

RUN composer global config --no-plugins allow-plugins.dealerdirect/phpcodesniffer-composer-installer true
RUN composer global require "squizlabs/php_codesniffer=*"
RUN composer global require "phpcompatibility/php-compatibility:dev-develop"
RUN composer global require "phpunit/phpunit=*"
RUN /root/.composer/vendor/bin/phpcs --config-set installed_paths "/root/.composer/vendor/phpcompatibility/php-compatibility"
RUN composer global update --lock

WORKDIR /app
VOLUME /app
