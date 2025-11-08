FROM debian:bullseye

# Install dependencies
RUN apt-get update && apt-get install -y \
    php-fpm php-mysql wget tar mariadb-client curl && \
    rm -rf /var/lib/apt/lists/*

# Create working directory
WORKDIR /var/www/html

# Download WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    rm latest.tar.gz

# Install WP-CLI and common PHP extensions required by WP-CLI and WordPress
RUN apt-get update && apt-get install -y \
    php-cli php-mbstring php-xml php-zip php-curl php-json wget curl && \
    curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp && \
    rm -rf /var/lib/apt/lists/*


# Copy configuration files
COPY tools/www.conf /etc/php/7.4/fpm/pool.d/
COPY ./tools/setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh

# Remove the mkdir command from here - it won't persist
# RUN mkdir -p /run/php

# Start PHP-FPM
CMD ["/tmp/setup.sh"]