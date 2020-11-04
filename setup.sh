#! /bin/sh

# Exit if a command fails
set -e

# Update
echo http://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories
echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories
echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
apk update

# Install pg_dump 13

apk add --no-cache postgresql-client

# Install go-chron
apk add curl
curl -L --insecure https://github.com/odise/go-cron/releases/download/v0.0.6/go-cron-linux.gz | zcat > /usr/local/bin/go-cron
chmod u+x /usr/local/bin/go-cron
apk del curl

# Cleanup
rm -rf /var/cache/apk/*