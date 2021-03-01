###############
# Pre-defined #
###############
ARG base_img
ARG base_tag

FROM ${base_img}:${base_tag}

LABEL maintainer "admin <admin@email.com>"

ENV PERSONALIZED_USR=admin
ENV PERSONALIZED_UID=1000
ENV PERSONALIZED_GID=1000

ENV HOME=/home/${PERSONALIZED_USR}
ENV TERM=xterm-256color
ENV DEBIAN_FRONTEND=noninteractive
ENV SHELL=/usr/bin/zsh

###############
# Create User #
###############

# Start zsh
RUN zsh

# Install sudo
RUN apt-get update && \
    apt-get -y install sudo && \
    rm -rf /var/lib/apt/lists/*

# Setup time zone
ENV TZ=Asia/Tokyo
RUN apt-get update && \
    apt-get -y install tzdata && \
    rm -rf /var/lib/apt/lists/*

RUN rm /etc/localtime && \
    ln -s -f /usr/share/zoneinfo/${TZ} /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Setup ssh client
RUN apt-get update && \
    apt-get -y install openssh-client && \
    rm -rf /var/lib/apt/lists/*

# Setup user account
# REFERENCE: https://stackoverflow.com/questions/27701930/how-to-add-users-to-docker-container
RUN useradd -r -m -d ${HOME} -s ${SHELL} -G sudo -u ${PERSONALIZED_UID} ${PERSONALIZED_USR} -p "$(openssl passwd -1 ${PERSONALIZED_USR})"

###############
# Start Setup #
###############

USER ${PERSONALIZED_USR}
WORKDIR ${HOME}

RUN git clone https://github.com/skrillcii/dotfiles.git /home/${PERSONALIZED_USR}/dotfiles && \
    ln -s -f ~/dotfiles/zsh/zshrc  ~/.zshrc
