FROM alpine:3.16
RUN apk --no-cache --update add mariadb mariadb-client
RUN addgroup mysql mysql \
	&& mkdir -p /run/mysqld \
	&& chown -R mysql:mysql /run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql \
	&& chmod -R 777 /run/mysqld
COPY tools/init.sh /tools/init.sh
EXPOSE 3306
ENTRYPOINT ["sh", "/tools/init.sh"]
