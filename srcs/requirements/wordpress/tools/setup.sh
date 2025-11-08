#!/bin/bash

# Create /run/php directory at container startup
echo "Creating /run/php directory..."
mkdir -p /run/php
chmod 755 /run/php

# Verify creation
if [ -d "/run/php" ]; then
    echo "SUCCESS: /run/php directory created"
else
    echo "ERROR: Failed to create /run/php directory"
    exit 1
fi

sleep 10

cd /var/www/html/wordpress

wp config create --allow-root \
    --dbname="$MYSQL_DATABASE" \
    --dbuser="$MYSQL_USER" \
    --dbpass="$MYSQL_PASSWORD" \
    --dbhost="$DB_HOST"

wp core install --allow-root \
    --url="$WP_URL" \
    --title="$WP_TITLE" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PASSWORD" \
    --admin_email="$WP_ADMIN_EMAIL"

wp user create --allow-root "$WP_USER" "$WP_EMAIL" \
        --user_pass="$PASS" --role=editor

wp theme activate twentytwentyfour --allow-root 

/usr/sbin/php-fpm7.4 -F


