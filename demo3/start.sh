#!/bin/sh

docker rm demo3-php54 demo3-php56 demo3-nginx 2>/dev/null

# Build image for PHP 5.4
cd php54

docker build -t demo3:php54 .

cd ..

# Build image for PHP 5.6
cd php56

docker build -t demo3:php56 .

cd ..

# Run all images
docker run -d -p 8081:80 --name demo3-php54 demo3:php54

docker run -d -p 8080:80 --name demo3-php56 demo3:php56

docker run -d -p 80:80 --name demo3-nginx -v `pwd`/nginx-config:/etc/nginx/conf.d/default.conf:ro nginx

# Access images via proxy
sleep 5

echo "Accessing PHP 5.4 via http://$DOCKER_HOST_IP/php54/"

curl -L http://$DOCKER_HOST_IP/php54/

echo "Accessing PHP 5.6 via http://$DOCKER_HOST_IP/php56/"

curl -L http://$DOCKER_HOST_IP/php56/

# Remove all images
docker stop demo3-nginx

docker stop demo3-php54

docker stop demo3-php56

docker rm demo3-nginx 2>/dev/null

docker rm demo3-php54 2>/dev/null

docker rm demo3-php56 2>/dev/null
