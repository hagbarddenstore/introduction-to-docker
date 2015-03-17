#!/bin/sh

# Stop running containers
docker stop demo4-v4 2>/dev/null
docker stop demo4-v3 2>/dev/null
docker stop demo4-v2 2>/dev/null
docker stop demo4-v1 2>/dev/null
docker stop demo4-html-app 2>/dev/null
docker stop demo4-etcd 2>/dev/null
docker stop demo4-vulcand 2>/dev/null

# Remove containers
docker rm demo4-html-app 2>/dev/null
docker rm demo4-vulcand 2>/dev/null
docker rm demo4-etcd 2>/dev/null
docker rm demo4-v1 2>/dev/null
docker rm demo4-v2 2>/dev/null
docker rm demo4-v3 2>/dev/null
docker rm demo4-v4 2>/dev/null
