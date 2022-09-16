echo 'wordpress containers starting'
if [[ ! -f /var/www/wordpress/index.php ]];
then
	wget https://wordpress.org/latest.tar.gz
	tar -xzvf latest.tar.gz -C /var/www/
	rm -rf latest.tar.gz
	echo 'wordpress successfully downloaded and installed !'
else
	echo 'wordpress already installed !'
fi


echo 'starting php-fpm8'
exec /usr/sbin/php-fpm8 -F
