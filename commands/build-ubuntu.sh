#!/usr/bin/zsh

if [[ $# -eq 3 ]] ; then
    echo "$(cd "$(dirname "$0")"; pwd)/$(basename "$0")"
    echo "BUILD -- from : ubuntu:"${1}" as "${2}":"${3}
    DOCKER_BUILDKIT=1 sudo docker build -t ${2}:${3} .
else
    echo "Command Usage:"
    echo "./build.sh UBUNTU_VERSION OUTPUT_IMG OUTPUT_TAG\n"
    echo "For Example:"
    echo "./build.sh focal ubuntu/admin focal\n"
fi
