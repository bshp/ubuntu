FROM ubuntu:jammy
    
LABEL org.opencontainers.image.authors="jason.everling@gmail.com"
    
ARG TZ=America/North_Dakota/Center
    
ENV OS_BASE=22.04
ENV OS_CODENAME=jammy
ENV OS_VERSION=2204
ENV OS_TIMEZONE=${TZ}

RUN set -eux; \
    installPkgs='ca-certificates curl gnupg jq openssl tzdata wget'; \
    ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone; \
    apt-get update; \
    apt-get install -y --no-install-recommends $installPkgs; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false;
    
CMD ["/bin/bash"]
