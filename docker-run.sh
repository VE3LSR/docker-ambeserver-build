#!/bin/bash

source docker-vars.sh

sudo docker rm $APP
sudo docker run -it \
    --name $APP \
    -v $PWD/dist:/tmp/dist \
    $NAME /opt/copy.sh

