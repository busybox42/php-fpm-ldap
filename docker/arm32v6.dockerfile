FROM alpine AS builder

# Download QEMU, see https://github.com/docker/hub-feedback/issues/1261
ENV QEMU_URL https://github.com/balena-io/qemu/releases/download/v6.0.0%2Bbalena1/qemu-6.0.0.balena1-arm.tar.gz
RUN apk add curl && curl -L ${QEMU_URL} | tar zxvf - -C . --strip-components 1

FROM arm32v6/alpine:latest

# Add QEMU
COPY --from=builder qemu-arm-static /usr/bin

RUN apk --update --no-cache add \
	php \
	php-fpm \
	php-ldap

COPY php.ini /etc/php7/conf.d/php.ini
COPY php-fpm.conf /etc/php7/php-fpm.conf
COPY www.conf /etc/php7/php-fpm.d/www.conf

WORKDIR /var/www/html

EXPOSE 9000

CMD ["php-fpm7", "-F"]
