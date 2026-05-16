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

ARG USERNAME="devuser"

RUN useradd -ms /bin/zsh ${USERNAME} \
  && usermod -aG sudo ${USERNAME} \
  && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${USERNAME}
ENV HOME="/home/${USERNAME}"
WORKDIR "${HOME}"

ENV ZDOTDIR="${HOME}"
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

FROM setup AS sandbox

ENTRYPOINT ["/bin/zsh"]
