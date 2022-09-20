#!/bin/sh
mysql_install_db --user=mysql --ldata=/var/lib/mysql

if [ -d "/var/lib/mysql/$DB_NAME" ]
then
	echo "$DB_NAME database already exists. Continuing"
else

	/usr/share/mariadb/mysql.server start

	echo "ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password';" | mysql -u root --skip-password
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';" | mysql -u root --skip-password

	echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

	echo "CREATE DATABASE $DB_NAME DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root -p $DB_ROOT_PASSWORD

	echo "GRANT ALL ON wordpress.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" | mysql -u root -p $DB_ROOT_PASSWORD

	echo "FLUSH PRIVILEGES;" | mysql -u root -p $DB_ROOT_PASSWORD

	/usr/share/mariadb/mysql.server stop
fi

mysqld --user=mysql --skip-networking=off --bind-address=0.0.0.0
