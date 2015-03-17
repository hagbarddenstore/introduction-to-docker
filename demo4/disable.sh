#!/bin/sh

for argument in "$@"; do
  case $argument in
    'v1')
      echo 'Disabling v1'

      curl -L http://${DOCKER_HOST_IP}:5001/v2/keys/vulcand/backends/b1/servers/v1 -X DELETE
    ;;

    'v2')
      echo 'Disabling v2'
      curl -L http://${DOCKER_HOST_IP}:5001/v2/keys/vulcand/backends/b1/servers/v2 -X DELETE
    ;;

    'v3')
      echo 'Disabling v3'
      curl -L http://${DOCKER_HOST_IP}:5001/v2/keys/vulcand/backends/b1/servers/v3 -X DELETE
    ;;

    'v4')
      echo 'Disabling v4'
      curl -L http://${DOCKER_HOST_IP}:5001/v2/keys/vulcand/backends/b1/servers/v4 -X DELETE
    ;;
  esac
done
