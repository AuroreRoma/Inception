#!/bin/sh

addgroup mysql mysql
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql
chmod -R 777 /run/mysqld

mysql_install_db --user=mysql --ldata=/var/lib/mysql

if [ -d "/var/lib/mysql/$DB_NAME" ]
then
	echo "$DB_NAME database already exists. Continuing"
else

	/usr/share/mariadb/mysql.server start

	echo "CREATE DATABASE $DB_NAME DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root --skip-password

	echo "GRANT ALL ON wordpress.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" | mysql -u root --skip-password

	echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

	/usr/share/mariadb/mysql.server stop

fi

mysqld --user=mysql --skip-networking=off --bind-address=0.0.0.0
