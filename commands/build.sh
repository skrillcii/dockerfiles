#!/usr/bin/zsh

if [[ $# -eq 6 ]] ; then
    echo "$(cd "$(dirname "$0")"; pwd)/$(basename "$0")"
    echo "BUILD -- from : "${1}":"${2}" as "${3}":"${4}" with python version"${5}" for user "${6}
    DOCKER_BUILDKIT=1 sudo docker build --ssh default -t ${3}:${4} --build-arg base_img=${1} --build-arg base_tag=${2} \
                                        --build-arg python_ver=${5} --build-arg user_name=${6} .
else
    echo "Command Usage:"
    echo "./build.sh BASE_IMG BASE_TAG OUTPUT_IMG OUTPUT_TAG PYTHON_VERSION USER_NAME"
    echo ""
    echo "For Example:"
    echo "./build.sh ubuntu-base focal ubuntu-custom focal 3.8.6 admin"
fi
