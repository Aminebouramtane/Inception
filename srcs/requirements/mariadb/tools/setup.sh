#!/bin/bash


if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql > /dev/null 2>&1
    sleep 3
fi


service mariadb start;
sleep 1

echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;" | mariadb
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mariadb
echo "GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%';" | mariadb
echo "FLUSH PRIVILEGES;" | mariadb

service mariadb stop
mysqld_safe