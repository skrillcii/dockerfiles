#!/usr/bin/env zsh

build_common(){
    # admin:ubuntu-focal
    cd ../../ubuntu/focal
    echo 'Building : '`pwd`
    ./build.sh focal admin ubuntu-focal

    # bionic:cuda10.1
    # cd cuda/10.1
    # echo 'Building : '`pwd`
    # ./build.sh bionic base bionic cuda10.1

    # bionic:cuda10.1-cudnn7
    # cd cudnn7
    # echo 'Building : '`pwd`
    # ./build.sh bionic cuda10.1 bionic cuda10.1-cudnn7
}

project_specific(){
    # admin:ubuntu-focal-personalized
    cd ../../personalized
    echo 'Building : '`pwd`
    ./build.sh admin ubuntu-focal admin ubuntu-focal-personalized

    # admin:ubuntu-focal-personalized+example
    cd ../../projects/example
    echo 'Building : '`pwd`
    ./build.sh admin ubuntu-focal admin ubuntu-focal-personalized
}

build_common
project_specific
