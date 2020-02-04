FROM alpine


RUN apk --update --no-cache add \
	php \
	php-fpm \
	php-ldap

COPY php.ini /etc/php7/conf.d/50-setting.ini
COPY php-fpm.conf /etc/php7/php-fpm.conf

WORKDIR /var/www/html

EXPOSE 9000

CMD ["php-fpm7", "-F"]

