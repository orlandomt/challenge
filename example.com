server {
    listen 3200 default_server;
    listen [::]:3200 default_server;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

    server_name example.com;

    location / {
        proxy_pass http://localhost:3400;
    }
}

server {
    listen 3200 default_server;
    listen [::]:3200 default_server;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

    server_name *.com;

    location / {
        error_page 404 /error.html;
    }
}
