#!/bin/bash

# Create /run/php directory at container startup
echo "Creating /run/php directory..."
mkdir -p /run/php
chmod 755 /run/php

# Verify creation
if [ -d "/run/php" ]; then
    echo "✅ SUCCESS: /run/php directory created"
else
    echo "❌ ERROR: Failed to create /run/php directory"
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


#!/bin/bash

# Create /run/php directory at container startup
# echo "Creating /run/php directory..."
# mkdir -p /run/php
# chmod 755 /run/php

# # Debug: Show environment variables
# echo "=== Environment Variables ==="
# echo "DB_HOST: $DB_HOST"
# echo "MYSQL_DATABASE: $MYSQL_DATABASE"
# echo "MYSQL_USER: $MYSQL_USER"
# echo "WP_URL: $WP_URL"
# echo "WP_TITLE: $WP_TITLE"
# echo "WP_ADMIN_USER: $WP_ADMIN_USER"
# echo "============================="

# # Wait for MySQL to be ready with timeout
# echo "Waiting for MySQL database to be ready..."
# for i in {1..30}; do
#     if mysql -h "$DB_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SELECT 1;" > /dev/null 2>&1; then
#         echo "✅ MySQL is ready!"
#         break
#     else
#         echo "⏳ Waiting for MySQL... (attempt $i/30)"
#         if [ $i -eq 30 ]; then
#             echo "❌ ERROR: MySQL not ready after 30 attempts"
#             echo "Trying to connect with:"
#             echo "Host: $DB_HOST"
#             echo "User: $MYSQL_USER"
#             echo "Database: $MYSQL_DATABASE"
#             exit 1
#         fi
#         sleep 2
#     fi
# done

# # Test database connection and create database if needed
# echo "Testing database connection..."
# if mysql -h "$DB_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "USE $MYSQL_DATABASE;" 2>/dev/null; then
#     echo "✅ Database $MYSQL_DATABASE exists"
# else
#     echo "Creating database $MYSQL_DATABASE..."
#     mysql -h "$DB_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "CREATE DATABASE $MYSQL_DATABASE;" || {
#         echo "❌ ERROR: Failed to create database"
#         exit 1
#     }
#     echo "✅ Database $MYSQL_DATABASE created successfully"
# fi

# sleep 2

# cd /var/www/html/wordpress

# # Create WordPress config
# echo "Creating WordPress configuration..."
# wp config create --allow-root \
#     --dbname="$MYSQL_DATABASE" \
#     --dbuser="$MYSQL_USER" \
#     --dbpass="$MYSQL_PASSWORD" \
#     --dbhost="$DB_HOST" || {
#     echo "❌ ERROR: Failed to create WordPress config"
#     exit 1
# }

# # Install WordPress
# echo "Installing WordPress..."
# wp core install --allow-root \
#     --url="$WP_URL" \
#     --title="$WP_TITLE" \
#     --admin_user="$WP_ADMIN_USER" \
#     --admin_password="$WP_ADMIN_PASSWORD" \
#     --admin_email="$WP_ADMIN_EMAIL" || {
#     echo "❌ ERROR: Failed to install WordPress"
#     exit 1
# }

# # Create additional user if variables are set
# if [ ! -z "$WP_USER" ] && [ ! -z "$WP_EMAIL" ] && [ ! -z "$WP_USER_PASSWORD" ]; then
#     echo "Creating additional user: $WP_USER"
#     wp user create --allow-root "$WP_USER" "$WP_EMAIL" \
#         --user_pass="$WP_USER_PASSWORD" --role=editor
# fi

# # Activate theme
# wp theme activate twentytwentyfour --allow-root

# echo "✅ WordPress setup completed successfully!"

# # Start PHP-FPM
# echo "Starting PHP-FPM..."
# exec /usr/sbin/php-fpm7.4 -F