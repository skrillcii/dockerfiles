# Dockerfiles
This repository is intended for future project development.
In general, images are increnmentally built with functionality as required.

## Base Images
Based on [Ubuntu](https://hub.docker.com//ubuntu/) images.

## Prerequisite
* docker
* nvidia-docker

## General Commands
* remove all running containers
```
docker rm $(docker ps -a -q)
```
* start a container
```
docker start CONTAINER_ID
```
* start a container and stay in the session
```
docker start -ai CONTAINER_ID
```
* attach to a running container
```
docker attach CONTAINER_ID
```
* remove dangling containers (built without success and shown as (none))
```
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
```
* remove dangling build cache
```
docker builder prune
```

## References
* https://github.com/dockerfile
* https://github.com/NVIDIA/nvidia-docker
* https://github.com/osrf/docker_images
* https://hub.docker.com/_/ubuntu
* https://hub.docker.com/r/nvidia/cuda/
* https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
