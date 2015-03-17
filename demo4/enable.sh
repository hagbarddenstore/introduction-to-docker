#!/bin/sh

for argument in "$@"; do
  case $argument in
    'v1')
      echo 'Enabling v1'

      curl -L http://${DOCKER_HOST_IP}:5001/v2/keys/vulcand/backends/b1/servers/v1 -X PUT -d value='{"URL":"http://'${DOCKER_HOST_IP}':9001"}'
    ;;

    'v2')
      echo 'Enabling v2'
      curl -L http://${DOCKER_HOST_IP}:5001/v2/keys/vulcand/backends/b1/servers/v2 -X PUT -d value='{"URL":"http://'${DOCKER_HOST_IP}':9002"}'
    ;;

    'v3')
      echo 'Enabling v3'
      curl -L http://${DOCKER_HOST_IP}:5001/v2/keys/vulcand/backends/b1/servers/v3 -X PUT -d value='{"URL":"http://'${DOCKER_HOST_IP}':9003"}'
    ;;

    'v4')
      echo 'Enabling v4'
      curl -L http://${DOCKER_HOST_IP}:5001/v2/keys/vulcand/backends/b1/servers/v4 -X PUT -d value='{"URL":"http://'${DOCKER_HOST_IP}':9004"}'
    ;;
  esac
done
