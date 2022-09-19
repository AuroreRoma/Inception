FROM alpine:latest

RUN apk --no-cache --update add \
		php php-common php-fpm \
		php-json php-session php-mysqli \
		php-gd php-zlib php-curl

COPY conf/www.conf /etc/php8/php-fpm.d/www.conf

COPY tools/init.sh /tools/init.sh

EXPOSE 9000

ENTRYPOINT ["sh", "/tools/init.sh"]
