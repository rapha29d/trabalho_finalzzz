# Version: 0.0.1
FROM alpine:3.4
MAINTAINER Raphael Paes Alves "raphapaes_al@hotmail.com"
ENV REFRESHED_AT 2016-11-10

ENV LANG="pt_BR.UTF-8" \
    LC_ALL="pt_BR.UTF-8" \
    LANGUAGE="pt_BR.UTF-8" \
    DB_ROOT_PASS="54321" \
    DB_USER="admin" \
    DB_PASS="12345" \
    TERM="xterm"

RUN apk -U upgrade && \
    apk --update add mariadb mariadb-client && \
    rm -rf /tmp/src && \
    rm -rf /var/cache/apk/*

ADD my.cnf /etc/mysql/my.cnf
ADD start.sh /start.sh

RUN chmod u+x /start.sh

VOLUME ["/data"]

EXPOSE 3306

CMD ["/start.sh"]

