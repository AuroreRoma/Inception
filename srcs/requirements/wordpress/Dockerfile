FROM alpine:latest

RUN apk --no-cache --update add \
		php php-common php-fpm \
		php-json php-session php-mysqli \
		php-gd php-zlib php-curl

ADD https://wordpress.org/latest.tar.gz /var/www/

RUN tar -xzvf /var/www/latest.tar.gz -C /var/www && \
	rm /var/www/latest.tar.gz

ADD init.sh /init.sh

EXPOSE 9000

ENTRYPOINT ["sh", "/init.sh"]
