#!/bin/sh

addgroup mysql mysql
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql

mysql_install_db --user=mysql --ldata=/var/lib/mysql

#/usr/share/mariadb/mysql.server start
#mysql_secure_installation
#/usr/share/mariadb/mysql.server stop

#echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root --skip-password

#echo "GRANT ALL ON wordpress.* TO 'aroma'@'localhost' IDENTIFIED BY 'tarte42';" | mysql -u root --skip-password

#echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

mysqld --user=mysql --bind-address=0.0.0.0
