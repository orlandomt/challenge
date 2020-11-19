FROM ubuntu:latest

#Install NGINX
RUN apt-get -y update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/* && \
    echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
    chown -R www-data:www-data /var/lib/nginx

#Configuration Persistent Volume
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

WORKDIR /etc/nginx

CMD ["nginx"]

#Adding Virtual Host
RUN mkdir -p /var/www/example.com/html && \
    chmod -R 755 /var/www

COPY index.html /var/www/example.com/html/
COPY example.com /etc/nginx/sites-available/

EXPOSE 80
EXPOSE 443

