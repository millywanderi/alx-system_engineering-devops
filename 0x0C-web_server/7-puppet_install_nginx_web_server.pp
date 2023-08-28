#!/usr/bin/env bash
# Install Nginx web server (w/ Puppet)

sudo apt update
sudo apt install -y nginx
echo "Hello World" > /var/www/html/index.html
echo "Ceci nést pas une page" > /var/www/html/404.html

printf %s "server {
    listen 80;
    listen [::]:80 default_server;
    root/var/www/html;
    index index.html;
    location /redirect_me {
    return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
    }
    error_page 404 /404.html;
}" > /etc/nginx/nginx.conf

sudo service nginx restart
