# Ubuntu Version, e.g 22.04 unquoted
ARG VERSION
    
# Set Image Name
ARG OS_IMAGE=ubuntu:${VERSION}
    
# Optional: Change Timezone
ARG TZ=America/North_Dakota/Center
    
FROM $OS_IMAGE
    
LABEL org.opencontainers.image.authors="jason.everling@gmail.com"
    
ARG TZ
    
RUN set -eux; \
    OS_BASE=$(sed -n 's/^VERSION_ID="\(.*\)"/\1/p' </etc/os-release); \
    OS_CODENAME=$(sed -n 's/^VERSION_CODENAME=\(.*\)/\1/p' </etc/os-release); \
    OS_VERSION=$(echo "${OS_BASE}" | sed 's/[^0-9]*//g'); \
    echo "OS_BASE=${OS_BASE}" >> /etc/environment; \
    echo "OS_CODENAME=${OS_CODENAME}" >> /etc/environment; \
    echo "OS_VERSION=${OS_VERSION}" >> /etc/environment; \
    echo "OS_TIMEZONE=${TZ}" >> /etc/environment; \
    installPkgs='ca-certificates curl gnupg jq openssl tzdata unzip wget'; \
    ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone; \
    apt-get update; \
    apt-get install -y --no-install-recommends $installPkgs; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
    rm -rf /var/lib/apt/lists/*;
    
CMD ["/bin/bash"]
