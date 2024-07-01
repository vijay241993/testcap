#!/bin/bash
DOCKER_USERNAME="viju93"
IMAGE_NAME_DEV="dev"
IMAGE_NAME_PROD="prod"
docker tag $DOCKER_USERNAME/$IMAGE_NAME_DEV:latest $DOCKER_USERNAME/$IMAGE_NAME_PROD:latest
docker push $DOCKER_USERNAME/$IMAGE_NAME_PROD:latest

#use docker compose to start the applicaton
docker-compose up -d 
