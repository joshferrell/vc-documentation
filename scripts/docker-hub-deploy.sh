#!/bin/sh

docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
docker tag $DOCKER_IMAGE:$TRAVIS_COMMIT $DOCKER_USERNAME/$DOCKER_IMAGE:$TRAVIS_COMMIT
docker push $DOCKER_USERNAME/$DOCKER_IMAGE:$TRAVIS_COMMIT