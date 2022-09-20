FROM alpine:latest

RUN apk add nginx openssl

RUN mkdir /root/cert

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		   -keyout /root/cert/private.key  \
		   -out /root/cert/certificate.crt \
		   -subj "/C=FR"

COPY conf/default.conf /etc/nginx/http.d/default.conf

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
