#!/usr/bin/zsh

if [[ $# -eq 4 ]] ; then
    echo "$(cd "$(dirname "$0")"; pwd)/$(basename "$0")"
    echo "BUILD -- from : "${1}":"${2}" as "${3}":"${4}
    DOCKER_BUILDKIT=1 sudo docker build --ssh default -t ${3}:${4} --build-arg base_img=${1} --build-arg base_tag=${2} .
else
    echo "Command Usage:"
    echo "./build.sh BASE_IMG BASE_TAG OUTPUT_IMG OUTPUT_TAG \n"
    echo "For Example:"
    echo "./build.sh ubuntu-admin focal ubuntu-admin focal-custom \n"
fi
