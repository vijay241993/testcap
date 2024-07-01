#!/bin/bash
#variables
DOCKER_USERNAME="viju93"
IMAGE_NAME_DEV="dev"

#Build the docker images
docker build -t $DOCKER_USERNAME/$IMAGE_NAME_DEV:latest .

docker push $DOCKER_USERNAME/$IMAGE_NAME_DEV:latest


