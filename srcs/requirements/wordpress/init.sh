echo 'wordpress containers starting'
if [[ ! -f /var/www/wordpress/wp-config.php ]];
then
	wget https://wordpress.org/latest.tar.gz
	tar -xzvf latest.tar.gz -C /var/www/
	rm -rf latest.tar.gz
	echo 'wordpress successfully downloaded and installed !'
	cd /var/www/wordpress

	sed -i "s/username_here/$DB_USER/g" wp-config-sample.php
	sed -i "s/password_here/$DB_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$DB_HOST/g" wp-config-sample.php
	sed -i "s/database_name_here/$DB_NAME/g" wp-config-sample.php
	mv wp-config-sample.php wp-config.php
else
	echo 'wordpress already installed !'
fi


echo 'starting php-fpm8'
exec /usr/sbin/php-fpm8 -F
