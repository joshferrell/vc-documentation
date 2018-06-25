#!/bin/sh

./sloppy change -v docker_image:"$DOCKER_REPOSITORY/$DOCKER_IMAGE:$TRAVIS_COMMIT" -v domain:"$DOMAIN" -v db:"$MONGODB_CONNECTION_STRING" ./sloppy.json
