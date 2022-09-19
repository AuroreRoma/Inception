#!/bin/sh

addgroup mysql mysql
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql
chmod -R 777 /run/mysqld

mysql_install_db --user=mysql --ldata=/var/lib/mysql

/usr/share/mariadb/mysql.server start

#mysql_secure_installation

echo "CREATE DATABASE $DB_NAME DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root --skip-password

echo "GRANT ALL ON wordpress.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';" | mysql -u root --skip-password

echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

/usr/share/mariadb/mysql.server stop

mysqld --user=mysql --skip-networking=off --bind-address=0.0.0.0
