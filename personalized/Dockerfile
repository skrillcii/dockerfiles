###############
# Pre-defined #
###############
ARG base_img
ARG base_tag
ARG python_ver
ARG user_name

FROM ${base_img}:${base_tag}

LABEL maintainer "name <name@github.com>"

ENV PERSONALIZED_USR ${user_name}
ENV PERSONALIZED_UID 1001
ENV PERSONALIZED_GID 1001

ENV PYTHON_VERSION ${python_ver}
ENV HOME /home/${PERSONALIZED_USR}
ENV SHELL /usr/bin/zsh
ENV TERM xterm-256color

###############
# Start Setup #
###############
RUN \
    apt-get update && \
    apt-get install -y ranger xclip atool unzip w3m highlight mediainfo caca-utils poppler-utils && \
    apt-get clean && \ 
    rm -rf /var/lib/apt/lists/*

CMD ["/usr/bin/zsh"]
