ARG PHP_VERSION
ARG DEPLOYER_VERSION

FROM php:${PHP_VERSION}-alpine

RUN apk add --no-cache \
    zip  \
    unzip  \
    git  \
    curl  \
    wget  \
    openssh-client  \
    rsync

RUN curl -LO https://github.com/deployphp/deployer/releases/download/v$DEPLOYER_VERSION/deployer.phar && \
    mv deployer.phar /usr/local/bin/dep && \
    chmod +x /usr/local/bin/dep

RUN mkdir -p ~/.ssh \
    && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
