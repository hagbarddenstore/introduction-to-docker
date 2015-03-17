#!/bin/sh

docker build -t demo2 .

docker run -d -p 8080:80 --name demo2 demo2

# Let the container start before accessing it.
sleep 5

curl -L http://$DOCKER_HOST_IP:8080/

docker stop demo2

docker rm demo2 2>/dev/null
