#!/bin/sh

# Remove containers
docker rm demo4-html-app 2>/dev/null
docker rm demo4-vulcand 2>/dev/null
docker rm demo4-etcd 2>/dev/null
docker rm demo4-v1 2>/dev/null
docker rm demo4-v2 2>/dev/null
docker rm demo4-v3 2>/dev/null
docker rm demo4-v4 2>/dev/null

# Build containers

# Version 1
cd v1

docker build -t demo4:v1 .

cd ..

# Version 2
cd v2

docker build -t demo4:v2 .

cd ..

# Version 3
cd v3

docker build -t demo4:v3 .

cd ..

# Version 4
cd v4

docker build -t demo4:v4 .

cd ..

# Html app
cd html-app

docker build -t demo4:html-app .

cd ..

# Run containers
docker run -d --name demo4-etcd -p 8001:8001 -p 5001:5001 quay.io/coreos/etcd:v0.4.6 -peer-addr ${DOCKER_HOST_IP}:8001 -addr ${DOCKER_HOST_IP}:5001 -name etcd-node1

sleep 5

docker run -d --name demo4-vulcand -p 8182:8182 -p 8181:8181 mailgun/vulcand:v0.8.0-beta.2 /go/bin/vulcand -apiInterface=0.0.0.0 --etcd=http://${DOCKER_HOST_IP}:5001

sleep 5

# Activate vulcand

curl -L http://${DOCKER_HOST_IP}:5001/v2/keys/vulcand/backends/b1/backend -X PUT -d value='{"Type":"http"}'
curl -L http://${DOCKER_HOST_IP}:5001/v2/keys/vulcand/frontends/f1/frontend -X PUT -d value='{"Type":"http", "BackendId":"b1","Route":"Path(`/`)"}'

docker run -d --name demo4-v1 -p 9001:80 demo4:v1

docker run -d --name demo4-v2 -p 9002:80 demo4:v2

docker run -d --name demo4-v3 -p 9003:80 demo4:v3

docker run -d --name demo4-v4 -p 9004:80 demo4:v4

docker run -d --name demo4-html-app -p 8080:80 demo4:html-app

sleep 5

# Open html app in Safari
open http://${DOCKER_HOST_IP}:8080/
