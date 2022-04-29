FROM archlinux:latest

# Build arguments.
ARG VCS_REF
ARG BUILD_DATE
ARG BRINKOS_VERSION="15"

# Labels / Metadata.
LABEL maintainer="Thomas Leon Highbaugh" \
    decription="Tantrik Linux" \
    version="01" \
    org.label-schema.name="tantrik" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/the-Electric-Tantra-Linux" \
    org.label-schema.schema-version="1.0.0"

# Create user for builds.
RUN set -xe; \
    useradd --no-create-home --shell=/bin/false build; \
    usermod -L build; \
    echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers; \
    echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers;

# Install all needed deps
RUN set -xe; \
    pacman -Syyu --noconfirm; \
    pacman -S base base-devel cmake automake autoconf wget vim archiso openssh git nginx --noconfirm;

# Improve build time by caching packages from image.
COPY ./pacman.conf /etc/pacman.conf
COPY ./packages.txt /packages.txt
COPY ./pacstrap.sh /bin/pacstrap
# Update the package lists
RUN pacman -Syy
# Clean Cache 
RUN pacman -Scc --noconfirm
# Install packages for cache
RUN pacman --noconfirm -Syyw $(</packages.txt)

# If building on a debian host, dev/shm points to /run/shm
# and will fail without this directory.
RUN mkdir -p /build/archiso/work/x86_64/airootfs/run/shm; \
    mkdir -p /build/archiso/work/x86_64/airootfs/var/run/shm; \
    mkdir -p /run/shm; \
    mkdir -p /var/run/shm;

# Copy in our entrypoint and archlive and set ownership.
COPY ./releng /build/releng
COPY ./docker-entrypoint.sh /build/docker-entrypoint.sh

# Setup Environment variables.
ENV GTK_THEME="Dhumavati-White-Dark" \
    ICON_THEME="chhinamasta" \
    PACKAGE_PROXY="" \
    NETINSTALL="true"

# Set our entrypoint which kicks off our build.
ENTRYPOINT [ "/build/docker-entrypoint.sh" ]
