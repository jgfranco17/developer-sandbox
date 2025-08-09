# syntax=docker/dockerfile:1

ARG UBUNTU_VERSION=22.04
FROM ubuntu:${UBUNTU_VERSION} AS setup

LABEL org.opencontainers.image.owner "jgfranco17"
LABEL org.opencontainers.image.description "A developer sandbox environment with essential tools and utilities."
LABEL org.opencontainers.image.source https://github.com/jgfranco17/developer-sandbox

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        wget \
        git \
        unzip \
        zip \
        vim \
        net-tools \
        iputils-ping \
        dnsutils \
        software-properties-common \
        ca-certificates \
        sudo \
        tree \
        jq \
        shellcheck \
        zsh \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

FROM setup AS app

RUN useradd -ms /bin/zsh devuser \
  && usermod -aG sudo devuser \
  && echo 'devuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER devuser
WORKDIR /home/devuser

ENV ZDOTDIR=/home/devuser
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

CMD ["/bin/zsh"]
