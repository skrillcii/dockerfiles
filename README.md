# Dockerfiles
This repository is intended for future project development.
In general, images are increnmentally built with functionality as required.

## Base Images
Based on [Ubuntu](https://hub.docker.com//ubuntu/) images.

## Prerequisite
* docker
* nvidia-docker

## Useful Commands
* remove all running containers
```
docker rm $(docker ps -a -q)
```
* remove dangling containers (built without success and shown as (none))
```
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
```
* remove dangling build cache
```
docker builder prune
```
## General Commands
* run a container
```
docker run CONTAINER_ID
```
* run a container and stay in the session (interactive/terminal)
```
docker run -it CONTAINER_ID
```
* run a container in a detached mode
```
docker run -d CONTAINER_ID
```
* start a stopped container
```
docker start CONTAINER_ID
```
* start a stopped container and stay in the session (attach/interactive)
```
docker start -ai CONTAINER_ID
```
* attach to a running container
```
docker attach CONTAINER_ID
```

## References
* https://github.com/dockerfile
* https://github.com/NVIDIA/nvidia-docker
* https://github.com/osrf/docker_images
* https://hub.docker.com/_/ubuntu
* https://hub.docker.com/r/nvidia/cuda/
* https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
* https://ypereirareis.github.io/blog/2015/05/04/docker-with-shell-script-or-makefile/
