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
ENV SHELL=/usr/bin/zsh
ENV TERM=xterm-256color

USER ${PERSONALIZED_USR}
WORKDIR ${HOME}

###############
# Start Setup #
###############

CMD ["zsh"]
