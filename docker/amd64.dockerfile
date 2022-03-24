FROM alpine

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
