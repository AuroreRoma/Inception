FROM alpine:latest

RUN apk --no-cache --update add \
		php php-common php-fpm \
		php-json php-session php-mysqli \
		php-gd php-zlib php-curl

#ADD https://wordpress.org/latest.tar.gz /var/www/wordpress/

#RUN tar -xzvf /var/www/wordpress/latest.tar.gz -C /var/www/wordpress && \
#	rm /var/www/wordpress/latest.tar.gz

COPY www.conf /etc/php8/php-fpm.d/www.conf

ADD init.sh /init.sh

EXPOSE 9000

ENTRYPOINT ["sh", "/init.sh"]
