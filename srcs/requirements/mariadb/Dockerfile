FROM alpine:latest

RUN apk --no-cache --update add mariadb mariadb-client

COPY tools/init.sh /init.sh

EXPOSE 3306

ENTRYPOINT ["sh", "/init.sh"]
