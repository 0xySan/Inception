FROM alpine:3.20

RUN apk update && apk add --no-cache nginx openssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /run/nginx

RUN mkdir -p /etc/nginx/certificates

RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/certificates/nginx.key \
    -out /etc/nginx/certificates/nginx.crt -days 365 -nodes \
    -subj "/C=FR/ST=Normandie/L=Le Havre/O=42/CN=etaquet"

EXPOSE 443

RUN mkdir -p /var/www/html
RUN chown -R nginx:nginx /var/www/html

CMD ["nginx", "-g", "daemon off;"]