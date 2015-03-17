#!/bin/sh

# Initialize boot2docker

# Set environment variables

# Pull images
docker pull nginx
docker pull ubuntu
docker pull php:5.4-apache
docker pull php:5.6-apache
docker pull mailgun/vulcand:v0.8.0-beta.2
docker pull quay.io/coreos/etcd:v0.4.6
