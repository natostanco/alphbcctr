FROM quay.io/natostanco/alpmgfctr

RUN apk update && apk upgrade \
 && apk add git alpine-sdk libxml2-dev curl-dev fuse-dev json-c-dev file-dev \
 && git clone https://github.com/TurboGit/hubicfuse \
 && cd hubicfuse \
 && ./configure \
 && make \
 && make install \
 && apk del --purge git alpine-sdk libxml2-dev curl-dev fuse-dev json-c-dev file-dev \
 && apk add libxml2 json-c file \
 && cd .. \
 && rm -r ./hubicfuse \
 && rm /var/cache/apk/*
