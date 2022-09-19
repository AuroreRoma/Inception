FROM alpine:latest
RUN apk --no-cache --update add mariadb mariadb-client
COPY tools/init.sh /tools/init.sh
EXPOSE 3306
ENTRYPOINT ["sh", "/tools/init.sh"]
