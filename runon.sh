#!/bin/bash

if [[ "$1" == "" ]]; then
  echo "Usage: $0 <path to check>"
  exit 1
fi

MOUNT_PATH=$(readlink -f "$1")
docker run --rm -v "$MOUNT_PATH:/app" php-compatibility-checker /root/.composer/vendor/bin/phpcs \
  -d memory_limit=1G --standard=PHPCompatibility --runtime-set testVersion 8.2 --extensions=php \
  --ignore=*/vendor/* --ignore=*/storage/* --ignore=*/bootstrap/cache/* -p \
  /app
