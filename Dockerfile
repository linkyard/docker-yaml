FROM alpine:3.9
LABEL maintainer="mario.siegenthaler@linkyard.ch"

RUN apk --no-cache add bash
RUN apk --no-cache add --update curl wget ca-certificates
RUN apk --no-cache add jq
RUN apk --no-cache add gnupg

ENV SPRUCE_VERSION 1.20.0
RUN wget https://github.com/geofffranks/spruce/releases/download/v${SPRUCE_VERSION}/spruce-linux-amd64 \
  && chmod a+x spruce-linux-amd64 \
  && mv spruce-linux-amd64 /usr/local/bin/spruce
