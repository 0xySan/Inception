FROM alpine:3.20

RUN apk update && \
    apk add --no-cache mariadb mariadb-client

RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql

COPY ./conf/my.cnf /etc/my.cnf
COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh
COPY ./conf/kuma.sql /usr/local/bin/kuma.sql

RUN chmod 644 /etc/my.cnf && \
    chmod 755 /usr/local/bin/entrypoint.sh && \
    chown root:root /etc/my.cnf && \
    chown mysql:mysql /usr/local/bin/entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]