FROM python:slim

RUN \
    echo "**** Update ****" && \
    apt-get update -y

RUN \
    echo "**** Install Packages ****" && \
    apt-get install -y \
        ffmpeg \
        libxslt-dev \
        libxml2-dev \
        gcc \
        musl-dev \
        tmux

RUN \
    echo "**** Install Streamlink ****" && \
    pip wheel --wheel-dir=/root/wheels streamlink && \
    pip install --no-index --find-links=/root/wheels streamlink

COPY twitch-recorder.py /twitch-stream-recorder/twitch-recorder.py

RUN \
    echo "**** Cleanup ****" &&  \
    apt-get clean && \
    rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/* 

VOLUME /VODs

COPY start.sh /start.sh

RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"] 
