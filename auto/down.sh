#! /bin/bash -e

if [ "$(docker ps -q -f name=meeting-server)" ]; then
    docker rm -f meeting-server
fi