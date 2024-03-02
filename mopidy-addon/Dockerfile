ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base-debian:latest
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Copy Python requirements file
COPY requirements.txt /tmp/

# Setup base
RUN \
    mkdir -p /usr/local/share/keyrings \
    && curl -L https://apt.mopidy.com/mopidy.gpg -o /etc/apt/keyrings/mopidy-archive-keyring.gpg \
    && curl -L https://apt.mopidy.com/mopidy.list -o /etc/apt/sources.list.d/mopidy.list \
    \
    && apt-get update \
    \
    && apt-get install -y \
        build-essential \
        gstreamer1.0-alsa \
        gstreamer1.0-plugins-bad \
        gstreamer1.0-plugins-good \
        gstreamer1.0-plugins-ugly \
        gstreamer1.0-pulseaudio \
        mopidy
RUN echo "11" \
    && apt-get install -y git \
    && curl -L \
        -o gst-plugin-spotify.deb \
        https://github.com/kingosticks/gst-plugins-rs-build/releases/download/gst-plugin-spotify_0.12.2-1/gst-plugin-spotify_0.12.2-1_amd64.deb \
    && apt-get install ./gst-plugin-spotify.deb \
    && rm gst-plugin-spotify.deb \
    && find /usr/lib -name EXTERNALLY-MANAGED | xargs rm -f \
    && curl https://bootstrap.pypa.io/get-pip.py | python3 \
    && pip3 install  --no-cache-dir -r /tmp/requirements.txt
RUN echo "1" \
    && find /usr/local \
        \( -type d -a -name test -o -name tests -o -name '__pycache__' \) \
        -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
        -exec rm -rf '{}' + \
    \
    && apt-get purge -y --auto-remove \
        libffi-dev \
        libxml2-dev \
        libxslt1-dev \
        zlib1g-dev \
        build-essential \
        gcc \
        python-dev \
        dpkg-dev \
    && rm -fr \
        /var/{cache,log}/* \
        /var/lib/apt/lists/* \
        /root/.cache \
    && find /tmp/ -mindepth 1  -delete

# Move access.log to stdout and error.log to stderr
RUN mkdir -p /var/log/nginx && ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log

# Copy root filesystem
COPY rootfs /


# build-essential \
# git \
# gstreamer1.0-alsa \
# gstreamer1.0-plugins-bad \
# gstreamer1.0-plugins-good \
# gstreamer1.0-plugins-ugly \
# gstreamer1.0-pulseaudio \
# libasound2-dev \
# libffi-dev \
# libspotify-dev \
# libspotify12 \
# libxml2-dev3 \
# libxslt1-dev \
# python3-dev \
# python3-gi \
# python3-gst-1.0 \
# zlib1g-dev \
# mopidy-alsamixer \
# mopidy-local \
# mopidy-mpd \
# mopidy-podcast \
# mopidy-soundcloud \
# mopidy-tunein \