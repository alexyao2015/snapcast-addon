
ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest
ARG SNAPCAST_VERSION=0.27.0-r4

FROM $BUILD_FROM
ARG SNAPCAST_VERSION

# install snapcast
RUN apk add \
        snapcast-server=${SNAPCAST_VERSION}

# Copy root filesystem
COPY rootfs /
