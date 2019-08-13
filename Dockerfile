FROM richarvey/nginx-php-fpm:1.5.7

ENV SKIP_COMPOSER 1
ENV SKIP_CHOWN 1

RUN wget https://github.com/DataDog/dd-trace-php/releases/download/0.30.0/datadog-php-tracer_0.30.0_noarch.apk
RUN apk add datadog-php-tracer_0.30.0_noarch.apk --allow-untrusted

# RUN echo "log_level = debug" >> /usr/local/etc/php-fpm.conf

RUN echo "log_level = warning" >> /usr/local/etc/php-fpm.conf

WORKDIR /etc/nginx
COPY cors_allowed.conf .

WORKDIR /etc/nginx/sites-available
COPY nginx.default.conf default.conf

WORKDIR /var/www/html
COPY . .
COPY .env .

WORKDIR /etc/nginx

#COPY docker/php.ini /usr/local/etc/php/conf.d/php.ini
RUN touch /var/log/php.log
RUN chmod 777 /var/log/php.log

WORKDIR /var/www/html
RUN touch /var/www/html/storage/logs/laravel.log
RUN mkdir -p /var/www/html/storage/storage/framework/cache/data
# Add App specific filese
RUN chmod -R 777 /var/www/html/storage


