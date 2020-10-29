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
ENV SHELL=/usr/bin/bash
ENV TERM=xterm-256color

###############
# Create User #
###############
# Install sudo
RUN apt-get update && \
    apt-get -y install sudo && \
    rm -rf /var/lib/apt/lists/*

# Setup user account, either method 1 or method 2 works
# REFERENCE: https://stackoverflow.com/questions/27701930/how-to-add-users-to-docker-container
#
# Method 1
# RUN adduser --disabled-password --gecos '' ${PERSONALIZED_USR} && \
#     echo "${PERSONALIZED_USR}:${PERSONALIZED_USR}" | chpasswd && \
#     adduser ${PERSONALIZED_USR} sudo && \
#     mkdir -p /home/${PERSONALIZED_USR} && \
#     chown -R root:${PERSONALIZED_USR} /home/${PERSONALIZED_USR}
#
# Method 2
RUN useradd -rm -d ${HOME} -s ${SHELL} -G sudo -u ${PERSONALIZED_UID} ${PERSONALIZED_USR} -p "$(openssl passwd -1 ${PERSONALIZED_USR})"

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

###############
# Start Setup #
###############

USER ${PERSONALIZED_USR}
WORKDIR ${HOME}

# Setup dotfiles
# RUN git clone https://github.com/skrillcii/dotfiles.git /home/${PERSONALIZED_USR}/dotfiles


CMD ["/usr/bin/zsh"]
