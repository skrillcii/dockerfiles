###############
# Pre-defined #
###############
FROM ubuntu:focal

LABEL maintainer "admin <admin@email.com>"

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NOWARNINGS=yes

###############
# Start Setup #
###############
RUN apt-get update && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get upgrade -y && \
    apt-get install -y lsb-release && \
    apt-get install -y build-essential && \
    apt-get install -y software-properties-common && \
    apt-get install -y zsh tmux vim curl wget git man htop && \
    apt-get install -y locales && locale-gen "en_US.UTF-8" && \
    apt-get clean && \ 
    rm -rf /var/lib/apt/lists/*

CMD ["/usr/bin/bash"]
