###############
# Pre-defined #
###############
FROM ubuntu:focal

LABEL maintainer "name <name@github.com>"

###############
# Start Setup #
###############
RUN \
    apt-get update && \
    apt-get install -y lsb-release build-essential && \
    apt-get install -y sudo zsh tmux vim curl wget git man htop && \
    apt-get install -y python3-pip python3-dev python3-pudb && \
    apt-get install -y default-jre default-jdk maven && \
    apt-get install -y locales && locale-gen "en_US.UTF-8" && \
    apt-get clean && \ 
    rm -rf /var/lib/apt/lists/*

CMD ["/usr/bin/bash"]
