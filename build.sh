#!/bin/bash

docker build -t docker.knewton.net/docker-gc .
docker push docker.knewton.net/docker-gc
